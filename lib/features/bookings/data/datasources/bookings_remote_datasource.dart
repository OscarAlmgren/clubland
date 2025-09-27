import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/exceptions.dart' as app_exceptions;
import '../../../../core/graphql/graphql_operations.dart';
import '../../../../core/network/graphql_client.dart';
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
  BookingsRemoteDataSourceImpl({Logger? logger})
      : _logger = logger ?? Logger();

  final Logger _logger;

  @override
  Future<List<BookingModel>> getUserBookings({
    BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    String? cursor,
  }) async {
    try {
      _logger.d('Fetching user bookings with status: $status');

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

      final result = await GraphQLHelpers.executeQuery(
        QueryOptions(
          document: gql(GraphQLOperations.userBookingsQuery),
          variables: variables,
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        throw app_exceptions.NetworkException.serverError(
          500,
          GraphQLHelpers.getErrorMessage(result) ?? 'Failed to fetch bookings',
        );
      }

      final data = result.data?['myBookings'];
      if (data == null) {
        throw const app_exceptions.NetworkException('No bookings data received', 'NO_DATA');
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
      throw app_exceptions.NetworkException.serverError(500, 'Failed to fetch bookings: $e');
    }
  }

  @override
  Future<BookingModel> getBookingById(String bookingId) async {
    try {
      _logger.d('Fetching booking details for ID: $bookingId');

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

      final result = await GraphQLHelpers.executeQuery(
        QueryOptions(
          document: gql(query),
          variables: {'id': bookingId},
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        throw app_exceptions.NetworkException.serverError(
          500,
          GraphQLHelpers.getErrorMessage(result) ?? 'Failed to fetch booking details',
        );
      }

      final bookingData = result.data?['booking'];
      if (bookingData == null) {
        throw app_exceptions.NetworkException.notFound();
      }

      return BookingModel.fromJson(bookingData as Map<String, dynamic>);
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching booking details', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching booking details', error: e);
      throw app_exceptions.NetworkException.serverError(500, 'Failed to fetch booking details: $e');
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

      final result = await GraphQLHelpers.executeQuery(
        QueryOptions(
          document: gql(GraphQLOperations.facilityAvailabilityQuery),
          variables: variables,
          fetchPolicy: FetchPolicy.networkOnly, // Always get fresh availability
        ),
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        throw app_exceptions.NetworkException.serverError(
          500,
          GraphQLHelpers.getErrorMessage(result) ?? 'Failed to fetch availability',
        );
      }

      final data = result.data?['facilityAvailability'];
      if (data == null) {
        throw const app_exceptions.NetworkException('No availability data received', 'NO_DATA');
      }

      return FacilityAvailabilityModel.fromJson(data as Map<String, dynamic>);
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error fetching availability', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching availability', error: e);
      throw app_exceptions.NetworkException.serverError(500, 'Failed to fetch availability: $e');
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

      final result = await GraphQLHelpers.executeMutation(
        MutationOptions(
          document: gql(GraphQLOperations.createBookingMutation),
          variables: variables,
        ),
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        throw app_exceptions.NetworkException.serverError(
          500,
          GraphQLHelpers.getErrorMessage(result) ?? 'Failed to create booking',
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
        throw const app_exceptions.NetworkException('No booking data received', 'NO_DATA');
      }

      _logger.i('Successfully created booking: ${bookingData['id']}');
      return BookingModel.fromJson(bookingData as Map<String, dynamic>);
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error creating booking', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error creating booking', error: e);
      throw app_exceptions.NetworkException.serverError(500, 'Failed to create booking: $e');
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

      final result = await GraphQLHelpers.executeMutation(
        MutationOptions(
          document: gql(GraphQLOperations.updateBookingMutation),
          variables: variables,
        ),
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        throw app_exceptions.NetworkException.serverError(
          500,
          GraphQLHelpers.getErrorMessage(result) ?? 'Failed to update booking',
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
        throw const app_exceptions.NetworkException('No booking data received', 'NO_DATA');
      }

      _logger.i('Successfully updated booking: $bookingId');
      return BookingModel.fromJson(bookingData as Map<String, dynamic>);
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error updating booking', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error updating booking', error: e);
      throw app_exceptions.NetworkException.serverError(500, 'Failed to update booking: $e');
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

      final result = await GraphQLHelpers.executeMutation(
        MutationOptions(
          document: gql(GraphQLOperations.cancelBookingMutation),
          variables: variables,
        ),
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        throw app_exceptions.NetworkException.serverError(
          500,
          GraphQLHelpers.getErrorMessage(result) ?? 'Failed to cancel booking',
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
        throw const app_exceptions.NetworkException('No booking data received', 'NO_DATA');
      }

      _logger.i('Successfully cancelled booking: $bookingId');
      return BookingModel.fromJson(bookingData as Map<String, dynamic>);
    } on app_exceptions.GraphQLException catch (e) {
      _logger.e('GraphQL error cancelling booking', error: e);
      throw app_exceptions.NetworkException.serverError(500, e.toString());
    } on Exception catch (e) {
      _logger.e('Error cancelling booking', error: e);
      throw app_exceptions.NetworkException.serverError(500, 'Failed to cancel booking: $e');
    }
  }

  @override
  Stream<BookingUpdateEvent> subscribeToBookingUpdates(String userId) {
    try {
      _logger.d('Subscribing to booking updates for user: $userId');

      return GraphQLHelpers.executeSubscription<Map<String, dynamic>>(
            SubscriptionOptions(
              document: gql(GraphQLOperations.bookingUpdatesSubscription),
              variables: {'userId': userId},
            ),
            showErrorToUser: false, // Handle errors in stream
          )
          .map((result) {
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
  factory BookingUpdateEvent.fromJson(Map<String, dynamic> json) =>
      BookingUpdateEvent(
        type: json['type'] as String,
        booking: BookingModel.fromJson(json['booking'] as Map<String, dynamic>),
        message: json['message'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
      );

  const BookingUpdateEvent({
    required this.type,
    required this.booking,
    required this.message,
    required this.timestamp,
  });
  final String type;
  final BookingModel booking;
  final String message;
  final DateTime timestamp;
}
