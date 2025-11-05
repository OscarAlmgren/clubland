import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Clubs {
  factory Variables$Query$Clubs({Input$PaginationInput? pagination}) =>
      Variables$Query$Clubs._({
        if (pagination != null) r'pagination': pagination,
      });

  Variables$Query$Clubs._(this._$data);

  factory Variables$Query$Clubs.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('pagination')) {
      final l$pagination = data['pagination'];
      result$data['pagination'] = l$pagination == null
          ? null
          : Input$PaginationInput.fromJson(
              (l$pagination as Map<String, dynamic>),
            );
    }
    return Variables$Query$Clubs._(result$data);
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

  CopyWith$Variables$Query$Clubs<Variables$Query$Clubs> get copyWith =>
      CopyWith$Variables$Query$Clubs(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Clubs || runtimeType != other.runtimeType) {
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

abstract class CopyWith$Variables$Query$Clubs<TRes> {
  factory CopyWith$Variables$Query$Clubs(
    Variables$Query$Clubs instance,
    TRes Function(Variables$Query$Clubs) then,
  ) = _CopyWithImpl$Variables$Query$Clubs;

  factory CopyWith$Variables$Query$Clubs.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Clubs;

  TRes call({Input$PaginationInput? pagination});
}

class _CopyWithImpl$Variables$Query$Clubs<TRes>
    implements CopyWith$Variables$Query$Clubs<TRes> {
  _CopyWithImpl$Variables$Query$Clubs(this._instance, this._then);

  final Variables$Query$Clubs _instance;

  final TRes Function(Variables$Query$Clubs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? pagination = _undefined}) => _then(
    Variables$Query$Clubs._({
      ..._instance._$data,
      if (pagination != _undefined)
        'pagination': (pagination as Input$PaginationInput?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$Clubs<TRes>
    implements CopyWith$Variables$Query$Clubs<TRes> {
  _CopyWithStubImpl$Variables$Query$Clubs(this._res);

  TRes _res;

  call({Input$PaginationInput? pagination}) => _res;
}

class Query$Clubs {
  Query$Clubs({required this.clubs, this.$__typename = 'Query'});

  factory Query$Clubs.fromJson(Map<String, dynamic> json) {
    final l$clubs = json['clubs'];
    final l$$__typename = json['__typename'];
    return Query$Clubs(
      clubs: Query$Clubs$clubs.fromJson((l$clubs as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Clubs$clubs clubs;

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
    if (other is! Query$Clubs || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Clubs on Query$Clubs {
  CopyWith$Query$Clubs<Query$Clubs> get copyWith =>
      CopyWith$Query$Clubs(this, (i) => i);
}

abstract class CopyWith$Query$Clubs<TRes> {
  factory CopyWith$Query$Clubs(
    Query$Clubs instance,
    TRes Function(Query$Clubs) then,
  ) = _CopyWithImpl$Query$Clubs;

  factory CopyWith$Query$Clubs.stub(TRes res) = _CopyWithStubImpl$Query$Clubs;

  TRes call({Query$Clubs$clubs? clubs, String? $__typename});
  CopyWith$Query$Clubs$clubs<TRes> get clubs;
}

class _CopyWithImpl$Query$Clubs<TRes> implements CopyWith$Query$Clubs<TRes> {
  _CopyWithImpl$Query$Clubs(this._instance, this._then);

  final Query$Clubs _instance;

  final TRes Function(Query$Clubs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? clubs = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$Clubs(
          clubs: clubs == _undefined || clubs == null
              ? _instance.clubs
              : (clubs as Query$Clubs$clubs),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$Clubs$clubs<TRes> get clubs {
    final local$clubs = _instance.clubs;
    return CopyWith$Query$Clubs$clubs(local$clubs, (e) => call(clubs: e));
  }
}

class _CopyWithStubImpl$Query$Clubs<TRes>
    implements CopyWith$Query$Clubs<TRes> {
  _CopyWithStubImpl$Query$Clubs(this._res);

  TRes _res;

  call({Query$Clubs$clubs? clubs, String? $__typename}) => _res;

  CopyWith$Query$Clubs$clubs<TRes> get clubs =>
      CopyWith$Query$Clubs$clubs.stub(_res);
}

const documentNodeQueryClubs = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Clubs'),
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
                              name: NameNode(value: 'requireApproval'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'maxVisitsPerMonth'),
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
Query$Clubs _parserFn$Query$Clubs(Map<String, dynamic> data) =>
    Query$Clubs.fromJson(data);
typedef OnQueryComplete$Query$Clubs =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Clubs?);

class Options$Query$Clubs extends graphql.QueryOptions<Query$Clubs> {
  Options$Query$Clubs({
    String? operationName,
    Variables$Query$Clubs? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Clubs? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Clubs? onComplete,
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
                 data == null ? null : _parserFn$Query$Clubs(data),
               ),
         onError: onError,
         document: documentNodeQueryClubs,
         parserFn: _parserFn$Query$Clubs,
       );

  final OnQueryComplete$Query$Clubs? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Clubs extends graphql.WatchQueryOptions<Query$Clubs> {
  WatchOptions$Query$Clubs({
    String? operationName,
    Variables$Query$Clubs? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Clubs? typedOptimisticResult,
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
         document: documentNodeQueryClubs,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Clubs,
       );
}

class FetchMoreOptions$Query$Clubs extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Clubs({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$Clubs? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryClubs,
       );
}

extension ClientExtension$Query$Clubs on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Clubs>> query$Clubs([
    Options$Query$Clubs? options,
  ]) async => await this.query(options ?? Options$Query$Clubs());

  graphql.ObservableQuery<Query$Clubs> watchQuery$Clubs([
    WatchOptions$Query$Clubs? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$Clubs());

  void writeQuery$Clubs({
    required Query$Clubs data,
    Variables$Query$Clubs? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryClubs),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$Clubs? readQuery$Clubs({
    Variables$Query$Clubs? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryClubs),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Clubs.fromJson(result);
  }
}

class Query$Clubs$clubs {
  Query$Clubs$clubs({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'ClubConnection',
  });

  factory Query$Clubs$clubs.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$Clubs$clubs(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) =>
                Query$Clubs$clubs$nodes.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      pageInfo: Query$Clubs$clubs$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Clubs$clubs$nodes> nodes;

  final Query$Clubs$clubs$pageInfo pageInfo;

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
    if (other is! Query$Clubs$clubs || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Clubs$clubs on Query$Clubs$clubs {
  CopyWith$Query$Clubs$clubs<Query$Clubs$clubs> get copyWith =>
      CopyWith$Query$Clubs$clubs(this, (i) => i);
}

abstract class CopyWith$Query$Clubs$clubs<TRes> {
  factory CopyWith$Query$Clubs$clubs(
    Query$Clubs$clubs instance,
    TRes Function(Query$Clubs$clubs) then,
  ) = _CopyWithImpl$Query$Clubs$clubs;

  factory CopyWith$Query$Clubs$clubs.stub(TRes res) =
      _CopyWithStubImpl$Query$Clubs$clubs;

  TRes call({
    List<Query$Clubs$clubs$nodes>? nodes,
    Query$Clubs$clubs$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$Clubs$clubs$nodes> Function(
      Iterable<CopyWith$Query$Clubs$clubs$nodes<Query$Clubs$clubs$nodes>>,
    )
    _fn,
  );
  CopyWith$Query$Clubs$clubs$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$Clubs$clubs<TRes>
    implements CopyWith$Query$Clubs$clubs<TRes> {
  _CopyWithImpl$Query$Clubs$clubs(this._instance, this._then);

  final Query$Clubs$clubs _instance;

  final TRes Function(Query$Clubs$clubs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Clubs$clubs(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$Clubs$clubs$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$Clubs$clubs$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$Clubs$clubs$nodes> Function(
      Iterable<CopyWith$Query$Clubs$clubs$nodes<Query$Clubs$clubs$nodes>>,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map((e) => CopyWith$Query$Clubs$clubs$nodes(e, (i) => i)),
    ).toList(),
  );

  CopyWith$Query$Clubs$clubs$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$Clubs$clubs$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$Clubs$clubs<TRes>
    implements CopyWith$Query$Clubs$clubs<TRes> {
  _CopyWithStubImpl$Query$Clubs$clubs(this._res);

  TRes _res;

  call({
    List<Query$Clubs$clubs$nodes>? nodes,
    Query$Clubs$clubs$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$Clubs$clubs$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$Clubs$clubs$pageInfo.stub(_res);
}

class Query$Clubs$clubs$nodes {
  Query$Clubs$clubs$nodes({
    required this.id,
    required this.name,
    this.description,
    required this.location,
    this.website,
    required this.status,
    this.settings,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Club',
  });

  factory Query$Clubs$clubs$nodes.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$location = json['location'];
    final l$website = json['website'];
    final l$status = json['status'];
    final l$settings = json['settings'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$Clubs$clubs$nodes(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String?),
      location: (l$location as String),
      website: (l$website as String?),
      status: fromJson$Enum$ClubStatus((l$status as String)),
      settings: l$settings == null
          ? null
          : Query$Clubs$clubs$nodes$settings.fromJson(
              (l$settings as Map<String, dynamic>),
            ),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? description;

  final String location;

  final String? website;

  final Enum$ClubStatus status;

  final Query$Clubs$clubs$nodes$settings? settings;

  final DateTime createdAt;

  final DateTime updatedAt;

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
    final l$website = website;
    _resultData['website'] = l$website;
    final l$status = status;
    _resultData['status'] = toJson$Enum$ClubStatus(l$status);
    final l$settings = settings;
    _resultData['settings'] = l$settings?.toJson();
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
    final l$description = description;
    final l$location = location;
    final l$website = website;
    final l$status = status;
    final l$settings = settings;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$location,
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
    if (other is! Query$Clubs$clubs$nodes || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Clubs$clubs$nodes on Query$Clubs$clubs$nodes {
  CopyWith$Query$Clubs$clubs$nodes<Query$Clubs$clubs$nodes> get copyWith =>
      CopyWith$Query$Clubs$clubs$nodes(this, (i) => i);
}

abstract class CopyWith$Query$Clubs$clubs$nodes<TRes> {
  factory CopyWith$Query$Clubs$clubs$nodes(
    Query$Clubs$clubs$nodes instance,
    TRes Function(Query$Clubs$clubs$nodes) then,
  ) = _CopyWithImpl$Query$Clubs$clubs$nodes;

  factory CopyWith$Query$Clubs$clubs$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$Clubs$clubs$nodes;

  TRes call({
    String? id,
    String? name,
    String? description,
    String? location,
    String? website,
    Enum$ClubStatus? status,
    Query$Clubs$clubs$nodes$settings? settings,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
  CopyWith$Query$Clubs$clubs$nodes$settings<TRes> get settings;
}

class _CopyWithImpl$Query$Clubs$clubs$nodes<TRes>
    implements CopyWith$Query$Clubs$clubs$nodes<TRes> {
  _CopyWithImpl$Query$Clubs$clubs$nodes(this._instance, this._then);

  final Query$Clubs$clubs$nodes _instance;

  final TRes Function(Query$Clubs$clubs$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? location = _undefined,
    Object? website = _undefined,
    Object? status = _undefined,
    Object? settings = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Clubs$clubs$nodes(
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
      website: website == _undefined ? _instance.website : (website as String?),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$ClubStatus),
      settings: settings == _undefined
          ? _instance.settings
          : (settings as Query$Clubs$clubs$nodes$settings?),
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

  CopyWith$Query$Clubs$clubs$nodes$settings<TRes> get settings {
    final local$settings = _instance.settings;
    return local$settings == null
        ? CopyWith$Query$Clubs$clubs$nodes$settings.stub(_then(_instance))
        : CopyWith$Query$Clubs$clubs$nodes$settings(
            local$settings,
            (e) => call(settings: e),
          );
  }
}

class _CopyWithStubImpl$Query$Clubs$clubs$nodes<TRes>
    implements CopyWith$Query$Clubs$clubs$nodes<TRes> {
  _CopyWithStubImpl$Query$Clubs$clubs$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    String? location,
    String? website,
    Enum$ClubStatus? status,
    Query$Clubs$clubs$nodes$settings? settings,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Clubs$clubs$nodes$settings<TRes> get settings =>
      CopyWith$Query$Clubs$clubs$nodes$settings.stub(_res);
}

class Query$Clubs$clubs$nodes$settings {
  Query$Clubs$clubs$nodes$settings({
    required this.allowReciprocal,
    required this.requireApproval,
    required this.maxVisitsPerMonth,
    this.reciprocalFee,
    this.$__typename = 'ClubSettings',
  });

  factory Query$Clubs$clubs$nodes$settings.fromJson(Map<String, dynamic> json) {
    final l$allowReciprocal = json['allowReciprocal'];
    final l$requireApproval = json['requireApproval'];
    final l$maxVisitsPerMonth = json['maxVisitsPerMonth'];
    final l$reciprocalFee = json['reciprocalFee'];
    final l$$__typename = json['__typename'];
    return Query$Clubs$clubs$nodes$settings(
      allowReciprocal: (l$allowReciprocal as bool),
      requireApproval: (l$requireApproval as bool),
      maxVisitsPerMonth: (l$maxVisitsPerMonth as int),
      reciprocalFee: (l$reciprocalFee as num?)?.toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final bool allowReciprocal;

  final bool requireApproval;

  final int maxVisitsPerMonth;

  final double? reciprocalFee;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$allowReciprocal = allowReciprocal;
    _resultData['allowReciprocal'] = l$allowReciprocal;
    final l$requireApproval = requireApproval;
    _resultData['requireApproval'] = l$requireApproval;
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    _resultData['maxVisitsPerMonth'] = l$maxVisitsPerMonth;
    final l$reciprocalFee = reciprocalFee;
    _resultData['reciprocalFee'] = l$reciprocalFee;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$allowReciprocal = allowReciprocal;
    final l$requireApproval = requireApproval;
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    final l$reciprocalFee = reciprocalFee;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$allowReciprocal,
      l$requireApproval,
      l$maxVisitsPerMonth,
      l$reciprocalFee,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Clubs$clubs$nodes$settings ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$allowReciprocal = allowReciprocal;
    final lOther$allowReciprocal = other.allowReciprocal;
    if (l$allowReciprocal != lOther$allowReciprocal) {
      return false;
    }
    final l$requireApproval = requireApproval;
    final lOther$requireApproval = other.requireApproval;
    if (l$requireApproval != lOther$requireApproval) {
      return false;
    }
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    final lOther$maxVisitsPerMonth = other.maxVisitsPerMonth;
    if (l$maxVisitsPerMonth != lOther$maxVisitsPerMonth) {
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

extension UtilityExtension$Query$Clubs$clubs$nodes$settings
    on Query$Clubs$clubs$nodes$settings {
  CopyWith$Query$Clubs$clubs$nodes$settings<Query$Clubs$clubs$nodes$settings>
  get copyWith => CopyWith$Query$Clubs$clubs$nodes$settings(this, (i) => i);
}

abstract class CopyWith$Query$Clubs$clubs$nodes$settings<TRes> {
  factory CopyWith$Query$Clubs$clubs$nodes$settings(
    Query$Clubs$clubs$nodes$settings instance,
    TRes Function(Query$Clubs$clubs$nodes$settings) then,
  ) = _CopyWithImpl$Query$Clubs$clubs$nodes$settings;

  factory CopyWith$Query$Clubs$clubs$nodes$settings.stub(TRes res) =
      _CopyWithStubImpl$Query$Clubs$clubs$nodes$settings;

  TRes call({
    bool? allowReciprocal,
    bool? requireApproval,
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Clubs$clubs$nodes$settings<TRes>
    implements CopyWith$Query$Clubs$clubs$nodes$settings<TRes> {
  _CopyWithImpl$Query$Clubs$clubs$nodes$settings(this._instance, this._then);

  final Query$Clubs$clubs$nodes$settings _instance;

  final TRes Function(Query$Clubs$clubs$nodes$settings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? allowReciprocal = _undefined,
    Object? requireApproval = _undefined,
    Object? maxVisitsPerMonth = _undefined,
    Object? reciprocalFee = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Clubs$clubs$nodes$settings(
      allowReciprocal: allowReciprocal == _undefined || allowReciprocal == null
          ? _instance.allowReciprocal
          : (allowReciprocal as bool),
      requireApproval: requireApproval == _undefined || requireApproval == null
          ? _instance.requireApproval
          : (requireApproval as bool),
      maxVisitsPerMonth:
          maxVisitsPerMonth == _undefined || maxVisitsPerMonth == null
          ? _instance.maxVisitsPerMonth
          : (maxVisitsPerMonth as int),
      reciprocalFee: reciprocalFee == _undefined
          ? _instance.reciprocalFee
          : (reciprocalFee as double?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Clubs$clubs$nodes$settings<TRes>
    implements CopyWith$Query$Clubs$clubs$nodes$settings<TRes> {
  _CopyWithStubImpl$Query$Clubs$clubs$nodes$settings(this._res);

  TRes _res;

  call({
    bool? allowReciprocal,
    bool? requireApproval,
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    String? $__typename,
  }) => _res;
}

class Query$Clubs$clubs$pageInfo {
  Query$Clubs$clubs$pageInfo({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$Clubs$clubs$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$pageSize = json['pageSize'];
    final l$total = json['total'];
    final l$totalPages = json['totalPages'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPrevPage = json['hasPrevPage'];
    final l$$__typename = json['__typename'];
    return Query$Clubs$clubs$pageInfo(
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
    if (other is! Query$Clubs$clubs$pageInfo ||
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

extension UtilityExtension$Query$Clubs$clubs$pageInfo
    on Query$Clubs$clubs$pageInfo {
  CopyWith$Query$Clubs$clubs$pageInfo<Query$Clubs$clubs$pageInfo>
  get copyWith => CopyWith$Query$Clubs$clubs$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$Clubs$clubs$pageInfo<TRes> {
  factory CopyWith$Query$Clubs$clubs$pageInfo(
    Query$Clubs$clubs$pageInfo instance,
    TRes Function(Query$Clubs$clubs$pageInfo) then,
  ) = _CopyWithImpl$Query$Clubs$clubs$pageInfo;

  factory CopyWith$Query$Clubs$clubs$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$Clubs$clubs$pageInfo;

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

class _CopyWithImpl$Query$Clubs$clubs$pageInfo<TRes>
    implements CopyWith$Query$Clubs$clubs$pageInfo<TRes> {
  _CopyWithImpl$Query$Clubs$clubs$pageInfo(this._instance, this._then);

  final Query$Clubs$clubs$pageInfo _instance;

  final TRes Function(Query$Clubs$clubs$pageInfo) _then;

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
    Query$Clubs$clubs$pageInfo(
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

class _CopyWithStubImpl$Query$Clubs$clubs$pageInfo<TRes>
    implements CopyWith$Query$Clubs$clubs$pageInfo<TRes> {
  _CopyWithStubImpl$Query$Clubs$clubs$pageInfo(this._res);

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
