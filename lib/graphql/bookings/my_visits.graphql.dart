import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$MyVisits {
  factory Variables$Query$MyVisits({Input$PaginationInput? pagination}) =>
      Variables$Query$MyVisits._({
        if (pagination != null) r'pagination': pagination,
      });

  Variables$Query$MyVisits._(this._$data);

  factory Variables$Query$MyVisits.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('pagination')) {
      final l$pagination = data['pagination'];
      result$data['pagination'] = l$pagination == null
          ? null
          : Input$PaginationInput.fromJson(
              (l$pagination as Map<String, dynamic>),
            );
    }
    return Variables$Query$MyVisits._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('pagination')) {
      final l$pagination = pagination;
      result$data['pagination'] = l$pagination?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$MyVisits<Variables$Query$MyVisits> get copyWith =>
      CopyWith$Variables$Query$MyVisits(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$MyVisits ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$pagination = pagination;
    final lOther$pagination = other.pagination;
    if (_$data.containsKey('pagination') !=
        other._$data.containsKey('pagination')) {
      return false;
    }
    if (l$pagination != lOther$pagination) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$pagination = pagination;
    return Object.hashAll([
      _$data.containsKey('pagination') ? l$pagination : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$MyVisits<TRes> {
  factory CopyWith$Variables$Query$MyVisits(
    Variables$Query$MyVisits instance,
    TRes Function(Variables$Query$MyVisits) then,
  ) = _CopyWithImpl$Variables$Query$MyVisits;

  factory CopyWith$Variables$Query$MyVisits.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$MyVisits;

  TRes call({Input$PaginationInput? pagination});
}

class _CopyWithImpl$Variables$Query$MyVisits<TRes>
    implements CopyWith$Variables$Query$MyVisits<TRes> {
  _CopyWithImpl$Variables$Query$MyVisits(this._instance, this._then);

  final Variables$Query$MyVisits _instance;

  final TRes Function(Variables$Query$MyVisits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? pagination = _undefined}) => _then(
    Variables$Query$MyVisits._({
      ..._instance._$data,
      if (pagination != _undefined)
        'pagination': (pagination as Input$PaginationInput?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$MyVisits<TRes>
    implements CopyWith$Variables$Query$MyVisits<TRes> {
  _CopyWithStubImpl$Variables$Query$MyVisits(this._res);

  TRes _res;

  call({Input$PaginationInput? pagination}) => _res;
}

class Query$MyVisits {
  Query$MyVisits({required this.myVisits, this.$__typename = 'Query'});

  factory Query$MyVisits.fromJson(Map<String, dynamic> json) {
    final l$myVisits = json['myVisits'];
    final l$$__typename = json['__typename'];
    return Query$MyVisits(
      myVisits: Query$MyVisits$myVisits.fromJson(
        (l$myVisits as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MyVisits$myVisits myVisits;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myVisits = myVisits;
    _resultData['myVisits'] = l$myVisits.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myVisits = myVisits;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myVisits, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyVisits || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myVisits = myVisits;
    final lOther$myVisits = other.myVisits;
    if (l$myVisits != lOther$myVisits) {
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

extension UtilityExtension$Query$MyVisits on Query$MyVisits {
  CopyWith$Query$MyVisits<Query$MyVisits> get copyWith =>
      CopyWith$Query$MyVisits(this, (i) => i);
}

abstract class CopyWith$Query$MyVisits<TRes> {
  factory CopyWith$Query$MyVisits(
    Query$MyVisits instance,
    TRes Function(Query$MyVisits) then,
  ) = _CopyWithImpl$Query$MyVisits;

  factory CopyWith$Query$MyVisits.stub(TRes res) =
      _CopyWithStubImpl$Query$MyVisits;

  TRes call({Query$MyVisits$myVisits? myVisits, String? $__typename});
  CopyWith$Query$MyVisits$myVisits<TRes> get myVisits;
}

class _CopyWithImpl$Query$MyVisits<TRes>
    implements CopyWith$Query$MyVisits<TRes> {
  _CopyWithImpl$Query$MyVisits(this._instance, this._then);

  final Query$MyVisits _instance;

  final TRes Function(Query$MyVisits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? myVisits = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyVisits(
      myVisits: myVisits == _undefined || myVisits == null
          ? _instance.myVisits
          : (myVisits as Query$MyVisits$myVisits),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$MyVisits$myVisits<TRes> get myVisits {
    final local$myVisits = _instance.myVisits;
    return CopyWith$Query$MyVisits$myVisits(
      local$myVisits,
      (e) => call(myVisits: e),
    );
  }
}

class _CopyWithStubImpl$Query$MyVisits<TRes>
    implements CopyWith$Query$MyVisits<TRes> {
  _CopyWithStubImpl$Query$MyVisits(this._res);

  TRes _res;

  call({Query$MyVisits$myVisits? myVisits, String? $__typename}) => _res;

  CopyWith$Query$MyVisits$myVisits<TRes> get myVisits =>
      CopyWith$Query$MyVisits$myVisits.stub(_res);
}

const documentNodeQueryMyVisits = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyVisits'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'pagination')),
          type: NamedTypeNode(
            name: NameNode(value: 'PaginationInput'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'myVisits'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'pagination'),
                value: VariableNode(name: NameNode(value: 'pagination')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'nodes'),
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
                  name: NameNode(value: 'pageInfo'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'page'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'pageSize'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'total'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'totalPages'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'hasNextPage'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'hasPrevPage'),
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
Query$MyVisits _parserFn$Query$MyVisits(Map<String, dynamic> data) =>
    Query$MyVisits.fromJson(data);
typedef OnQueryComplete$Query$MyVisits =
    FutureOr<void> Function(Map<String, dynamic>?, Query$MyVisits?);

class Options$Query$MyVisits extends graphql.QueryOptions<Query$MyVisits> {
  Options$Query$MyVisits({
    String? operationName,
    Variables$Query$MyVisits? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MyVisits? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$MyVisits? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables?.toJson() ?? {},
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
                 data == null ? null : _parserFn$Query$MyVisits(data),
               ),
         onError: onError,
         document: documentNodeQueryMyVisits,
         parserFn: _parserFn$Query$MyVisits,
       );

  final OnQueryComplete$Query$MyVisits? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$MyVisits
    extends graphql.WatchQueryOptions<Query$MyVisits> {
  WatchOptions$Query$MyVisits({
    String? operationName,
    Variables$Query$MyVisits? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MyVisits? typedOptimisticResult,
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
         document: documentNodeQueryMyVisits,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$MyVisits,
       );
}

class FetchMoreOptions$Query$MyVisits extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$MyVisits({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$MyVisits? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryMyVisits,
       );
}

extension ClientExtension$Query$MyVisits on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$MyVisits>> query$MyVisits([
    Options$Query$MyVisits? options,
  ]) async => await this.query(options ?? Options$Query$MyVisits());

  graphql.ObservableQuery<Query$MyVisits> watchQuery$MyVisits([
    WatchOptions$Query$MyVisits? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$MyVisits());

  void writeQuery$MyVisits({
    required Query$MyVisits data,
    Variables$Query$MyVisits? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryMyVisits),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$MyVisits? readQuery$MyVisits({
    Variables$Query$MyVisits? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMyVisits),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$MyVisits.fromJson(result);
  }
}

class Query$MyVisits$myVisits {
  Query$MyVisits$myVisits({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'VisitConnection',
  });

  factory Query$MyVisits$myVisits.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$MyVisits$myVisits(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$MyVisits$myVisits$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$MyVisits$myVisits$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MyVisits$myVisits$nodes> nodes;

  final Query$MyVisits$myVisits$pageInfo pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$nodes = nodes;
    _resultData['nodes'] = l$nodes.map((e) => e.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$nodes = nodes;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$nodes.map((v) => v)),
      l$pageInfo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyVisits$myVisits || runtimeType != other.runtimeType) {
      return false;
    }
    final l$nodes = nodes;
    final lOther$nodes = other.nodes;
    if (l$nodes.length != lOther$nodes.length) {
      return false;
    }
    for (int i = 0; i < l$nodes.length; i++) {
      final l$nodes$entry = l$nodes[i];
      final lOther$nodes$entry = lOther$nodes[i];
      if (l$nodes$entry != lOther$nodes$entry) {
        return false;
      }
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
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

extension UtilityExtension$Query$MyVisits$myVisits on Query$MyVisits$myVisits {
  CopyWith$Query$MyVisits$myVisits<Query$MyVisits$myVisits> get copyWith =>
      CopyWith$Query$MyVisits$myVisits(this, (i) => i);
}

abstract class CopyWith$Query$MyVisits$myVisits<TRes> {
  factory CopyWith$Query$MyVisits$myVisits(
    Query$MyVisits$myVisits instance,
    TRes Function(Query$MyVisits$myVisits) then,
  ) = _CopyWithImpl$Query$MyVisits$myVisits;

  factory CopyWith$Query$MyVisits$myVisits.stub(TRes res) =
      _CopyWithStubImpl$Query$MyVisits$myVisits;

  TRes call({
    List<Query$MyVisits$myVisits$nodes>? nodes,
    Query$MyVisits$myVisits$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$MyVisits$myVisits$nodes> Function(
      Iterable<
        CopyWith$Query$MyVisits$myVisits$nodes<Query$MyVisits$myVisits$nodes>
      >,
    )
    _fn,
  );
  CopyWith$Query$MyVisits$myVisits$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$MyVisits$myVisits<TRes>
    implements CopyWith$Query$MyVisits$myVisits<TRes> {
  _CopyWithImpl$Query$MyVisits$myVisits(this._instance, this._then);

  final Query$MyVisits$myVisits _instance;

  final TRes Function(Query$MyVisits$myVisits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyVisits$myVisits(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$MyVisits$myVisits$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$MyVisits$myVisits$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$MyVisits$myVisits$nodes> Function(
      Iterable<
        CopyWith$Query$MyVisits$myVisits$nodes<Query$MyVisits$myVisits$nodes>
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$MyVisits$myVisits$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$MyVisits$myVisits$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$MyVisits$myVisits$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$MyVisits$myVisits<TRes>
    implements CopyWith$Query$MyVisits$myVisits<TRes> {
  _CopyWithStubImpl$Query$MyVisits$myVisits(this._res);

  TRes _res;

  call({
    List<Query$MyVisits$myVisits$nodes>? nodes,
    Query$MyVisits$myVisits$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$MyVisits$myVisits$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$MyVisits$myVisits$pageInfo.stub(_res);
}

class Query$MyVisits$myVisits$nodes {
  Query$MyVisits$myVisits$nodes({
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

  factory Query$MyVisits$myVisits$nodes.fromJson(Map<String, dynamic> json) {
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
    return Query$MyVisits$myVisits$nodes(
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
    if (other is! Query$MyVisits$myVisits$nodes ||
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

extension UtilityExtension$Query$MyVisits$myVisits$nodes
    on Query$MyVisits$myVisits$nodes {
  CopyWith$Query$MyVisits$myVisits$nodes<Query$MyVisits$myVisits$nodes>
  get copyWith => CopyWith$Query$MyVisits$myVisits$nodes(this, (i) => i);
}

abstract class CopyWith$Query$MyVisits$myVisits$nodes<TRes> {
  factory CopyWith$Query$MyVisits$myVisits$nodes(
    Query$MyVisits$myVisits$nodes instance,
    TRes Function(Query$MyVisits$myVisits$nodes) then,
  ) = _CopyWithImpl$Query$MyVisits$myVisits$nodes;

  factory CopyWith$Query$MyVisits$myVisits$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$MyVisits$myVisits$nodes;

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

class _CopyWithImpl$Query$MyVisits$myVisits$nodes<TRes>
    implements CopyWith$Query$MyVisits$myVisits$nodes<TRes> {
  _CopyWithImpl$Query$MyVisits$myVisits$nodes(this._instance, this._then);

  final Query$MyVisits$myVisits$nodes _instance;

  final TRes Function(Query$MyVisits$myVisits$nodes) _then;

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
    Query$MyVisits$myVisits$nodes(
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

class _CopyWithStubImpl$Query$MyVisits$myVisits$nodes<TRes>
    implements CopyWith$Query$MyVisits$myVisits$nodes<TRes> {
  _CopyWithStubImpl$Query$MyVisits$myVisits$nodes(this._res);

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

class Query$MyVisits$myVisits$pageInfo {
  Query$MyVisits$myVisits$pageInfo({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$MyVisits$myVisits$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$pageSize = json['pageSize'];
    final l$total = json['total'];
    final l$totalPages = json['totalPages'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPrevPage = json['hasPrevPage'];
    final l$$__typename = json['__typename'];
    return Query$MyVisits$myVisits$pageInfo(
      page: (l$page as int),
      pageSize: (l$pageSize as int),
      total: (l$total as int),
      totalPages: (l$totalPages as int),
      hasNextPage: (l$hasNextPage as bool),
      hasPrevPage: (l$hasPrevPage as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final int page;

  final int pageSize;

  final int total;

  final int totalPages;

  final bool hasNextPage;

  final bool hasPrevPage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$page = page;
    _resultData['page'] = l$page;
    final l$pageSize = pageSize;
    _resultData['pageSize'] = l$pageSize;
    final l$total = total;
    _resultData['total'] = l$total;
    final l$totalPages = totalPages;
    _resultData['totalPages'] = l$totalPages;
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$hasPrevPage = hasPrevPage;
    _resultData['hasPrevPage'] = l$hasPrevPage;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$pageSize = pageSize;
    final l$total = total;
    final l$totalPages = totalPages;
    final l$hasNextPage = hasNextPage;
    final l$hasPrevPage = hasPrevPage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$page,
      l$pageSize,
      l$total,
      l$totalPages,
      l$hasNextPage,
      l$hasPrevPage,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyVisits$myVisits$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
      return false;
    }
    final l$pageSize = pageSize;
    final lOther$pageSize = other.pageSize;
    if (l$pageSize != lOther$pageSize) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
      return false;
    }
    final l$totalPages = totalPages;
    final lOther$totalPages = other.totalPages;
    if (l$totalPages != lOther$totalPages) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$hasPrevPage = hasPrevPage;
    final lOther$hasPrevPage = other.hasPrevPage;
    if (l$hasPrevPage != lOther$hasPrevPage) {
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

extension UtilityExtension$Query$MyVisits$myVisits$pageInfo
    on Query$MyVisits$myVisits$pageInfo {
  CopyWith$Query$MyVisits$myVisits$pageInfo<Query$MyVisits$myVisits$pageInfo>
  get copyWith => CopyWith$Query$MyVisits$myVisits$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$MyVisits$myVisits$pageInfo<TRes> {
  factory CopyWith$Query$MyVisits$myVisits$pageInfo(
    Query$MyVisits$myVisits$pageInfo instance,
    TRes Function(Query$MyVisits$myVisits$pageInfo) then,
  ) = _CopyWithImpl$Query$MyVisits$myVisits$pageInfo;

  factory CopyWith$Query$MyVisits$myVisits$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$MyVisits$myVisits$pageInfo;

  TRes call({
    int? page,
    int? pageSize,
    int? total,
    int? totalPages,
    bool? hasNextPage,
    bool? hasPrevPage,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MyVisits$myVisits$pageInfo<TRes>
    implements CopyWith$Query$MyVisits$myVisits$pageInfo<TRes> {
  _CopyWithImpl$Query$MyVisits$myVisits$pageInfo(this._instance, this._then);

  final Query$MyVisits$myVisits$pageInfo _instance;

  final TRes Function(Query$MyVisits$myVisits$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? page = _undefined,
    Object? pageSize = _undefined,
    Object? total = _undefined,
    Object? totalPages = _undefined,
    Object? hasNextPage = _undefined,
    Object? hasPrevPage = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyVisits$myVisits$pageInfo(
      page: page == _undefined || page == null ? _instance.page : (page as int),
      pageSize: pageSize == _undefined || pageSize == null
          ? _instance.pageSize
          : (pageSize as int),
      total: total == _undefined || total == null
          ? _instance.total
          : (total as int),
      totalPages: totalPages == _undefined || totalPages == null
          ? _instance.totalPages
          : (totalPages as int),
      hasNextPage: hasNextPage == _undefined || hasNextPage == null
          ? _instance.hasNextPage
          : (hasNextPage as bool),
      hasPrevPage: hasPrevPage == _undefined || hasPrevPage == null
          ? _instance.hasPrevPage
          : (hasPrevPage as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$MyVisits$myVisits$pageInfo<TRes>
    implements CopyWith$Query$MyVisits$myVisits$pageInfo<TRes> {
  _CopyWithStubImpl$Query$MyVisits$myVisits$pageInfo(this._res);

  TRes _res;

  call({
    int? page,
    int? pageSize,
    int? total,
    int? totalPages,
    bool? hasNextPage,
    bool? hasPrevPage,
    String? $__typename,
  }) => _res;
}
