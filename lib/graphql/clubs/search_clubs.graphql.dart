import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$SearchClubs {
  factory Variables$Query$SearchClubs({
    required String query,
    Input$LocationInput? location,
    double? radius,
    List<String>? amenities,
    Input$PaginationInput? pagination,
  }) => Variables$Query$SearchClubs._({
    r'query': query,
    if (location != null) r'location': location,
    if (radius != null) r'radius': radius,
    if (amenities != null) r'amenities': amenities,
    if (pagination != null) r'pagination': pagination,
  });

  Variables$Query$SearchClubs._(this._$data);

  factory Variables$Query$SearchClubs.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$query = data['query'];
    result$data['query'] = (l$query as String);
    if (data.containsKey('location')) {
      final l$location = data['location'];
      result$data['location'] = l$location == null
          ? null
          : Input$LocationInput.fromJson((l$location as Map<String, dynamic>));
    }
    if (data.containsKey('radius')) {
      final l$radius = data['radius'];
      result$data['radius'] = (l$radius as num?)?.toDouble();
    }
    if (data.containsKey('amenities')) {
      final l$amenities = data['amenities'];
      result$data['amenities'] = (l$amenities as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('pagination')) {
      final l$pagination = data['pagination'];
      result$data['pagination'] = l$pagination == null
          ? null
          : Input$PaginationInput.fromJson(
              (l$pagination as Map<String, dynamic>),
            );
    }
    return Variables$Query$SearchClubs._(result$data);
  }

  Map<String, dynamic> _$data;

  String get query => (_$data['query'] as String);

  Input$LocationInput? get location =>
      (_$data['location'] as Input$LocationInput?);

  double? get radius => (_$data['radius'] as double?);

  List<String>? get amenities => (_$data['amenities'] as List<String>?);

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$query = query;
    result$data['query'] = l$query;
    if (_$data.containsKey('location')) {
      final l$location = location;
      result$data['location'] = l$location?.toJson();
    }
    if (_$data.containsKey('radius')) {
      final l$radius = radius;
      result$data['radius'] = l$radius;
    }
    if (_$data.containsKey('amenities')) {
      final l$amenities = amenities;
      result$data['amenities'] = l$amenities?.map((e) => e).toList();
    }
    if (_$data.containsKey('pagination')) {
      final l$pagination = pagination;
      result$data['pagination'] = l$pagination?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$SearchClubs<Variables$Query$SearchClubs>
  get copyWith => CopyWith$Variables$Query$SearchClubs(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$SearchClubs ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$query = query;
    final lOther$query = other.query;
    if (l$query != lOther$query) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (_$data.containsKey('location') !=
        other._$data.containsKey('location')) {
      return false;
    }
    if (l$location != lOther$location) {
      return false;
    }
    final l$radius = radius;
    final lOther$radius = other.radius;
    if (_$data.containsKey('radius') != other._$data.containsKey('radius')) {
      return false;
    }
    if (l$radius != lOther$radius) {
      return false;
    }
    final l$amenities = amenities;
    final lOther$amenities = other.amenities;
    if (_$data.containsKey('amenities') !=
        other._$data.containsKey('amenities')) {
      return false;
    }
    if (l$amenities != null && lOther$amenities != null) {
      if (l$amenities.length != lOther$amenities.length) {
        return false;
      }
      for (int i = 0; i < l$amenities.length; i++) {
        final l$amenities$entry = l$amenities[i];
        final lOther$amenities$entry = lOther$amenities[i];
        if (l$amenities$entry != lOther$amenities$entry) {
          return false;
        }
      }
    } else if (l$amenities != lOther$amenities) {
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
    final l$query = query;
    final l$location = location;
    final l$radius = radius;
    final l$amenities = amenities;
    final l$pagination = pagination;
    return Object.hashAll([
      l$query,
      _$data.containsKey('location') ? l$location : const {},
      _$data.containsKey('radius') ? l$radius : const {},
      _$data.containsKey('amenities')
          ? l$amenities == null
                ? null
                : Object.hashAll(l$amenities.map((v) => v))
          : const {},
      _$data.containsKey('pagination') ? l$pagination : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$SearchClubs<TRes> {
  factory CopyWith$Variables$Query$SearchClubs(
    Variables$Query$SearchClubs instance,
    TRes Function(Variables$Query$SearchClubs) then,
  ) = _CopyWithImpl$Variables$Query$SearchClubs;

  factory CopyWith$Variables$Query$SearchClubs.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$SearchClubs;

  TRes call({
    String? query,
    Input$LocationInput? location,
    double? radius,
    List<String>? amenities,
    Input$PaginationInput? pagination,
  });
}

class _CopyWithImpl$Variables$Query$SearchClubs<TRes>
    implements CopyWith$Variables$Query$SearchClubs<TRes> {
  _CopyWithImpl$Variables$Query$SearchClubs(this._instance, this._then);

  final Variables$Query$SearchClubs _instance;

  final TRes Function(Variables$Query$SearchClubs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? query = _undefined,
    Object? location = _undefined,
    Object? radius = _undefined,
    Object? amenities = _undefined,
    Object? pagination = _undefined,
  }) => _then(
    Variables$Query$SearchClubs._({
      ..._instance._$data,
      if (query != _undefined && query != null) 'query': (query as String),
      if (location != _undefined)
        'location': (location as Input$LocationInput?),
      if (radius != _undefined) 'radius': (radius as double?),
      if (amenities != _undefined) 'amenities': (amenities as List<String>?),
      if (pagination != _undefined)
        'pagination': (pagination as Input$PaginationInput?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$SearchClubs<TRes>
    implements CopyWith$Variables$Query$SearchClubs<TRes> {
  _CopyWithStubImpl$Variables$Query$SearchClubs(this._res);

  TRes _res;

  call({
    String? query,
    Input$LocationInput? location,
    double? radius,
    List<String>? amenities,
    Input$PaginationInput? pagination,
  }) => _res;
}

class Query$SearchClubs {
  Query$SearchClubs({required this.searchClubs, this.$__typename = 'Query'});

  factory Query$SearchClubs.fromJson(Map<String, dynamic> json) {
    final l$searchClubs = json['searchClubs'];
    final l$$__typename = json['__typename'];
    return Query$SearchClubs(
      searchClubs: Query$SearchClubs$searchClubs.fromJson(
        (l$searchClubs as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$SearchClubs$searchClubs searchClubs;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$searchClubs = searchClubs;
    _resultData['searchClubs'] = l$searchClubs.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$searchClubs = searchClubs;
    final l$$__typename = $__typename;
    return Object.hashAll([l$searchClubs, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SearchClubs || runtimeType != other.runtimeType) {
      return false;
    }
    final l$searchClubs = searchClubs;
    final lOther$searchClubs = other.searchClubs;
    if (l$searchClubs != lOther$searchClubs) {
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

extension UtilityExtension$Query$SearchClubs on Query$SearchClubs {
  CopyWith$Query$SearchClubs<Query$SearchClubs> get copyWith =>
      CopyWith$Query$SearchClubs(this, (i) => i);
}

abstract class CopyWith$Query$SearchClubs<TRes> {
  factory CopyWith$Query$SearchClubs(
    Query$SearchClubs instance,
    TRes Function(Query$SearchClubs) then,
  ) = _CopyWithImpl$Query$SearchClubs;

  factory CopyWith$Query$SearchClubs.stub(TRes res) =
      _CopyWithStubImpl$Query$SearchClubs;

  TRes call({Query$SearchClubs$searchClubs? searchClubs, String? $__typename});
  CopyWith$Query$SearchClubs$searchClubs<TRes> get searchClubs;
}

class _CopyWithImpl$Query$SearchClubs<TRes>
    implements CopyWith$Query$SearchClubs<TRes> {
  _CopyWithImpl$Query$SearchClubs(this._instance, this._then);

  final Query$SearchClubs _instance;

  final TRes Function(Query$SearchClubs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? searchClubs = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$SearchClubs(
      searchClubs: searchClubs == _undefined || searchClubs == null
          ? _instance.searchClubs
          : (searchClubs as Query$SearchClubs$searchClubs),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$SearchClubs$searchClubs<TRes> get searchClubs {
    final local$searchClubs = _instance.searchClubs;
    return CopyWith$Query$SearchClubs$searchClubs(
      local$searchClubs,
      (e) => call(searchClubs: e),
    );
  }
}

class _CopyWithStubImpl$Query$SearchClubs<TRes>
    implements CopyWith$Query$SearchClubs<TRes> {
  _CopyWithStubImpl$Query$SearchClubs(this._res);

  TRes _res;

  call({Query$SearchClubs$searchClubs? searchClubs, String? $__typename}) =>
      _res;

  CopyWith$Query$SearchClubs$searchClubs<TRes> get searchClubs =>
      CopyWith$Query$SearchClubs$searchClubs.stub(_res);
}

const documentNodeQuerySearchClubs = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'SearchClubs'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'query')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'location')),
          type: NamedTypeNode(
            name: NameNode(value: 'LocationInput'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'radius')),
          type: NamedTypeNode(name: NameNode(value: 'Float'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'amenities')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'String'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
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
            name: NameNode(value: 'searchClubs'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'query'),
                value: VariableNode(name: NameNode(value: 'query')),
              ),
              ArgumentNode(
                name: NameNode(value: 'location'),
                value: VariableNode(name: NameNode(value: 'location')),
              ),
              ArgumentNode(
                name: NameNode(value: 'radius'),
                value: VariableNode(name: NameNode(value: 'radius')),
              ),
              ArgumentNode(
                name: NameNode(value: 'amenities'),
                value: VariableNode(name: NameNode(value: 'amenities')),
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
                        name: NameNode(value: 'name'),
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
                        name: NameNode(value: 'location'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'distance'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'relevanceScore'),
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
Query$SearchClubs _parserFn$Query$SearchClubs(Map<String, dynamic> data) =>
    Query$SearchClubs.fromJson(data);
typedef OnQueryComplete$Query$SearchClubs =
    FutureOr<void> Function(Map<String, dynamic>?, Query$SearchClubs?);

class Options$Query$SearchClubs
    extends graphql.QueryOptions<Query$SearchClubs> {
  Options$Query$SearchClubs({
    String? operationName,
    required Variables$Query$SearchClubs variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SearchClubs? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$SearchClubs? onComplete,
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
                 data == null ? null : _parserFn$Query$SearchClubs(data),
               ),
         onError: onError,
         document: documentNodeQuerySearchClubs,
         parserFn: _parserFn$Query$SearchClubs,
       );

  final OnQueryComplete$Query$SearchClubs? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$SearchClubs
    extends graphql.WatchQueryOptions<Query$SearchClubs> {
  WatchOptions$Query$SearchClubs({
    String? operationName,
    required Variables$Query$SearchClubs variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SearchClubs? typedOptimisticResult,
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
         document: documentNodeQuerySearchClubs,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$SearchClubs,
       );
}

class FetchMoreOptions$Query$SearchClubs extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$SearchClubs({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$SearchClubs variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQuerySearchClubs,
       );
}

extension ClientExtension$Query$SearchClubs on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$SearchClubs>> query$SearchClubs(
    Options$Query$SearchClubs options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$SearchClubs> watchQuery$SearchClubs(
    WatchOptions$Query$SearchClubs options,
  ) => this.watchQuery(options);

  void writeQuery$SearchClubs({
    required Query$SearchClubs data,
    required Variables$Query$SearchClubs variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQuerySearchClubs),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$SearchClubs? readQuery$SearchClubs({
    required Variables$Query$SearchClubs variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerySearchClubs),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$SearchClubs.fromJson(result);
  }
}

class Query$SearchClubs$searchClubs {
  Query$SearchClubs$searchClubs({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'ClubConnection',
  });

  factory Query$SearchClubs$searchClubs.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$SearchClubs$searchClubs(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$SearchClubs$searchClubs$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$SearchClubs$searchClubs$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$SearchClubs$searchClubs$nodes> nodes;

  final Query$SearchClubs$searchClubs$pageInfo pageInfo;

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
    if (other is! Query$SearchClubs$searchClubs ||
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

extension UtilityExtension$Query$SearchClubs$searchClubs
    on Query$SearchClubs$searchClubs {
  CopyWith$Query$SearchClubs$searchClubs<Query$SearchClubs$searchClubs>
  get copyWith => CopyWith$Query$SearchClubs$searchClubs(this, (i) => i);
}

abstract class CopyWith$Query$SearchClubs$searchClubs<TRes> {
  factory CopyWith$Query$SearchClubs$searchClubs(
    Query$SearchClubs$searchClubs instance,
    TRes Function(Query$SearchClubs$searchClubs) then,
  ) = _CopyWithImpl$Query$SearchClubs$searchClubs;

  factory CopyWith$Query$SearchClubs$searchClubs.stub(TRes res) =
      _CopyWithStubImpl$Query$SearchClubs$searchClubs;

  TRes call({
    List<Query$SearchClubs$searchClubs$nodes>? nodes,
    Query$SearchClubs$searchClubs$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$SearchClubs$searchClubs$nodes> Function(
      Iterable<
        CopyWith$Query$SearchClubs$searchClubs$nodes<
          Query$SearchClubs$searchClubs$nodes
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$SearchClubs$searchClubs$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$SearchClubs$searchClubs<TRes>
    implements CopyWith$Query$SearchClubs$searchClubs<TRes> {
  _CopyWithImpl$Query$SearchClubs$searchClubs(this._instance, this._then);

  final Query$SearchClubs$searchClubs _instance;

  final TRes Function(Query$SearchClubs$searchClubs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$SearchClubs$searchClubs(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$SearchClubs$searchClubs$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$SearchClubs$searchClubs$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$SearchClubs$searchClubs$nodes> Function(
      Iterable<
        CopyWith$Query$SearchClubs$searchClubs$nodes<
          Query$SearchClubs$searchClubs$nodes
        >
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$SearchClubs$searchClubs$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$SearchClubs$searchClubs$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$SearchClubs$searchClubs$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$SearchClubs$searchClubs<TRes>
    implements CopyWith$Query$SearchClubs$searchClubs<TRes> {
  _CopyWithStubImpl$Query$SearchClubs$searchClubs(this._res);

  TRes _res;

  call({
    List<Query$SearchClubs$searchClubs$nodes>? nodes,
    Query$SearchClubs$searchClubs$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$SearchClubs$searchClubs$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$SearchClubs$searchClubs$pageInfo.stub(_res);
}

class Query$SearchClubs$searchClubs$nodes {
  Query$SearchClubs$searchClubs$nodes({
    required this.id,
    required this.name,
    this.description,
    required this.location,
    this.distance,
    this.relevanceScore,
    this.$__typename = 'Club',
  });

  factory Query$SearchClubs$searchClubs$nodes.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$location = json['location'];
    final l$distance = json['distance'];
    final l$relevanceScore = json['relevanceScore'];
    final l$$__typename = json['__typename'];
    return Query$SearchClubs$searchClubs$nodes(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String?),
      location: (l$location as String),
      distance: (l$distance as num?)?.toDouble(),
      relevanceScore: (l$relevanceScore as num?)?.toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? description;

  final String location;

  final double? distance;

  final double? relevanceScore;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$location = location;
    _resultData['location'] = l$location;
    final l$distance = distance;
    _resultData['distance'] = l$distance;
    final l$relevanceScore = relevanceScore;
    _resultData['relevanceScore'] = l$relevanceScore;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$location = location;
    final l$distance = distance;
    final l$relevanceScore = relevanceScore;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$location,
      l$distance,
      l$relevanceScore,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SearchClubs$searchClubs$nodes ||
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
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$distance = distance;
    final lOther$distance = other.distance;
    if (l$distance != lOther$distance) {
      return false;
    }
    final l$relevanceScore = relevanceScore;
    final lOther$relevanceScore = other.relevanceScore;
    if (l$relevanceScore != lOther$relevanceScore) {
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

extension UtilityExtension$Query$SearchClubs$searchClubs$nodes
    on Query$SearchClubs$searchClubs$nodes {
  CopyWith$Query$SearchClubs$searchClubs$nodes<
    Query$SearchClubs$searchClubs$nodes
  >
  get copyWith => CopyWith$Query$SearchClubs$searchClubs$nodes(this, (i) => i);
}

abstract class CopyWith$Query$SearchClubs$searchClubs$nodes<TRes> {
  factory CopyWith$Query$SearchClubs$searchClubs$nodes(
    Query$SearchClubs$searchClubs$nodes instance,
    TRes Function(Query$SearchClubs$searchClubs$nodes) then,
  ) = _CopyWithImpl$Query$SearchClubs$searchClubs$nodes;

  factory CopyWith$Query$SearchClubs$searchClubs$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$SearchClubs$searchClubs$nodes;

  TRes call({
    String? id,
    String? name,
    String? description,
    String? location,
    double? distance,
    double? relevanceScore,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SearchClubs$searchClubs$nodes<TRes>
    implements CopyWith$Query$SearchClubs$searchClubs$nodes<TRes> {
  _CopyWithImpl$Query$SearchClubs$searchClubs$nodes(this._instance, this._then);

  final Query$SearchClubs$searchClubs$nodes _instance;

  final TRes Function(Query$SearchClubs$searchClubs$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? location = _undefined,
    Object? distance = _undefined,
    Object? relevanceScore = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$SearchClubs$searchClubs$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      location: location == _undefined || location == null
          ? _instance.location
          : (location as String),
      distance: distance == _undefined
          ? _instance.distance
          : (distance as double?),
      relevanceScore: relevanceScore == _undefined
          ? _instance.relevanceScore
          : (relevanceScore as double?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$SearchClubs$searchClubs$nodes<TRes>
    implements CopyWith$Query$SearchClubs$searchClubs$nodes<TRes> {
  _CopyWithStubImpl$Query$SearchClubs$searchClubs$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    String? location,
    double? distance,
    double? relevanceScore,
    String? $__typename,
  }) => _res;
}

class Query$SearchClubs$searchClubs$pageInfo {
  Query$SearchClubs$searchClubs$pageInfo({
    required this.hasNextPage,
    this.totalCount,
    this.$__typename = 'PageInfo',
  });

  factory Query$SearchClubs$searchClubs$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$hasNextPage = json['hasNextPage'];
    final l$totalCount = json['totalCount'];
    final l$$__typename = json['__typename'];
    return Query$SearchClubs$searchClubs$pageInfo(
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
    if (other is! Query$SearchClubs$searchClubs$pageInfo ||
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

extension UtilityExtension$Query$SearchClubs$searchClubs$pageInfo
    on Query$SearchClubs$searchClubs$pageInfo {
  CopyWith$Query$SearchClubs$searchClubs$pageInfo<
    Query$SearchClubs$searchClubs$pageInfo
  >
  get copyWith =>
      CopyWith$Query$SearchClubs$searchClubs$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$SearchClubs$searchClubs$pageInfo<TRes> {
  factory CopyWith$Query$SearchClubs$searchClubs$pageInfo(
    Query$SearchClubs$searchClubs$pageInfo instance,
    TRes Function(Query$SearchClubs$searchClubs$pageInfo) then,
  ) = _CopyWithImpl$Query$SearchClubs$searchClubs$pageInfo;

  factory CopyWith$Query$SearchClubs$searchClubs$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$SearchClubs$searchClubs$pageInfo;

  TRes call({bool? hasNextPage, int? totalCount, String? $__typename});
}

class _CopyWithImpl$Query$SearchClubs$searchClubs$pageInfo<TRes>
    implements CopyWith$Query$SearchClubs$searchClubs$pageInfo<TRes> {
  _CopyWithImpl$Query$SearchClubs$searchClubs$pageInfo(
    this._instance,
    this._then,
  );

  final Query$SearchClubs$searchClubs$pageInfo _instance;

  final TRes Function(Query$SearchClubs$searchClubs$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? totalCount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$SearchClubs$searchClubs$pageInfo(
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

class _CopyWithStubImpl$Query$SearchClubs$searchClubs$pageInfo<TRes>
    implements CopyWith$Query$SearchClubs$searchClubs$pageInfo<TRes> {
  _CopyWithStubImpl$Query$SearchClubs$searchClubs$pageInfo(this._res);

  TRes _res;

  call({bool? hasNextPage, int? totalCount, String? $__typename}) => _res;
}
