import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$FeaturedClubs {
  factory Variables$Query$FeaturedClubs({Input$PaginationInput? pagination}) =>
      Variables$Query$FeaturedClubs._({
        if (pagination != null) r'pagination': pagination,
      });

  Variables$Query$FeaturedClubs._(this._$data);

  factory Variables$Query$FeaturedClubs.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('pagination')) {
      final l$pagination = data['pagination'];
      result$data['pagination'] = l$pagination == null
          ? null
          : Input$PaginationInput.fromJson(
              (l$pagination as Map<String, dynamic>),
            );
    }
    return Variables$Query$FeaturedClubs._(result$data);
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

  CopyWith$Variables$Query$FeaturedClubs<Variables$Query$FeaturedClubs>
  get copyWith => CopyWith$Variables$Query$FeaturedClubs(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$FeaturedClubs ||
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

abstract class CopyWith$Variables$Query$FeaturedClubs<TRes> {
  factory CopyWith$Variables$Query$FeaturedClubs(
    Variables$Query$FeaturedClubs instance,
    TRes Function(Variables$Query$FeaturedClubs) then,
  ) = _CopyWithImpl$Variables$Query$FeaturedClubs;

  factory CopyWith$Variables$Query$FeaturedClubs.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$FeaturedClubs;

  TRes call({Input$PaginationInput? pagination});
}

class _CopyWithImpl$Variables$Query$FeaturedClubs<TRes>
    implements CopyWith$Variables$Query$FeaturedClubs<TRes> {
  _CopyWithImpl$Variables$Query$FeaturedClubs(this._instance, this._then);

  final Variables$Query$FeaturedClubs _instance;

  final TRes Function(Variables$Query$FeaturedClubs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? pagination = _undefined}) => _then(
    Variables$Query$FeaturedClubs._({
      ..._instance._$data,
      if (pagination != _undefined)
        'pagination': (pagination as Input$PaginationInput?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$FeaturedClubs<TRes>
    implements CopyWith$Variables$Query$FeaturedClubs<TRes> {
  _CopyWithStubImpl$Variables$Query$FeaturedClubs(this._res);

  TRes _res;

  call({Input$PaginationInput? pagination}) => _res;
}

class Query$FeaturedClubs {
  Query$FeaturedClubs({required this.clubs, this.$__typename = 'Query'});

  factory Query$FeaturedClubs.fromJson(Map<String, dynamic> json) {
    final l$clubs = json['clubs'];
    final l$$__typename = json['__typename'];
    return Query$FeaturedClubs(
      clubs: Query$FeaturedClubs$clubs.fromJson(
        (l$clubs as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FeaturedClubs$clubs clubs;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$clubs = clubs;
    _resultData['clubs'] = l$clubs.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$clubs = clubs;
    final l$$__typename = $__typename;
    return Object.hashAll([l$clubs, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FeaturedClubs || runtimeType != other.runtimeType) {
      return false;
    }
    final l$clubs = clubs;
    final lOther$clubs = other.clubs;
    if (l$clubs != lOther$clubs) {
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

extension UtilityExtension$Query$FeaturedClubs on Query$FeaturedClubs {
  CopyWith$Query$FeaturedClubs<Query$FeaturedClubs> get copyWith =>
      CopyWith$Query$FeaturedClubs(this, (i) => i);
}

abstract class CopyWith$Query$FeaturedClubs<TRes> {
  factory CopyWith$Query$FeaturedClubs(
    Query$FeaturedClubs instance,
    TRes Function(Query$FeaturedClubs) then,
  ) = _CopyWithImpl$Query$FeaturedClubs;

  factory CopyWith$Query$FeaturedClubs.stub(TRes res) =
      _CopyWithStubImpl$Query$FeaturedClubs;

  TRes call({Query$FeaturedClubs$clubs? clubs, String? $__typename});
  CopyWith$Query$FeaturedClubs$clubs<TRes> get clubs;
}

class _CopyWithImpl$Query$FeaturedClubs<TRes>
    implements CopyWith$Query$FeaturedClubs<TRes> {
  _CopyWithImpl$Query$FeaturedClubs(this._instance, this._then);

  final Query$FeaturedClubs _instance;

  final TRes Function(Query$FeaturedClubs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? clubs = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$FeaturedClubs(
          clubs: clubs == _undefined || clubs == null
              ? _instance.clubs
              : (clubs as Query$FeaturedClubs$clubs),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$FeaturedClubs$clubs<TRes> get clubs {
    final local$clubs = _instance.clubs;
    return CopyWith$Query$FeaturedClubs$clubs(
      local$clubs,
      (e) => call(clubs: e),
    );
  }
}

class _CopyWithStubImpl$Query$FeaturedClubs<TRes>
    implements CopyWith$Query$FeaturedClubs<TRes> {
  _CopyWithStubImpl$Query$FeaturedClubs(this._res);

  TRes _res;

  call({Query$FeaturedClubs$clubs? clubs, String? $__typename}) => _res;

  CopyWith$Query$FeaturedClubs$clubs<TRes> get clubs =>
      CopyWith$Query$FeaturedClubs$clubs.stub(_res);
}

const documentNodeQueryFeaturedClubs = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'FeaturedClubs'),
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
            name: NameNode(value: 'clubs'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'isFeatured'),
                      value: BooleanValueNode(value: true),
                    ),
                  ],
                ),
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
                        name: NameNode(value: 'slug'),
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
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'street'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'city'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'state'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'postalCode'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'country'),
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
                        name: NameNode(value: 'logo'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'website'),
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
                        name: NameNode(value: 'settings'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'allowReciprocal'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'reciprocalFee'),
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
                        name: NameNode(value: 'createdAt'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'updatedAt'),
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
Query$FeaturedClubs _parserFn$Query$FeaturedClubs(Map<String, dynamic> data) =>
    Query$FeaturedClubs.fromJson(data);
typedef OnQueryComplete$Query$FeaturedClubs =
    FutureOr<void> Function(Map<String, dynamic>?, Query$FeaturedClubs?);

class Options$Query$FeaturedClubs
    extends graphql.QueryOptions<Query$FeaturedClubs> {
  Options$Query$FeaturedClubs({
    String? operationName,
    Variables$Query$FeaturedClubs? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FeaturedClubs? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$FeaturedClubs? onComplete,
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
                 data == null ? null : _parserFn$Query$FeaturedClubs(data),
               ),
         onError: onError,
         document: documentNodeQueryFeaturedClubs,
         parserFn: _parserFn$Query$FeaturedClubs,
       );

  final OnQueryComplete$Query$FeaturedClubs? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$FeaturedClubs
    extends graphql.WatchQueryOptions<Query$FeaturedClubs> {
  WatchOptions$Query$FeaturedClubs({
    String? operationName,
    Variables$Query$FeaturedClubs? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FeaturedClubs? typedOptimisticResult,
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
         document: documentNodeQueryFeaturedClubs,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$FeaturedClubs,
       );
}

class FetchMoreOptions$Query$FeaturedClubs extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$FeaturedClubs({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$FeaturedClubs? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryFeaturedClubs,
       );
}

extension ClientExtension$Query$FeaturedClubs on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$FeaturedClubs>> query$FeaturedClubs([
    Options$Query$FeaturedClubs? options,
  ]) async => await this.query(options ?? Options$Query$FeaturedClubs());

  graphql.ObservableQuery<Query$FeaturedClubs> watchQuery$FeaturedClubs([
    WatchOptions$Query$FeaturedClubs? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$FeaturedClubs());

  void writeQuery$FeaturedClubs({
    required Query$FeaturedClubs data,
    Variables$Query$FeaturedClubs? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryFeaturedClubs),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$FeaturedClubs? readQuery$FeaturedClubs({
    Variables$Query$FeaturedClubs? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryFeaturedClubs),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$FeaturedClubs.fromJson(result);
  }
}

class Query$FeaturedClubs$clubs {
  Query$FeaturedClubs$clubs({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'ClubConnection',
  });

  factory Query$FeaturedClubs$clubs.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$FeaturedClubs$clubs(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$FeaturedClubs$clubs$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$FeaturedClubs$clubs$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$FeaturedClubs$clubs$nodes> nodes;

  final Query$FeaturedClubs$clubs$pageInfo pageInfo;

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
    if (other is! Query$FeaturedClubs$clubs ||
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

extension UtilityExtension$Query$FeaturedClubs$clubs
    on Query$FeaturedClubs$clubs {
  CopyWith$Query$FeaturedClubs$clubs<Query$FeaturedClubs$clubs> get copyWith =>
      CopyWith$Query$FeaturedClubs$clubs(this, (i) => i);
}

abstract class CopyWith$Query$FeaturedClubs$clubs<TRes> {
  factory CopyWith$Query$FeaturedClubs$clubs(
    Query$FeaturedClubs$clubs instance,
    TRes Function(Query$FeaturedClubs$clubs) then,
  ) = _CopyWithImpl$Query$FeaturedClubs$clubs;

  factory CopyWith$Query$FeaturedClubs$clubs.stub(TRes res) =
      _CopyWithStubImpl$Query$FeaturedClubs$clubs;

  TRes call({
    List<Query$FeaturedClubs$clubs$nodes>? nodes,
    Query$FeaturedClubs$clubs$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$FeaturedClubs$clubs$nodes> Function(
      Iterable<
        CopyWith$Query$FeaturedClubs$clubs$nodes<
          Query$FeaturedClubs$clubs$nodes
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$FeaturedClubs$clubs$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$FeaturedClubs$clubs<TRes>
    implements CopyWith$Query$FeaturedClubs$clubs<TRes> {
  _CopyWithImpl$Query$FeaturedClubs$clubs(this._instance, this._then);

  final Query$FeaturedClubs$clubs _instance;

  final TRes Function(Query$FeaturedClubs$clubs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FeaturedClubs$clubs(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$FeaturedClubs$clubs$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$FeaturedClubs$clubs$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$FeaturedClubs$clubs$nodes> Function(
      Iterable<
        CopyWith$Query$FeaturedClubs$clubs$nodes<
          Query$FeaturedClubs$clubs$nodes
        >
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$FeaturedClubs$clubs$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$FeaturedClubs$clubs$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$FeaturedClubs$clubs$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$FeaturedClubs$clubs<TRes>
    implements CopyWith$Query$FeaturedClubs$clubs<TRes> {
  _CopyWithStubImpl$Query$FeaturedClubs$clubs(this._res);

  TRes _res;

  call({
    List<Query$FeaturedClubs$clubs$nodes>? nodes,
    Query$FeaturedClubs$clubs$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$FeaturedClubs$clubs$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$FeaturedClubs$clubs$pageInfo.stub(_res);
}

class Query$FeaturedClubs$clubs$nodes {
  Query$FeaturedClubs$clubs$nodes({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    this.location,
    this.address,
    this.logo,
    this.website,
    required this.status,
    required this.settings,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Club',
  });

  factory Query$FeaturedClubs$clubs$nodes.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$slug = json['slug'];
    final l$description = json['description'];
    final l$location = json['location'];
    final l$address = json['address'];
    final l$logo = json['logo'];
    final l$website = json['website'];
    final l$status = json['status'];
    final l$settings = json['settings'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$FeaturedClubs$clubs$nodes(
      id: (l$id as String),
      name: (l$name as String),
      slug: (l$slug as String),
      description: (l$description as String?),
      location: (l$location as String?),
      address: l$address == null
          ? null
          : Query$FeaturedClubs$clubs$nodes$address.fromJson(
              (l$address as Map<String, dynamic>),
            ),
      logo: (l$logo as String?),
      website: (l$website as String?),
      status: fromJson$Enum$ClubStatus((l$status as String)),
      settings: Query$FeaturedClubs$clubs$nodes$settings.fromJson(
        (l$settings as Map<String, dynamic>),
      ),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String slug;

  final String? description;

  final String? location;

  final Query$FeaturedClubs$clubs$nodes$address? address;

  final String? logo;

  final String? website;

  final Enum$ClubStatus status;

  final Query$FeaturedClubs$clubs$nodes$settings settings;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$slug = slug;
    _resultData['slug'] = l$slug;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$location = location;
    _resultData['location'] = l$location;
    final l$address = address;
    _resultData['address'] = l$address?.toJson();
    final l$logo = logo;
    _resultData['logo'] = l$logo;
    final l$website = website;
    _resultData['website'] = l$website;
    final l$status = status;
    _resultData['status'] = toJson$Enum$ClubStatus(l$status);
    final l$settings = settings;
    _resultData['settings'] = l$settings.toJson();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$slug = slug;
    final l$description = description;
    final l$location = location;
    final l$address = address;
    final l$logo = logo;
    final l$website = website;
    final l$status = status;
    final l$settings = settings;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$slug,
      l$description,
      l$location,
      l$address,
      l$logo,
      l$website,
      l$status,
      l$settings,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FeaturedClubs$clubs$nodes ||
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
    final l$slug = slug;
    final lOther$slug = other.slug;
    if (l$slug != lOther$slug) {
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
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$logo = logo;
    final lOther$logo = other.logo;
    if (l$logo != lOther$logo) {
      return false;
    }
    final l$website = website;
    final lOther$website = other.website;
    if (l$website != lOther$website) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$settings = settings;
    final lOther$settings = other.settings;
    if (l$settings != lOther$settings) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
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

extension UtilityExtension$Query$FeaturedClubs$clubs$nodes
    on Query$FeaturedClubs$clubs$nodes {
  CopyWith$Query$FeaturedClubs$clubs$nodes<Query$FeaturedClubs$clubs$nodes>
  get copyWith => CopyWith$Query$FeaturedClubs$clubs$nodes(this, (i) => i);
}

abstract class CopyWith$Query$FeaturedClubs$clubs$nodes<TRes> {
  factory CopyWith$Query$FeaturedClubs$clubs$nodes(
    Query$FeaturedClubs$clubs$nodes instance,
    TRes Function(Query$FeaturedClubs$clubs$nodes) then,
  ) = _CopyWithImpl$Query$FeaturedClubs$clubs$nodes;

  factory CopyWith$Query$FeaturedClubs$clubs$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$FeaturedClubs$clubs$nodes;

  TRes call({
    String? id,
    String? name,
    String? slug,
    String? description,
    String? location,
    Query$FeaturedClubs$clubs$nodes$address? address,
    String? logo,
    String? website,
    Enum$ClubStatus? status,
    Query$FeaturedClubs$clubs$nodes$settings? settings,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
  CopyWith$Query$FeaturedClubs$clubs$nodes$address<TRes> get address;
  CopyWith$Query$FeaturedClubs$clubs$nodes$settings<TRes> get settings;
}

class _CopyWithImpl$Query$FeaturedClubs$clubs$nodes<TRes>
    implements CopyWith$Query$FeaturedClubs$clubs$nodes<TRes> {
  _CopyWithImpl$Query$FeaturedClubs$clubs$nodes(this._instance, this._then);

  final Query$FeaturedClubs$clubs$nodes _instance;

  final TRes Function(Query$FeaturedClubs$clubs$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? slug = _undefined,
    Object? description = _undefined,
    Object? location = _undefined,
    Object? address = _undefined,
    Object? logo = _undefined,
    Object? website = _undefined,
    Object? status = _undefined,
    Object? settings = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FeaturedClubs$clubs$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      slug: slug == _undefined || slug == null
          ? _instance.slug
          : (slug as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      location: location == _undefined
          ? _instance.location
          : (location as String?),
      address: address == _undefined
          ? _instance.address
          : (address as Query$FeaturedClubs$clubs$nodes$address?),
      logo: logo == _undefined ? _instance.logo : (logo as String?),
      website: website == _undefined ? _instance.website : (website as String?),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$ClubStatus),
      settings: settings == _undefined || settings == null
          ? _instance.settings
          : (settings as Query$FeaturedClubs$clubs$nodes$settings),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$FeaturedClubs$clubs$nodes$address<TRes> get address {
    final local$address = _instance.address;
    return local$address == null
        ? CopyWith$Query$FeaturedClubs$clubs$nodes$address.stub(
            _then(_instance),
          )
        : CopyWith$Query$FeaturedClubs$clubs$nodes$address(
            local$address,
            (e) => call(address: e),
          );
  }

  CopyWith$Query$FeaturedClubs$clubs$nodes$settings<TRes> get settings {
    final local$settings = _instance.settings;
    return CopyWith$Query$FeaturedClubs$clubs$nodes$settings(
      local$settings,
      (e) => call(settings: e),
    );
  }
}

class _CopyWithStubImpl$Query$FeaturedClubs$clubs$nodes<TRes>
    implements CopyWith$Query$FeaturedClubs$clubs$nodes<TRes> {
  _CopyWithStubImpl$Query$FeaturedClubs$clubs$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? slug,
    String? description,
    String? location,
    Query$FeaturedClubs$clubs$nodes$address? address,
    String? logo,
    String? website,
    Enum$ClubStatus? status,
    Query$FeaturedClubs$clubs$nodes$settings? settings,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$FeaturedClubs$clubs$nodes$address<TRes> get address =>
      CopyWith$Query$FeaturedClubs$clubs$nodes$address.stub(_res);

  CopyWith$Query$FeaturedClubs$clubs$nodes$settings<TRes> get settings =>
      CopyWith$Query$FeaturedClubs$clubs$nodes$settings.stub(_res);
}

class Query$FeaturedClubs$clubs$nodes$address {
  Query$FeaturedClubs$clubs$nodes$address({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.$__typename = 'Address',
  });

  factory Query$FeaturedClubs$clubs$nodes$address.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$street = json['street'];
    final l$city = json['city'];
    final l$state = json['state'];
    final l$postalCode = json['postalCode'];
    final l$country = json['country'];
    final l$$__typename = json['__typename'];
    return Query$FeaturedClubs$clubs$nodes$address(
      street: (l$street as String),
      city: (l$city as String),
      state: (l$state as String),
      postalCode: (l$postalCode as String),
      country: (l$country as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String street;

  final String city;

  final String state;

  final String postalCode;

  final String country;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$street = street;
    _resultData['street'] = l$street;
    final l$city = city;
    _resultData['city'] = l$city;
    final l$state = state;
    _resultData['state'] = l$state;
    final l$postalCode = postalCode;
    _resultData['postalCode'] = l$postalCode;
    final l$country = country;
    _resultData['country'] = l$country;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$street = street;
    final l$city = city;
    final l$state = state;
    final l$postalCode = postalCode;
    final l$country = country;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$street,
      l$city,
      l$state,
      l$postalCode,
      l$country,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FeaturedClubs$clubs$nodes$address ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$street = street;
    final lOther$street = other.street;
    if (l$street != lOther$street) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (l$city != lOther$city) {
      return false;
    }
    final l$state = state;
    final lOther$state = other.state;
    if (l$state != lOther$state) {
      return false;
    }
    final l$postalCode = postalCode;
    final lOther$postalCode = other.postalCode;
    if (l$postalCode != lOther$postalCode) {
      return false;
    }
    final l$country = country;
    final lOther$country = other.country;
    if (l$country != lOther$country) {
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

extension UtilityExtension$Query$FeaturedClubs$clubs$nodes$address
    on Query$FeaturedClubs$clubs$nodes$address {
  CopyWith$Query$FeaturedClubs$clubs$nodes$address<
    Query$FeaturedClubs$clubs$nodes$address
  >
  get copyWith =>
      CopyWith$Query$FeaturedClubs$clubs$nodes$address(this, (i) => i);
}

abstract class CopyWith$Query$FeaturedClubs$clubs$nodes$address<TRes> {
  factory CopyWith$Query$FeaturedClubs$clubs$nodes$address(
    Query$FeaturedClubs$clubs$nodes$address instance,
    TRes Function(Query$FeaturedClubs$clubs$nodes$address) then,
  ) = _CopyWithImpl$Query$FeaturedClubs$clubs$nodes$address;

  factory CopyWith$Query$FeaturedClubs$clubs$nodes$address.stub(TRes res) =
      _CopyWithStubImpl$Query$FeaturedClubs$clubs$nodes$address;

  TRes call({
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FeaturedClubs$clubs$nodes$address<TRes>
    implements CopyWith$Query$FeaturedClubs$clubs$nodes$address<TRes> {
  _CopyWithImpl$Query$FeaturedClubs$clubs$nodes$address(
    this._instance,
    this._then,
  );

  final Query$FeaturedClubs$clubs$nodes$address _instance;

  final TRes Function(Query$FeaturedClubs$clubs$nodes$address) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? street = _undefined,
    Object? city = _undefined,
    Object? state = _undefined,
    Object? postalCode = _undefined,
    Object? country = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FeaturedClubs$clubs$nodes$address(
      street: street == _undefined || street == null
          ? _instance.street
          : (street as String),
      city: city == _undefined || city == null
          ? _instance.city
          : (city as String),
      state: state == _undefined || state == null
          ? _instance.state
          : (state as String),
      postalCode: postalCode == _undefined || postalCode == null
          ? _instance.postalCode
          : (postalCode as String),
      country: country == _undefined || country == null
          ? _instance.country
          : (country as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$FeaturedClubs$clubs$nodes$address<TRes>
    implements CopyWith$Query$FeaturedClubs$clubs$nodes$address<TRes> {
  _CopyWithStubImpl$Query$FeaturedClubs$clubs$nodes$address(this._res);

  TRes _res;

  call({
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    String? $__typename,
  }) => _res;
}

class Query$FeaturedClubs$clubs$nodes$settings {
  Query$FeaturedClubs$clubs$nodes$settings({
    required this.allowReciprocal,
    this.reciprocalFee,
    this.$__typename = 'ClubSettings',
  });

  factory Query$FeaturedClubs$clubs$nodes$settings.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$allowReciprocal = json['allowReciprocal'];
    final l$reciprocalFee = json['reciprocalFee'];
    final l$$__typename = json['__typename'];
    return Query$FeaturedClubs$clubs$nodes$settings(
      allowReciprocal: (l$allowReciprocal as bool),
      reciprocalFee: (l$reciprocalFee as num?)?.toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final bool allowReciprocal;

  final double? reciprocalFee;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$allowReciprocal = allowReciprocal;
    _resultData['allowReciprocal'] = l$allowReciprocal;
    final l$reciprocalFee = reciprocalFee;
    _resultData['reciprocalFee'] = l$reciprocalFee;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$allowReciprocal = allowReciprocal;
    final l$reciprocalFee = reciprocalFee;
    final l$$__typename = $__typename;
    return Object.hashAll([l$allowReciprocal, l$reciprocalFee, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FeaturedClubs$clubs$nodes$settings ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$allowReciprocal = allowReciprocal;
    final lOther$allowReciprocal = other.allowReciprocal;
    if (l$allowReciprocal != lOther$allowReciprocal) {
      return false;
    }
    final l$reciprocalFee = reciprocalFee;
    final lOther$reciprocalFee = other.reciprocalFee;
    if (l$reciprocalFee != lOther$reciprocalFee) {
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

extension UtilityExtension$Query$FeaturedClubs$clubs$nodes$settings
    on Query$FeaturedClubs$clubs$nodes$settings {
  CopyWith$Query$FeaturedClubs$clubs$nodes$settings<
    Query$FeaturedClubs$clubs$nodes$settings
  >
  get copyWith =>
      CopyWith$Query$FeaturedClubs$clubs$nodes$settings(this, (i) => i);
}

abstract class CopyWith$Query$FeaturedClubs$clubs$nodes$settings<TRes> {
  factory CopyWith$Query$FeaturedClubs$clubs$nodes$settings(
    Query$FeaturedClubs$clubs$nodes$settings instance,
    TRes Function(Query$FeaturedClubs$clubs$nodes$settings) then,
  ) = _CopyWithImpl$Query$FeaturedClubs$clubs$nodes$settings;

  factory CopyWith$Query$FeaturedClubs$clubs$nodes$settings.stub(TRes res) =
      _CopyWithStubImpl$Query$FeaturedClubs$clubs$nodes$settings;

  TRes call({
    bool? allowReciprocal,
    double? reciprocalFee,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FeaturedClubs$clubs$nodes$settings<TRes>
    implements CopyWith$Query$FeaturedClubs$clubs$nodes$settings<TRes> {
  _CopyWithImpl$Query$FeaturedClubs$clubs$nodes$settings(
    this._instance,
    this._then,
  );

  final Query$FeaturedClubs$clubs$nodes$settings _instance;

  final TRes Function(Query$FeaturedClubs$clubs$nodes$settings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? allowReciprocal = _undefined,
    Object? reciprocalFee = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FeaturedClubs$clubs$nodes$settings(
      allowReciprocal: allowReciprocal == _undefined || allowReciprocal == null
          ? _instance.allowReciprocal
          : (allowReciprocal as bool),
      reciprocalFee: reciprocalFee == _undefined
          ? _instance.reciprocalFee
          : (reciprocalFee as double?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$FeaturedClubs$clubs$nodes$settings<TRes>
    implements CopyWith$Query$FeaturedClubs$clubs$nodes$settings<TRes> {
  _CopyWithStubImpl$Query$FeaturedClubs$clubs$nodes$settings(this._res);

  TRes _res;

  call({bool? allowReciprocal, double? reciprocalFee, String? $__typename}) =>
      _res;
}

class Query$FeaturedClubs$clubs$pageInfo {
  Query$FeaturedClubs$clubs$pageInfo({
    required this.hasNextPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$FeaturedClubs$clubs$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$hasNextPage = json['hasNextPage'];
    final l$$__typename = json['__typename'];
    return Query$FeaturedClubs$clubs$pageInfo(
      hasNextPage: (l$hasNextPage as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$$__typename = $__typename;
    return Object.hashAll([l$hasNextPage, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FeaturedClubs$clubs$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
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

extension UtilityExtension$Query$FeaturedClubs$clubs$pageInfo
    on Query$FeaturedClubs$clubs$pageInfo {
  CopyWith$Query$FeaturedClubs$clubs$pageInfo<
    Query$FeaturedClubs$clubs$pageInfo
  >
  get copyWith => CopyWith$Query$FeaturedClubs$clubs$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$FeaturedClubs$clubs$pageInfo<TRes> {
  factory CopyWith$Query$FeaturedClubs$clubs$pageInfo(
    Query$FeaturedClubs$clubs$pageInfo instance,
    TRes Function(Query$FeaturedClubs$clubs$pageInfo) then,
  ) = _CopyWithImpl$Query$FeaturedClubs$clubs$pageInfo;

  factory CopyWith$Query$FeaturedClubs$clubs$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$FeaturedClubs$clubs$pageInfo;

  TRes call({bool? hasNextPage, String? $__typename});
}

class _CopyWithImpl$Query$FeaturedClubs$clubs$pageInfo<TRes>
    implements CopyWith$Query$FeaturedClubs$clubs$pageInfo<TRes> {
  _CopyWithImpl$Query$FeaturedClubs$clubs$pageInfo(this._instance, this._then);

  final Query$FeaturedClubs$clubs$pageInfo _instance;

  final TRes Function(Query$FeaturedClubs$clubs$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FeaturedClubs$clubs$pageInfo(
      hasNextPage: hasNextPage == _undefined || hasNextPage == null
          ? _instance.hasNextPage
          : (hasNextPage as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$FeaturedClubs$clubs$pageInfo<TRes>
    implements CopyWith$Query$FeaturedClubs$clubs$pageInfo<TRes> {
  _CopyWithStubImpl$Query$FeaturedClubs$clubs$pageInfo(this._res);

  TRes _res;

  call({bool? hasNextPage, String? $__typename}) => _res;
}
