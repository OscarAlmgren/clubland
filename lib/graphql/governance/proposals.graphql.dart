import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Proposals {
  factory Variables$Query$Proposals({
    Input$PaginationInput? pagination,
    Enum$ProposalStatus? status,
    Enum$ProposalType? type,
  }) => Variables$Query$Proposals._({
    if (pagination != null) r'pagination': pagination,
    if (status != null) r'status': status,
    if (type != null) r'type': type,
  });

  Variables$Query$Proposals._(this._$data);

  factory Variables$Query$Proposals.fromJson(Map<String, dynamic> data) {
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
          : fromJson$Enum$ProposalStatus((l$status as String));
    }
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = l$type == null
          ? null
          : fromJson$Enum$ProposalType((l$type as String));
    }
    return Variables$Query$Proposals._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Enum$ProposalStatus? get status => (_$data['status'] as Enum$ProposalStatus?);

  Enum$ProposalType? get type => (_$data['type'] as Enum$ProposalType?);

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
          : toJson$Enum$ProposalStatus(l$status);
    }
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type == null
          ? null
          : toJson$Enum$ProposalType(l$type);
    }
    return result$data;
  }

  CopyWith$Variables$Query$Proposals<Variables$Query$Proposals> get copyWith =>
      CopyWith$Variables$Query$Proposals(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Proposals ||
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
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$pagination = pagination;
    final l$status = status;
    final l$type = type;
    return Object.hashAll([
      _$data.containsKey('pagination') ? l$pagination : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('type') ? l$type : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$Proposals<TRes> {
  factory CopyWith$Variables$Query$Proposals(
    Variables$Query$Proposals instance,
    TRes Function(Variables$Query$Proposals) then,
  ) = _CopyWithImpl$Variables$Query$Proposals;

  factory CopyWith$Variables$Query$Proposals.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Proposals;

  TRes call({
    Input$PaginationInput? pagination,
    Enum$ProposalStatus? status,
    Enum$ProposalType? type,
  });
}

class _CopyWithImpl$Variables$Query$Proposals<TRes>
    implements CopyWith$Variables$Query$Proposals<TRes> {
  _CopyWithImpl$Variables$Query$Proposals(this._instance, this._then);

  final Variables$Query$Proposals _instance;

  final TRes Function(Variables$Query$Proposals) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? pagination = _undefined,
    Object? status = _undefined,
    Object? type = _undefined,
  }) => _then(
    Variables$Query$Proposals._({
      ..._instance._$data,
      if (pagination != _undefined)
        'pagination': (pagination as Input$PaginationInput?),
      if (status != _undefined) 'status': (status as Enum$ProposalStatus?),
      if (type != _undefined) 'type': (type as Enum$ProposalType?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$Proposals<TRes>
    implements CopyWith$Variables$Query$Proposals<TRes> {
  _CopyWithStubImpl$Variables$Query$Proposals(this._res);

  TRes _res;

  call({
    Input$PaginationInput? pagination,
    Enum$ProposalStatus? status,
    Enum$ProposalType? type,
  }) => _res;
}

class Query$Proposals {
  Query$Proposals({required this.proposals, this.$__typename = 'Query'});

  factory Query$Proposals.fromJson(Map<String, dynamic> json) {
    final l$proposals = json['proposals'];
    final l$$__typename = json['__typename'];
    return Query$Proposals(
      proposals: Query$Proposals$proposals.fromJson(
        (l$proposals as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Proposals$proposals proposals;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$proposals = proposals;
    _resultData['proposals'] = l$proposals.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$proposals = proposals;
    final l$$__typename = $__typename;
    return Object.hashAll([l$proposals, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Proposals || runtimeType != other.runtimeType) {
      return false;
    }
    final l$proposals = proposals;
    final lOther$proposals = other.proposals;
    if (l$proposals != lOther$proposals) {
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

extension UtilityExtension$Query$Proposals on Query$Proposals {
  CopyWith$Query$Proposals<Query$Proposals> get copyWith =>
      CopyWith$Query$Proposals(this, (i) => i);
}

abstract class CopyWith$Query$Proposals<TRes> {
  factory CopyWith$Query$Proposals(
    Query$Proposals instance,
    TRes Function(Query$Proposals) then,
  ) = _CopyWithImpl$Query$Proposals;

  factory CopyWith$Query$Proposals.stub(TRes res) =
      _CopyWithStubImpl$Query$Proposals;

  TRes call({Query$Proposals$proposals? proposals, String? $__typename});
  CopyWith$Query$Proposals$proposals<TRes> get proposals;
}

class _CopyWithImpl$Query$Proposals<TRes>
    implements CopyWith$Query$Proposals<TRes> {
  _CopyWithImpl$Query$Proposals(this._instance, this._then);

  final Query$Proposals _instance;

  final TRes Function(Query$Proposals) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? proposals = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Proposals(
      proposals: proposals == _undefined || proposals == null
          ? _instance.proposals
          : (proposals as Query$Proposals$proposals),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Proposals$proposals<TRes> get proposals {
    final local$proposals = _instance.proposals;
    return CopyWith$Query$Proposals$proposals(
      local$proposals,
      (e) => call(proposals: e),
    );
  }
}

class _CopyWithStubImpl$Query$Proposals<TRes>
    implements CopyWith$Query$Proposals<TRes> {
  _CopyWithStubImpl$Query$Proposals(this._res);

  TRes _res;

  call({Query$Proposals$proposals? proposals, String? $__typename}) => _res;

  CopyWith$Query$Proposals$proposals<TRes> get proposals =>
      CopyWith$Query$Proposals$proposals.stub(_res);
}

const documentNodeQueryProposals = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Proposals'),
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
            name: NameNode(value: 'ProposalStatus'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'type')),
          type: NamedTypeNode(
            name: NameNode(value: 'ProposalType'),
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
            name: NameNode(value: 'proposals'),
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
              ArgumentNode(
                name: NameNode(value: 'type'),
                value: VariableNode(name: NameNode(value: 'type')),
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
                        name: NameNode(value: 'title'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'description'),
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
                        name: NameNode(value: 'status'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'category'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'votingStartTime'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'votingEndTime'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'totalVotes'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'votesYay'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'votesNay'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'votesAbstain'),
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
                        name: NameNode(value: 'proposer'),
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
Query$Proposals _parserFn$Query$Proposals(Map<String, dynamic> data) =>
    Query$Proposals.fromJson(data);
typedef OnQueryComplete$Query$Proposals =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Proposals?);

class Options$Query$Proposals extends graphql.QueryOptions<Query$Proposals> {
  Options$Query$Proposals({
    String? operationName,
    Variables$Query$Proposals? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Proposals? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Proposals? onComplete,
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
                 data == null ? null : _parserFn$Query$Proposals(data),
               ),
         onError: onError,
         document: documentNodeQueryProposals,
         parserFn: _parserFn$Query$Proposals,
       );

  final OnQueryComplete$Query$Proposals? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Proposals
    extends graphql.WatchQueryOptions<Query$Proposals> {
  WatchOptions$Query$Proposals({
    String? operationName,
    Variables$Query$Proposals? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Proposals? typedOptimisticResult,
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
         document: documentNodeQueryProposals,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Proposals,
       );
}

class FetchMoreOptions$Query$Proposals extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Proposals({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$Proposals? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryProposals,
       );
}

extension ClientExtension$Query$Proposals on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Proposals>> query$Proposals([
    Options$Query$Proposals? options,
  ]) async => await this.query(options ?? Options$Query$Proposals());

  graphql.ObservableQuery<Query$Proposals> watchQuery$Proposals([
    WatchOptions$Query$Proposals? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$Proposals());

  void writeQuery$Proposals({
    required Query$Proposals data,
    Variables$Query$Proposals? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryProposals),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$Proposals? readQuery$Proposals({
    Variables$Query$Proposals? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryProposals),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Proposals.fromJson(result);
  }
}

class Query$Proposals$proposals {
  Query$Proposals$proposals({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'ProposalConnection',
  });

  factory Query$Proposals$proposals.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$Proposals$proposals(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$Proposals$proposals$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$Proposals$proposals$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Proposals$proposals$nodes> nodes;

  final Query$Proposals$proposals$pageInfo pageInfo;

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
    if (other is! Query$Proposals$proposals ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Proposals$proposals
    on Query$Proposals$proposals {
  CopyWith$Query$Proposals$proposals<Query$Proposals$proposals> get copyWith =>
      CopyWith$Query$Proposals$proposals(this, (i) => i);
}

abstract class CopyWith$Query$Proposals$proposals<TRes> {
  factory CopyWith$Query$Proposals$proposals(
    Query$Proposals$proposals instance,
    TRes Function(Query$Proposals$proposals) then,
  ) = _CopyWithImpl$Query$Proposals$proposals;

  factory CopyWith$Query$Proposals$proposals.stub(TRes res) =
      _CopyWithStubImpl$Query$Proposals$proposals;

  TRes call({
    List<Query$Proposals$proposals$nodes>? nodes,
    Query$Proposals$proposals$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$Proposals$proposals$nodes> Function(
      Iterable<
        CopyWith$Query$Proposals$proposals$nodes<
          Query$Proposals$proposals$nodes
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$Proposals$proposals$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$Proposals$proposals<TRes>
    implements CopyWith$Query$Proposals$proposals<TRes> {
  _CopyWithImpl$Query$Proposals$proposals(this._instance, this._then);

  final Query$Proposals$proposals _instance;

  final TRes Function(Query$Proposals$proposals) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Proposals$proposals(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$Proposals$proposals$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$Proposals$proposals$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$Proposals$proposals$nodes> Function(
      Iterable<
        CopyWith$Query$Proposals$proposals$nodes<
          Query$Proposals$proposals$nodes
        >
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$Proposals$proposals$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$Proposals$proposals$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$Proposals$proposals$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$Proposals$proposals<TRes>
    implements CopyWith$Query$Proposals$proposals<TRes> {
  _CopyWithStubImpl$Query$Proposals$proposals(this._res);

  TRes _res;

  call({
    List<Query$Proposals$proposals$nodes>? nodes,
    Query$Proposals$proposals$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$Proposals$proposals$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$Proposals$proposals$pageInfo.stub(_res);
}

class Query$Proposals$proposals$nodes {
  Query$Proposals$proposals$nodes({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
    this.category,
    required this.votingStartTime,
    required this.votingEndTime,
    required this.totalVotes,
    required this.votesYay,
    required this.votesNay,
    required this.votesAbstain,
    required this.createdAt,
    this.proposer,
    this.$__typename = 'Proposal',
  });

  factory Query$Proposals$proposals$nodes.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$type = json['type'];
    final l$status = json['status'];
    final l$category = json['category'];
    final l$votingStartTime = json['votingStartTime'];
    final l$votingEndTime = json['votingEndTime'];
    final l$totalVotes = json['totalVotes'];
    final l$votesYay = json['votesYay'];
    final l$votesNay = json['votesNay'];
    final l$votesAbstain = json['votesAbstain'];
    final l$createdAt = json['createdAt'];
    final l$proposer = json['proposer'];
    final l$$__typename = json['__typename'];
    return Query$Proposals$proposals$nodes(
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String),
      type: fromJson$Enum$ProposalType((l$type as String)),
      status: fromJson$Enum$ProposalStatus((l$status as String)),
      category: (l$category as String?),
      votingStartTime: DateTime.parse((l$votingStartTime as String)),
      votingEndTime: DateTime.parse((l$votingEndTime as String)),
      totalVotes: (l$totalVotes as int),
      votesYay: (l$votesYay as int),
      votesNay: (l$votesNay as int),
      votesAbstain: (l$votesAbstain as int),
      createdAt: DateTime.parse((l$createdAt as String)),
      proposer: l$proposer == null
          ? null
          : Query$Proposals$proposals$nodes$proposer.fromJson(
              (l$proposer as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String description;

  final Enum$ProposalType type;

  final Enum$ProposalStatus status;

  final String? category;

  final DateTime votingStartTime;

  final DateTime votingEndTime;

  final int totalVotes;

  final int votesYay;

  final int votesNay;

  final int votesAbstain;

  final DateTime createdAt;

  final Query$Proposals$proposals$nodes$proposer? proposer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$type = type;
    _resultData['type'] = toJson$Enum$ProposalType(l$type);
    final l$status = status;
    _resultData['status'] = toJson$Enum$ProposalStatus(l$status);
    final l$category = category;
    _resultData['category'] = l$category;
    final l$votingStartTime = votingStartTime;
    _resultData['votingStartTime'] = l$votingStartTime.toIso8601String();
    final l$votingEndTime = votingEndTime;
    _resultData['votingEndTime'] = l$votingEndTime.toIso8601String();
    final l$totalVotes = totalVotes;
    _resultData['totalVotes'] = l$totalVotes;
    final l$votesYay = votesYay;
    _resultData['votesYay'] = l$votesYay;
    final l$votesNay = votesNay;
    _resultData['votesNay'] = l$votesNay;
    final l$votesAbstain = votesAbstain;
    _resultData['votesAbstain'] = l$votesAbstain;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$proposer = proposer;
    _resultData['proposer'] = l$proposer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$type = type;
    final l$status = status;
    final l$category = category;
    final l$votingStartTime = votingStartTime;
    final l$votingEndTime = votingEndTime;
    final l$totalVotes = totalVotes;
    final l$votesYay = votesYay;
    final l$votesNay = votesNay;
    final l$votesAbstain = votesAbstain;
    final l$createdAt = createdAt;
    final l$proposer = proposer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$type,
      l$status,
      l$category,
      l$votingStartTime,
      l$votingEndTime,
      l$totalVotes,
      l$votesYay,
      l$votesNay,
      l$votesAbstain,
      l$createdAt,
      l$proposer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Proposals$proposals$nodes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
      return false;
    }
    final l$votingStartTime = votingStartTime;
    final lOther$votingStartTime = other.votingStartTime;
    if (l$votingStartTime != lOther$votingStartTime) {
      return false;
    }
    final l$votingEndTime = votingEndTime;
    final lOther$votingEndTime = other.votingEndTime;
    if (l$votingEndTime != lOther$votingEndTime) {
      return false;
    }
    final l$totalVotes = totalVotes;
    final lOther$totalVotes = other.totalVotes;
    if (l$totalVotes != lOther$totalVotes) {
      return false;
    }
    final l$votesYay = votesYay;
    final lOther$votesYay = other.votesYay;
    if (l$votesYay != lOther$votesYay) {
      return false;
    }
    final l$votesNay = votesNay;
    final lOther$votesNay = other.votesNay;
    if (l$votesNay != lOther$votesNay) {
      return false;
    }
    final l$votesAbstain = votesAbstain;
    final lOther$votesAbstain = other.votesAbstain;
    if (l$votesAbstain != lOther$votesAbstain) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$proposer = proposer;
    final lOther$proposer = other.proposer;
    if (l$proposer != lOther$proposer) {
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

extension UtilityExtension$Query$Proposals$proposals$nodes
    on Query$Proposals$proposals$nodes {
  CopyWith$Query$Proposals$proposals$nodes<Query$Proposals$proposals$nodes>
  get copyWith => CopyWith$Query$Proposals$proposals$nodes(this, (i) => i);
}

abstract class CopyWith$Query$Proposals$proposals$nodes<TRes> {
  factory CopyWith$Query$Proposals$proposals$nodes(
    Query$Proposals$proposals$nodes instance,
    TRes Function(Query$Proposals$proposals$nodes) then,
  ) = _CopyWithImpl$Query$Proposals$proposals$nodes;

  factory CopyWith$Query$Proposals$proposals$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$Proposals$proposals$nodes;

  TRes call({
    String? id,
    String? title,
    String? description,
    Enum$ProposalType? type,
    Enum$ProposalStatus? status,
    String? category,
    DateTime? votingStartTime,
    DateTime? votingEndTime,
    int? totalVotes,
    int? votesYay,
    int? votesNay,
    int? votesAbstain,
    DateTime? createdAt,
    Query$Proposals$proposals$nodes$proposer? proposer,
    String? $__typename,
  });
  CopyWith$Query$Proposals$proposals$nodes$proposer<TRes> get proposer;
}

class _CopyWithImpl$Query$Proposals$proposals$nodes<TRes>
    implements CopyWith$Query$Proposals$proposals$nodes<TRes> {
  _CopyWithImpl$Query$Proposals$proposals$nodes(this._instance, this._then);

  final Query$Proposals$proposals$nodes _instance;

  final TRes Function(Query$Proposals$proposals$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? type = _undefined,
    Object? status = _undefined,
    Object? category = _undefined,
    Object? votingStartTime = _undefined,
    Object? votingEndTime = _undefined,
    Object? totalVotes = _undefined,
    Object? votesYay = _undefined,
    Object? votesNay = _undefined,
    Object? votesAbstain = _undefined,
    Object? createdAt = _undefined,
    Object? proposer = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Proposals$proposals$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      title: title == _undefined || title == null
          ? _instance.title
          : (title as String),
      description: description == _undefined || description == null
          ? _instance.description
          : (description as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$ProposalType),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$ProposalStatus),
      category: category == _undefined
          ? _instance.category
          : (category as String?),
      votingStartTime: votingStartTime == _undefined || votingStartTime == null
          ? _instance.votingStartTime
          : (votingStartTime as DateTime),
      votingEndTime: votingEndTime == _undefined || votingEndTime == null
          ? _instance.votingEndTime
          : (votingEndTime as DateTime),
      totalVotes: totalVotes == _undefined || totalVotes == null
          ? _instance.totalVotes
          : (totalVotes as int),
      votesYay: votesYay == _undefined || votesYay == null
          ? _instance.votesYay
          : (votesYay as int),
      votesNay: votesNay == _undefined || votesNay == null
          ? _instance.votesNay
          : (votesNay as int),
      votesAbstain: votesAbstain == _undefined || votesAbstain == null
          ? _instance.votesAbstain
          : (votesAbstain as int),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      proposer: proposer == _undefined
          ? _instance.proposer
          : (proposer as Query$Proposals$proposals$nodes$proposer?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Proposals$proposals$nodes$proposer<TRes> get proposer {
    final local$proposer = _instance.proposer;
    return local$proposer == null
        ? CopyWith$Query$Proposals$proposals$nodes$proposer.stub(
            _then(_instance),
          )
        : CopyWith$Query$Proposals$proposals$nodes$proposer(
            local$proposer,
            (e) => call(proposer: e),
          );
  }
}

class _CopyWithStubImpl$Query$Proposals$proposals$nodes<TRes>
    implements CopyWith$Query$Proposals$proposals$nodes<TRes> {
  _CopyWithStubImpl$Query$Proposals$proposals$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    Enum$ProposalType? type,
    Enum$ProposalStatus? status,
    String? category,
    DateTime? votingStartTime,
    DateTime? votingEndTime,
    int? totalVotes,
    int? votesYay,
    int? votesNay,
    int? votesAbstain,
    DateTime? createdAt,
    Query$Proposals$proposals$nodes$proposer? proposer,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Proposals$proposals$nodes$proposer<TRes> get proposer =>
      CopyWith$Query$Proposals$proposals$nodes$proposer.stub(_res);
}

class Query$Proposals$proposals$nodes$proposer {
  Query$Proposals$proposals$nodes$proposer({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.$__typename = 'Member',
  });

  factory Query$Proposals$proposals$nodes$proposer.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$$__typename = json['__typename'];
    return Query$Proposals$proposals$nodes$proposer(
      id: (l$id as String),
      firstName: (l$firstName as String),
      lastName: (l$lastName as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String firstName;

  final String lastName;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$firstName, l$lastName, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Proposals$proposals$nodes$proposer ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Proposals$proposals$nodes$proposer
    on Query$Proposals$proposals$nodes$proposer {
  CopyWith$Query$Proposals$proposals$nodes$proposer<
    Query$Proposals$proposals$nodes$proposer
  >
  get copyWith =>
      CopyWith$Query$Proposals$proposals$nodes$proposer(this, (i) => i);
}

abstract class CopyWith$Query$Proposals$proposals$nodes$proposer<TRes> {
  factory CopyWith$Query$Proposals$proposals$nodes$proposer(
    Query$Proposals$proposals$nodes$proposer instance,
    TRes Function(Query$Proposals$proposals$nodes$proposer) then,
  ) = _CopyWithImpl$Query$Proposals$proposals$nodes$proposer;

  factory CopyWith$Query$Proposals$proposals$nodes$proposer.stub(TRes res) =
      _CopyWithStubImpl$Query$Proposals$proposals$nodes$proposer;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Proposals$proposals$nodes$proposer<TRes>
    implements CopyWith$Query$Proposals$proposals$nodes$proposer<TRes> {
  _CopyWithImpl$Query$Proposals$proposals$nodes$proposer(
    this._instance,
    this._then,
  );

  final Query$Proposals$proposals$nodes$proposer _instance;

  final TRes Function(Query$Proposals$proposals$nodes$proposer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Proposals$proposals$nodes$proposer(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      firstName: firstName == _undefined || firstName == null
          ? _instance.firstName
          : (firstName as String),
      lastName: lastName == _undefined || lastName == null
          ? _instance.lastName
          : (lastName as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Proposals$proposals$nodes$proposer<TRes>
    implements CopyWith$Query$Proposals$proposals$nodes$proposer<TRes> {
  _CopyWithStubImpl$Query$Proposals$proposals$nodes$proposer(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? $__typename,
  }) => _res;
}

class Query$Proposals$proposals$pageInfo {
  Query$Proposals$proposals$pageInfo({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$Proposals$proposals$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$page = json['page'];
    final l$pageSize = json['pageSize'];
    final l$total = json['total'];
    final l$totalPages = json['totalPages'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPrevPage = json['hasPrevPage'];
    final l$$__typename = json['__typename'];
    return Query$Proposals$proposals$pageInfo(
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
    if (other is! Query$Proposals$proposals$pageInfo ||
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

extension UtilityExtension$Query$Proposals$proposals$pageInfo
    on Query$Proposals$proposals$pageInfo {
  CopyWith$Query$Proposals$proposals$pageInfo<
    Query$Proposals$proposals$pageInfo
  >
  get copyWith => CopyWith$Query$Proposals$proposals$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$Proposals$proposals$pageInfo<TRes> {
  factory CopyWith$Query$Proposals$proposals$pageInfo(
    Query$Proposals$proposals$pageInfo instance,
    TRes Function(Query$Proposals$proposals$pageInfo) then,
  ) = _CopyWithImpl$Query$Proposals$proposals$pageInfo;

  factory CopyWith$Query$Proposals$proposals$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$Proposals$proposals$pageInfo;

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

class _CopyWithImpl$Query$Proposals$proposals$pageInfo<TRes>
    implements CopyWith$Query$Proposals$proposals$pageInfo<TRes> {
  _CopyWithImpl$Query$Proposals$proposals$pageInfo(this._instance, this._then);

  final Query$Proposals$proposals$pageInfo _instance;

  final TRes Function(Query$Proposals$proposals$pageInfo) _then;

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
    Query$Proposals$proposals$pageInfo(
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

class _CopyWithStubImpl$Query$Proposals$proposals$pageInfo<TRes>
    implements CopyWith$Query$Proposals$proposals$pageInfo<TRes> {
  _CopyWithStubImpl$Query$Proposals$proposals$pageInfo(this._res);

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
