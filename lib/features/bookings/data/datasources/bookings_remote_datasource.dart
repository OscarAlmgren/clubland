import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/exceptions.dart' as app_exceptions;
import '../../../../core/graphql/graphql_api.dart';
import '../../domain/entities/booking_entity.dart';
import '../models/booking_model.dart';
import '../models/facility_availability_model.dart';
import '../models/visit_model.dart';

abstract class BookingsRemoteDataSource {
  Future<List<BookingModel>> getUserBookings({
    Enum$BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    String? cursor,
  });

  Future<BookingModel> getBookingById(String bookingId);

  Future<FacilityAvailabilityModel> getFacilityAvailability({
    required String facilityId,
    required DateTime startDate,
    required DateTime endDate,
  });

  Future<BookingModel> createBooking({
    required String facilityId,
    required DateTime startTime,
    required DateTime endTime,
    String? notes,
    List<String>? participantIds,
  });

  Future<BookingModel> updateBooking({
    required String bookingId,
    DateTime? startTime,
    DateTime? endTime,
    String? notes,
    List<String>? participantIds,
  });

  Future<BookingModel> cancelBooking({
    required String bookingId,
    String? reason,
  });

  Future<BookingModel> confirmBooking(String bookingId);

  Future<BookingModel> checkInBooking(String bookingId);

  Future<BookingModel> checkOutBooking(String bookingId);

  Stream<BookingUpdateEvent> subscribeToBookingUpdates(String userId);

  Future<List<VisitModel>> getMyVisits({int? limit, String? cursor});

  Future<VisitModel> recordVisit({
    required String memberId,
    required String visitingClubId,
    List<String>? services,
    double? cost,
  });

  Future<VisitModel> checkoutVisit({
    required String visitId,
    List<String>? services,
    double? cost,
  });
}

class BookingsRemoteDataSourceImpl implements BookingsRemoteDataSource {
  BookingsRemoteDataSourceImpl({required GraphQLClient client, Logger? logger})
    : _client = client,
      _logger = logger ?? Logger();

  final GraphQLClient _client;
  final Logger _logger;

  @override
  Future<List<BookingModel>> getUserBookings({
    Enum$BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    String? cursor,
  }) async {
    _logger.d('Fetching user bookings with status: $status');

    try {
      final result = await _client.query(
        QueryOptions(
          document: documentNodeQueryMyBookings,
          variables: Variables$Query$MyBookings(
            status: status,
            pagination: limit != null
                ? Input$PaginationInput(pageSize: limit)
                : null,
          ).toJson(),
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException(
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to fetch bookings',
          'FETCH_FAILED',
        );
      }

      final data = result.data?['myBookings'] as Map<String, dynamic>?;
      if (data == null) return [];

      final nodes = data['nodes'] as List<dynamic>? ?? [];
      return nodes
          .map((n) => BookingModel.fromJson(n as Map<String, dynamic>))
          .toList();
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error fetching bookings', error: e);
      throw app_exceptions.NetworkException(
        'Failed to fetch bookings: $e',
        'UNKNOWN',
      );
    }
  }

  @override
  Future<BookingModel> getBookingById(String bookingId) async {
    _logger.d('Fetching booking details for ID: $bookingId');

    try {
      final result = await _client
          .query(
            QueryOptions(
              document: documentNodeQueryBooking,
              variables: Variables$Query$Booking(id: bookingId).toJson(),
              fetchPolicy: FetchPolicy.networkOnly,
            ),
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              _logger.w('Booking query timeout');
              throw app_exceptions.NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw app_exceptions.NetworkException(
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to fetch booking',
          'FETCH_FAILED',
        );
      }

      final bookingData = result.data?['booking'] as Map<String, dynamic>?;
      if (bookingData == null) {
        throw app_exceptions.NetworkException.notFound();
      }

      return BookingModel.fromJson(bookingData);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error fetching booking', error: e);
      throw app_exceptions.NetworkException(
        'Failed to fetch booking: $e',
        'UNKNOWN',
      );
    }
  }

  @override
  Future<FacilityAvailabilityModel> getFacilityAvailability({
    required String facilityId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      _logger.d('Fetching availability for facility: $facilityId');

      // The backend has no facilityAvailability query; it exposes facility
      // details and per-day availableSlots separately — compose the model
      // from both.
      final facilityResult = await _client
          .query(
            QueryOptions(
              document: documentNodeQueryFacility,
              variables: {'id': facilityId},
              fetchPolicy: FetchPolicy.networkOnly,
            ),
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              _logger.w('Facility query timeout');
              throw app_exceptions.NetworkException.timeout();
            },
          );

      if (facilityResult.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          facilityResult.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to fetch facility',
        );
      }

      final facilityData =
          facilityResult.data?['facility'] as Map<String, dynamic>?;
      if (facilityData == null) {
        throw const app_exceptions.NetworkException(
          'No facility data received',
          'NO_DATA',
        );
      }

      final minDuration = facilityData['minBookingDuration'] as int? ?? 60;

      final slotsResult = await _client
          .query(
            QueryOptions(
              document: documentNodeQueryAvailableSlots,
              variables: {
                'facilityId': facilityId,
                'date': startDate.toIso8601String(),
                'slotDuration': minDuration,
              },
              fetchPolicy:
                  FetchPolicy.networkOnly, // Always get fresh availability
            ),
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              _logger.w('AvailableSlots query timeout');
              throw app_exceptions.NetworkException.timeout();
            },
          );

      if (slotsResult.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          slotsResult.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to fetch availability',
        );
      }

      final slotsData =
          slotsResult.data?['availableSlots'] as List<dynamic>? ?? [];

      final capacity = facilityData['capacity'] as int? ?? 0;
      final slots = slotsData.whereType<Map<String, dynamic>>().map((slot) {
        final available = slot['available'] as bool? ?? false;
        return AvailableSlot(
          startTime: DateTime.parse(slot['startTime'] as String),
          endTime: DateTime.parse(slot['endTime'] as String),
          available: available,
          capacity: capacity,
          remainingSpots: available ? capacity : 0,
        );
      }).toList();

      return FacilityAvailabilityModel(
        facility: FacilityDetails(
          id: facilityData['id'] as String,
          name: facilityData['name'] as String,
          capacity: capacity,
          bookingSettings: BookingSettings(
            minBookingDuration: Duration(minutes: minDuration),
            maxBookingDuration: Duration(
              minutes: facilityData['maxBookingDuration'] as int? ?? 240,
            ),
            advanceBookingLimit: Duration(
              hours: 24 * (facilityData['advanceBookingDays'] as int? ?? 30),
            ),
            cancellationPolicy:
                'Cancel at least ${facilityData['cancellationDeadline'] as int? ?? 24}h before start',
          ),
        ),
        availableSlots: slots,
        // The backend does not expose other members' bookings here.
        bookedSlots: const [],
      );
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching availability', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching availability', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to fetch availability: $e',
      );
    }
  }

  @override
  Future<BookingModel> createBooking({
    required String facilityId,
    required DateTime startTime,
    required DateTime endTime,
    String? notes,
    List<String>? participantIds,
  }) async {
    _logger.d('Creating booking for facility: $facilityId');

    try {
      final result = await _client
          .mutate(
            MutationOptions(
              document: documentNodeMutationCreateBooking,
              variables: Variables$Mutation$CreateBooking(
                input: Input$CreateBookingInput(
                  facilityId: facilityId,
                  startTime: startTime,
                  endTime: endTime,
                  purpose: notes,
                  guestCount: participantIds?.length,
                ),
              ).toJson(),
            ),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              _logger.w('CreateBooking mutation timeout');
              throw app_exceptions.NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw app_exceptions.NetworkException(
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to create booking',
          'CREATE_FAILED',
        );
      }

      final createdData =
          result.data?['createBooking'] as Map<String, dynamic>?;
      final createdId = createdData?['id'] as String?;
      if (createdId == null) {
        throw const app_exceptions.NetworkException(
          'No booking ID in create response',
          'NO_DATA',
        );
      }

      _logger.i('Successfully created booking: $createdId');
      return getBookingById(createdId);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error creating booking', error: e);
      throw app_exceptions.NetworkException(
        'Failed to create booking: $e',
        'UNKNOWN',
      );
    }
  }

  @override
  Future<BookingModel> updateBooking({
    required String bookingId,
    DateTime? startTime,
    DateTime? endTime,
    String? notes,
    List<String>? participantIds,
  }) async {
    _logger.d('Updating booking: $bookingId');

    try {
      final result = await _client
          .mutate(
            MutationOptions(
              document: documentNodeMutationUpdateBooking,
              variables: Variables$Mutation$UpdateBooking(
                id: bookingId,
                input: Input$UpdateBookingInput(
                  startTime: startTime,
                  endTime: endTime,
                  purpose: notes,
                  guestCount: participantIds?.length,
                ),
              ).toJson(),
            ),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              _logger.w('UpdateBooking mutation timeout');
              throw app_exceptions.NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw app_exceptions.NetworkException(
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to update booking',
          'UPDATE_FAILED',
        );
      }

      _logger.i('Successfully updated booking: $bookingId');
      return getBookingById(bookingId);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error updating booking', error: e);
      throw app_exceptions.NetworkException(
        'Failed to update booking: $e',
        'UNKNOWN',
      );
    }
  }

  @override
  Future<BookingModel> cancelBooking({
    required String bookingId,
    String? reason,
  }) async {
    _logger.d('Cancelling booking: $bookingId');

    try {
      final result = await _client
          .mutate(
            MutationOptions(
              document: documentNodeMutationCancelBooking,
              variables: Variables$Mutation$CancelBooking(
                bookingId: bookingId,
                reason: reason ?? 'No reason provided',
              ).toJson(),
            ),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              _logger.w('CancelBooking mutation timeout');
              throw app_exceptions.NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw app_exceptions.NetworkException(
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to cancel booking',
          'CANCEL_FAILED',
        );
      }

      _logger.i('Successfully cancelled booking: $bookingId');
      return getBookingById(bookingId);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error cancelling booking', error: e);
      throw app_exceptions.NetworkException(
        'Failed to cancel booking: $e',
        'UNKNOWN',
      );
    }
  }

  @override
  Future<BookingModel> confirmBooking(String bookingId) async {
    _logger.d('Confirming booking: $bookingId');

    try {
      final result = await _client
          .mutate(
            MutationOptions(
              document: documentNodeMutationConfirmBooking,
              variables:
                  Variables$Mutation$ConfirmBooking(bookingId: bookingId)
                      .toJson(),
            ),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              _logger.w('ConfirmBooking mutation timeout');
              throw app_exceptions.NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw app_exceptions.NetworkException(
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to confirm booking',
          'CONFIRM_FAILED',
        );
      }

      _logger.i('Successfully confirmed booking: $bookingId');
      return getBookingById(bookingId);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error confirming booking', error: e);
      throw app_exceptions.NetworkException(
        'Failed to confirm booking: $e',
        'UNKNOWN',
      );
    }
  }

  @override
  Future<BookingModel> checkInBooking(String bookingId) async {
    _logger.d('Checking in booking: $bookingId');

    try {
      final result = await _client
          .mutate(
            MutationOptions(
              document: documentNodeMutationCheckInBooking,
              variables:
                  Variables$Mutation$CheckInBooking(bookingId: bookingId)
                      .toJson(),
            ),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              _logger.w('CheckInBooking mutation timeout');
              throw app_exceptions.NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw app_exceptions.NetworkException(
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to check in booking',
          'CHECK_IN_FAILED',
        );
      }

      _logger.i('Successfully checked in booking: $bookingId');
      return getBookingById(bookingId);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error checking in booking', error: e);
      throw app_exceptions.NetworkException(
        'Failed to check in booking: $e',
        'UNKNOWN',
      );
    }
  }

  @override
  Future<BookingModel> checkOutBooking(String bookingId) async {
    _logger.d('Checking out booking: $bookingId');

    try {
      final result = await _client
          .mutate(
            MutationOptions(
              document: documentNodeMutationCheckOutBooking,
              variables:
                  Variables$Mutation$CheckOutBooking(bookingId: bookingId)
                      .toJson(),
            ),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              _logger.w('CheckOutBooking mutation timeout');
              throw app_exceptions.NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw app_exceptions.NetworkException(
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to check out booking',
          'CHECK_OUT_FAILED',
        );
      }

      _logger.i('Successfully checked out booking: $bookingId');
      return getBookingById(bookingId);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error checking out booking', error: e);
      throw app_exceptions.NetworkException(
        'Failed to check out booking: $e',
        'UNKNOWN',
      );
    }
  }

  @override
  Stream<BookingUpdateEvent> subscribeToBookingUpdates(String userId) {
    try {
      _logger.d('Subscribing to booking updates for user: $userId');

      // Schema: bookingUpdates(clubId, userId) emits the FacilityBooking
      // itself (no type/message wrapper).
      return _client
          .subscribe(
            SubscriptionOptions(
              document: documentNodeSubscriptionBookingUpdates,
              variables: {'userId': userId},
            ),
          )
          .timeout(
            const Duration(seconds: 30),
            onTimeout: (sink) {
              _logger.w('BookingUpdates subscription timeout');
              sink.addError(
                const app_exceptions.NetworkException(
                  'Subscription connection timed out',
                  'SUBSCRIPTION_TIMEOUT',
                ),
              );
              sink.close();
            },
          )
          .map((result) {
            if (result.hasException) {
              throw app_exceptions.NetworkException(
                result.exception?.graphqlErrors.firstOrNull?.message ??
                    'Subscription error',
                'SUBSCRIPTION_ERROR',
              );
            }

            final data = result.data?['bookingUpdates'];
            if (data == null) {
              throw const app_exceptions.NetworkException(
                'No booking update data received',
                'NO_DATA',
              );
            }
            return BookingUpdateEvent(
              type: 'UPDATED',
              booking: BookingModel.fromJson(data as Map<String, dynamic>),
              message: '',
              timestamp: DateTime.now(),
            );
          });
    } on Exception catch (e) {
      _logger.e('Error setting up booking updates subscription', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to subscribe to booking updates: $e',
      );
    }
  }

  @override
  Future<List<VisitModel>> getMyVisits({int? limit, String? cursor}) async {
    _logger.d('Fetching my visits');

    try {
      final result = await _client.query(
        QueryOptions(
          document: documentNodeQueryMyVisits,
          variables: Variables$Query$MyVisits(
            pagination: limit != null
                ? Input$PaginationInput(pageSize: limit)
                : null,
          ).toJson(),
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException(
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to fetch visits',
          'FETCH_FAILED',
        );
      }

      final data = result.data?['myVisits'] as Map<String, dynamic>?;
      if (data == null) return [];

      final nodes = data['nodes'] as List<dynamic>? ?? [];
      return nodes
          .map((n) => VisitModel.fromJson(n as Map<String, dynamic>))
          .toList();
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error fetching visits', error: e);
      throw app_exceptions.NetworkException(
        'Failed to fetch visits: $e',
        'UNKNOWN',
      );
    }
  }

  @override
  Future<VisitModel> recordVisit({
    required String memberId,
    required String visitingClubId,
    List<String>? services,
    double? cost,
  }) async {
    _logger.d('Recording visit to club: $visitingClubId');

    try {
      final result = await _client
          .mutate(
            MutationOptions(
              document: documentNodeMutationRecordVisit,
              variables: Variables$Mutation$RecordVisit(
                input: Input$RecordVisitInput(
                  memberId: memberId,
                  visitingClubId: visitingClubId,
                  services: services,
                  cost: cost,
                ),
              ).toJson(),
            ),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              _logger.w('RecordVisit mutation timeout');
              throw app_exceptions.NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw app_exceptions.NetworkException(
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to record visit',
          'RECORD_VISIT_FAILED',
        );
      }

      final visitData = result.data?['recordVisit'] as Map<String, dynamic>?;
      if (visitData == null) {
        throw const app_exceptions.NetworkException(
          'No visit data returned',
          'NO_DATA',
        );
      }

      _logger.i('Successfully recorded visit to club: $visitingClubId');
      return VisitModel.fromJson(visitData);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error recording visit', error: e);
      throw app_exceptions.NetworkException(
        'Failed to record visit: $e',
        'UNKNOWN',
      );
    }
  }

  @override
  Future<VisitModel> checkoutVisit({
    required String visitId,
    List<String>? services,
    double? cost,
  }) async {
    _logger.d('Checking out visit: $visitId');

    try {
      final result = await _client
          .mutate(
            MutationOptions(
              document: documentNodeMutationCheckOutVisit,
              variables: Variables$Mutation$CheckOutVisit(
                input: Input$CheckOutVisitInput(
                  visitId: visitId,
                  services: services,
                  cost: cost,
                ),
              ).toJson(),
            ),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              _logger.w('CheckOutVisit mutation timeout');
              throw app_exceptions.NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw app_exceptions.NetworkException(
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to checkout visit',
          'CHECKOUT_VISIT_FAILED',
        );
      }

      final visitData =
          result.data?['checkOutVisit'] as Map<String, dynamic>?;
      if (visitData == null) {
        throw const app_exceptions.NetworkException(
          'No visit data returned',
          'NO_DATA',
        );
      }

      _logger.i('Successfully checked out visit: $visitId');
      return VisitModel.fromJson(visitData);
    } on app_exceptions.NetworkException {
      rethrow;
    } on Exception catch (e) {
      _logger.e('Error checking out visit', error: e);
      throw app_exceptions.NetworkException(
        'Failed to checkout visit: $e',
        'UNKNOWN',
      );
    }
  }
}

// Supporting classes

class BookingUpdateEvent {
  const BookingUpdateEvent({
    required this.type,
    required this.booking,
    required this.message,
    required this.timestamp,
  });
  factory BookingUpdateEvent.fromJson(Map<String, dynamic> json) =>
      BookingUpdateEvent(
        type: json['type'] as String,
        booking: BookingModel.fromJson(json['booking'] as Map<String, dynamic>),
        message: json['message'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
      );
  final String type;
  final BookingModel booking;
  final String message;
  final DateTime timestamp;
}
