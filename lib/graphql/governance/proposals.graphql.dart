import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Proposals {
  factory Variables$Query$Proposals({
    Input$PaginationInput? pagination,
    Enum$ProposalStatus? status,
  }) => Variables$Query$Proposals._({
    if (pagination != null) r'pagination': pagination,
    if (status != null) r'status': status,
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
    return Variables$Query$Proposals._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Enum$ProposalStatus? get status => (_$data['status'] as Enum$ProposalStatus?);

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

abstract class CopyWith$Variables$Query$Proposals<TRes> {
  factory CopyWith$Variables$Query$Proposals(
    Variables$Query$Proposals instance,
    TRes Function(Variables$Query$Proposals) then,
  ) = _CopyWithImpl$Variables$Query$Proposals;

  factory CopyWith$Variables$Query$Proposals.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Proposals;

  TRes call({Input$PaginationInput? pagination, Enum$ProposalStatus? status});
}

class _CopyWithImpl$Variables$Query$Proposals<TRes>
    implements CopyWith$Variables$Query$Proposals<TRes> {
  _CopyWithImpl$Variables$Query$Proposals(this._instance, this._then);

  final Variables$Query$Proposals _instance;

  final TRes Function(Variables$Query$Proposals) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? pagination = _undefined, Object? status = _undefined}) =>
      _then(
        Variables$Query$Proposals._({
          ..._instance._$data,
          if (pagination != _undefined)
            'pagination': (pagination as Input$PaginationInput?),
          if (status != _undefined) 'status': (status as Enum$ProposalStatus?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$Proposals<TRes>
    implements CopyWith$Variables$Query$Proposals<TRes> {
  _CopyWithStubImpl$Variables$Query$Proposals(this._res);

  TRes _res;

  call({Input$PaginationInput? pagination, Enum$ProposalStatus? status}) =>
      _res;
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
                        name: NameNode(value: 'proposer'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'username'),
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
                        name: NameNode(value: 'votes'),
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
                              name: NameNode(value: 'choice'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'voter'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(
                                selections: [
                                  FieldNode(
                                    name: NameNode(value: 'username'),
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
                        name: NameNode(value: 'votingDeadline'),
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
                        name: NameNode(value: 'total'),
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
    required this.proposer,
    required this.votes,
    required this.votingDeadline,
    required this.createdAt,
    this.$__typename = 'Proposal',
  });

  factory Query$Proposals$proposals$nodes.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$type = json['type'];
    final l$status = json['status'];
    final l$proposer = json['proposer'];
    final l$votes = json['votes'];
    final l$votingDeadline = json['votingDeadline'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$Proposals$proposals$nodes(
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String),
      type: fromJson$Enum$ProposalType((l$type as String)),
      status: fromJson$Enum$ProposalStatus((l$status as String)),
      proposer: Query$Proposals$proposals$nodes$proposer.fromJson(
        (l$proposer as Map<String, dynamic>),
      ),
      votes: (l$votes as List<dynamic>)
          .map(
            (e) => Query$Proposals$proposals$nodes$votes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      votingDeadline: DateTime.parse((l$votingDeadline as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String description;

  final Enum$ProposalType type;

  final Enum$ProposalStatus status;

  final Query$Proposals$proposals$nodes$proposer proposer;

  final List<Query$Proposals$proposals$nodes$votes> votes;

  final DateTime votingDeadline;

  final DateTime createdAt;

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
    final l$proposer = proposer;
    _resultData['proposer'] = l$proposer.toJson();
    final l$votes = votes;
    _resultData['votes'] = l$votes.map((e) => e.toJson()).toList();
    final l$votingDeadline = votingDeadline;
    _resultData['votingDeadline'] = l$votingDeadline.toIso8601String();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
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
    final l$proposer = proposer;
    final l$votes = votes;
    final l$votingDeadline = votingDeadline;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$type,
      l$status,
      l$proposer,
      Object.hashAll(l$votes.map((v) => v)),
      l$votingDeadline,
      l$createdAt,
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
    final l$proposer = proposer;
    final lOther$proposer = other.proposer;
    if (l$proposer != lOther$proposer) {
      return false;
    }
    final l$votes = votes;
    final lOther$votes = other.votes;
    if (l$votes.length != lOther$votes.length) {
      return false;
    }
    for (int i = 0; i < l$votes.length; i++) {
      final l$votes$entry = l$votes[i];
      final lOther$votes$entry = lOther$votes[i];
      if (l$votes$entry != lOther$votes$entry) {
        return false;
      }
    }
    final l$votingDeadline = votingDeadline;
    final lOther$votingDeadline = other.votingDeadline;
    if (l$votingDeadline != lOther$votingDeadline) {
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
    Query$Proposals$proposals$nodes$proposer? proposer,
    List<Query$Proposals$proposals$nodes$votes>? votes,
    DateTime? votingDeadline,
    DateTime? createdAt,
    String? $__typename,
  });
  CopyWith$Query$Proposals$proposals$nodes$proposer<TRes> get proposer;
  TRes votes(
    Iterable<Query$Proposals$proposals$nodes$votes> Function(
      Iterable<
        CopyWith$Query$Proposals$proposals$nodes$votes<
          Query$Proposals$proposals$nodes$votes
        >
      >,
    )
    _fn,
  );
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
    Object? proposer = _undefined,
    Object? votes = _undefined,
    Object? votingDeadline = _undefined,
    Object? createdAt = _undefined,
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
      proposer: proposer == _undefined || proposer == null
          ? _instance.proposer
          : (proposer as Query$Proposals$proposals$nodes$proposer),
      votes: votes == _undefined || votes == null
          ? _instance.votes
          : (votes as List<Query$Proposals$proposals$nodes$votes>),
      votingDeadline: votingDeadline == _undefined || votingDeadline == null
          ? _instance.votingDeadline
          : (votingDeadline as DateTime),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Proposals$proposals$nodes$proposer<TRes> get proposer {
    final local$proposer = _instance.proposer;
    return CopyWith$Query$Proposals$proposals$nodes$proposer(
      local$proposer,
      (e) => call(proposer: e),
    );
  }

  TRes votes(
    Iterable<Query$Proposals$proposals$nodes$votes> Function(
      Iterable<
        CopyWith$Query$Proposals$proposals$nodes$votes<
          Query$Proposals$proposals$nodes$votes
        >
      >,
    )
    _fn,
  ) => call(
    votes: _fn(
      _instance.votes.map(
        (e) => CopyWith$Query$Proposals$proposals$nodes$votes(e, (i) => i),
      ),
    ).toList(),
  );
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
    Query$Proposals$proposals$nodes$proposer? proposer,
    List<Query$Proposals$proposals$nodes$votes>? votes,
    DateTime? votingDeadline,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Proposals$proposals$nodes$proposer<TRes> get proposer =>
      CopyWith$Query$Proposals$proposals$nodes$proposer.stub(_res);

  votes(_fn) => _res;
}

class Query$Proposals$proposals$nodes$proposer {
  Query$Proposals$proposals$nodes$proposer({
    required this.username,
    this.firstName,
    this.lastName,
    this.$__typename = 'User',
  });

  factory Query$Proposals$proposals$nodes$proposer.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$username = json['username'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$$__typename = json['__typename'];
    return Query$Proposals$proposals$nodes$proposer(
      username: (l$username as String),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String username;

  final String? firstName;

  final String? lastName;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$username = username;
    _resultData['username'] = l$username;
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
    final l$username = username;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$$__typename = $__typename;
    return Object.hashAll([l$username, l$firstName, l$lastName, l$$__typename]);
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
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
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
    String? username,
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
    Object? username = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Proposals$proposals$nodes$proposer(
      username: username == _undefined || username == null
          ? _instance.username
          : (username as String),
      firstName: firstName == _undefined
          ? _instance.firstName
          : (firstName as String?),
      lastName: lastName == _undefined
          ? _instance.lastName
          : (lastName as String?),
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
    String? username,
    String? firstName,
    String? lastName,
    String? $__typename,
  }) => _res;
}

class Query$Proposals$proposals$nodes$votes {
  Query$Proposals$proposals$nodes$votes({
    required this.id,
    required this.choice,
    required this.voter,
    this.$__typename = 'Vote',
  });

  factory Query$Proposals$proposals$nodes$votes.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$choice = json['choice'];
    final l$voter = json['voter'];
    final l$$__typename = json['__typename'];
    return Query$Proposals$proposals$nodes$votes(
      id: (l$id as String),
      choice: fromJson$Enum$VoteChoice((l$choice as String)),
      voter: Query$Proposals$proposals$nodes$votes$voter.fromJson(
        (l$voter as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$VoteChoice choice;

  final Query$Proposals$proposals$nodes$votes$voter voter;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$choice = choice;
    _resultData['choice'] = toJson$Enum$VoteChoice(l$choice);
    final l$voter = voter;
    _resultData['voter'] = l$voter.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$choice = choice;
    final l$voter = voter;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$choice, l$voter, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Proposals$proposals$nodes$votes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$choice = choice;
    final lOther$choice = other.choice;
    if (l$choice != lOther$choice) {
      return false;
    }
    final l$voter = voter;
    final lOther$voter = other.voter;
    if (l$voter != lOther$voter) {
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

extension UtilityExtension$Query$Proposals$proposals$nodes$votes
    on Query$Proposals$proposals$nodes$votes {
  CopyWith$Query$Proposals$proposals$nodes$votes<
    Query$Proposals$proposals$nodes$votes
  >
  get copyWith =>
      CopyWith$Query$Proposals$proposals$nodes$votes(this, (i) => i);
}

abstract class CopyWith$Query$Proposals$proposals$nodes$votes<TRes> {
  factory CopyWith$Query$Proposals$proposals$nodes$votes(
    Query$Proposals$proposals$nodes$votes instance,
    TRes Function(Query$Proposals$proposals$nodes$votes) then,
  ) = _CopyWithImpl$Query$Proposals$proposals$nodes$votes;

  factory CopyWith$Query$Proposals$proposals$nodes$votes.stub(TRes res) =
      _CopyWithStubImpl$Query$Proposals$proposals$nodes$votes;

  TRes call({
    String? id,
    Enum$VoteChoice? choice,
    Query$Proposals$proposals$nodes$votes$voter? voter,
    String? $__typename,
  });
  CopyWith$Query$Proposals$proposals$nodes$votes$voter<TRes> get voter;
}

class _CopyWithImpl$Query$Proposals$proposals$nodes$votes<TRes>
    implements CopyWith$Query$Proposals$proposals$nodes$votes<TRes> {
  _CopyWithImpl$Query$Proposals$proposals$nodes$votes(
    this._instance,
    this._then,
  );

  final Query$Proposals$proposals$nodes$votes _instance;

  final TRes Function(Query$Proposals$proposals$nodes$votes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? choice = _undefined,
    Object? voter = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Proposals$proposals$nodes$votes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      choice: choice == _undefined || choice == null
          ? _instance.choice
          : (choice as Enum$VoteChoice),
      voter: voter == _undefined || voter == null
          ? _instance.voter
          : (voter as Query$Proposals$proposals$nodes$votes$voter),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Proposals$proposals$nodes$votes$voter<TRes> get voter {
    final local$voter = _instance.voter;
    return CopyWith$Query$Proposals$proposals$nodes$votes$voter(
      local$voter,
      (e) => call(voter: e),
    );
  }
}

class _CopyWithStubImpl$Query$Proposals$proposals$nodes$votes<TRes>
    implements CopyWith$Query$Proposals$proposals$nodes$votes<TRes> {
  _CopyWithStubImpl$Query$Proposals$proposals$nodes$votes(this._res);

  TRes _res;

  call({
    String? id,
    Enum$VoteChoice? choice,
    Query$Proposals$proposals$nodes$votes$voter? voter,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Proposals$proposals$nodes$votes$voter<TRes> get voter =>
      CopyWith$Query$Proposals$proposals$nodes$votes$voter.stub(_res);
}

class Query$Proposals$proposals$nodes$votes$voter {
  Query$Proposals$proposals$nodes$votes$voter({
    required this.username,
    this.$__typename = 'User',
  });

  factory Query$Proposals$proposals$nodes$votes$voter.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$username = json['username'];
    final l$$__typename = json['__typename'];
    return Query$Proposals$proposals$nodes$votes$voter(
      username: (l$username as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String username;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$username = username;
    _resultData['username'] = l$username;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$username = username;
    final l$$__typename = $__typename;
    return Object.hashAll([l$username, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Proposals$proposals$nodes$votes$voter ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
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

extension UtilityExtension$Query$Proposals$proposals$nodes$votes$voter
    on Query$Proposals$proposals$nodes$votes$voter {
  CopyWith$Query$Proposals$proposals$nodes$votes$voter<
    Query$Proposals$proposals$nodes$votes$voter
  >
  get copyWith =>
      CopyWith$Query$Proposals$proposals$nodes$votes$voter(this, (i) => i);
}

abstract class CopyWith$Query$Proposals$proposals$nodes$votes$voter<TRes> {
  factory CopyWith$Query$Proposals$proposals$nodes$votes$voter(
    Query$Proposals$proposals$nodes$votes$voter instance,
    TRes Function(Query$Proposals$proposals$nodes$votes$voter) then,
  ) = _CopyWithImpl$Query$Proposals$proposals$nodes$votes$voter;

  factory CopyWith$Query$Proposals$proposals$nodes$votes$voter.stub(TRes res) =
      _CopyWithStubImpl$Query$Proposals$proposals$nodes$votes$voter;

  TRes call({String? username, String? $__typename});
}

class _CopyWithImpl$Query$Proposals$proposals$nodes$votes$voter<TRes>
    implements CopyWith$Query$Proposals$proposals$nodes$votes$voter<TRes> {
  _CopyWithImpl$Query$Proposals$proposals$nodes$votes$voter(
    this._instance,
    this._then,
  );

  final Query$Proposals$proposals$nodes$votes$voter _instance;

  final TRes Function(Query$Proposals$proposals$nodes$votes$voter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? username = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Proposals$proposals$nodes$votes$voter(
      username: username == _undefined || username == null
          ? _instance.username
          : (username as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Proposals$proposals$nodes$votes$voter<TRes>
    implements CopyWith$Query$Proposals$proposals$nodes$votes$voter<TRes> {
  _CopyWithStubImpl$Query$Proposals$proposals$nodes$votes$voter(this._res);

  TRes _res;

  call({String? username, String? $__typename}) => _res;
}

class Query$Proposals$proposals$pageInfo {
  Query$Proposals$proposals$pageInfo({
    required this.page,
    required this.total,
    this.$__typename = 'PageInfo',
  });

  factory Query$Proposals$proposals$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$page = json['page'];
    final l$total = json['total'];
    final l$$__typename = json['__typename'];
    return Query$Proposals$proposals$pageInfo(
      page: (l$page as int),
      total: (l$total as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int page;

  final int total;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$page = page;
    _resultData['page'] = l$page;
    final l$total = total;
    _resultData['total'] = l$total;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$total = total;
    final l$$__typename = $__typename;
    return Object.hashAll([l$page, l$total, l$$__typename]);
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
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
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

  TRes call({int? page, int? total, String? $__typename});
}

class _CopyWithImpl$Query$Proposals$proposals$pageInfo<TRes>
    implements CopyWith$Query$Proposals$proposals$pageInfo<TRes> {
  _CopyWithImpl$Query$Proposals$proposals$pageInfo(this._instance, this._then);

  final Query$Proposals$proposals$pageInfo _instance;

  final TRes Function(Query$Proposals$proposals$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? page = _undefined,
    Object? total = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Proposals$proposals$pageInfo(
      page: page == _undefined || page == null ? _instance.page : (page as int),
      total: total == _undefined || total == null
          ? _instance.total
          : (total as int),
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

  call({int? page, int? total, String? $__typename}) => _res;
}
