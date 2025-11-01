import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Facilities {
  factory Variables$Query$Facilities({
    Input$FacilityFilterInput? filter,
    Input$PaginationInput? pagination,
  }) => Variables$Query$Facilities._({
    if (filter != null) r'filter': filter,
    if (pagination != null) r'pagination': pagination,
  });

  Variables$Query$Facilities._(this._$data);

  factory Variables$Query$Facilities.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('filter')) {
      final l$filter = data['filter'];
      result$data['filter'] = l$filter == null
          ? null
          : Input$FacilityFilterInput.fromJson(
              (l$filter as Map<String, dynamic>),
            );
    }
    if (data.containsKey('pagination')) {
      final l$pagination = data['pagination'];
      result$data['pagination'] = l$pagination == null
          ? null
          : Input$PaginationInput.fromJson(
              (l$pagination as Map<String, dynamic>),
            );
    }
    return Variables$Query$Facilities._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$FacilityFilterInput? get filter =>
      (_$data['filter'] as Input$FacilityFilterInput?);

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('filter')) {
      final l$filter = filter;
      result$data['filter'] = l$filter?.toJson();
    }
    if (_$data.containsKey('pagination')) {
      final l$pagination = pagination;
      result$data['pagination'] = l$pagination?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$Facilities<Variables$Query$Facilities>
  get copyWith => CopyWith$Variables$Query$Facilities(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Facilities ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$filter = filter;
    final lOther$filter = other.filter;
    if (_$data.containsKey('filter') != other._$data.containsKey('filter')) {
      return false;
    }
    if (l$filter != lOther$filter) {
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
    final l$filter = filter;
    final l$pagination = pagination;
    return Object.hashAll([
      _$data.containsKey('filter') ? l$filter : const {},
      _$data.containsKey('pagination') ? l$pagination : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$Facilities<TRes> {
  factory CopyWith$Variables$Query$Facilities(
    Variables$Query$Facilities instance,
    TRes Function(Variables$Query$Facilities) then,
  ) = _CopyWithImpl$Variables$Query$Facilities;

  factory CopyWith$Variables$Query$Facilities.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Facilities;

  TRes call({
    Input$FacilityFilterInput? filter,
    Input$PaginationInput? pagination,
  });
}

class _CopyWithImpl$Variables$Query$Facilities<TRes>
    implements CopyWith$Variables$Query$Facilities<TRes> {
  _CopyWithImpl$Variables$Query$Facilities(this._instance, this._then);

  final Variables$Query$Facilities _instance;

  final TRes Function(Variables$Query$Facilities) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? filter = _undefined, Object? pagination = _undefined}) =>
      _then(
        Variables$Query$Facilities._({
          ..._instance._$data,
          if (filter != _undefined)
            'filter': (filter as Input$FacilityFilterInput?),
          if (pagination != _undefined)
            'pagination': (pagination as Input$PaginationInput?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$Facilities<TRes>
    implements CopyWith$Variables$Query$Facilities<TRes> {
  _CopyWithStubImpl$Variables$Query$Facilities(this._res);

  TRes _res;

  call({
    Input$FacilityFilterInput? filter,
    Input$PaginationInput? pagination,
  }) => _res;
}

class Query$Facilities {
  Query$Facilities({required this.facilities, this.$__typename = 'Query'});

  factory Query$Facilities.fromJson(Map<String, dynamic> json) {
    final l$facilities = json['facilities'];
    final l$$__typename = json['__typename'];
    return Query$Facilities(
      facilities: Query$Facilities$facilities.fromJson(
        (l$facilities as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Facilities$facilities facilities;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$facilities = facilities;
    _resultData['facilities'] = l$facilities.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$facilities = facilities;
    final l$$__typename = $__typename;
    return Object.hashAll([l$facilities, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Facilities || runtimeType != other.runtimeType) {
      return false;
    }
    final l$facilities = facilities;
    final lOther$facilities = other.facilities;
    if (l$facilities != lOther$facilities) {
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

extension UtilityExtension$Query$Facilities on Query$Facilities {
  CopyWith$Query$Facilities<Query$Facilities> get copyWith =>
      CopyWith$Query$Facilities(this, (i) => i);
}

abstract class CopyWith$Query$Facilities<TRes> {
  factory CopyWith$Query$Facilities(
    Query$Facilities instance,
    TRes Function(Query$Facilities) then,
  ) = _CopyWithImpl$Query$Facilities;

  factory CopyWith$Query$Facilities.stub(TRes res) =
      _CopyWithStubImpl$Query$Facilities;

  TRes call({Query$Facilities$facilities? facilities, String? $__typename});
  CopyWith$Query$Facilities$facilities<TRes> get facilities;
}

class _CopyWithImpl$Query$Facilities<TRes>
    implements CopyWith$Query$Facilities<TRes> {
  _CopyWithImpl$Query$Facilities(this._instance, this._then);

  final Query$Facilities _instance;

  final TRes Function(Query$Facilities) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? facilities = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Facilities(
      facilities: facilities == _undefined || facilities == null
          ? _instance.facilities
          : (facilities as Query$Facilities$facilities),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Facilities$facilities<TRes> get facilities {
    final local$facilities = _instance.facilities;
    return CopyWith$Query$Facilities$facilities(
      local$facilities,
      (e) => call(facilities: e),
    );
  }
}

class _CopyWithStubImpl$Query$Facilities<TRes>
    implements CopyWith$Query$Facilities<TRes> {
  _CopyWithStubImpl$Query$Facilities(this._res);

  TRes _res;

  call({Query$Facilities$facilities? facilities, String? $__typename}) => _res;

  CopyWith$Query$Facilities$facilities<TRes> get facilities =>
      CopyWith$Query$Facilities$facilities.stub(_res);
}

const documentNodeQueryFacilities = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Facilities'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'filter')),
          type: NamedTypeNode(
            name: NameNode(value: 'FacilityFilterInput'),
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
            name: NameNode(value: 'facilities'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: VariableNode(name: NameNode(value: 'filter')),
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
                        name: NameNode(value: 'clubId'),
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
                        name: NameNode(value: 'type'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'capacity'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'amenities'),
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
                        name: NameNode(value: 'minBookingDuration'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'maxBookingDuration'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'advanceBookingDays'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'cancellationDeadline'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'operatingHours'),
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
Query$Facilities _parserFn$Query$Facilities(Map<String, dynamic> data) =>
    Query$Facilities.fromJson(data);
typedef OnQueryComplete$Query$Facilities =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Facilities?);

class Options$Query$Facilities extends graphql.QueryOptions<Query$Facilities> {
  Options$Query$Facilities({
    String? operationName,
    Variables$Query$Facilities? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Facilities? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Facilities? onComplete,
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
                 data == null ? null : _parserFn$Query$Facilities(data),
               ),
         onError: onError,
         document: documentNodeQueryFacilities,
         parserFn: _parserFn$Query$Facilities,
       );

  final OnQueryComplete$Query$Facilities? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Facilities
    extends graphql.WatchQueryOptions<Query$Facilities> {
  WatchOptions$Query$Facilities({
    String? operationName,
    Variables$Query$Facilities? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Facilities? typedOptimisticResult,
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
         document: documentNodeQueryFacilities,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Facilities,
       );
}

class FetchMoreOptions$Query$Facilities extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Facilities({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$Facilities? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryFacilities,
       );
}

extension ClientExtension$Query$Facilities on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Facilities>> query$Facilities([
    Options$Query$Facilities? options,
  ]) async => await this.query(options ?? Options$Query$Facilities());

  graphql.ObservableQuery<Query$Facilities> watchQuery$Facilities([
    WatchOptions$Query$Facilities? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$Facilities());

  void writeQuery$Facilities({
    required Query$Facilities data,
    Variables$Query$Facilities? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryFacilities),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$Facilities? readQuery$Facilities({
    Variables$Query$Facilities? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryFacilities),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Facilities.fromJson(result);
  }
}

class Query$Facilities$facilities {
  Query$Facilities$facilities({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'FacilityConnection',
  });

  factory Query$Facilities$facilities.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$Facilities$facilities(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$Facilities$facilities$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$Facilities$facilities$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Facilities$facilities$nodes> nodes;

  final Query$Facilities$facilities$pageInfo pageInfo;

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
    if (other is! Query$Facilities$facilities ||
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

extension UtilityExtension$Query$Facilities$facilities
    on Query$Facilities$facilities {
  CopyWith$Query$Facilities$facilities<Query$Facilities$facilities>
  get copyWith => CopyWith$Query$Facilities$facilities(this, (i) => i);
}

abstract class CopyWith$Query$Facilities$facilities<TRes> {
  factory CopyWith$Query$Facilities$facilities(
    Query$Facilities$facilities instance,
    TRes Function(Query$Facilities$facilities) then,
  ) = _CopyWithImpl$Query$Facilities$facilities;

  factory CopyWith$Query$Facilities$facilities.stub(TRes res) =
      _CopyWithStubImpl$Query$Facilities$facilities;

  TRes call({
    List<Query$Facilities$facilities$nodes>? nodes,
    Query$Facilities$facilities$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$Facilities$facilities$nodes> Function(
      Iterable<
        CopyWith$Query$Facilities$facilities$nodes<
          Query$Facilities$facilities$nodes
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$Facilities$facilities$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$Facilities$facilities<TRes>
    implements CopyWith$Query$Facilities$facilities<TRes> {
  _CopyWithImpl$Query$Facilities$facilities(this._instance, this._then);

  final Query$Facilities$facilities _instance;

  final TRes Function(Query$Facilities$facilities) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Facilities$facilities(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$Facilities$facilities$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$Facilities$facilities$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$Facilities$facilities$nodes> Function(
      Iterable<
        CopyWith$Query$Facilities$facilities$nodes<
          Query$Facilities$facilities$nodes
        >
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$Facilities$facilities$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$Facilities$facilities$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$Facilities$facilities$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$Facilities$facilities<TRes>
    implements CopyWith$Query$Facilities$facilities<TRes> {
  _CopyWithStubImpl$Query$Facilities$facilities(this._res);

  TRes _res;

  call({
    List<Query$Facilities$facilities$nodes>? nodes,
    Query$Facilities$facilities$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$Facilities$facilities$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$Facilities$facilities$pageInfo.stub(_res);
}

class Query$Facilities$facilities$nodes {
  Query$Facilities$facilities$nodes({
    required this.id,
    required this.clubId,
    required this.name,
    this.description,
    required this.type,
    this.capacity,
    this.amenities,
    required this.status,
    this.minBookingDuration,
    this.maxBookingDuration,
    this.advanceBookingDays,
    this.cancellationDeadline,
    this.operatingHours,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Facility',
  });

  factory Query$Facilities$facilities$nodes.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$type = json['type'];
    final l$capacity = json['capacity'];
    final l$amenities = json['amenities'];
    final l$status = json['status'];
    final l$minBookingDuration = json['minBookingDuration'];
    final l$maxBookingDuration = json['maxBookingDuration'];
    final l$advanceBookingDays = json['advanceBookingDays'];
    final l$cancellationDeadline = json['cancellationDeadline'];
    final l$operatingHours = json['operatingHours'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$Facilities$facilities$nodes(
      id: (l$id as String),
      clubId: (l$clubId as String),
      name: (l$name as String),
      description: (l$description as String?),
      type: fromJson$Enum$FacilityType((l$type as String)),
      capacity: (l$capacity as int?),
      amenities: (l$amenities as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList(),
      status: fromJson$Enum$FacilityStatus((l$status as String)),
      minBookingDuration: (l$minBookingDuration as int?),
      maxBookingDuration: (l$maxBookingDuration as int?),
      advanceBookingDays: (l$advanceBookingDays as int?),
      cancellationDeadline: (l$cancellationDeadline as int?),
      operatingHours: (l$operatingHours as String?),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String name;

  final String? description;

  final Enum$FacilityType type;

  final int? capacity;

  final List<String>? amenities;

  final Enum$FacilityStatus status;

  final int? minBookingDuration;

  final int? maxBookingDuration;

  final int? advanceBookingDays;

  final int? cancellationDeadline;

  final String? operatingHours;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$type = type;
    _resultData['type'] = toJson$Enum$FacilityType(l$type);
    final l$capacity = capacity;
    _resultData['capacity'] = l$capacity;
    final l$amenities = amenities;
    _resultData['amenities'] = l$amenities?.map((e) => e).toList();
    final l$status = status;
    _resultData['status'] = toJson$Enum$FacilityStatus(l$status);
    final l$minBookingDuration = minBookingDuration;
    _resultData['minBookingDuration'] = l$minBookingDuration;
    final l$maxBookingDuration = maxBookingDuration;
    _resultData['maxBookingDuration'] = l$maxBookingDuration;
    final l$advanceBookingDays = advanceBookingDays;
    _resultData['advanceBookingDays'] = l$advanceBookingDays;
    final l$cancellationDeadline = cancellationDeadline;
    _resultData['cancellationDeadline'] = l$cancellationDeadline;
    final l$operatingHours = operatingHours;
    _resultData['operatingHours'] = l$operatingHours;
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
    final l$clubId = clubId;
    final l$name = name;
    final l$description = description;
    final l$type = type;
    final l$capacity = capacity;
    final l$amenities = amenities;
    final l$status = status;
    final l$minBookingDuration = minBookingDuration;
    final l$maxBookingDuration = maxBookingDuration;
    final l$advanceBookingDays = advanceBookingDays;
    final l$cancellationDeadline = cancellationDeadline;
    final l$operatingHours = operatingHours;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$name,
      l$description,
      l$type,
      l$capacity,
      l$amenities == null ? null : Object.hashAll(l$amenities.map((v) => v)),
      l$status,
      l$minBookingDuration,
      l$maxBookingDuration,
      l$advanceBookingDays,
      l$cancellationDeadline,
      l$operatingHours,
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
    if (other is! Query$Facilities$facilities$nodes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clubId = clubId;
    final lOther$clubId = other.clubId;
    if (l$clubId != lOther$clubId) {
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
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$capacity = capacity;
    final lOther$capacity = other.capacity;
    if (l$capacity != lOther$capacity) {
      return false;
    }
    final l$amenities = amenities;
    final lOther$amenities = other.amenities;
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
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$minBookingDuration = minBookingDuration;
    final lOther$minBookingDuration = other.minBookingDuration;
    if (l$minBookingDuration != lOther$minBookingDuration) {
      return false;
    }
    final l$maxBookingDuration = maxBookingDuration;
    final lOther$maxBookingDuration = other.maxBookingDuration;
    if (l$maxBookingDuration != lOther$maxBookingDuration) {
      return false;
    }
    final l$advanceBookingDays = advanceBookingDays;
    final lOther$advanceBookingDays = other.advanceBookingDays;
    if (l$advanceBookingDays != lOther$advanceBookingDays) {
      return false;
    }
    final l$cancellationDeadline = cancellationDeadline;
    final lOther$cancellationDeadline = other.cancellationDeadline;
    if (l$cancellationDeadline != lOther$cancellationDeadline) {
      return false;
    }
    final l$operatingHours = operatingHours;
    final lOther$operatingHours = other.operatingHours;
    if (l$operatingHours != lOther$operatingHours) {
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

extension UtilityExtension$Query$Facilities$facilities$nodes
    on Query$Facilities$facilities$nodes {
  CopyWith$Query$Facilities$facilities$nodes<Query$Facilities$facilities$nodes>
  get copyWith => CopyWith$Query$Facilities$facilities$nodes(this, (i) => i);
}

abstract class CopyWith$Query$Facilities$facilities$nodes<TRes> {
  factory CopyWith$Query$Facilities$facilities$nodes(
    Query$Facilities$facilities$nodes instance,
    TRes Function(Query$Facilities$facilities$nodes) then,
  ) = _CopyWithImpl$Query$Facilities$facilities$nodes;

  factory CopyWith$Query$Facilities$facilities$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$Facilities$facilities$nodes;

  TRes call({
    String? id,
    String? clubId,
    String? name,
    String? description,
    Enum$FacilityType? type,
    int? capacity,
    List<String>? amenities,
    Enum$FacilityStatus? status,
    int? minBookingDuration,
    int? maxBookingDuration,
    int? advanceBookingDays,
    int? cancellationDeadline,
    String? operatingHours,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Facilities$facilities$nodes<TRes>
    implements CopyWith$Query$Facilities$facilities$nodes<TRes> {
  _CopyWithImpl$Query$Facilities$facilities$nodes(this._instance, this._then);

  final Query$Facilities$facilities$nodes _instance;

  final TRes Function(Query$Facilities$facilities$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? type = _undefined,
    Object? capacity = _undefined,
    Object? amenities = _undefined,
    Object? status = _undefined,
    Object? minBookingDuration = _undefined,
    Object? maxBookingDuration = _undefined,
    Object? advanceBookingDays = _undefined,
    Object? cancellationDeadline = _undefined,
    Object? operatingHours = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Facilities$facilities$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$FacilityType),
      capacity: capacity == _undefined
          ? _instance.capacity
          : (capacity as int?),
      amenities: amenities == _undefined
          ? _instance.amenities
          : (amenities as List<String>?),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$FacilityStatus),
      minBookingDuration: minBookingDuration == _undefined
          ? _instance.minBookingDuration
          : (minBookingDuration as int?),
      maxBookingDuration: maxBookingDuration == _undefined
          ? _instance.maxBookingDuration
          : (maxBookingDuration as int?),
      advanceBookingDays: advanceBookingDays == _undefined
          ? _instance.advanceBookingDays
          : (advanceBookingDays as int?),
      cancellationDeadline: cancellationDeadline == _undefined
          ? _instance.cancellationDeadline
          : (cancellationDeadline as int?),
      operatingHours: operatingHours == _undefined
          ? _instance.operatingHours
          : (operatingHours as String?),
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
}

class _CopyWithStubImpl$Query$Facilities$facilities$nodes<TRes>
    implements CopyWith$Query$Facilities$facilities$nodes<TRes> {
  _CopyWithStubImpl$Query$Facilities$facilities$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? name,
    String? description,
    Enum$FacilityType? type,
    int? capacity,
    List<String>? amenities,
    Enum$FacilityStatus? status,
    int? minBookingDuration,
    int? maxBookingDuration,
    int? advanceBookingDays,
    int? cancellationDeadline,
    String? operatingHours,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;
}

class Query$Facilities$facilities$pageInfo {
  Query$Facilities$facilities$pageInfo({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$Facilities$facilities$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$page = json['page'];
    final l$pageSize = json['pageSize'];
    final l$total = json['total'];
    final l$totalPages = json['totalPages'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPrevPage = json['hasPrevPage'];
    final l$$__typename = json['__typename'];
    return Query$Facilities$facilities$pageInfo(
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
    if (other is! Query$Facilities$facilities$pageInfo ||
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

extension UtilityExtension$Query$Facilities$facilities$pageInfo
    on Query$Facilities$facilities$pageInfo {
  CopyWith$Query$Facilities$facilities$pageInfo<
    Query$Facilities$facilities$pageInfo
  >
  get copyWith => CopyWith$Query$Facilities$facilities$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$Facilities$facilities$pageInfo<TRes> {
  factory CopyWith$Query$Facilities$facilities$pageInfo(
    Query$Facilities$facilities$pageInfo instance,
    TRes Function(Query$Facilities$facilities$pageInfo) then,
  ) = _CopyWithImpl$Query$Facilities$facilities$pageInfo;

  factory CopyWith$Query$Facilities$facilities$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$Facilities$facilities$pageInfo;

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

class _CopyWithImpl$Query$Facilities$facilities$pageInfo<TRes>
    implements CopyWith$Query$Facilities$facilities$pageInfo<TRes> {
  _CopyWithImpl$Query$Facilities$facilities$pageInfo(
    this._instance,
    this._then,
  );

  final Query$Facilities$facilities$pageInfo _instance;

  final TRes Function(Query$Facilities$facilities$pageInfo) _then;

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
    Query$Facilities$facilities$pageInfo(
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

class _CopyWithStubImpl$Query$Facilities$facilities$pageInfo<TRes>
    implements CopyWith$Query$Facilities$facilities$pageInfo<TRes> {
  _CopyWithStubImpl$Query$Facilities$facilities$pageInfo(this._res);

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
