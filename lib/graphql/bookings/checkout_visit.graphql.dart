import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CheckOutVisit {
  factory Variables$Mutation$CheckOutVisit({
    required Input$CheckOutVisitInput input,
  }) => Variables$Mutation$CheckOutVisit._({r'input': input});

  Variables$Mutation$CheckOutVisit._(this._$data);

  factory Variables$Mutation$CheckOutVisit.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$CheckOutVisitInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CheckOutVisit._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CheckOutVisitInput get input =>
      (_$data['input'] as Input$CheckOutVisitInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CheckOutVisit<Variables$Mutation$CheckOutVisit>
  get copyWith => CopyWith$Variables$Mutation$CheckOutVisit(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CheckOutVisit ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$CheckOutVisit<TRes> {
  factory CopyWith$Variables$Mutation$CheckOutVisit(
    Variables$Mutation$CheckOutVisit instance,
    TRes Function(Variables$Mutation$CheckOutVisit) then,
  ) = _CopyWithImpl$Variables$Mutation$CheckOutVisit;

  factory CopyWith$Variables$Mutation$CheckOutVisit.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CheckOutVisit;

  TRes call({Input$CheckOutVisitInput? input});
}

class _CopyWithImpl$Variables$Mutation$CheckOutVisit<TRes>
    implements CopyWith$Variables$Mutation$CheckOutVisit<TRes> {
  _CopyWithImpl$Variables$Mutation$CheckOutVisit(this._instance, this._then);

  final Variables$Mutation$CheckOutVisit _instance;

  final TRes Function(Variables$Mutation$CheckOutVisit) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CheckOutVisit._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$CheckOutVisitInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CheckOutVisit<TRes>
    implements CopyWith$Variables$Mutation$CheckOutVisit<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CheckOutVisit(this._res);

  TRes _res;

  call({Input$CheckOutVisitInput? input}) => _res;
}

class Mutation$CheckOutVisit {
  Mutation$CheckOutVisit({
    required this.checkOutVisit,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CheckOutVisit.fromJson(Map<String, dynamic> json) {
    final l$checkOutVisit = json['checkOutVisit'];
    final l$$__typename = json['__typename'];
    return Mutation$CheckOutVisit(
      checkOutVisit: Mutation$CheckOutVisit$checkOutVisit.fromJson(
        (l$checkOutVisit as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CheckOutVisit$checkOutVisit checkOutVisit;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$checkOutVisit = checkOutVisit;
    _resultData['checkOutVisit'] = l$checkOutVisit.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$checkOutVisit = checkOutVisit;
    final l$$__typename = $__typename;
    return Object.hashAll([l$checkOutVisit, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CheckOutVisit || runtimeType != other.runtimeType) {
      return false;
    }
    final l$checkOutVisit = checkOutVisit;
    final lOther$checkOutVisit = other.checkOutVisit;
    if (l$checkOutVisit != lOther$checkOutVisit) {
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

extension UtilityExtension$Mutation$CheckOutVisit on Mutation$CheckOutVisit {
  CopyWith$Mutation$CheckOutVisit<Mutation$CheckOutVisit> get copyWith =>
      CopyWith$Mutation$CheckOutVisit(this, (i) => i);
}

abstract class CopyWith$Mutation$CheckOutVisit<TRes> {
  factory CopyWith$Mutation$CheckOutVisit(
    Mutation$CheckOutVisit instance,
    TRes Function(Mutation$CheckOutVisit) then,
  ) = _CopyWithImpl$Mutation$CheckOutVisit;

  factory CopyWith$Mutation$CheckOutVisit.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CheckOutVisit;

  TRes call({
    Mutation$CheckOutVisit$checkOutVisit? checkOutVisit,
    String? $__typename,
  });
  CopyWith$Mutation$CheckOutVisit$checkOutVisit<TRes> get checkOutVisit;
}

class _CopyWithImpl$Mutation$CheckOutVisit<TRes>
    implements CopyWith$Mutation$CheckOutVisit<TRes> {
  _CopyWithImpl$Mutation$CheckOutVisit(this._instance, this._then);

  final Mutation$CheckOutVisit _instance;

  final TRes Function(Mutation$CheckOutVisit) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? checkOutVisit = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CheckOutVisit(
      checkOutVisit: checkOutVisit == _undefined || checkOutVisit == null
          ? _instance.checkOutVisit
          : (checkOutVisit as Mutation$CheckOutVisit$checkOutVisit),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CheckOutVisit$checkOutVisit<TRes> get checkOutVisit {
    final local$checkOutVisit = _instance.checkOutVisit;
    return CopyWith$Mutation$CheckOutVisit$checkOutVisit(
      local$checkOutVisit,
      (e) => call(checkOutVisit: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CheckOutVisit<TRes>
    implements CopyWith$Mutation$CheckOutVisit<TRes> {
  _CopyWithStubImpl$Mutation$CheckOutVisit(this._res);

  TRes _res;

  call({
    Mutation$CheckOutVisit$checkOutVisit? checkOutVisit,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CheckOutVisit$checkOutVisit<TRes> get checkOutVisit =>
      CopyWith$Mutation$CheckOutVisit$checkOutVisit.stub(_res);
}

const documentNodeMutationCheckOutVisit = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CheckOutVisit'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'CheckOutVisitInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'checkOutVisit'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
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
                  name: NameNode(value: 'services'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cost'),
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
                  name: NameNode(value: 'blockchainTxId'),
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
Mutation$CheckOutVisit _parserFn$Mutation$CheckOutVisit(
  Map<String, dynamic> data,
) => Mutation$CheckOutVisit.fromJson(data);
typedef OnMutationCompleted$Mutation$CheckOutVisit =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CheckOutVisit?);

class Options$Mutation$CheckOutVisit
    extends graphql.MutationOptions<Mutation$CheckOutVisit> {
  Options$Mutation$CheckOutVisit({
    String? operationName,
    required Variables$Mutation$CheckOutVisit variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CheckOutVisit? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CheckOutVisit? onCompleted,
    graphql.OnMutationUpdate<Mutation$CheckOutVisit>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$CheckOutVisit(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCheckOutVisit,
         parserFn: _parserFn$Mutation$CheckOutVisit,
       );

  final OnMutationCompleted$Mutation$CheckOutVisit? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CheckOutVisit
    extends graphql.WatchQueryOptions<Mutation$CheckOutVisit> {
  WatchOptions$Mutation$CheckOutVisit({
    String? operationName,
    required Variables$Mutation$CheckOutVisit variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CheckOutVisit? typedOptimisticResult,
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
         document: documentNodeMutationCheckOutVisit,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CheckOutVisit,
       );
}

extension ClientExtension$Mutation$CheckOutVisit on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CheckOutVisit>> mutate$CheckOutVisit(
    Options$Mutation$CheckOutVisit options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CheckOutVisit> watchMutation$CheckOutVisit(
    WatchOptions$Mutation$CheckOutVisit options,
  ) => this.watchMutation(options);
}

class Mutation$CheckOutVisit$checkOutVisit {
  Mutation$CheckOutVisit$checkOutVisit({
    required this.id,
    required this.memberId,
    required this.clubId,
    required this.visitingClubId,
    required this.status,
    required this.checkInTime,
    this.checkOutTime,
    this.services,
    this.cost,
    required this.verified,
    this.blockchainTxId,
    required this.createdAt,
    this.$__typename = 'Visit',
  });

  factory Mutation$CheckOutVisit$checkOutVisit.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$memberId = json['memberId'];
    final l$clubId = json['clubId'];
    final l$visitingClubId = json['visitingClubId'];
    final l$status = json['status'];
    final l$checkInTime = json['checkInTime'];
    final l$checkOutTime = json['checkOutTime'];
    final l$services = json['services'];
    final l$cost = json['cost'];
    final l$verified = json['verified'];
    final l$blockchainTxId = json['blockchainTxId'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Mutation$CheckOutVisit$checkOutVisit(
      id: (l$id as String),
      memberId: (l$memberId as String),
      clubId: (l$clubId as String),
      visitingClubId: (l$visitingClubId as String),
      status: fromJson$Enum$VisitStatus((l$status as String)),
      checkInTime: DateTime.parse((l$checkInTime as String)),
      checkOutTime: l$checkOutTime == null
          ? null
          : DateTime.parse((l$checkOutTime as String)),
      services: (l$services as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList(),
      cost: (l$cost as num?)?.toDouble(),
      verified: (l$verified as bool),
      blockchainTxId: (l$blockchainTxId as String?),
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

  final List<String>? services;

  final double? cost;

  final bool verified;

  final String? blockchainTxId;

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
    final l$services = services;
    _resultData['services'] = l$services?.map((e) => e).toList();
    final l$cost = cost;
    _resultData['cost'] = l$cost;
    final l$verified = verified;
    _resultData['verified'] = l$verified;
    final l$blockchainTxId = blockchainTxId;
    _resultData['blockchainTxId'] = l$blockchainTxId;
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
    final l$services = services;
    final l$cost = cost;
    final l$verified = verified;
    final l$blockchainTxId = blockchainTxId;
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
      l$services == null ? null : Object.hashAll(l$services.map((v) => v)),
      l$cost,
      l$verified,
      l$blockchainTxId,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CheckOutVisit$checkOutVisit ||
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
    final l$services = services;
    final lOther$services = other.services;
    if (l$services != null && lOther$services != null) {
      if (l$services.length != lOther$services.length) {
        return false;
      }
      for (int i = 0; i < l$services.length; i++) {
        final l$services$entry = l$services[i];
        final lOther$services$entry = lOther$services[i];
        if (l$services$entry != lOther$services$entry) {
          return false;
        }
      }
    } else if (l$services != lOther$services) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$verified = verified;
    final lOther$verified = other.verified;
    if (l$verified != lOther$verified) {
      return false;
    }
    final l$blockchainTxId = blockchainTxId;
    final lOther$blockchainTxId = other.blockchainTxId;
    if (l$blockchainTxId != lOther$blockchainTxId) {
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

extension UtilityExtension$Mutation$CheckOutVisit$checkOutVisit
    on Mutation$CheckOutVisit$checkOutVisit {
  CopyWith$Mutation$CheckOutVisit$checkOutVisit<
    Mutation$CheckOutVisit$checkOutVisit
  >
  get copyWith => CopyWith$Mutation$CheckOutVisit$checkOutVisit(this, (i) => i);
}

abstract class CopyWith$Mutation$CheckOutVisit$checkOutVisit<TRes> {
  factory CopyWith$Mutation$CheckOutVisit$checkOutVisit(
    Mutation$CheckOutVisit$checkOutVisit instance,
    TRes Function(Mutation$CheckOutVisit$checkOutVisit) then,
  ) = _CopyWithImpl$Mutation$CheckOutVisit$checkOutVisit;

  factory CopyWith$Mutation$CheckOutVisit$checkOutVisit.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CheckOutVisit$checkOutVisit;

  TRes call({
    String? id,
    String? memberId,
    String? clubId,
    String? visitingClubId,
    Enum$VisitStatus? status,
    DateTime? checkInTime,
    DateTime? checkOutTime,
    List<String>? services,
    double? cost,
    bool? verified,
    String? blockchainTxId,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CheckOutVisit$checkOutVisit<TRes>
    implements CopyWith$Mutation$CheckOutVisit$checkOutVisit<TRes> {
  _CopyWithImpl$Mutation$CheckOutVisit$checkOutVisit(
    this._instance,
    this._then,
  );

  final Mutation$CheckOutVisit$checkOutVisit _instance;

  final TRes Function(Mutation$CheckOutVisit$checkOutVisit) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? memberId = _undefined,
    Object? clubId = _undefined,
    Object? visitingClubId = _undefined,
    Object? status = _undefined,
    Object? checkInTime = _undefined,
    Object? checkOutTime = _undefined,
    Object? services = _undefined,
    Object? cost = _undefined,
    Object? verified = _undefined,
    Object? blockchainTxId = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CheckOutVisit$checkOutVisit(
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
      services: services == _undefined
          ? _instance.services
          : (services as List<String>?),
      cost: cost == _undefined ? _instance.cost : (cost as double?),
      verified: verified == _undefined || verified == null
          ? _instance.verified
          : (verified as bool),
      blockchainTxId: blockchainTxId == _undefined
          ? _instance.blockchainTxId
          : (blockchainTxId as String?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CheckOutVisit$checkOutVisit<TRes>
    implements CopyWith$Mutation$CheckOutVisit$checkOutVisit<TRes> {
  _CopyWithStubImpl$Mutation$CheckOutVisit$checkOutVisit(this._res);

  TRes _res;

  call({
    String? id,
    String? memberId,
    String? clubId,
    String? visitingClubId,
    Enum$VisitStatus? status,
    DateTime? checkInTime,
    DateTime? checkOutTime,
    List<String>? services,
    double? cost,
    bool? verified,
    String? blockchainTxId,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}
