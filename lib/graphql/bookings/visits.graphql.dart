import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Visits {
  factory Variables$Query$Visits({
    Input$PaginationInput? pagination,
    Enum$VisitStatus? status,
  }) => Variables$Query$Visits._({
    if (pagination != null) r'pagination': pagination,
    if (status != null) r'status': status,
  });

  Variables$Query$Visits._(this._$data);

  factory Variables$Query$Visits.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('pagination')) {
      final l$pagination = data['pagination'];
      result$data['pagination'] = l$pagination == null
          ? null
          : Input$PaginationInput.fromJson(
              (l$pagination as Map<String, dynamic>),
            );
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$VisitStatus((l$status as String));
    }
    return Variables$Query$Visits._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Enum$VisitStatus? get status => (_$data['status'] as Enum$VisitStatus?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('pagination')) {
      final l$pagination = pagination;
      result$data['pagination'] = l$pagination?.toJson();
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$VisitStatus(l$status);
    }
    return result$data;
  }

  CopyWith$Variables$Query$Visits<Variables$Query$Visits> get copyWith =>
      CopyWith$Variables$Query$Visits(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Visits || runtimeType != other.runtimeType) {
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
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$pagination = pagination;
    final l$status = status;
    return Object.hashAll([
      _$data.containsKey('pagination') ? l$pagination : const {},
      _$data.containsKey('status') ? l$status : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$Visits<TRes> {
  factory CopyWith$Variables$Query$Visits(
    Variables$Query$Visits instance,
    TRes Function(Variables$Query$Visits) then,
  ) = _CopyWithImpl$Variables$Query$Visits;

  factory CopyWith$Variables$Query$Visits.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Visits;

  TRes call({Input$PaginationInput? pagination, Enum$VisitStatus? status});
}

class _CopyWithImpl$Variables$Query$Visits<TRes>
    implements CopyWith$Variables$Query$Visits<TRes> {
  _CopyWithImpl$Variables$Query$Visits(this._instance, this._then);

  final Variables$Query$Visits _instance;

  final TRes Function(Variables$Query$Visits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? pagination = _undefined, Object? status = _undefined}) =>
      _then(
        Variables$Query$Visits._({
          ..._instance._$data,
          if (pagination != _undefined)
            'pagination': (pagination as Input$PaginationInput?),
          if (status != _undefined) 'status': (status as Enum$VisitStatus?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$Visits<TRes>
    implements CopyWith$Variables$Query$Visits<TRes> {
  _CopyWithStubImpl$Variables$Query$Visits(this._res);

  TRes _res;

  call({Input$PaginationInput? pagination, Enum$VisitStatus? status}) => _res;
}

class Query$Visits {
  Query$Visits({required this.visits, this.$__typename = 'Query'});

  factory Query$Visits.fromJson(Map<String, dynamic> json) {
    final l$visits = json['visits'];
    final l$$__typename = json['__typename'];
    return Query$Visits(
      visits: Query$Visits$visits.fromJson((l$visits as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Visits$visits visits;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$visits = visits;
    _resultData['visits'] = l$visits.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$visits = visits;
    final l$$__typename = $__typename;
    return Object.hashAll([l$visits, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Visits || runtimeType != other.runtimeType) {
      return false;
    }
    final l$visits = visits;
    final lOther$visits = other.visits;
    if (l$visits != lOther$visits) {
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

extension UtilityExtension$Query$Visits on Query$Visits {
  CopyWith$Query$Visits<Query$Visits> get copyWith =>
      CopyWith$Query$Visits(this, (i) => i);
}

abstract class CopyWith$Query$Visits<TRes> {
  factory CopyWith$Query$Visits(
    Query$Visits instance,
    TRes Function(Query$Visits) then,
  ) = _CopyWithImpl$Query$Visits;

  factory CopyWith$Query$Visits.stub(TRes res) = _CopyWithStubImpl$Query$Visits;

  TRes call({Query$Visits$visits? visits, String? $__typename});
  CopyWith$Query$Visits$visits<TRes> get visits;
}

class _CopyWithImpl$Query$Visits<TRes> implements CopyWith$Query$Visits<TRes> {
  _CopyWithImpl$Query$Visits(this._instance, this._then);

  final Query$Visits _instance;

  final TRes Function(Query$Visits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? visits = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$Visits(
          visits: visits == _undefined || visits == null
              ? _instance.visits
              : (visits as Query$Visits$visits),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$Visits$visits<TRes> get visits {
    final local$visits = _instance.visits;
    return CopyWith$Query$Visits$visits(local$visits, (e) => call(visits: e));
  }
}

class _CopyWithStubImpl$Query$Visits<TRes>
    implements CopyWith$Query$Visits<TRes> {
  _CopyWithStubImpl$Query$Visits(this._res);

  TRes _res;

  call({Query$Visits$visits? visits, String? $__typename}) => _res;

  CopyWith$Query$Visits$visits<TRes> get visits =>
      CopyWith$Query$Visits$visits.stub(_res);
}

const documentNodeQueryVisits = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Visits'),
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
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'status')),
          type: NamedTypeNode(
            name: NameNode(value: 'VisitStatus'),
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
            name: NameNode(value: 'visits'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'pagination'),
                value: VariableNode(name: NameNode(value: 'pagination')),
              ),
              ArgumentNode(
                name: NameNode(value: 'status'),
                value: VariableNode(name: NameNode(value: 'status')),
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
Query$Visits _parserFn$Query$Visits(Map<String, dynamic> data) =>
    Query$Visits.fromJson(data);
typedef OnQueryComplete$Query$Visits =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Visits?);

class Options$Query$Visits extends graphql.QueryOptions<Query$Visits> {
  Options$Query$Visits({
    String? operationName,
    Variables$Query$Visits? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Visits? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Visits? onComplete,
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
                 data == null ? null : _parserFn$Query$Visits(data),
               ),
         onError: onError,
         document: documentNodeQueryVisits,
         parserFn: _parserFn$Query$Visits,
       );

  final OnQueryComplete$Query$Visits? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Visits
    extends graphql.WatchQueryOptions<Query$Visits> {
  WatchOptions$Query$Visits({
    String? operationName,
    Variables$Query$Visits? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Visits? typedOptimisticResult,
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
         document: documentNodeQueryVisits,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Visits,
       );
}

class FetchMoreOptions$Query$Visits extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Visits({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$Visits? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryVisits,
       );
}

extension ClientExtension$Query$Visits on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Visits>> query$Visits([
    Options$Query$Visits? options,
  ]) async => await this.query(options ?? Options$Query$Visits());

  graphql.ObservableQuery<Query$Visits> watchQuery$Visits([
    WatchOptions$Query$Visits? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$Visits());

  void writeQuery$Visits({
    required Query$Visits data,
    Variables$Query$Visits? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryVisits),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$Visits? readQuery$Visits({
    Variables$Query$Visits? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryVisits),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Visits.fromJson(result);
  }
}

class Query$Visits$visits {
  Query$Visits$visits({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'VisitConnection',
  });

  factory Query$Visits$visits.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$Visits$visits(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) =>
                Query$Visits$visits$nodes.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      pageInfo: Query$Visits$visits$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Visits$visits$nodes> nodes;

  final Query$Visits$visits$pageInfo pageInfo;

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
    if (other is! Query$Visits$visits || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Visits$visits on Query$Visits$visits {
  CopyWith$Query$Visits$visits<Query$Visits$visits> get copyWith =>
      CopyWith$Query$Visits$visits(this, (i) => i);
}

abstract class CopyWith$Query$Visits$visits<TRes> {
  factory CopyWith$Query$Visits$visits(
    Query$Visits$visits instance,
    TRes Function(Query$Visits$visits) then,
  ) = _CopyWithImpl$Query$Visits$visits;

  factory CopyWith$Query$Visits$visits.stub(TRes res) =
      _CopyWithStubImpl$Query$Visits$visits;

  TRes call({
    List<Query$Visits$visits$nodes>? nodes,
    Query$Visits$visits$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$Visits$visits$nodes> Function(
      Iterable<CopyWith$Query$Visits$visits$nodes<Query$Visits$visits$nodes>>,
    )
    _fn,
  );
  CopyWith$Query$Visits$visits$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$Visits$visits<TRes>
    implements CopyWith$Query$Visits$visits<TRes> {
  _CopyWithImpl$Query$Visits$visits(this._instance, this._then);

  final Query$Visits$visits _instance;

  final TRes Function(Query$Visits$visits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Visits$visits(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$Visits$visits$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$Visits$visits$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$Visits$visits$nodes> Function(
      Iterable<CopyWith$Query$Visits$visits$nodes<Query$Visits$visits$nodes>>,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$Visits$visits$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$Visits$visits$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$Visits$visits$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$Visits$visits<TRes>
    implements CopyWith$Query$Visits$visits<TRes> {
  _CopyWithStubImpl$Query$Visits$visits(this._res);

  TRes _res;

  call({
    List<Query$Visits$visits$nodes>? nodes,
    Query$Visits$visits$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$Visits$visits$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$Visits$visits$pageInfo.stub(_res);
}

class Query$Visits$visits$nodes {
  Query$Visits$visits$nodes({
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

  factory Query$Visits$visits$nodes.fromJson(Map<String, dynamic> json) {
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
    return Query$Visits$visits$nodes(
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
    if (other is! Query$Visits$visits$nodes ||
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

extension UtilityExtension$Query$Visits$visits$nodes
    on Query$Visits$visits$nodes {
  CopyWith$Query$Visits$visits$nodes<Query$Visits$visits$nodes> get copyWith =>
      CopyWith$Query$Visits$visits$nodes(this, (i) => i);
}

abstract class CopyWith$Query$Visits$visits$nodes<TRes> {
  factory CopyWith$Query$Visits$visits$nodes(
    Query$Visits$visits$nodes instance,
    TRes Function(Query$Visits$visits$nodes) then,
  ) = _CopyWithImpl$Query$Visits$visits$nodes;

  factory CopyWith$Query$Visits$visits$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$Visits$visits$nodes;

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

class _CopyWithImpl$Query$Visits$visits$nodes<TRes>
    implements CopyWith$Query$Visits$visits$nodes<TRes> {
  _CopyWithImpl$Query$Visits$visits$nodes(this._instance, this._then);

  final Query$Visits$visits$nodes _instance;

  final TRes Function(Query$Visits$visits$nodes) _then;

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
    Query$Visits$visits$nodes(
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

class _CopyWithStubImpl$Query$Visits$visits$nodes<TRes>
    implements CopyWith$Query$Visits$visits$nodes<TRes> {
  _CopyWithStubImpl$Query$Visits$visits$nodes(this._res);

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

class Query$Visits$visits$pageInfo {
  Query$Visits$visits$pageInfo({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$Visits$visits$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$pageSize = json['pageSize'];
    final l$total = json['total'];
    final l$totalPages = json['totalPages'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPrevPage = json['hasPrevPage'];
    final l$$__typename = json['__typename'];
    return Query$Visits$visits$pageInfo(
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
    if (other is! Query$Visits$visits$pageInfo ||
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

extension UtilityExtension$Query$Visits$visits$pageInfo
    on Query$Visits$visits$pageInfo {
  CopyWith$Query$Visits$visits$pageInfo<Query$Visits$visits$pageInfo>
  get copyWith => CopyWith$Query$Visits$visits$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$Visits$visits$pageInfo<TRes> {
  factory CopyWith$Query$Visits$visits$pageInfo(
    Query$Visits$visits$pageInfo instance,
    TRes Function(Query$Visits$visits$pageInfo) then,
  ) = _CopyWithImpl$Query$Visits$visits$pageInfo;

  factory CopyWith$Query$Visits$visits$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$Visits$visits$pageInfo;

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

class _CopyWithImpl$Query$Visits$visits$pageInfo<TRes>
    implements CopyWith$Query$Visits$visits$pageInfo<TRes> {
  _CopyWithImpl$Query$Visits$visits$pageInfo(this._instance, this._then);

  final Query$Visits$visits$pageInfo _instance;

  final TRes Function(Query$Visits$visits$pageInfo) _then;

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
    Query$Visits$visits$pageInfo(
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

class _CopyWithStubImpl$Query$Visits$visits$pageInfo<TRes>
    implements CopyWith$Query$Visits$visits$pageInfo<TRes> {
  _CopyWithStubImpl$Query$Visits$visits$pageInfo(this._res);

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
