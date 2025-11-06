import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/exceptions.dart' as app_exceptions;
import '../../domain/entities/booking_entity.dart';
import '../models/booking_model.dart';
import '../models/facility_availability_model.dart';

abstract class BookingsRemoteDataSource {
  Future<List<BookingModel>> getUserBookings({
    BookingStatus? status,
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

  Stream<BookingUpdateEvent> subscribeToBookingUpdates(String userId);
}

class BookingsRemoteDataSourceImpl implements BookingsRemoteDataSource {
  BookingsRemoteDataSourceImpl({required GraphQLClient client, Logger? logger})
    : _client = client,
      _logger = logger ?? Logger();

  final GraphQLClient _client;
  final Logger _logger;

  @override
  Future<List<BookingModel>> getUserBookings({
    BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    String? cursor,
  }) async {
    _logger.d('Fetching user bookings with status: $status');

    // TODO: Backend bookings schema not yet implemented
    // Return empty list until backend API is ready
    _logger.w(
      'Bookings API not yet implemented in backend, returning empty list',
    );
    return [];

    /*
    // This code will be uncommented when backend bookings schema is available
    try {
      final variables = <String, dynamic>{
        'filter': {
          if (status != null) 'status': status.name.toUpperCase(),
          if (startDate != null) 'startDate': startDate.toIso8601String(),
          if (endDate != null) 'endDate': endDate.toIso8601String(),
        },
        'pagination': {
          if (limit != null) 'first': limit,
          if (cursor != null) 'after': cursor,
        },
      };

      const query = r'''
        query UserBookings($filter: BookingFilterInput, $pagination: PaginationInput) {
          myBookings(filter: $filter, pagination: $pagination) {
            nodes {
              id
              startTime
              endTime
              status
              notes
              createdAt
              club { id name logo }
              facility { id name }
            }
            pageInfo { hasNextPage totalCount }
          }
        }
      ''';

      final result = await _client.query(
        QueryOptions(
          document: gql(query),
          variables: variables,
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ??
            'Failed to fetch bookings',
        );
      }

      final data = result.data?['myBookings'];
      if (data == null) {
        throw const app_exceptions.NetworkException(
          'No bookings data received',
          'NO_DATA',
        );
      }

      final nodes = data['nodes'] as List<dynamic>?;
      if (nodes == null) {
        return [];
      }

      return nodes
          .map((node) => BookingModel.fromJson(node as Map<String, dynamic>))
          .toList();
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching bookings', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching bookings', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to fetch bookings: $e',
      );
    }
    */
  }

  @override
  Future<BookingModel> getBookingById(String bookingId) async {
    try {
      _logger.d('Fetching booking details for ID: $bookingId');

      // TODO: Add bookingDetailsQuery to GraphQLDocuments when backend schema is available
      const query = r'''
        query BookingDetails($id: ID!) {
          booking(id: $id) {
            id
            startTime
            endTime
            status
            notes
            createdAt
            updatedAt
            club {
              id
              name
              logo
              address {
                street
                city
                state
              }
            }
            facility {
              id
              name
              description
              capacity
              images
            }
            user {
              id
              firstName
              lastName
              avatar
            }
            participants {
              id
              user {
                id
                firstName
                lastName
                avatar
              }
              role
              status
            }
            payment {
              id
              amount
              currency
              status
              method
            }
            cancellation {
              reason
              cancelledAt
              refundAmount
            }
          }
        }
      ''';

      final result = await _client.query(
        QueryOptions(
          document: gql(query),
          variables: {'id': bookingId},
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to fetch booking details',
        );
      }

      final bookingData = result.data?['booking'];
      if (bookingData == null) {
        throw app_exceptions.NetworkException.notFound(
          'Null booking',
          'Booking data is null',
        );
      }

      return BookingModel.fromJson(bookingData as Map<String, dynamic>);
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching booking details', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching booking details', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to fetch booking details: $e',
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

      final variables = {
        'facilityId': facilityId,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
      };

      // TODO: Add facilityAvailabilityQuery to GraphQLDocuments when backend schema is available
      const query = r'''
        query FacilityAvailability($facilityId: ID!, $startDate: DateTime!, $endDate: DateTime!) {
          facilityAvailability(facilityId: $facilityId, startDate: $startDate, endDate: $endDate) {
            facility {
              id
              name
              capacity
            }
            availableSlots {
              startTime
              endTime
              available
              capacity
              remainingSpots
            }
          }
        }
      ''';

      final result = await _client.query(
        QueryOptions(
          document: gql(query),
          variables: variables,
          fetchPolicy: FetchPolicy.networkOnly, // Always get fresh availability
        ),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to fetch availability',
        );
      }

      final data = result.data?['facilityAvailability'];
      if (data == null) {
        throw const app_exceptions.NetworkException(
          'No availability data received',
          'NO_DATA',
        );
      }

      return FacilityAvailabilityModel.fromJson(data as Map<String, dynamic>);
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
    try {
      _logger.d('Creating booking for facility: $facilityId');

      final variables = {
        'input': {
          'facilityId': facilityId,
          'startTime': startTime.toIso8601String(),
          'endTime': endTime.toIso8601String(),
          if (notes != null) 'notes': notes,
          if (participantIds != null && participantIds.isNotEmpty)
            'participantIds': participantIds,
        },
      };

      // TODO: Add createBookingMutation to GraphQLDocuments when backend schema is available
      const mutation = r'''
        mutation CreateBooking($input: CreateBookingInput!) {
          createBooking(input: $input) {
            booking {
              id
              startTime
              endTime
              status
              notes
              club { id name logo }
              facility { id name }
            }
            success
            message
          }
        }
      ''';

      final result = await _client.mutate(
        MutationOptions(document: gql(mutation), variables: variables),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to create booking',
        );
      }

      final data = result.data?['createBooking'];
      if (data == null || data['success'] != true) {
        throw app_exceptions.NetworkException(
          (data?['message'] as String?) ?? 'Failed to create booking',
          'CREATE_FAILED',
        );
      }

      final bookingData = data['booking'];
      if (bookingData == null) {
        throw const app_exceptions.NetworkException(
          'No booking data received',
          'NO_DATA',
        );
      }

      _logger.i('Successfully created booking: ${bookingData['id']}');
      return BookingModel.fromJson(bookingData as Map<String, dynamic>);
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error creating booking', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error creating booking', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to create booking: $e',
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
    try {
      _logger.d('Updating booking: $bookingId');

      final variables = {
        'bookingId': bookingId,
        'input': {
          if (startTime != null) 'startTime': startTime.toIso8601String(),
          if (endTime != null) 'endTime': endTime.toIso8601String(),
          if (notes != null) 'notes': notes,
          if (participantIds != null) 'participantIds': participantIds,
        },
      };

      // TODO: Add updateBookingMutation to GraphQLDocuments when backend schema is available
      const mutation = r'''
        mutation UpdateBooking($bookingId: ID!, $input: UpdateBookingInput!) {
          updateBooking(bookingId: $bookingId, input: $input) {
            booking {
              id
              startTime
              endTime
              notes
            }
            success
            message
          }
        }
      ''';

      final result = await _client.mutate(
        MutationOptions(document: gql(mutation), variables: variables),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to update booking',
        );
      }

      final data = result.data?['updateBooking'];
      if (data == null || data['success'] != true) {
        throw app_exceptions.NetworkException(
          (data?['message'] as String?) ?? 'Failed to update booking',
          'UPDATE_FAILED',
        );
      }

      final bookingData = data['booking'];
      if (bookingData == null) {
        throw const app_exceptions.NetworkException(
          'No booking data received',
          'NO_DATA',
        );
      }

      _logger.i('Successfully updated booking: $bookingId');
      return BookingModel.fromJson(bookingData as Map<String, dynamic>);
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error updating booking', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error updating booking', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to update booking: $e',
      );
    }
  }

  @override
  Future<BookingModel> cancelBooking({
    required String bookingId,
    String? reason,
  }) async {
    try {
      _logger.d('Cancelling booking: $bookingId');

      final variables = {
        'bookingId': bookingId,
        if (reason != null) 'reason': reason,
      };

      // TODO: Add cancelBookingMutation to GraphQLDocuments when backend schema is available
      const mutation = r'''
        mutation CancelBooking($bookingId: ID!, $reason: String) {
          cancelBooking(bookingId: $bookingId, reason: $reason) {
            booking {
              id
              status
              cancellation {
                reason
                cancelledAt
                refundAmount
              }
            }
            success
            message
          }
        }
      ''';

      final result = await _client.mutate(
        MutationOptions(document: gql(mutation), variables: variables),
      );

      if (result.hasException) {
        throw app_exceptions.NetworkException.serverError(
          500,
          result.exception?.graphqlErrors.firstOrNull?.message ??
              'Failed to cancel booking',
        );
      }

      final data = result.data?['cancelBooking'];
      if (data == null || data['success'] != true) {
        throw app_exceptions.NetworkException(
          (data?['message'] as String?) ?? 'Failed to cancel booking',
          'CANCEL_FAILED',
        );
      }

      final bookingData = data['booking'];
      if (bookingData == null) {
        throw const app_exceptions.NetworkException(
          'No booking data received',
          'NO_DATA',
        );
      }

      _logger.i('Successfully cancelled booking: $bookingId');
      return BookingModel.fromJson(bookingData as Map<String, dynamic>);
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error cancelling booking', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error cancelling booking', error: e);
      throw app_exceptions.NetworkException.serverError(
        500,
        'Failed to cancel booking: $e',
      );
    }
  }

  @override
  Stream<BookingUpdateEvent> subscribeToBookingUpdates(String userId) {
    try {
      _logger.d('Subscribing to booking updates for user: $userId');

      // TODO: Add bookingUpdatesSubscription to GraphQLDocuments when backend schema is available
      const subscription = r'''
        subscription BookingUpdates($userId: ID!) {
          bookingUpdates(userId: $userId) {
            type
            booking {
              id
              startTime
              endTime
              status
              club { id name logo }
              facility { id name }
            }
            message
            timestamp
          }
        }
      ''';

      return _client
          .subscribe(
            SubscriptionOptions(
              document: gql(subscription),
              variables: {'userId': userId},
            ),
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
            return BookingUpdateEvent.fromJson(data as Map<String, dynamic>);
          })
          .handleError((Object error) {
            _logger.e('Error in booking updates subscription', error: error);
            throw app_exceptions.NetworkException(
              'Booking updates subscription error: $error',
              'SUBSCRIPTION_ERROR',
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
