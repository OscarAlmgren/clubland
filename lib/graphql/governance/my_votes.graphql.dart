import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$MyVotes {
  factory Variables$Query$MyVotes({Input$PaginationInput? pagination}) =>
      Variables$Query$MyVotes._({
        if (pagination != null) r'pagination': pagination,
      });

  Variables$Query$MyVotes._(this._$data);

  factory Variables$Query$MyVotes.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('pagination')) {
      final l$pagination = data['pagination'];
      result$data['pagination'] = l$pagination == null
          ? null
          : Input$PaginationInput.fromJson(
              (l$pagination as Map<String, dynamic>),
            );
    }
    return Variables$Query$MyVotes._(result$data);
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

  CopyWith$Variables$Query$MyVotes<Variables$Query$MyVotes> get copyWith =>
      CopyWith$Variables$Query$MyVotes(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$MyVotes || runtimeType != other.runtimeType) {
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

abstract class CopyWith$Variables$Query$MyVotes<TRes> {
  factory CopyWith$Variables$Query$MyVotes(
    Variables$Query$MyVotes instance,
    TRes Function(Variables$Query$MyVotes) then,
  ) = _CopyWithImpl$Variables$Query$MyVotes;

  factory CopyWith$Variables$Query$MyVotes.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$MyVotes;

  TRes call({Input$PaginationInput? pagination});
}

class _CopyWithImpl$Variables$Query$MyVotes<TRes>
    implements CopyWith$Variables$Query$MyVotes<TRes> {
  _CopyWithImpl$Variables$Query$MyVotes(this._instance, this._then);

  final Variables$Query$MyVotes _instance;

  final TRes Function(Variables$Query$MyVotes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? pagination = _undefined}) => _then(
    Variables$Query$MyVotes._({
      ..._instance._$data,
      if (pagination != _undefined)
        'pagination': (pagination as Input$PaginationInput?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$MyVotes<TRes>
    implements CopyWith$Variables$Query$MyVotes<TRes> {
  _CopyWithStubImpl$Variables$Query$MyVotes(this._res);

  TRes _res;

  call({Input$PaginationInput? pagination}) => _res;
}

class Query$MyVotes {
  Query$MyVotes({required this.myVotes, this.$__typename = 'Query'});

  factory Query$MyVotes.fromJson(Map<String, dynamic> json) {
    final l$myVotes = json['myVotes'];
    final l$$__typename = json['__typename'];
    return Query$MyVotes(
      myVotes: Query$MyVotes$myVotes.fromJson(
        (l$myVotes as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MyVotes$myVotes myVotes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myVotes = myVotes;
    _resultData['myVotes'] = l$myVotes.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myVotes = myVotes;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myVotes, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyVotes || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myVotes = myVotes;
    final lOther$myVotes = other.myVotes;
    if (l$myVotes != lOther$myVotes) {
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

extension UtilityExtension$Query$MyVotes on Query$MyVotes {
  CopyWith$Query$MyVotes<Query$MyVotes> get copyWith =>
      CopyWith$Query$MyVotes(this, (i) => i);
}

abstract class CopyWith$Query$MyVotes<TRes> {
  factory CopyWith$Query$MyVotes(
    Query$MyVotes instance,
    TRes Function(Query$MyVotes) then,
  ) = _CopyWithImpl$Query$MyVotes;

  factory CopyWith$Query$MyVotes.stub(TRes res) =
      _CopyWithStubImpl$Query$MyVotes;

  TRes call({Query$MyVotes$myVotes? myVotes, String? $__typename});
  CopyWith$Query$MyVotes$myVotes<TRes> get myVotes;
}

class _CopyWithImpl$Query$MyVotes<TRes>
    implements CopyWith$Query$MyVotes<TRes> {
  _CopyWithImpl$Query$MyVotes(this._instance, this._then);

  final Query$MyVotes _instance;

  final TRes Function(Query$MyVotes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? myVotes = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$MyVotes(
          myVotes: myVotes == _undefined || myVotes == null
              ? _instance.myVotes
              : (myVotes as Query$MyVotes$myVotes),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$MyVotes$myVotes<TRes> get myVotes {
    final local$myVotes = _instance.myVotes;
    return CopyWith$Query$MyVotes$myVotes(
      local$myVotes,
      (e) => call(myVotes: e),
    );
  }
}

class _CopyWithStubImpl$Query$MyVotes<TRes>
    implements CopyWith$Query$MyVotes<TRes> {
  _CopyWithStubImpl$Query$MyVotes(this._res);

  TRes _res;

  call({Query$MyVotes$myVotes? myVotes, String? $__typename}) => _res;

  CopyWith$Query$MyVotes$myVotes<TRes> get myVotes =>
      CopyWith$Query$MyVotes$myVotes.stub(_res);
}

const documentNodeQueryMyVotes = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyVotes'),
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
            name: NameNode(value: 'myVotes'),
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
                        name: NameNode(value: 'proposalId'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'voteValue'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'weight'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'comments'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'isAnonymous'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'castAt'),
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
Query$MyVotes _parserFn$Query$MyVotes(Map<String, dynamic> data) =>
    Query$MyVotes.fromJson(data);
typedef OnQueryComplete$Query$MyVotes =
    FutureOr<void> Function(Map<String, dynamic>?, Query$MyVotes?);

class Options$Query$MyVotes extends graphql.QueryOptions<Query$MyVotes> {
  Options$Query$MyVotes({
    String? operationName,
    Variables$Query$MyVotes? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MyVotes? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$MyVotes? onComplete,
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
                 data == null ? null : _parserFn$Query$MyVotes(data),
               ),
         onError: onError,
         document: documentNodeQueryMyVotes,
         parserFn: _parserFn$Query$MyVotes,
       );

  final OnQueryComplete$Query$MyVotes? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$MyVotes
    extends graphql.WatchQueryOptions<Query$MyVotes> {
  WatchOptions$Query$MyVotes({
    String? operationName,
    Variables$Query$MyVotes? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MyVotes? typedOptimisticResult,
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
         document: documentNodeQueryMyVotes,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$MyVotes,
       );
}

class FetchMoreOptions$Query$MyVotes extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$MyVotes({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$MyVotes? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryMyVotes,
       );
}

extension ClientExtension$Query$MyVotes on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$MyVotes>> query$MyVotes([
    Options$Query$MyVotes? options,
  ]) async => await this.query(options ?? Options$Query$MyVotes());

  graphql.ObservableQuery<Query$MyVotes> watchQuery$MyVotes([
    WatchOptions$Query$MyVotes? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$MyVotes());

  void writeQuery$MyVotes({
    required Query$MyVotes data,
    Variables$Query$MyVotes? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryMyVotes),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$MyVotes? readQuery$MyVotes({
    Variables$Query$MyVotes? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMyVotes),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$MyVotes.fromJson(result);
  }
}

class Query$MyVotes$myVotes {
  Query$MyVotes$myVotes({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'VoteConnection',
  });

  factory Query$MyVotes$myVotes.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$MyVotes$myVotes(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$MyVotes$myVotes$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$MyVotes$myVotes$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MyVotes$myVotes$nodes> nodes;

  final Query$MyVotes$myVotes$pageInfo pageInfo;

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
    if (other is! Query$MyVotes$myVotes || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$MyVotes$myVotes on Query$MyVotes$myVotes {
  CopyWith$Query$MyVotes$myVotes<Query$MyVotes$myVotes> get copyWith =>
      CopyWith$Query$MyVotes$myVotes(this, (i) => i);
}

abstract class CopyWith$Query$MyVotes$myVotes<TRes> {
  factory CopyWith$Query$MyVotes$myVotes(
    Query$MyVotes$myVotes instance,
    TRes Function(Query$MyVotes$myVotes) then,
  ) = _CopyWithImpl$Query$MyVotes$myVotes;

  factory CopyWith$Query$MyVotes$myVotes.stub(TRes res) =
      _CopyWithStubImpl$Query$MyVotes$myVotes;

  TRes call({
    List<Query$MyVotes$myVotes$nodes>? nodes,
    Query$MyVotes$myVotes$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$MyVotes$myVotes$nodes> Function(
      Iterable<
        CopyWith$Query$MyVotes$myVotes$nodes<Query$MyVotes$myVotes$nodes>
      >,
    )
    _fn,
  );
  CopyWith$Query$MyVotes$myVotes$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$MyVotes$myVotes<TRes>
    implements CopyWith$Query$MyVotes$myVotes<TRes> {
  _CopyWithImpl$Query$MyVotes$myVotes(this._instance, this._then);

  final Query$MyVotes$myVotes _instance;

  final TRes Function(Query$MyVotes$myVotes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyVotes$myVotes(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$MyVotes$myVotes$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$MyVotes$myVotes$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$MyVotes$myVotes$nodes> Function(
      Iterable<
        CopyWith$Query$MyVotes$myVotes$nodes<Query$MyVotes$myVotes$nodes>
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$MyVotes$myVotes$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$MyVotes$myVotes$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$MyVotes$myVotes$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$MyVotes$myVotes<TRes>
    implements CopyWith$Query$MyVotes$myVotes<TRes> {
  _CopyWithStubImpl$Query$MyVotes$myVotes(this._res);

  TRes _res;

  call({
    List<Query$MyVotes$myVotes$nodes>? nodes,
    Query$MyVotes$myVotes$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$MyVotes$myVotes$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$MyVotes$myVotes$pageInfo.stub(_res);
}

class Query$MyVotes$myVotes$nodes {
  Query$MyVotes$myVotes$nodes({
    required this.id,
    required this.proposalId,
    required this.voteValue,
    required this.weight,
    this.comments,
    required this.isAnonymous,
    required this.castAt,
    required this.createdAt,
    this.$__typename = 'Vote',
  });

  factory Query$MyVotes$myVotes$nodes.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$proposalId = json['proposalId'];
    final l$voteValue = json['voteValue'];
    final l$weight = json['weight'];
    final l$comments = json['comments'];
    final l$isAnonymous = json['isAnonymous'];
    final l$castAt = json['castAt'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$MyVotes$myVotes$nodes(
      id: (l$id as String),
      proposalId: (l$proposalId as String),
      voteValue: fromJson$Enum$VoteChoice((l$voteValue as String)),
      weight: (l$weight as int),
      comments: (l$comments as String?),
      isAnonymous: (l$isAnonymous as bool),
      castAt: DateTime.parse((l$castAt as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String proposalId;

  final Enum$VoteChoice voteValue;

  final int weight;

  final String? comments;

  final bool isAnonymous;

  final DateTime castAt;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$proposalId = proposalId;
    _resultData['proposalId'] = l$proposalId;
    final l$voteValue = voteValue;
    _resultData['voteValue'] = toJson$Enum$VoteChoice(l$voteValue);
    final l$weight = weight;
    _resultData['weight'] = l$weight;
    final l$comments = comments;
    _resultData['comments'] = l$comments;
    final l$isAnonymous = isAnonymous;
    _resultData['isAnonymous'] = l$isAnonymous;
    final l$castAt = castAt;
    _resultData['castAt'] = l$castAt.toIso8601String();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$proposalId = proposalId;
    final l$voteValue = voteValue;
    final l$weight = weight;
    final l$comments = comments;
    final l$isAnonymous = isAnonymous;
    final l$castAt = castAt;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$proposalId,
      l$voteValue,
      l$weight,
      l$comments,
      l$isAnonymous,
      l$castAt,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyVotes$myVotes$nodes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$proposalId = proposalId;
    final lOther$proposalId = other.proposalId;
    if (l$proposalId != lOther$proposalId) {
      return false;
    }
    final l$voteValue = voteValue;
    final lOther$voteValue = other.voteValue;
    if (l$voteValue != lOther$voteValue) {
      return false;
    }
    final l$weight = weight;
    final lOther$weight = other.weight;
    if (l$weight != lOther$weight) {
      return false;
    }
    final l$comments = comments;
    final lOther$comments = other.comments;
    if (l$comments != lOther$comments) {
      return false;
    }
    final l$isAnonymous = isAnonymous;
    final lOther$isAnonymous = other.isAnonymous;
    if (l$isAnonymous != lOther$isAnonymous) {
      return false;
    }
    final l$castAt = castAt;
    final lOther$castAt = other.castAt;
    if (l$castAt != lOther$castAt) {
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

extension UtilityExtension$Query$MyVotes$myVotes$nodes
    on Query$MyVotes$myVotes$nodes {
  CopyWith$Query$MyVotes$myVotes$nodes<Query$MyVotes$myVotes$nodes>
  get copyWith => CopyWith$Query$MyVotes$myVotes$nodes(this, (i) => i);
}

abstract class CopyWith$Query$MyVotes$myVotes$nodes<TRes> {
  factory CopyWith$Query$MyVotes$myVotes$nodes(
    Query$MyVotes$myVotes$nodes instance,
    TRes Function(Query$MyVotes$myVotes$nodes) then,
  ) = _CopyWithImpl$Query$MyVotes$myVotes$nodes;

  factory CopyWith$Query$MyVotes$myVotes$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$MyVotes$myVotes$nodes;

  TRes call({
    String? id,
    String? proposalId,
    Enum$VoteChoice? voteValue,
    int? weight,
    String? comments,
    bool? isAnonymous,
    DateTime? castAt,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MyVotes$myVotes$nodes<TRes>
    implements CopyWith$Query$MyVotes$myVotes$nodes<TRes> {
  _CopyWithImpl$Query$MyVotes$myVotes$nodes(this._instance, this._then);

  final Query$MyVotes$myVotes$nodes _instance;

  final TRes Function(Query$MyVotes$myVotes$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? proposalId = _undefined,
    Object? voteValue = _undefined,
    Object? weight = _undefined,
    Object? comments = _undefined,
    Object? isAnonymous = _undefined,
    Object? castAt = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyVotes$myVotes$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      proposalId: proposalId == _undefined || proposalId == null
          ? _instance.proposalId
          : (proposalId as String),
      voteValue: voteValue == _undefined || voteValue == null
          ? _instance.voteValue
          : (voteValue as Enum$VoteChoice),
      weight: weight == _undefined || weight == null
          ? _instance.weight
          : (weight as int),
      comments: comments == _undefined
          ? _instance.comments
          : (comments as String?),
      isAnonymous: isAnonymous == _undefined || isAnonymous == null
          ? _instance.isAnonymous
          : (isAnonymous as bool),
      castAt: castAt == _undefined || castAt == null
          ? _instance.castAt
          : (castAt as DateTime),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$MyVotes$myVotes$nodes<TRes>
    implements CopyWith$Query$MyVotes$myVotes$nodes<TRes> {
  _CopyWithStubImpl$Query$MyVotes$myVotes$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? proposalId,
    Enum$VoteChoice? voteValue,
    int? weight,
    String? comments,
    bool? isAnonymous,
    DateTime? castAt,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}

class Query$MyVotes$myVotes$pageInfo {
  Query$MyVotes$myVotes$pageInfo({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$MyVotes$myVotes$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$pageSize = json['pageSize'];
    final l$total = json['total'];
    final l$totalPages = json['totalPages'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPrevPage = json['hasPrevPage'];
    final l$$__typename = json['__typename'];
    return Query$MyVotes$myVotes$pageInfo(
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
    if (other is! Query$MyVotes$myVotes$pageInfo ||
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

extension UtilityExtension$Query$MyVotes$myVotes$pageInfo
    on Query$MyVotes$myVotes$pageInfo {
  CopyWith$Query$MyVotes$myVotes$pageInfo<Query$MyVotes$myVotes$pageInfo>
  get copyWith => CopyWith$Query$MyVotes$myVotes$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$MyVotes$myVotes$pageInfo<TRes> {
  factory CopyWith$Query$MyVotes$myVotes$pageInfo(
    Query$MyVotes$myVotes$pageInfo instance,
    TRes Function(Query$MyVotes$myVotes$pageInfo) then,
  ) = _CopyWithImpl$Query$MyVotes$myVotes$pageInfo;

  factory CopyWith$Query$MyVotes$myVotes$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$MyVotes$myVotes$pageInfo;

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

class _CopyWithImpl$Query$MyVotes$myVotes$pageInfo<TRes>
    implements CopyWith$Query$MyVotes$myVotes$pageInfo<TRes> {
  _CopyWithImpl$Query$MyVotes$myVotes$pageInfo(this._instance, this._then);

  final Query$MyVotes$myVotes$pageInfo _instance;

  final TRes Function(Query$MyVotes$myVotes$pageInfo) _then;

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
    Query$MyVotes$myVotes$pageInfo(
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

class _CopyWithStubImpl$Query$MyVotes$myVotes$pageInfo<TRes>
    implements CopyWith$Query$MyVotes$myVotes$pageInfo<TRes> {
  _CopyWithStubImpl$Query$MyVotes$myVotes$pageInfo(this._res);

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
