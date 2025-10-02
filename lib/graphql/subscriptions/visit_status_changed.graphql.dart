import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Subscription$VisitStatusChanged {
  factory Variables$Subscription$VisitStatusChanged({String? clubId}) =>
      Variables$Subscription$VisitStatusChanged._({
        if (clubId != null) r'clubId': clubId,
      });

  Variables$Subscription$VisitStatusChanged._(this._$data);

  factory Variables$Subscription$VisitStatusChanged.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('clubId')) {
      final l$clubId = data['clubId'];
      result$data['clubId'] = (l$clubId as String?);
    }
    return Variables$Subscription$VisitStatusChanged._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get clubId => (_$data['clubId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('clubId')) {
      final l$clubId = clubId;
      result$data['clubId'] = l$clubId;
    }
    return result$data;
  }

  CopyWith$Variables$Subscription$VisitStatusChanged<
    Variables$Subscription$VisitStatusChanged
  >
  get copyWith =>
      CopyWith$Variables$Subscription$VisitStatusChanged(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$VisitStatusChanged ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$clubId = clubId;
    final lOther$clubId = other.clubId;
    if (_$data.containsKey('clubId') != other._$data.containsKey('clubId')) {
      return false;
    }
    if (l$clubId != lOther$clubId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$clubId = clubId;
    return Object.hashAll([_$data.containsKey('clubId') ? l$clubId : const {}]);
  }
}

abstract class CopyWith$Variables$Subscription$VisitStatusChanged<TRes> {
  factory CopyWith$Variables$Subscription$VisitStatusChanged(
    Variables$Subscription$VisitStatusChanged instance,
    TRes Function(Variables$Subscription$VisitStatusChanged) then,
  ) = _CopyWithImpl$Variables$Subscription$VisitStatusChanged;

  factory CopyWith$Variables$Subscription$VisitStatusChanged.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$VisitStatusChanged;

  TRes call({String? clubId});
}

class _CopyWithImpl$Variables$Subscription$VisitStatusChanged<TRes>
    implements CopyWith$Variables$Subscription$VisitStatusChanged<TRes> {
  _CopyWithImpl$Variables$Subscription$VisitStatusChanged(
    this._instance,
    this._then,
  );

  final Variables$Subscription$VisitStatusChanged _instance;

  final TRes Function(Variables$Subscription$VisitStatusChanged) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? clubId = _undefined}) => _then(
    Variables$Subscription$VisitStatusChanged._({
      ..._instance._$data,
      if (clubId != _undefined) 'clubId': (clubId as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Subscription$VisitStatusChanged<TRes>
    implements CopyWith$Variables$Subscription$VisitStatusChanged<TRes> {
  _CopyWithStubImpl$Variables$Subscription$VisitStatusChanged(this._res);

  TRes _res;

  call({String? clubId}) => _res;
}

class Subscription$VisitStatusChanged {
  Subscription$VisitStatusChanged({
    required this.visitStatusChanged,
    this.$__typename = 'Subscription',
  });

  factory Subscription$VisitStatusChanged.fromJson(Map<String, dynamic> json) {
    final l$visitStatusChanged = json['visitStatusChanged'];
    final l$$__typename = json['__typename'];
    return Subscription$VisitStatusChanged(
      visitStatusChanged:
          Subscription$VisitStatusChanged$visitStatusChanged.fromJson(
            (l$visitStatusChanged as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Subscription$VisitStatusChanged$visitStatusChanged visitStatusChanged;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$visitStatusChanged = visitStatusChanged;
    _resultData['visitStatusChanged'] = l$visitStatusChanged.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$visitStatusChanged = visitStatusChanged;
    final l$$__typename = $__typename;
    return Object.hashAll([l$visitStatusChanged, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$VisitStatusChanged ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$visitStatusChanged = visitStatusChanged;
    final lOther$visitStatusChanged = other.visitStatusChanged;
    if (l$visitStatusChanged != lOther$visitStatusChanged) {
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

extension UtilityExtension$Subscription$VisitStatusChanged
    on Subscription$VisitStatusChanged {
  CopyWith$Subscription$VisitStatusChanged<Subscription$VisitStatusChanged>
  get copyWith => CopyWith$Subscription$VisitStatusChanged(this, (i) => i);
}

abstract class CopyWith$Subscription$VisitStatusChanged<TRes> {
  factory CopyWith$Subscription$VisitStatusChanged(
    Subscription$VisitStatusChanged instance,
    TRes Function(Subscription$VisitStatusChanged) then,
  ) = _CopyWithImpl$Subscription$VisitStatusChanged;

  factory CopyWith$Subscription$VisitStatusChanged.stub(TRes res) =
      _CopyWithStubImpl$Subscription$VisitStatusChanged;

  TRes call({
    Subscription$VisitStatusChanged$visitStatusChanged? visitStatusChanged,
    String? $__typename,
  });
  CopyWith$Subscription$VisitStatusChanged$visitStatusChanged<TRes>
  get visitStatusChanged;
}

class _CopyWithImpl$Subscription$VisitStatusChanged<TRes>
    implements CopyWith$Subscription$VisitStatusChanged<TRes> {
  _CopyWithImpl$Subscription$VisitStatusChanged(this._instance, this._then);

  final Subscription$VisitStatusChanged _instance;

  final TRes Function(Subscription$VisitStatusChanged) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? visitStatusChanged = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Subscription$VisitStatusChanged(
      visitStatusChanged:
          visitStatusChanged == _undefined || visitStatusChanged == null
          ? _instance.visitStatusChanged
          : (visitStatusChanged
                as Subscription$VisitStatusChanged$visitStatusChanged),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Subscription$VisitStatusChanged$visitStatusChanged<TRes>
  get visitStatusChanged {
    final local$visitStatusChanged = _instance.visitStatusChanged;
    return CopyWith$Subscription$VisitStatusChanged$visitStatusChanged(
      local$visitStatusChanged,
      (e) => call(visitStatusChanged: e),
    );
  }
}

class _CopyWithStubImpl$Subscription$VisitStatusChanged<TRes>
    implements CopyWith$Subscription$VisitStatusChanged<TRes> {
  _CopyWithStubImpl$Subscription$VisitStatusChanged(this._res);

  TRes _res;

  call({
    Subscription$VisitStatusChanged$visitStatusChanged? visitStatusChanged,
    String? $__typename,
  }) => _res;

  CopyWith$Subscription$VisitStatusChanged$visitStatusChanged<TRes>
  get visitStatusChanged =>
      CopyWith$Subscription$VisitStatusChanged$visitStatusChanged.stub(_res);
}

const documentNodeSubscriptionVisitStatusChanged = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'VisitStatusChanged'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'clubId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'visitStatusChanged'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'clubId'),
                value: VariableNode(name: NameNode(value: 'clubId')),
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
                  name: NameNode(value: 'memberId'),
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
                  name: NameNode(value: 'visitingClubId'),
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
                  name: NameNode(value: 'verified'),
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
Subscription$VisitStatusChanged _parserFn$Subscription$VisitStatusChanged(
  Map<String, dynamic> data,
) => Subscription$VisitStatusChanged.fromJson(data);

class Options$Subscription$VisitStatusChanged
    extends graphql.SubscriptionOptions<Subscription$VisitStatusChanged> {
  Options$Subscription$VisitStatusChanged({
    String? operationName,
    Variables$Subscription$VisitStatusChanged? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$VisitStatusChanged? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeSubscriptionVisitStatusChanged,
         parserFn: _parserFn$Subscription$VisitStatusChanged,
       );
}

class WatchOptions$Subscription$VisitStatusChanged
    extends graphql.WatchQueryOptions<Subscription$VisitStatusChanged> {
  WatchOptions$Subscription$VisitStatusChanged({
    String? operationName,
    Variables$Subscription$VisitStatusChanged? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$VisitStatusChanged? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeSubscriptionVisitStatusChanged,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Subscription$VisitStatusChanged,
       );
}

class FetchMoreOptions$Subscription$VisitStatusChanged
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$VisitStatusChanged({
    required graphql.UpdateQuery updateQuery,
    Variables$Subscription$VisitStatusChanged? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeSubscriptionVisitStatusChanged,
       );
}

extension ClientExtension$Subscription$VisitStatusChanged
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$VisitStatusChanged>>
  subscribe$VisitStatusChanged([
    Options$Subscription$VisitStatusChanged? options,
  ]) => this.subscribe(options ?? Options$Subscription$VisitStatusChanged());

  graphql.ObservableQuery<Subscription$VisitStatusChanged>
  watchSubscription$VisitStatusChanged([
    WatchOptions$Subscription$VisitStatusChanged? options,
  ]) => this.watchQuery(
    options ?? WatchOptions$Subscription$VisitStatusChanged(),
  );
}

class Subscription$VisitStatusChanged$visitStatusChanged {
  Subscription$VisitStatusChanged$visitStatusChanged({
    required this.id,
    required this.memberId,
    required this.clubId,
    required this.visitingClubId,
    required this.status,
    required this.checkInTime,
    this.checkOutTime,
    required this.verified,
    required this.createdAt,
    this.$__typename = 'Visit',
  });

  factory Subscription$VisitStatusChanged$visitStatusChanged.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$memberId = json['memberId'];
    final l$clubId = json['clubId'];
    final l$visitingClubId = json['visitingClubId'];
    final l$status = json['status'];
    final l$checkInTime = json['checkInTime'];
    final l$checkOutTime = json['checkOutTime'];
    final l$verified = json['verified'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Subscription$VisitStatusChanged$visitStatusChanged(
      id: (l$id as String),
      memberId: (l$memberId as String),
      clubId: (l$clubId as String),
      visitingClubId: (l$visitingClubId as String),
      status: fromJson$Enum$VisitStatus((l$status as String)),
      checkInTime: DateTime.parse((l$checkInTime as String)),
      checkOutTime: l$checkOutTime == null
          ? null
          : DateTime.parse((l$checkOutTime as String)),
      verified: (l$verified as bool),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String memberId;

  final String clubId;

  final String visitingClubId;

  final Enum$VisitStatus status;

  final DateTime checkInTime;

  final DateTime? checkOutTime;

  final bool verified;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$memberId = memberId;
    _resultData['memberId'] = l$memberId;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$visitingClubId = visitingClubId;
    _resultData['visitingClubId'] = l$visitingClubId;
    final l$status = status;
    _resultData['status'] = toJson$Enum$VisitStatus(l$status);
    final l$checkInTime = checkInTime;
    _resultData['checkInTime'] = l$checkInTime.toIso8601String();
    final l$checkOutTime = checkOutTime;
    _resultData['checkOutTime'] = l$checkOutTime?.toIso8601String();
    final l$verified = verified;
    _resultData['verified'] = l$verified;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$memberId = memberId;
    final l$clubId = clubId;
    final l$visitingClubId = visitingClubId;
    final l$status = status;
    final l$checkInTime = checkInTime;
    final l$checkOutTime = checkOutTime;
    final l$verified = verified;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$memberId,
      l$clubId,
      l$visitingClubId,
      l$status,
      l$checkInTime,
      l$checkOutTime,
      l$verified,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$VisitStatusChanged$visitStatusChanged ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$memberId = memberId;
    final lOther$memberId = other.memberId;
    if (l$memberId != lOther$memberId) {
      return false;
    }
    final l$clubId = clubId;
    final lOther$clubId = other.clubId;
    if (l$clubId != lOther$clubId) {
      return false;
    }
    final l$visitingClubId = visitingClubId;
    final lOther$visitingClubId = other.visitingClubId;
    if (l$visitingClubId != lOther$visitingClubId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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
    final l$verified = verified;
    final lOther$verified = other.verified;
    if (l$verified != lOther$verified) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

extension UtilityExtension$Subscription$VisitStatusChanged$visitStatusChanged
    on Subscription$VisitStatusChanged$visitStatusChanged {
  CopyWith$Subscription$VisitStatusChanged$visitStatusChanged<
    Subscription$VisitStatusChanged$visitStatusChanged
  >
  get copyWith => CopyWith$Subscription$VisitStatusChanged$visitStatusChanged(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Subscription$VisitStatusChanged$visitStatusChanged<
  TRes
> {
  factory CopyWith$Subscription$VisitStatusChanged$visitStatusChanged(
    Subscription$VisitStatusChanged$visitStatusChanged instance,
    TRes Function(Subscription$VisitStatusChanged$visitStatusChanged) then,
  ) = _CopyWithImpl$Subscription$VisitStatusChanged$visitStatusChanged;

  factory CopyWith$Subscription$VisitStatusChanged$visitStatusChanged.stub(
    TRes res,
  ) = _CopyWithStubImpl$Subscription$VisitStatusChanged$visitStatusChanged;

  TRes call({
    String? id,
    String? memberId,
    String? clubId,
    String? visitingClubId,
    Enum$VisitStatus? status,
    DateTime? checkInTime,
    DateTime? checkOutTime,
    bool? verified,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$VisitStatusChanged$visitStatusChanged<TRes>
    implements
        CopyWith$Subscription$VisitStatusChanged$visitStatusChanged<TRes> {
  _CopyWithImpl$Subscription$VisitStatusChanged$visitStatusChanged(
    this._instance,
    this._then,
  );

  final Subscription$VisitStatusChanged$visitStatusChanged _instance;

  final TRes Function(Subscription$VisitStatusChanged$visitStatusChanged) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? memberId = _undefined,
    Object? clubId = _undefined,
    Object? visitingClubId = _undefined,
    Object? status = _undefined,
    Object? checkInTime = _undefined,
    Object? checkOutTime = _undefined,
    Object? verified = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Subscription$VisitStatusChanged$visitStatusChanged(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      memberId: memberId == _undefined || memberId == null
          ? _instance.memberId
          : (memberId as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      visitingClubId: visitingClubId == _undefined || visitingClubId == null
          ? _instance.visitingClubId
          : (visitingClubId as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$VisitStatus),
      checkInTime: checkInTime == _undefined || checkInTime == null
          ? _instance.checkInTime
          : (checkInTime as DateTime),
      checkOutTime: checkOutTime == _undefined
          ? _instance.checkOutTime
          : (checkOutTime as DateTime?),
      verified: verified == _undefined || verified == null
          ? _instance.verified
          : (verified as bool),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Subscription$VisitStatusChanged$visitStatusChanged<TRes>
    implements
        CopyWith$Subscription$VisitStatusChanged$visitStatusChanged<TRes> {
  _CopyWithStubImpl$Subscription$VisitStatusChanged$visitStatusChanged(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? memberId,
    String? clubId,
    String? visitingClubId,
    Enum$VisitStatus? status,
    DateTime? checkInTime,
    DateTime? checkOutTime,
    bool? verified,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}
