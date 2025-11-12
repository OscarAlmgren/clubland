import 'package:equatable/equatable.dart';
import 'event_entity.dart';

/// Page info entity for pagination
class PageInfoEntity extends Equatable {
  const PageInfoEntity({
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.startCursor,
    this.endCursor,
    this.page,
    this.total,
  });

  final bool hasNextPage;
  final bool hasPreviousPage;
  final String? startCursor;
  final String? endCursor;
  final int? page;
  final int? total;

  @override
  List<Object?> get props => [
    hasNextPage,
    hasPreviousPage,
    startCursor,
    endCursor,
    page,
    total,
  ];
}

/// Events connection entity - represents a paginated list of events
class EventsConnectionEntity extends Equatable {
  const EventsConnectionEntity({
    required this.events,
    required this.pageInfo,
    required this.totalCount,
  });

  final List<EventEntity> events;
  final PageInfoEntity pageInfo;
  final int totalCount;

  /// Whether there are any events
  bool get hasEvents => events.isNotEmpty;

  /// Whether the list is empty
  bool get isEmpty => events.isEmpty;

  @override
  List<Object?> get props => [events, pageInfo, totalCount];
}

/// RSVPs connection entity - represents a paginated list of RSVPs
class RSVPsConnectionEntity extends Equatable {
  const RSVPsConnectionEntity({
    required this.rsvps,
    required this.pageInfo,
    required this.totalCount,
  });

  final List rsvps;
  final PageInfoEntity pageInfo;
  final int totalCount;

  /// Whether there are any RSVPs
  bool get hasRSVPs => rsvps.isNotEmpty;

  /// Whether the list is empty
  bool get isEmpty => rsvps.isEmpty;

  @override
  List<Object?> get props => [rsvps, pageInfo, totalCount];
}
