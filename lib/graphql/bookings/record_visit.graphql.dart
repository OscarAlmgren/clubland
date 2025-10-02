import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$RecordVisit {
  factory Variables$Mutation$RecordVisit({
    required Input$RecordVisitInput input,
  }) => Variables$Mutation$RecordVisit._({r'input': input});

  Variables$Mutation$RecordVisit._(this._$data);

  factory Variables$Mutation$RecordVisit.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$RecordVisitInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$RecordVisit._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$RecordVisitInput get input =>
      (_$data['input'] as Input$RecordVisitInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$RecordVisit<Variables$Mutation$RecordVisit>
  get copyWith => CopyWith$Variables$Mutation$RecordVisit(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$RecordVisit ||
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

abstract class CopyWith$Variables$Mutation$RecordVisit<TRes> {
  factory CopyWith$Variables$Mutation$RecordVisit(
    Variables$Mutation$RecordVisit instance,
    TRes Function(Variables$Mutation$RecordVisit) then,
  ) = _CopyWithImpl$Variables$Mutation$RecordVisit;

  factory CopyWith$Variables$Mutation$RecordVisit.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$RecordVisit;

  TRes call({Input$RecordVisitInput? input});
}

class _CopyWithImpl$Variables$Mutation$RecordVisit<TRes>
    implements CopyWith$Variables$Mutation$RecordVisit<TRes> {
  _CopyWithImpl$Variables$Mutation$RecordVisit(this._instance, this._then);

  final Variables$Mutation$RecordVisit _instance;

  final TRes Function(Variables$Mutation$RecordVisit) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$RecordVisit._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$RecordVisitInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$RecordVisit<TRes>
    implements CopyWith$Variables$Mutation$RecordVisit<TRes> {
  _CopyWithStubImpl$Variables$Mutation$RecordVisit(this._res);

  TRes _res;

  call({Input$RecordVisitInput? input}) => _res;
}

class Mutation$RecordVisit {
  Mutation$RecordVisit({
    required this.recordVisit,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RecordVisit.fromJson(Map<String, dynamic> json) {
    final l$recordVisit = json['recordVisit'];
    final l$$__typename = json['__typename'];
    return Mutation$RecordVisit(
      recordVisit: Mutation$RecordVisit$recordVisit.fromJson(
        (l$recordVisit as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$RecordVisit$recordVisit recordVisit;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$recordVisit = recordVisit;
    _resultData['recordVisit'] = l$recordVisit.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$recordVisit = recordVisit;
    final l$$__typename = $__typename;
    return Object.hashAll([l$recordVisit, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RecordVisit || runtimeType != other.runtimeType) {
      return false;
    }
    final l$recordVisit = recordVisit;
    final lOther$recordVisit = other.recordVisit;
    if (l$recordVisit != lOther$recordVisit) {
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

extension UtilityExtension$Mutation$RecordVisit on Mutation$RecordVisit {
  CopyWith$Mutation$RecordVisit<Mutation$RecordVisit> get copyWith =>
      CopyWith$Mutation$RecordVisit(this, (i) => i);
}

abstract class CopyWith$Mutation$RecordVisit<TRes> {
  factory CopyWith$Mutation$RecordVisit(
    Mutation$RecordVisit instance,
    TRes Function(Mutation$RecordVisit) then,
  ) = _CopyWithImpl$Mutation$RecordVisit;

  factory CopyWith$Mutation$RecordVisit.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RecordVisit;

  TRes call({
    Mutation$RecordVisit$recordVisit? recordVisit,
    String? $__typename,
  });
  CopyWith$Mutation$RecordVisit$recordVisit<TRes> get recordVisit;
}

class _CopyWithImpl$Mutation$RecordVisit<TRes>
    implements CopyWith$Mutation$RecordVisit<TRes> {
  _CopyWithImpl$Mutation$RecordVisit(this._instance, this._then);

  final Mutation$RecordVisit _instance;

  final TRes Function(Mutation$RecordVisit) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? recordVisit = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$RecordVisit(
      recordVisit: recordVisit == _undefined || recordVisit == null
          ? _instance.recordVisit
          : (recordVisit as Mutation$RecordVisit$recordVisit),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$RecordVisit$recordVisit<TRes> get recordVisit {
    final local$recordVisit = _instance.recordVisit;
    return CopyWith$Mutation$RecordVisit$recordVisit(
      local$recordVisit,
      (e) => call(recordVisit: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$RecordVisit<TRes>
    implements CopyWith$Mutation$RecordVisit<TRes> {
  _CopyWithStubImpl$Mutation$RecordVisit(this._res);

  TRes _res;

  call({Mutation$RecordVisit$recordVisit? recordVisit, String? $__typename}) =>
      _res;

  CopyWith$Mutation$RecordVisit$recordVisit<TRes> get recordVisit =>
      CopyWith$Mutation$RecordVisit$recordVisit.stub(_res);
}

const documentNodeMutationRecordVisit = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RecordVisit'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'RecordVisitInput'),
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
            name: NameNode(value: 'recordVisit'),
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
Mutation$RecordVisit _parserFn$Mutation$RecordVisit(
  Map<String, dynamic> data,
) => Mutation$RecordVisit.fromJson(data);
typedef OnMutationCompleted$Mutation$RecordVisit =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$RecordVisit?);

class Options$Mutation$RecordVisit
    extends graphql.MutationOptions<Mutation$RecordVisit> {
  Options$Mutation$RecordVisit({
    String? operationName,
    required Variables$Mutation$RecordVisit variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RecordVisit? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RecordVisit? onCompleted,
    graphql.OnMutationUpdate<Mutation$RecordVisit>? update,
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
                 data == null ? null : _parserFn$Mutation$RecordVisit(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationRecordVisit,
         parserFn: _parserFn$Mutation$RecordVisit,
       );

  final OnMutationCompleted$Mutation$RecordVisit? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$RecordVisit
    extends graphql.WatchQueryOptions<Mutation$RecordVisit> {
  WatchOptions$Mutation$RecordVisit({
    String? operationName,
    required Variables$Mutation$RecordVisit variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RecordVisit? typedOptimisticResult,
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
         document: documentNodeMutationRecordVisit,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$RecordVisit,
       );
}

extension ClientExtension$Mutation$RecordVisit on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$RecordVisit>> mutate$RecordVisit(
    Options$Mutation$RecordVisit options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$RecordVisit> watchMutation$RecordVisit(
    WatchOptions$Mutation$RecordVisit options,
  ) => this.watchMutation(options);
}

class Mutation$RecordVisit$recordVisit {
  Mutation$RecordVisit$recordVisit({
    required this.id,
    required this.memberId,
    required this.clubId,
    required this.visitingClubId,
    required this.status,
    required this.checkInTime,
    this.services,
    this.cost,
    required this.verified,
    required this.createdAt,
    this.$__typename = 'Visit',
  });

  factory Mutation$RecordVisit$recordVisit.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$memberId = json['memberId'];
    final l$clubId = json['clubId'];
    final l$visitingClubId = json['visitingClubId'];
    final l$status = json['status'];
    final l$checkInTime = json['checkInTime'];
    final l$services = json['services'];
    final l$cost = json['cost'];
    final l$verified = json['verified'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Mutation$RecordVisit$recordVisit(
      id: (l$id as String),
      memberId: (l$memberId as String),
      clubId: (l$clubId as String),
      visitingClubId: (l$visitingClubId as String),
      status: fromJson$Enum$VisitStatus((l$status as String)),
      checkInTime: DateTime.parse((l$checkInTime as String)),
      services: (l$services as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList(),
      cost: (l$cost as num?)?.toDouble(),
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

  final List<String>? services;

  final double? cost;

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
    final l$services = services;
    _resultData['services'] = l$services?.map((e) => e).toList();
    final l$cost = cost;
    _resultData['cost'] = l$cost;
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
    final l$services = services;
    final l$cost = cost;
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
      l$services == null ? null : Object.hashAll(l$services.map((v) => v)),
      l$cost,
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
    if (other is! Mutation$RecordVisit$recordVisit ||
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

extension UtilityExtension$Mutation$RecordVisit$recordVisit
    on Mutation$RecordVisit$recordVisit {
  CopyWith$Mutation$RecordVisit$recordVisit<Mutation$RecordVisit$recordVisit>
  get copyWith => CopyWith$Mutation$RecordVisit$recordVisit(this, (i) => i);
}

abstract class CopyWith$Mutation$RecordVisit$recordVisit<TRes> {
  factory CopyWith$Mutation$RecordVisit$recordVisit(
    Mutation$RecordVisit$recordVisit instance,
    TRes Function(Mutation$RecordVisit$recordVisit) then,
  ) = _CopyWithImpl$Mutation$RecordVisit$recordVisit;

  factory CopyWith$Mutation$RecordVisit$recordVisit.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RecordVisit$recordVisit;

  TRes call({
    String? id,
    String? memberId,
    String? clubId,
    String? visitingClubId,
    Enum$VisitStatus? status,
    DateTime? checkInTime,
    List<String>? services,
    double? cost,
    bool? verified,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$RecordVisit$recordVisit<TRes>
    implements CopyWith$Mutation$RecordVisit$recordVisit<TRes> {
  _CopyWithImpl$Mutation$RecordVisit$recordVisit(this._instance, this._then);

  final Mutation$RecordVisit$recordVisit _instance;

  final TRes Function(Mutation$RecordVisit$recordVisit) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? memberId = _undefined,
    Object? clubId = _undefined,
    Object? visitingClubId = _undefined,
    Object? status = _undefined,
    Object? checkInTime = _undefined,
    Object? services = _undefined,
    Object? cost = _undefined,
    Object? verified = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$RecordVisit$recordVisit(
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
      services: services == _undefined
          ? _instance.services
          : (services as List<String>?),
      cost: cost == _undefined ? _instance.cost : (cost as double?),
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

class _CopyWithStubImpl$Mutation$RecordVisit$recordVisit<TRes>
    implements CopyWith$Mutation$RecordVisit$recordVisit<TRes> {
  _CopyWithStubImpl$Mutation$RecordVisit$recordVisit(this._res);

  TRes _res;

  call({
    String? id,
    String? memberId,
    String? clubId,
    String? visitingClubId,
    Enum$VisitStatus? status,
    DateTime? checkInTime,
    List<String>? services,
    double? cost,
    bool? verified,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}
