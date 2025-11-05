import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$ClubReviews {
  factory Variables$Query$ClubReviews({
    required String clubId,
    Input$PaginationInput? pagination,
  }) => Variables$Query$ClubReviews._({
    r'clubId': clubId,
    if (pagination != null) r'pagination': pagination,
  });

  Variables$Query$ClubReviews._(this._$data);

  factory Variables$Query$ClubReviews.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$clubId = data['clubId'];
    result$data['clubId'] = (l$clubId as String);
    if (data.containsKey('pagination')) {
      final l$pagination = data['pagination'];
      result$data['pagination'] = l$pagination == null
          ? null
          : Input$PaginationInput.fromJson(
              (l$pagination as Map<String, dynamic>),
            );
    }
    return Variables$Query$ClubReviews._(result$data);
  }

  Map<String, dynamic> _$data;

  String get clubId => (_$data['clubId'] as String);

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$clubId = clubId;
    result$data['clubId'] = l$clubId;
    if (_$data.containsKey('pagination')) {
      final l$pagination = pagination;
      result$data['pagination'] = l$pagination?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$ClubReviews<Variables$Query$ClubReviews>
  get copyWith => CopyWith$Variables$Query$ClubReviews(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$ClubReviews ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$clubId = clubId;
    final lOther$clubId = other.clubId;
    if (l$clubId != lOther$clubId) {
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
    final l$clubId = clubId;
    final l$pagination = pagination;
    return Object.hashAll([
      l$clubId,
      _$data.containsKey('pagination') ? l$pagination : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$ClubReviews<TRes> {
  factory CopyWith$Variables$Query$ClubReviews(
    Variables$Query$ClubReviews instance,
    TRes Function(Variables$Query$ClubReviews) then,
  ) = _CopyWithImpl$Variables$Query$ClubReviews;

  factory CopyWith$Variables$Query$ClubReviews.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ClubReviews;

  TRes call({String? clubId, Input$PaginationInput? pagination});
}

class _CopyWithImpl$Variables$Query$ClubReviews<TRes>
    implements CopyWith$Variables$Query$ClubReviews<TRes> {
  _CopyWithImpl$Variables$Query$ClubReviews(this._instance, this._then);

  final Variables$Query$ClubReviews _instance;

  final TRes Function(Variables$Query$ClubReviews) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? clubId = _undefined, Object? pagination = _undefined}) =>
      _then(
        Variables$Query$ClubReviews._({
          ..._instance._$data,
          if (clubId != _undefined && clubId != null)
            'clubId': (clubId as String),
          if (pagination != _undefined)
            'pagination': (pagination as Input$PaginationInput?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$ClubReviews<TRes>
    implements CopyWith$Variables$Query$ClubReviews<TRes> {
  _CopyWithStubImpl$Variables$Query$ClubReviews(this._res);

  TRes _res;

  call({String? clubId, Input$PaginationInput? pagination}) => _res;
}

class Query$ClubReviews {
  Query$ClubReviews({required this.clubReviews, this.$__typename = 'Query'});

  factory Query$ClubReviews.fromJson(Map<String, dynamic> json) {
    final l$clubReviews = json['clubReviews'];
    final l$$__typename = json['__typename'];
    return Query$ClubReviews(
      clubReviews: Query$ClubReviews$clubReviews.fromJson(
        (l$clubReviews as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ClubReviews$clubReviews clubReviews;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$clubReviews = clubReviews;
    _resultData['clubReviews'] = l$clubReviews.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$clubReviews = clubReviews;
    final l$$__typename = $__typename;
    return Object.hashAll([l$clubReviews, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ClubReviews || runtimeType != other.runtimeType) {
      return false;
    }
    final l$clubReviews = clubReviews;
    final lOther$clubReviews = other.clubReviews;
    if (l$clubReviews != lOther$clubReviews) {
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

extension UtilityExtension$Query$ClubReviews on Query$ClubReviews {
  CopyWith$Query$ClubReviews<Query$ClubReviews> get copyWith =>
      CopyWith$Query$ClubReviews(this, (i) => i);
}

abstract class CopyWith$Query$ClubReviews<TRes> {
  factory CopyWith$Query$ClubReviews(
    Query$ClubReviews instance,
    TRes Function(Query$ClubReviews) then,
  ) = _CopyWithImpl$Query$ClubReviews;

  factory CopyWith$Query$ClubReviews.stub(TRes res) =
      _CopyWithStubImpl$Query$ClubReviews;

  TRes call({Query$ClubReviews$clubReviews? clubReviews, String? $__typename});
  CopyWith$Query$ClubReviews$clubReviews<TRes> get clubReviews;
}

class _CopyWithImpl$Query$ClubReviews<TRes>
    implements CopyWith$Query$ClubReviews<TRes> {
  _CopyWithImpl$Query$ClubReviews(this._instance, this._then);

  final Query$ClubReviews _instance;

  final TRes Function(Query$ClubReviews) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? clubReviews = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ClubReviews(
      clubReviews: clubReviews == _undefined || clubReviews == null
          ? _instance.clubReviews
          : (clubReviews as Query$ClubReviews$clubReviews),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$ClubReviews$clubReviews<TRes> get clubReviews {
    final local$clubReviews = _instance.clubReviews;
    return CopyWith$Query$ClubReviews$clubReviews(
      local$clubReviews,
      (e) => call(clubReviews: e),
    );
  }
}

class _CopyWithStubImpl$Query$ClubReviews<TRes>
    implements CopyWith$Query$ClubReviews<TRes> {
  _CopyWithStubImpl$Query$ClubReviews(this._res);

  TRes _res;

  call({Query$ClubReviews$clubReviews? clubReviews, String? $__typename}) =>
      _res;

  CopyWith$Query$ClubReviews$clubReviews<TRes> get clubReviews =>
      CopyWith$Query$ClubReviews$clubReviews.stub(_res);
}

const documentNodeQueryClubReviews = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ClubReviews'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'clubId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
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
            name: NameNode(value: 'clubReviews'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'clubId'),
                value: VariableNode(name: NameNode(value: 'clubId')),
              ),
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
                        name: NameNode(value: 'rating'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'comment'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'author'),
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
                        name: NameNode(value: 'hasNextPage'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'totalCount'),
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
Query$ClubReviews _parserFn$Query$ClubReviews(Map<String, dynamic> data) =>
    Query$ClubReviews.fromJson(data);
typedef OnQueryComplete$Query$ClubReviews =
    FutureOr<void> Function(Map<String, dynamic>?, Query$ClubReviews?);

class Options$Query$ClubReviews
    extends graphql.QueryOptions<Query$ClubReviews> {
  Options$Query$ClubReviews({
    String? operationName,
    required Variables$Query$ClubReviews variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ClubReviews? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ClubReviews? onComplete,
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
                 data == null ? null : _parserFn$Query$ClubReviews(data),
               ),
         onError: onError,
         document: documentNodeQueryClubReviews,
         parserFn: _parserFn$Query$ClubReviews,
       );

  final OnQueryComplete$Query$ClubReviews? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$ClubReviews
    extends graphql.WatchQueryOptions<Query$ClubReviews> {
  WatchOptions$Query$ClubReviews({
    String? operationName,
    required Variables$Query$ClubReviews variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ClubReviews? typedOptimisticResult,
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
         document: documentNodeQueryClubReviews,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$ClubReviews,
       );
}

class FetchMoreOptions$Query$ClubReviews extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ClubReviews({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$ClubReviews variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryClubReviews,
       );
}

extension ClientExtension$Query$ClubReviews on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ClubReviews>> query$ClubReviews(
    Options$Query$ClubReviews options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$ClubReviews> watchQuery$ClubReviews(
    WatchOptions$Query$ClubReviews options,
  ) => this.watchQuery(options);

  void writeQuery$ClubReviews({
    required Query$ClubReviews data,
    required Variables$Query$ClubReviews variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryClubReviews),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$ClubReviews? readQuery$ClubReviews({
    required Variables$Query$ClubReviews variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryClubReviews),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ClubReviews.fromJson(result);
  }
}

class Query$ClubReviews$clubReviews {
  Query$ClubReviews$clubReviews({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'ReviewConnection',
  });

  factory Query$ClubReviews$clubReviews.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$ClubReviews$clubReviews(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$ClubReviews$clubReviews$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$ClubReviews$clubReviews$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$ClubReviews$clubReviews$nodes> nodes;

  final Query$ClubReviews$clubReviews$pageInfo pageInfo;

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
    if (other is! Query$ClubReviews$clubReviews ||
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

extension UtilityExtension$Query$ClubReviews$clubReviews
    on Query$ClubReviews$clubReviews {
  CopyWith$Query$ClubReviews$clubReviews<Query$ClubReviews$clubReviews>
  get copyWith => CopyWith$Query$ClubReviews$clubReviews(this, (i) => i);
}

abstract class CopyWith$Query$ClubReviews$clubReviews<TRes> {
  factory CopyWith$Query$ClubReviews$clubReviews(
    Query$ClubReviews$clubReviews instance,
    TRes Function(Query$ClubReviews$clubReviews) then,
  ) = _CopyWithImpl$Query$ClubReviews$clubReviews;

  factory CopyWith$Query$ClubReviews$clubReviews.stub(TRes res) =
      _CopyWithStubImpl$Query$ClubReviews$clubReviews;

  TRes call({
    List<Query$ClubReviews$clubReviews$nodes>? nodes,
    Query$ClubReviews$clubReviews$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$ClubReviews$clubReviews$nodes> Function(
      Iterable<
        CopyWith$Query$ClubReviews$clubReviews$nodes<
          Query$ClubReviews$clubReviews$nodes
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$ClubReviews$clubReviews$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$ClubReviews$clubReviews<TRes>
    implements CopyWith$Query$ClubReviews$clubReviews<TRes> {
  _CopyWithImpl$Query$ClubReviews$clubReviews(this._instance, this._then);

  final Query$ClubReviews$clubReviews _instance;

  final TRes Function(Query$ClubReviews$clubReviews) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ClubReviews$clubReviews(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$ClubReviews$clubReviews$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$ClubReviews$clubReviews$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$ClubReviews$clubReviews$nodes> Function(
      Iterable<
        CopyWith$Query$ClubReviews$clubReviews$nodes<
          Query$ClubReviews$clubReviews$nodes
        >
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$ClubReviews$clubReviews$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$ClubReviews$clubReviews$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$ClubReviews$clubReviews$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$ClubReviews$clubReviews<TRes>
    implements CopyWith$Query$ClubReviews$clubReviews<TRes> {
  _CopyWithStubImpl$Query$ClubReviews$clubReviews(this._res);

  TRes _res;

  call({
    List<Query$ClubReviews$clubReviews$nodes>? nodes,
    Query$ClubReviews$clubReviews$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$ClubReviews$clubReviews$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$ClubReviews$clubReviews$pageInfo.stub(_res);
}

class Query$ClubReviews$clubReviews$nodes {
  Query$ClubReviews$clubReviews$nodes({
    required this.id,
    required this.rating,
    this.comment,
    this.author,
    required this.createdAt,
    this.$__typename = 'Review',
  });

  factory Query$ClubReviews$clubReviews$nodes.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$rating = json['rating'];
    final l$comment = json['comment'];
    final l$author = json['author'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$ClubReviews$clubReviews$nodes(
      id: (l$id as String),
      rating: (l$rating as num).toDouble(),
      comment: (l$comment as String?),
      author: (l$author as String?),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final double rating;

  final String? comment;

  final String? author;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$rating = rating;
    _resultData['rating'] = l$rating;
    final l$comment = comment;
    _resultData['comment'] = l$comment;
    final l$author = author;
    _resultData['author'] = l$author;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$rating = rating;
    final l$comment = comment;
    final l$author = author;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$rating,
      l$comment,
      l$author,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ClubReviews$clubReviews$nodes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$rating = rating;
    final lOther$rating = other.rating;
    if (l$rating != lOther$rating) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (l$comment != lOther$comment) {
      return false;
    }
    final l$author = author;
    final lOther$author = other.author;
    if (l$author != lOther$author) {
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

extension UtilityExtension$Query$ClubReviews$clubReviews$nodes
    on Query$ClubReviews$clubReviews$nodes {
  CopyWith$Query$ClubReviews$clubReviews$nodes<
    Query$ClubReviews$clubReviews$nodes
  >
  get copyWith => CopyWith$Query$ClubReviews$clubReviews$nodes(this, (i) => i);
}

abstract class CopyWith$Query$ClubReviews$clubReviews$nodes<TRes> {
  factory CopyWith$Query$ClubReviews$clubReviews$nodes(
    Query$ClubReviews$clubReviews$nodes instance,
    TRes Function(Query$ClubReviews$clubReviews$nodes) then,
  ) = _CopyWithImpl$Query$ClubReviews$clubReviews$nodes;

  factory CopyWith$Query$ClubReviews$clubReviews$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$ClubReviews$clubReviews$nodes;

  TRes call({
    String? id,
    double? rating,
    String? comment,
    String? author,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ClubReviews$clubReviews$nodes<TRes>
    implements CopyWith$Query$ClubReviews$clubReviews$nodes<TRes> {
  _CopyWithImpl$Query$ClubReviews$clubReviews$nodes(this._instance, this._then);

  final Query$ClubReviews$clubReviews$nodes _instance;

  final TRes Function(Query$ClubReviews$clubReviews$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? rating = _undefined,
    Object? comment = _undefined,
    Object? author = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ClubReviews$clubReviews$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      rating: rating == _undefined || rating == null
          ? _instance.rating
          : (rating as double),
      comment: comment == _undefined ? _instance.comment : (comment as String?),
      author: author == _undefined ? _instance.author : (author as String?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$ClubReviews$clubReviews$nodes<TRes>
    implements CopyWith$Query$ClubReviews$clubReviews$nodes<TRes> {
  _CopyWithStubImpl$Query$ClubReviews$clubReviews$nodes(this._res);

  TRes _res;

  call({
    String? id,
    double? rating,
    String? comment,
    String? author,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}

class Query$ClubReviews$clubReviews$pageInfo {
  Query$ClubReviews$clubReviews$pageInfo({
    required this.hasNextPage,
    this.totalCount,
    this.$__typename = 'PageInfo',
  });

  factory Query$ClubReviews$clubReviews$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$hasNextPage = json['hasNextPage'];
    final l$totalCount = json['totalCount'];
    final l$$__typename = json['__typename'];
    return Query$ClubReviews$clubReviews$pageInfo(
      hasNextPage: (l$hasNextPage as bool),
      totalCount: (l$totalCount as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final int? totalCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$totalCount = totalCount;
    final l$$__typename = $__typename;
    return Object.hashAll([l$hasNextPage, l$totalCount, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ClubReviews$clubReviews$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$totalCount = totalCount;
    final lOther$totalCount = other.totalCount;
    if (l$totalCount != lOther$totalCount) {
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

extension UtilityExtension$Query$ClubReviews$clubReviews$pageInfo
    on Query$ClubReviews$clubReviews$pageInfo {
  CopyWith$Query$ClubReviews$clubReviews$pageInfo<
    Query$ClubReviews$clubReviews$pageInfo
  >
  get copyWith =>
      CopyWith$Query$ClubReviews$clubReviews$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$ClubReviews$clubReviews$pageInfo<TRes> {
  factory CopyWith$Query$ClubReviews$clubReviews$pageInfo(
    Query$ClubReviews$clubReviews$pageInfo instance,
    TRes Function(Query$ClubReviews$clubReviews$pageInfo) then,
  ) = _CopyWithImpl$Query$ClubReviews$clubReviews$pageInfo;

  factory CopyWith$Query$ClubReviews$clubReviews$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$ClubReviews$clubReviews$pageInfo;

  TRes call({bool? hasNextPage, int? totalCount, String? $__typename});
}

class _CopyWithImpl$Query$ClubReviews$clubReviews$pageInfo<TRes>
    implements CopyWith$Query$ClubReviews$clubReviews$pageInfo<TRes> {
  _CopyWithImpl$Query$ClubReviews$clubReviews$pageInfo(
    this._instance,
    this._then,
  );

  final Query$ClubReviews$clubReviews$pageInfo _instance;

  final TRes Function(Query$ClubReviews$clubReviews$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? totalCount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ClubReviews$clubReviews$pageInfo(
      hasNextPage: hasNextPage == _undefined || hasNextPage == null
          ? _instance.hasNextPage
          : (hasNextPage as bool),
      totalCount: totalCount == _undefined
          ? _instance.totalCount
          : (totalCount as int?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$ClubReviews$clubReviews$pageInfo<TRes>
    implements CopyWith$Query$ClubReviews$clubReviews$pageInfo<TRes> {
  _CopyWithStubImpl$Query$ClubReviews$clubReviews$pageInfo(this._res);

  TRes _res;

  call({bool? hasNextPage, int? totalCount, String? $__typename}) => _res;
}
