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
  Query$Booking({this.facilityBooking, this.$__typename = 'Query'});

  factory Query$Booking.fromJson(Map<String, dynamic> json) {
    final l$facilityBooking = json['facilityBooking'];
    final l$$__typename = json['__typename'];
    return Query$Booking(
      facilityBooking: l$facilityBooking == null
          ? null
          : Query$Booking$facilityBooking.fromJson(
              (l$facilityBooking as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Booking$facilityBooking? facilityBooking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$facilityBooking = facilityBooking;
    _resultData['facilityBooking'] = l$facilityBooking?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$facilityBooking = facilityBooking;
    final l$$__typename = $__typename;
    return Object.hashAll([l$facilityBooking, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Booking || runtimeType != other.runtimeType) {
      return false;
    }
    final l$facilityBooking = facilityBooking;
    final lOther$facilityBooking = other.facilityBooking;
    if (l$facilityBooking != lOther$facilityBooking) {
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

  TRes call({
    Query$Booking$facilityBooking? facilityBooking,
    String? $__typename,
  });
  CopyWith$Query$Booking$facilityBooking<TRes> get facilityBooking;
}

class _CopyWithImpl$Query$Booking<TRes>
    implements CopyWith$Query$Booking<TRes> {
  _CopyWithImpl$Query$Booking(this._instance, this._then);

  final Query$Booking _instance;

  final TRes Function(Query$Booking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? facilityBooking = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Booking(
      facilityBooking: facilityBooking == _undefined
          ? _instance.facilityBooking
          : (facilityBooking as Query$Booking$facilityBooking?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Booking$facilityBooking<TRes> get facilityBooking {
    final local$facilityBooking = _instance.facilityBooking;
    return local$facilityBooking == null
        ? CopyWith$Query$Booking$facilityBooking.stub(_then(_instance))
        : CopyWith$Query$Booking$facilityBooking(
            local$facilityBooking,
            (e) => call(facilityBooking: e),
          );
  }
}

class _CopyWithStubImpl$Query$Booking<TRes>
    implements CopyWith$Query$Booking<TRes> {
  _CopyWithStubImpl$Query$Booking(this._res);

  TRes _res;

  call({Query$Booking$facilityBooking? facilityBooking, String? $__typename}) =>
      _res;

  CopyWith$Query$Booking$facilityBooking<TRes> get facilityBooking =>
      CopyWith$Query$Booking$facilityBooking.stub(_res);
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
            name: NameNode(value: 'facilityBooking'),
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
                  name: NameNode(value: 'clubId'),
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
                  name: NameNode(value: 'memberId'),
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
                  name: NameNode(value: 'purpose'),
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
                  name: NameNode(value: 'specialRequests'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'totalCost'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'currency'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'paymentStatus'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'checkInTime'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'checkOutTime'),
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
                  name: NameNode(value: 'cancelledAt'),
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

class Query$Booking$facilityBooking {
  Query$Booking$facilityBooking({
    required this.id,
    required this.clubId,
    required this.facilityId,
    required this.memberId,
    this.facility,
    required this.startTime,
    required this.endTime,
    required this.status,
    this.purpose,
    this.guestCount,
    this.specialRequests,
    this.totalCost,
    this.currency,
    required this.paymentStatus,
    this.checkInTime,
    this.checkOutTime,
    this.cancellationReason,
    this.cancelledAt,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'FacilityBooking',
  });

  factory Query$Booking$facilityBooking.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$facilityId = json['facilityId'];
    final l$memberId = json['memberId'];
    final l$facility = json['facility'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$status = json['status'];
    final l$purpose = json['purpose'];
    final l$guestCount = json['guestCount'];
    final l$specialRequests = json['specialRequests'];
    final l$totalCost = json['totalCost'];
    final l$currency = json['currency'];
    final l$paymentStatus = json['paymentStatus'];
    final l$checkInTime = json['checkInTime'];
    final l$checkOutTime = json['checkOutTime'];
    final l$cancellationReason = json['cancellationReason'];
    final l$cancelledAt = json['cancelledAt'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$Booking$facilityBooking(
      id: (l$id as String),
      clubId: (l$clubId as String),
      facilityId: (l$facilityId as String),
      memberId: (l$memberId as String),
      facility: l$facility == null
          ? null
          : Query$Booking$facilityBooking$facility.fromJson(
              (l$facility as Map<String, dynamic>),
            ),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      purpose: (l$purpose as String?),
      guestCount: (l$guestCount as int?),
      specialRequests: (l$specialRequests as String?),
      totalCost: (l$totalCost as num?)?.toDouble(),
      currency: (l$currency as String?),
      paymentStatus: fromJson$Enum$PaymentStatus((l$paymentStatus as String)),
      checkInTime: l$checkInTime == null
          ? null
          : DateTime.parse((l$checkInTime as String)),
      checkOutTime: l$checkOutTime == null
          ? null
          : DateTime.parse((l$checkOutTime as String)),
      cancellationReason: (l$cancellationReason as String?),
      cancelledAt: l$cancelledAt == null
          ? null
          : DateTime.parse((l$cancelledAt as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String facilityId;

  final String memberId;

  final Query$Booking$facilityBooking$facility? facility;

  final DateTime startTime;

  final DateTime endTime;

  final Enum$BookingStatus status;

  final String? purpose;

  final int? guestCount;

  final String? specialRequests;

  final double? totalCost;

  final String? currency;

  final Enum$PaymentStatus paymentStatus;

  final DateTime? checkInTime;

  final DateTime? checkOutTime;

  final String? cancellationReason;

  final DateTime? cancelledAt;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$facilityId = facilityId;
    _resultData['facilityId'] = l$facilityId;
    final l$memberId = memberId;
    _resultData['memberId'] = l$memberId;
    final l$facility = facility;
    _resultData['facility'] = l$facility?.toJson();
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime.toIso8601String();
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$purpose = purpose;
    _resultData['purpose'] = l$purpose;
    final l$guestCount = guestCount;
    _resultData['guestCount'] = l$guestCount;
    final l$specialRequests = specialRequests;
    _resultData['specialRequests'] = l$specialRequests;
    final l$totalCost = totalCost;
    _resultData['totalCost'] = l$totalCost;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$paymentStatus = paymentStatus;
    _resultData['paymentStatus'] = toJson$Enum$PaymentStatus(l$paymentStatus);
    final l$checkInTime = checkInTime;
    _resultData['checkInTime'] = l$checkInTime?.toIso8601String();
    final l$checkOutTime = checkOutTime;
    _resultData['checkOutTime'] = l$checkOutTime?.toIso8601String();
    final l$cancellationReason = cancellationReason;
    _resultData['cancellationReason'] = l$cancellationReason;
    final l$cancelledAt = cancelledAt;
    _resultData['cancelledAt'] = l$cancelledAt?.toIso8601String();
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
    final l$clubId = clubId;
    final l$facilityId = facilityId;
    final l$memberId = memberId;
    final l$facility = facility;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$status = status;
    final l$purpose = purpose;
    final l$guestCount = guestCount;
    final l$specialRequests = specialRequests;
    final l$totalCost = totalCost;
    final l$currency = currency;
    final l$paymentStatus = paymentStatus;
    final l$checkInTime = checkInTime;
    final l$checkOutTime = checkOutTime;
    final l$cancellationReason = cancellationReason;
    final l$cancelledAt = cancelledAt;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$facilityId,
      l$memberId,
      l$facility,
      l$startTime,
      l$endTime,
      l$status,
      l$purpose,
      l$guestCount,
      l$specialRequests,
      l$totalCost,
      l$currency,
      l$paymentStatus,
      l$checkInTime,
      l$checkOutTime,
      l$cancellationReason,
      l$cancelledAt,
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
    if (other is! Query$Booking$facilityBooking ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clubId = clubId;
    final lOther$clubId = other.clubId;
    if (l$clubId != lOther$clubId) {
      return false;
    }
    final l$facilityId = facilityId;
    final lOther$facilityId = other.facilityId;
    if (l$facilityId != lOther$facilityId) {
      return false;
    }
    final l$memberId = memberId;
    final lOther$memberId = other.memberId;
    if (l$memberId != lOther$memberId) {
      return false;
    }
    final l$facility = facility;
    final lOther$facility = other.facility;
    if (l$facility != lOther$facility) {
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
    final l$purpose = purpose;
    final lOther$purpose = other.purpose;
    if (l$purpose != lOther$purpose) {
      return false;
    }
    final l$guestCount = guestCount;
    final lOther$guestCount = other.guestCount;
    if (l$guestCount != lOther$guestCount) {
      return false;
    }
    final l$specialRequests = specialRequests;
    final lOther$specialRequests = other.specialRequests;
    if (l$specialRequests != lOther$specialRequests) {
      return false;
    }
    final l$totalCost = totalCost;
    final lOther$totalCost = other.totalCost;
    if (l$totalCost != lOther$totalCost) {
      return false;
    }
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
      return false;
    }
    final l$paymentStatus = paymentStatus;
    final lOther$paymentStatus = other.paymentStatus;
    if (l$paymentStatus != lOther$paymentStatus) {
      return false;
    }
    final l$checkInTime = checkInTime;
    final lOther$checkInTime = other.checkInTime;
    if (l$checkInTime != lOther$checkInTime) {
      return false;
    }
    final l$checkOutTime = checkOutTime;
    final lOther$checkOutTime = other.checkOutTime;
    if (l$checkOutTime != lOther$checkOutTime) {
      return false;
    }
    final l$cancellationReason = cancellationReason;
    final lOther$cancellationReason = other.cancellationReason;
    if (l$cancellationReason != lOther$cancellationReason) {
      return false;
    }
    final l$cancelledAt = cancelledAt;
    final lOther$cancelledAt = other.cancelledAt;
    if (l$cancelledAt != lOther$cancelledAt) {
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

extension UtilityExtension$Query$Booking$facilityBooking
    on Query$Booking$facilityBooking {
  CopyWith$Query$Booking$facilityBooking<Query$Booking$facilityBooking>
  get copyWith => CopyWith$Query$Booking$facilityBooking(this, (i) => i);
}

abstract class CopyWith$Query$Booking$facilityBooking<TRes> {
  factory CopyWith$Query$Booking$facilityBooking(
    Query$Booking$facilityBooking instance,
    TRes Function(Query$Booking$facilityBooking) then,
  ) = _CopyWithImpl$Query$Booking$facilityBooking;

  factory CopyWith$Query$Booking$facilityBooking.stub(TRes res) =
      _CopyWithStubImpl$Query$Booking$facilityBooking;

  TRes call({
    String? id,
    String? clubId,
    String? facilityId,
    String? memberId,
    Query$Booking$facilityBooking$facility? facility,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? purpose,
    int? guestCount,
    String? specialRequests,
    double? totalCost,
    String? currency,
    Enum$PaymentStatus? paymentStatus,
    DateTime? checkInTime,
    DateTime? checkOutTime,
    String? cancellationReason,
    DateTime? cancelledAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
  CopyWith$Query$Booking$facilityBooking$facility<TRes> get facility;
}

class _CopyWithImpl$Query$Booking$facilityBooking<TRes>
    implements CopyWith$Query$Booking$facilityBooking<TRes> {
  _CopyWithImpl$Query$Booking$facilityBooking(this._instance, this._then);

  final Query$Booking$facilityBooking _instance;

  final TRes Function(Query$Booking$facilityBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? facilityId = _undefined,
    Object? memberId = _undefined,
    Object? facility = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? status = _undefined,
    Object? purpose = _undefined,
    Object? guestCount = _undefined,
    Object? specialRequests = _undefined,
    Object? totalCost = _undefined,
    Object? currency = _undefined,
    Object? paymentStatus = _undefined,
    Object? checkInTime = _undefined,
    Object? checkOutTime = _undefined,
    Object? cancellationReason = _undefined,
    Object? cancelledAt = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Booking$facilityBooking(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      facilityId: facilityId == _undefined || facilityId == null
          ? _instance.facilityId
          : (facilityId as String),
      memberId: memberId == _undefined || memberId == null
          ? _instance.memberId
          : (memberId as String),
      facility: facility == _undefined
          ? _instance.facility
          : (facility as Query$Booking$facilityBooking$facility?),
      startTime: startTime == _undefined || startTime == null
          ? _instance.startTime
          : (startTime as DateTime),
      endTime: endTime == _undefined || endTime == null
          ? _instance.endTime
          : (endTime as DateTime),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$BookingStatus),
      purpose: purpose == _undefined ? _instance.purpose : (purpose as String?),
      guestCount: guestCount == _undefined
          ? _instance.guestCount
          : (guestCount as int?),
      specialRequests: specialRequests == _undefined
          ? _instance.specialRequests
          : (specialRequests as String?),
      totalCost: totalCost == _undefined
          ? _instance.totalCost
          : (totalCost as double?),
      currency: currency == _undefined
          ? _instance.currency
          : (currency as String?),
      paymentStatus: paymentStatus == _undefined || paymentStatus == null
          ? _instance.paymentStatus
          : (paymentStatus as Enum$PaymentStatus),
      checkInTime: checkInTime == _undefined
          ? _instance.checkInTime
          : (checkInTime as DateTime?),
      checkOutTime: checkOutTime == _undefined
          ? _instance.checkOutTime
          : (checkOutTime as DateTime?),
      cancellationReason: cancellationReason == _undefined
          ? _instance.cancellationReason
          : (cancellationReason as String?),
      cancelledAt: cancelledAt == _undefined
          ? _instance.cancelledAt
          : (cancelledAt as DateTime?),
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

  CopyWith$Query$Booking$facilityBooking$facility<TRes> get facility {
    final local$facility = _instance.facility;
    return local$facility == null
        ? CopyWith$Query$Booking$facilityBooking$facility.stub(_then(_instance))
        : CopyWith$Query$Booking$facilityBooking$facility(
            local$facility,
            (e) => call(facility: e),
          );
  }
}

class _CopyWithStubImpl$Query$Booking$facilityBooking<TRes>
    implements CopyWith$Query$Booking$facilityBooking<TRes> {
  _CopyWithStubImpl$Query$Booking$facilityBooking(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? facilityId,
    String? memberId,
    Query$Booking$facilityBooking$facility? facility,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? purpose,
    int? guestCount,
    String? specialRequests,
    double? totalCost,
    String? currency,
    Enum$PaymentStatus? paymentStatus,
    DateTime? checkInTime,
    DateTime? checkOutTime,
    String? cancellationReason,
    DateTime? cancelledAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Booking$facilityBooking$facility<TRes> get facility =>
      CopyWith$Query$Booking$facilityBooking$facility.stub(_res);
}

class Query$Booking$facilityBooking$facility {
  Query$Booking$facilityBooking$facility({
    required this.id,
    required this.name,
    required this.type,
    required this.capacity,
    this.$__typename = 'Facility',
  });

  factory Query$Booking$facilityBooking$facility.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$type = json['type'];
    final l$capacity = json['capacity'];
    final l$$__typename = json['__typename'];
    return Query$Booking$facilityBooking$facility(
      id: (l$id as String),
      name: (l$name as String),
      type: fromJson$Enum$FacilityType((l$type as String)),
      capacity: (l$capacity as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final Enum$FacilityType type;

  final int capacity;

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
    if (other is! Query$Booking$facilityBooking$facility ||
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

extension UtilityExtension$Query$Booking$facilityBooking$facility
    on Query$Booking$facilityBooking$facility {
  CopyWith$Query$Booking$facilityBooking$facility<
    Query$Booking$facilityBooking$facility
  >
  get copyWith =>
      CopyWith$Query$Booking$facilityBooking$facility(this, (i) => i);
}

abstract class CopyWith$Query$Booking$facilityBooking$facility<TRes> {
  factory CopyWith$Query$Booking$facilityBooking$facility(
    Query$Booking$facilityBooking$facility instance,
    TRes Function(Query$Booking$facilityBooking$facility) then,
  ) = _CopyWithImpl$Query$Booking$facilityBooking$facility;

  factory CopyWith$Query$Booking$facilityBooking$facility.stub(TRes res) =
      _CopyWithStubImpl$Query$Booking$facilityBooking$facility;

  TRes call({
    String? id,
    String? name,
    Enum$FacilityType? type,
    int? capacity,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Booking$facilityBooking$facility<TRes>
    implements CopyWith$Query$Booking$facilityBooking$facility<TRes> {
  _CopyWithImpl$Query$Booking$facilityBooking$facility(
    this._instance,
    this._then,
  );

  final Query$Booking$facilityBooking$facility _instance;

  final TRes Function(Query$Booking$facilityBooking$facility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? type = _undefined,
    Object? capacity = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Booking$facilityBooking$facility(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$FacilityType),
      capacity: capacity == _undefined || capacity == null
          ? _instance.capacity
          : (capacity as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Booking$facilityBooking$facility<TRes>
    implements CopyWith$Query$Booking$facilityBooking$facility<TRes> {
  _CopyWithStubImpl$Query$Booking$facilityBooking$facility(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    Enum$FacilityType? type,
    int? capacity,
    String? $__typename,
  }) => _res;
}
