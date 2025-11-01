import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Booking {
  factory Variables$Query$Booking({required String id}) =>
      Variables$Query$Booking._({r'id': id});

  Variables$Query$Booking._(this._$data);

  factory Variables$Query$Booking.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$Booking._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$Booking<Variables$Query$Booking> get copyWith =>
      CopyWith$Variables$Query$Booking(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Booking || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$Booking<TRes> {
  factory CopyWith$Variables$Query$Booking(
    Variables$Query$Booking instance,
    TRes Function(Variables$Query$Booking) then,
  ) = _CopyWithImpl$Variables$Query$Booking;

  factory CopyWith$Variables$Query$Booking.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Booking;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$Booking<TRes>
    implements CopyWith$Variables$Query$Booking<TRes> {
  _CopyWithImpl$Variables$Query$Booking(this._instance, this._then);

  final Variables$Query$Booking _instance;

  final TRes Function(Variables$Query$Booking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$Booking._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$Booking<TRes>
    implements CopyWith$Variables$Query$Booking<TRes> {
  _CopyWithStubImpl$Variables$Query$Booking(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$Booking {
  Query$Booking({this.booking, this.$__typename = 'Query'});

  factory Query$Booking.fromJson(Map<String, dynamic> json) {
    final l$booking = json['booking'];
    final l$$__typename = json['__typename'];
    return Query$Booking(
      booking: l$booking == null
          ? null
          : Query$Booking$booking.fromJson((l$booking as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Booking$booking? booking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$booking = booking;
    _resultData['booking'] = l$booking?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$booking = booking;
    final l$$__typename = $__typename;
    return Object.hashAll([l$booking, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Booking || runtimeType != other.runtimeType) {
      return false;
    }
    final l$booking = booking;
    final lOther$booking = other.booking;
    if (l$booking != lOther$booking) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Booking on Query$Booking {
  CopyWith$Query$Booking<Query$Booking> get copyWith =>
      CopyWith$Query$Booking(this, (i) => i);
}

abstract class CopyWith$Query$Booking<TRes> {
  factory CopyWith$Query$Booking(
    Query$Booking instance,
    TRes Function(Query$Booking) then,
  ) = _CopyWithImpl$Query$Booking;

  factory CopyWith$Query$Booking.stub(TRes res) =
      _CopyWithStubImpl$Query$Booking;

  TRes call({Query$Booking$booking? booking, String? $__typename});
  CopyWith$Query$Booking$booking<TRes> get booking;
}

class _CopyWithImpl$Query$Booking<TRes>
    implements CopyWith$Query$Booking<TRes> {
  _CopyWithImpl$Query$Booking(this._instance, this._then);

  final Query$Booking _instance;

  final TRes Function(Query$Booking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? booking = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$Booking(
          booking: booking == _undefined
              ? _instance.booking
              : (booking as Query$Booking$booking?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$Booking$booking<TRes> get booking {
    final local$booking = _instance.booking;
    return local$booking == null
        ? CopyWith$Query$Booking$booking.stub(_then(_instance))
        : CopyWith$Query$Booking$booking(
            local$booking,
            (e) => call(booking: e),
          );
  }
}

class _CopyWithStubImpl$Query$Booking<TRes>
    implements CopyWith$Query$Booking<TRes> {
  _CopyWithStubImpl$Query$Booking(this._res);

  TRes _res;

  call({Query$Booking$booking? booking, String? $__typename}) => _res;

  CopyWith$Query$Booking$booking<TRes> get booking =>
      CopyWith$Query$Booking$booking.stub(_res);
}

const documentNodeQueryBooking = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Booking'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'booking'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'facilityId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'userId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'facility'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'type'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'capacity'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: 'user'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'firstName'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'lastName'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'email'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: 'startTime'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'endTime'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'status'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'notes'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'participants'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'partySize'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'mealType'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'dietaryRestrictions'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'specialRequests'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'tablePreference'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'eventType'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'guestCount'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'serviceAddons'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cancellationReason'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'confirmedAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'confirmedBy'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cancelledAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'checkedInAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'checkedOutAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'createdAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'updatedAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Query$Booking _parserFn$Query$Booking(Map<String, dynamic> data) =>
    Query$Booking.fromJson(data);
typedef OnQueryComplete$Query$Booking =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Booking?);

class Options$Query$Booking extends graphql.QueryOptions<Query$Booking> {
  Options$Query$Booking({
    String? operationName,
    required Variables$Query$Booking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Booking? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Booking? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$Booking(data),
               ),
         onError: onError,
         document: documentNodeQueryBooking,
         parserFn: _parserFn$Query$Booking,
       );

  final OnQueryComplete$Query$Booking? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Booking
    extends graphql.WatchQueryOptions<Query$Booking> {
  WatchOptions$Query$Booking({
    String? operationName,
    required Variables$Query$Booking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Booking? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryBooking,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Booking,
       );
}

class FetchMoreOptions$Query$Booking extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Booking({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$Booking variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryBooking,
       );
}

extension ClientExtension$Query$Booking on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Booking>> query$Booking(
    Options$Query$Booking options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$Booking> watchQuery$Booking(
    WatchOptions$Query$Booking options,
  ) => this.watchQuery(options);

  void writeQuery$Booking({
    required Query$Booking data,
    required Variables$Query$Booking variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryBooking),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$Booking? readQuery$Booking({
    required Variables$Query$Booking variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryBooking),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Booking.fromJson(result);
  }
}

class Query$Booking$booking {
  Query$Booking$booking({
    required this.id,
    required this.facilityId,
    required this.userId,
    required this.facility,
    required this.user,
    required this.startTime,
    required this.endTime,
    required this.status,
    this.notes,
    this.participants,
    this.partySize,
    this.mealType,
    this.dietaryRestrictions,
    this.specialRequests,
    this.tablePreference,
    this.eventType,
    this.guestCount,
    this.serviceAddons,
    this.cancellationReason,
    this.confirmedAt,
    this.confirmedBy,
    this.cancelledAt,
    this.checkedInAt,
    this.checkedOutAt,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Booking',
  });

  factory Query$Booking$booking.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$facilityId = json['facilityId'];
    final l$userId = json['userId'];
    final l$facility = json['facility'];
    final l$user = json['user'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$status = json['status'];
    final l$notes = json['notes'];
    final l$participants = json['participants'];
    final l$partySize = json['partySize'];
    final l$mealType = json['mealType'];
    final l$dietaryRestrictions = json['dietaryRestrictions'];
    final l$specialRequests = json['specialRequests'];
    final l$tablePreference = json['tablePreference'];
    final l$eventType = json['eventType'];
    final l$guestCount = json['guestCount'];
    final l$serviceAddons = json['serviceAddons'];
    final l$cancellationReason = json['cancellationReason'];
    final l$confirmedAt = json['confirmedAt'];
    final l$confirmedBy = json['confirmedBy'];
    final l$cancelledAt = json['cancelledAt'];
    final l$checkedInAt = json['checkedInAt'];
    final l$checkedOutAt = json['checkedOutAt'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$Booking$booking(
      id: (l$id as String),
      facilityId: (l$facilityId as String),
      userId: (l$userId as String),
      facility: Query$Booking$booking$facility.fromJson(
        (l$facility as Map<String, dynamic>),
      ),
      user: Query$Booking$booking$user.fromJson(
        (l$user as Map<String, dynamic>),
      ),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      notes: (l$notes as String?),
      participants: (l$participants as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList(),
      partySize: (l$partySize as int?),
      mealType: l$mealType == null
          ? null
          : fromJson$Enum$MealType((l$mealType as String)),
      dietaryRestrictions: (l$dietaryRestrictions as List<dynamic>?)
          ?.map((e) => fromJson$Enum$DietaryRestriction((e as String)))
          .toList(),
      specialRequests: (l$specialRequests as String?),
      tablePreference: l$tablePreference == null
          ? null
          : fromJson$Enum$TablePreference((l$tablePreference as String)),
      eventType: l$eventType == null
          ? null
          : fromJson$Enum$EventType((l$eventType as String)),
      guestCount: (l$guestCount as int?),
      serviceAddons: (l$serviceAddons as List<dynamic>?)
          ?.map((e) => fromJson$Enum$ServiceAddon((e as String)))
          .toList(),
      cancellationReason: (l$cancellationReason as String?),
      confirmedAt: l$confirmedAt == null
          ? null
          : DateTime.parse((l$confirmedAt as String)),
      confirmedBy: (l$confirmedBy as String?),
      cancelledAt: l$cancelledAt == null
          ? null
          : DateTime.parse((l$cancelledAt as String)),
      checkedInAt: l$checkedInAt == null
          ? null
          : DateTime.parse((l$checkedInAt as String)),
      checkedOutAt: l$checkedOutAt == null
          ? null
          : DateTime.parse((l$checkedOutAt as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String facilityId;

  final String userId;

  final Query$Booking$booking$facility facility;

  final Query$Booking$booking$user user;

  final DateTime startTime;

  final DateTime endTime;

  final Enum$BookingStatus status;

  final String? notes;

  final List<String>? participants;

  final int? partySize;

  final Enum$MealType? mealType;

  final List<Enum$DietaryRestriction>? dietaryRestrictions;

  final String? specialRequests;

  final Enum$TablePreference? tablePreference;

  final Enum$EventType? eventType;

  final int? guestCount;

  final List<Enum$ServiceAddon>? serviceAddons;

  final String? cancellationReason;

  final DateTime? confirmedAt;

  final String? confirmedBy;

  final DateTime? cancelledAt;

  final DateTime? checkedInAt;

  final DateTime? checkedOutAt;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$facilityId = facilityId;
    _resultData['facilityId'] = l$facilityId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$facility = facility;
    _resultData['facility'] = l$facility.toJson();
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime.toIso8601String();
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$participants = participants;
    _resultData['participants'] = l$participants?.map((e) => e).toList();
    final l$partySize = partySize;
    _resultData['partySize'] = l$partySize;
    final l$mealType = mealType;
    _resultData['mealType'] = l$mealType == null
        ? null
        : toJson$Enum$MealType(l$mealType);
    final l$dietaryRestrictions = dietaryRestrictions;
    _resultData['dietaryRestrictions'] = l$dietaryRestrictions
        ?.map((e) => toJson$Enum$DietaryRestriction(e))
        .toList();
    final l$specialRequests = specialRequests;
    _resultData['specialRequests'] = l$specialRequests;
    final l$tablePreference = tablePreference;
    _resultData['tablePreference'] = l$tablePreference == null
        ? null
        : toJson$Enum$TablePreference(l$tablePreference);
    final l$eventType = eventType;
    _resultData['eventType'] = l$eventType == null
        ? null
        : toJson$Enum$EventType(l$eventType);
    final l$guestCount = guestCount;
    _resultData['guestCount'] = l$guestCount;
    final l$serviceAddons = serviceAddons;
    _resultData['serviceAddons'] = l$serviceAddons
        ?.map((e) => toJson$Enum$ServiceAddon(e))
        .toList();
    final l$cancellationReason = cancellationReason;
    _resultData['cancellationReason'] = l$cancellationReason;
    final l$confirmedAt = confirmedAt;
    _resultData['confirmedAt'] = l$confirmedAt?.toIso8601String();
    final l$confirmedBy = confirmedBy;
    _resultData['confirmedBy'] = l$confirmedBy;
    final l$cancelledAt = cancelledAt;
    _resultData['cancelledAt'] = l$cancelledAt?.toIso8601String();
    final l$checkedInAt = checkedInAt;
    _resultData['checkedInAt'] = l$checkedInAt?.toIso8601String();
    final l$checkedOutAt = checkedOutAt;
    _resultData['checkedOutAt'] = l$checkedOutAt?.toIso8601String();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$facilityId = facilityId;
    final l$userId = userId;
    final l$facility = facility;
    final l$user = user;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$status = status;
    final l$notes = notes;
    final l$participants = participants;
    final l$partySize = partySize;
    final l$mealType = mealType;
    final l$dietaryRestrictions = dietaryRestrictions;
    final l$specialRequests = specialRequests;
    final l$tablePreference = tablePreference;
    final l$eventType = eventType;
    final l$guestCount = guestCount;
    final l$serviceAddons = serviceAddons;
    final l$cancellationReason = cancellationReason;
    final l$confirmedAt = confirmedAt;
    final l$confirmedBy = confirmedBy;
    final l$cancelledAt = cancelledAt;
    final l$checkedInAt = checkedInAt;
    final l$checkedOutAt = checkedOutAt;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$facilityId,
      l$userId,
      l$facility,
      l$user,
      l$startTime,
      l$endTime,
      l$status,
      l$notes,
      l$participants == null
          ? null
          : Object.hashAll(l$participants.map((v) => v)),
      l$partySize,
      l$mealType,
      l$dietaryRestrictions == null
          ? null
          : Object.hashAll(l$dietaryRestrictions.map((v) => v)),
      l$specialRequests,
      l$tablePreference,
      l$eventType,
      l$guestCount,
      l$serviceAddons == null
          ? null
          : Object.hashAll(l$serviceAddons.map((v) => v)),
      l$cancellationReason,
      l$confirmedAt,
      l$confirmedBy,
      l$cancelledAt,
      l$checkedInAt,
      l$checkedOutAt,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Booking$booking || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$facilityId = facilityId;
    final lOther$facilityId = other.facilityId;
    if (l$facilityId != lOther$facilityId) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$facility = facility;
    final lOther$facility = other.facility;
    if (l$facility != lOther$facility) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$startTime = startTime;
    final lOther$startTime = other.startTime;
    if (l$startTime != lOther$startTime) {
      return false;
    }
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (l$endTime != lOther$endTime) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$participants = participants;
    final lOther$participants = other.participants;
    if (l$participants != null && lOther$participants != null) {
      if (l$participants.length != lOther$participants.length) {
        return false;
      }
      for (int i = 0; i < l$participants.length; i++) {
        final l$participants$entry = l$participants[i];
        final lOther$participants$entry = lOther$participants[i];
        if (l$participants$entry != lOther$participants$entry) {
          return false;
        }
      }
    } else if (l$participants != lOther$participants) {
      return false;
    }
    final l$partySize = partySize;
    final lOther$partySize = other.partySize;
    if (l$partySize != lOther$partySize) {
      return false;
    }
    final l$mealType = mealType;
    final lOther$mealType = other.mealType;
    if (l$mealType != lOther$mealType) {
      return false;
    }
    final l$dietaryRestrictions = dietaryRestrictions;
    final lOther$dietaryRestrictions = other.dietaryRestrictions;
    if (l$dietaryRestrictions != null && lOther$dietaryRestrictions != null) {
      if (l$dietaryRestrictions.length != lOther$dietaryRestrictions.length) {
        return false;
      }
      for (int i = 0; i < l$dietaryRestrictions.length; i++) {
        final l$dietaryRestrictions$entry = l$dietaryRestrictions[i];
        final lOther$dietaryRestrictions$entry = lOther$dietaryRestrictions[i];
        if (l$dietaryRestrictions$entry != lOther$dietaryRestrictions$entry) {
          return false;
        }
      }
    } else if (l$dietaryRestrictions != lOther$dietaryRestrictions) {
      return false;
    }
    final l$specialRequests = specialRequests;
    final lOther$specialRequests = other.specialRequests;
    if (l$specialRequests != lOther$specialRequests) {
      return false;
    }
    final l$tablePreference = tablePreference;
    final lOther$tablePreference = other.tablePreference;
    if (l$tablePreference != lOther$tablePreference) {
      return false;
    }
    final l$eventType = eventType;
    final lOther$eventType = other.eventType;
    if (l$eventType != lOther$eventType) {
      return false;
    }
    final l$guestCount = guestCount;
    final lOther$guestCount = other.guestCount;
    if (l$guestCount != lOther$guestCount) {
      return false;
    }
    final l$serviceAddons = serviceAddons;
    final lOther$serviceAddons = other.serviceAddons;
    if (l$serviceAddons != null && lOther$serviceAddons != null) {
      if (l$serviceAddons.length != lOther$serviceAddons.length) {
        return false;
      }
      for (int i = 0; i < l$serviceAddons.length; i++) {
        final l$serviceAddons$entry = l$serviceAddons[i];
        final lOther$serviceAddons$entry = lOther$serviceAddons[i];
        if (l$serviceAddons$entry != lOther$serviceAddons$entry) {
          return false;
        }
      }
    } else if (l$serviceAddons != lOther$serviceAddons) {
      return false;
    }
    final l$cancellationReason = cancellationReason;
    final lOther$cancellationReason = other.cancellationReason;
    if (l$cancellationReason != lOther$cancellationReason) {
      return false;
    }
    final l$confirmedAt = confirmedAt;
    final lOther$confirmedAt = other.confirmedAt;
    if (l$confirmedAt != lOther$confirmedAt) {
      return false;
    }
    final l$confirmedBy = confirmedBy;
    final lOther$confirmedBy = other.confirmedBy;
    if (l$confirmedBy != lOther$confirmedBy) {
      return false;
    }
    final l$cancelledAt = cancelledAt;
    final lOther$cancelledAt = other.cancelledAt;
    if (l$cancelledAt != lOther$cancelledAt) {
      return false;
    }
    final l$checkedInAt = checkedInAt;
    final lOther$checkedInAt = other.checkedInAt;
    if (l$checkedInAt != lOther$checkedInAt) {
      return false;
    }
    final l$checkedOutAt = checkedOutAt;
    final lOther$checkedOutAt = other.checkedOutAt;
    if (l$checkedOutAt != lOther$checkedOutAt) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Booking$booking on Query$Booking$booking {
  CopyWith$Query$Booking$booking<Query$Booking$booking> get copyWith =>
      CopyWith$Query$Booking$booking(this, (i) => i);
}

abstract class CopyWith$Query$Booking$booking<TRes> {
  factory CopyWith$Query$Booking$booking(
    Query$Booking$booking instance,
    TRes Function(Query$Booking$booking) then,
  ) = _CopyWithImpl$Query$Booking$booking;

  factory CopyWith$Query$Booking$booking.stub(TRes res) =
      _CopyWithStubImpl$Query$Booking$booking;

  TRes call({
    String? id,
    String? facilityId,
    String? userId,
    Query$Booking$booking$facility? facility,
    Query$Booking$booking$user? user,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? notes,
    List<String>? participants,
    int? partySize,
    Enum$MealType? mealType,
    List<Enum$DietaryRestriction>? dietaryRestrictions,
    String? specialRequests,
    Enum$TablePreference? tablePreference,
    Enum$EventType? eventType,
    int? guestCount,
    List<Enum$ServiceAddon>? serviceAddons,
    String? cancellationReason,
    DateTime? confirmedAt,
    String? confirmedBy,
    DateTime? cancelledAt,
    DateTime? checkedInAt,
    DateTime? checkedOutAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
  CopyWith$Query$Booking$booking$facility<TRes> get facility;
  CopyWith$Query$Booking$booking$user<TRes> get user;
}

class _CopyWithImpl$Query$Booking$booking<TRes>
    implements CopyWith$Query$Booking$booking<TRes> {
  _CopyWithImpl$Query$Booking$booking(this._instance, this._then);

  final Query$Booking$booking _instance;

  final TRes Function(Query$Booking$booking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? facilityId = _undefined,
    Object? userId = _undefined,
    Object? facility = _undefined,
    Object? user = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? status = _undefined,
    Object? notes = _undefined,
    Object? participants = _undefined,
    Object? partySize = _undefined,
    Object? mealType = _undefined,
    Object? dietaryRestrictions = _undefined,
    Object? specialRequests = _undefined,
    Object? tablePreference = _undefined,
    Object? eventType = _undefined,
    Object? guestCount = _undefined,
    Object? serviceAddons = _undefined,
    Object? cancellationReason = _undefined,
    Object? confirmedAt = _undefined,
    Object? confirmedBy = _undefined,
    Object? cancelledAt = _undefined,
    Object? checkedInAt = _undefined,
    Object? checkedOutAt = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Booking$booking(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      facilityId: facilityId == _undefined || facilityId == null
          ? _instance.facilityId
          : (facilityId as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      facility: facility == _undefined || facility == null
          ? _instance.facility
          : (facility as Query$Booking$booking$facility),
      user: user == _undefined || user == null
          ? _instance.user
          : (user as Query$Booking$booking$user),
      startTime: startTime == _undefined || startTime == null
          ? _instance.startTime
          : (startTime as DateTime),
      endTime: endTime == _undefined || endTime == null
          ? _instance.endTime
          : (endTime as DateTime),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$BookingStatus),
      notes: notes == _undefined ? _instance.notes : (notes as String?),
      participants: participants == _undefined
          ? _instance.participants
          : (participants as List<String>?),
      partySize: partySize == _undefined
          ? _instance.partySize
          : (partySize as int?),
      mealType: mealType == _undefined
          ? _instance.mealType
          : (mealType as Enum$MealType?),
      dietaryRestrictions: dietaryRestrictions == _undefined
          ? _instance.dietaryRestrictions
          : (dietaryRestrictions as List<Enum$DietaryRestriction>?),
      specialRequests: specialRequests == _undefined
          ? _instance.specialRequests
          : (specialRequests as String?),
      tablePreference: tablePreference == _undefined
          ? _instance.tablePreference
          : (tablePreference as Enum$TablePreference?),
      eventType: eventType == _undefined
          ? _instance.eventType
          : (eventType as Enum$EventType?),
      guestCount: guestCount == _undefined
          ? _instance.guestCount
          : (guestCount as int?),
      serviceAddons: serviceAddons == _undefined
          ? _instance.serviceAddons
          : (serviceAddons as List<Enum$ServiceAddon>?),
      cancellationReason: cancellationReason == _undefined
          ? _instance.cancellationReason
          : (cancellationReason as String?),
      confirmedAt: confirmedAt == _undefined
          ? _instance.confirmedAt
          : (confirmedAt as DateTime?),
      confirmedBy: confirmedBy == _undefined
          ? _instance.confirmedBy
          : (confirmedBy as String?),
      cancelledAt: cancelledAt == _undefined
          ? _instance.cancelledAt
          : (cancelledAt as DateTime?),
      checkedInAt: checkedInAt == _undefined
          ? _instance.checkedInAt
          : (checkedInAt as DateTime?),
      checkedOutAt: checkedOutAt == _undefined
          ? _instance.checkedOutAt
          : (checkedOutAt as DateTime?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Booking$booking$facility<TRes> get facility {
    final local$facility = _instance.facility;
    return CopyWith$Query$Booking$booking$facility(
      local$facility,
      (e) => call(facility: e),
    );
  }

  CopyWith$Query$Booking$booking$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$Booking$booking$user(
      local$user,
      (e) => call(user: e),
    );
  }
}

class _CopyWithStubImpl$Query$Booking$booking<TRes>
    implements CopyWith$Query$Booking$booking<TRes> {
  _CopyWithStubImpl$Query$Booking$booking(this._res);

  TRes _res;

  call({
    String? id,
    String? facilityId,
    String? userId,
    Query$Booking$booking$facility? facility,
    Query$Booking$booking$user? user,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? notes,
    List<String>? participants,
    int? partySize,
    Enum$MealType? mealType,
    List<Enum$DietaryRestriction>? dietaryRestrictions,
    String? specialRequests,
    Enum$TablePreference? tablePreference,
    Enum$EventType? eventType,
    int? guestCount,
    List<Enum$ServiceAddon>? serviceAddons,
    String? cancellationReason,
    DateTime? confirmedAt,
    String? confirmedBy,
    DateTime? cancelledAt,
    DateTime? checkedInAt,
    DateTime? checkedOutAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Booking$booking$facility<TRes> get facility =>
      CopyWith$Query$Booking$booking$facility.stub(_res);

  CopyWith$Query$Booking$booking$user<TRes> get user =>
      CopyWith$Query$Booking$booking$user.stub(_res);
}

class Query$Booking$booking$facility {
  Query$Booking$booking$facility({
    required this.id,
    required this.name,
    required this.type,
    this.capacity,
    this.$__typename = 'Facility',
  });

  factory Query$Booking$booking$facility.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$type = json['type'];
    final l$capacity = json['capacity'];
    final l$$__typename = json['__typename'];
    return Query$Booking$booking$facility(
      id: (l$id as String),
      name: (l$name as String),
      type: fromJson$Enum$FacilityType((l$type as String)),
      capacity: (l$capacity as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final Enum$FacilityType type;

  final int? capacity;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$type = type;
    _resultData['type'] = toJson$Enum$FacilityType(l$type);
    final l$capacity = capacity;
    _resultData['capacity'] = l$capacity;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$type = type;
    final l$capacity = capacity;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$type, l$capacity, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Booking$booking$facility ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$capacity = capacity;
    final lOther$capacity = other.capacity;
    if (l$capacity != lOther$capacity) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Booking$booking$facility
    on Query$Booking$booking$facility {
  CopyWith$Query$Booking$booking$facility<Query$Booking$booking$facility>
  get copyWith => CopyWith$Query$Booking$booking$facility(this, (i) => i);
}

abstract class CopyWith$Query$Booking$booking$facility<TRes> {
  factory CopyWith$Query$Booking$booking$facility(
    Query$Booking$booking$facility instance,
    TRes Function(Query$Booking$booking$facility) then,
  ) = _CopyWithImpl$Query$Booking$booking$facility;

  factory CopyWith$Query$Booking$booking$facility.stub(TRes res) =
      _CopyWithStubImpl$Query$Booking$booking$facility;

  TRes call({
    String? id,
    String? name,
    Enum$FacilityType? type,
    int? capacity,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Booking$booking$facility<TRes>
    implements CopyWith$Query$Booking$booking$facility<TRes> {
  _CopyWithImpl$Query$Booking$booking$facility(this._instance, this._then);

  final Query$Booking$booking$facility _instance;

  final TRes Function(Query$Booking$booking$facility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? type = _undefined,
    Object? capacity = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Booking$booking$facility(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$FacilityType),
      capacity: capacity == _undefined
          ? _instance.capacity
          : (capacity as int?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Booking$booking$facility<TRes>
    implements CopyWith$Query$Booking$booking$facility<TRes> {
  _CopyWithStubImpl$Query$Booking$booking$facility(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    Enum$FacilityType? type,
    int? capacity,
    String? $__typename,
  }) => _res;
}

class Query$Booking$booking$user {
  Query$Booking$booking$user({
    required this.id,
    this.firstName,
    this.lastName,
    required this.email,
    this.$__typename = 'User',
  });

  factory Query$Booking$booking$user.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Query$Booking$booking$user(
      id: (l$id as String),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      email: (l$email as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? firstName;

  final String? lastName;

  final String email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$email = email;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firstName,
      l$lastName,
      l$email,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Booking$booking$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Booking$booking$user
    on Query$Booking$booking$user {
  CopyWith$Query$Booking$booking$user<Query$Booking$booking$user>
  get copyWith => CopyWith$Query$Booking$booking$user(this, (i) => i);
}

abstract class CopyWith$Query$Booking$booking$user<TRes> {
  factory CopyWith$Query$Booking$booking$user(
    Query$Booking$booking$user instance,
    TRes Function(Query$Booking$booking$user) then,
  ) = _CopyWithImpl$Query$Booking$booking$user;

  factory CopyWith$Query$Booking$booking$user.stub(TRes res) =
      _CopyWithStubImpl$Query$Booking$booking$user;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Booking$booking$user<TRes>
    implements CopyWith$Query$Booking$booking$user<TRes> {
  _CopyWithImpl$Query$Booking$booking$user(this._instance, this._then);

  final Query$Booking$booking$user _instance;

  final TRes Function(Query$Booking$booking$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Booking$booking$user(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      firstName: firstName == _undefined
          ? _instance.firstName
          : (firstName as String?),
      lastName: lastName == _undefined
          ? _instance.lastName
          : (lastName as String?),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Booking$booking$user<TRes>
    implements CopyWith$Query$Booking$booking$user<TRes> {
  _CopyWithStubImpl$Query$Booking$booking$user(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? $__typename,
  }) => _res;
}
