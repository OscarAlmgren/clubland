import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Bookings {
  factory Variables$Query$Bookings({
    Input$BookingFilterInput? filter,
    Input$PaginationInput? pagination,
  }) => Variables$Query$Bookings._({
    if (filter != null) r'filter': filter,
    if (pagination != null) r'pagination': pagination,
  });

  Variables$Query$Bookings._(this._$data);

  factory Variables$Query$Bookings.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('filter')) {
      final l$filter = data['filter'];
      result$data['filter'] = l$filter == null
          ? null
          : Input$BookingFilterInput.fromJson(
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
    return Variables$Query$Bookings._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$BookingFilterInput? get filter =>
      (_$data['filter'] as Input$BookingFilterInput?);

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

  CopyWith$Variables$Query$Bookings<Variables$Query$Bookings> get copyWith =>
      CopyWith$Variables$Query$Bookings(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Bookings ||
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

abstract class CopyWith$Variables$Query$Bookings<TRes> {
  factory CopyWith$Variables$Query$Bookings(
    Variables$Query$Bookings instance,
    TRes Function(Variables$Query$Bookings) then,
  ) = _CopyWithImpl$Variables$Query$Bookings;

  factory CopyWith$Variables$Query$Bookings.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Bookings;

  TRes call({
    Input$BookingFilterInput? filter,
    Input$PaginationInput? pagination,
  });
}

class _CopyWithImpl$Variables$Query$Bookings<TRes>
    implements CopyWith$Variables$Query$Bookings<TRes> {
  _CopyWithImpl$Variables$Query$Bookings(this._instance, this._then);

  final Variables$Query$Bookings _instance;

  final TRes Function(Variables$Query$Bookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? filter = _undefined, Object? pagination = _undefined}) =>
      _then(
        Variables$Query$Bookings._({
          ..._instance._$data,
          if (filter != _undefined)
            'filter': (filter as Input$BookingFilterInput?),
          if (pagination != _undefined)
            'pagination': (pagination as Input$PaginationInput?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$Bookings<TRes>
    implements CopyWith$Variables$Query$Bookings<TRes> {
  _CopyWithStubImpl$Variables$Query$Bookings(this._res);

  TRes _res;

  call({Input$BookingFilterInput? filter, Input$PaginationInput? pagination}) =>
      _res;
}

class Query$Bookings {
  Query$Bookings({required this.bookings, this.$__typename = 'Query'});

  factory Query$Bookings.fromJson(Map<String, dynamic> json) {
    final l$bookings = json['bookings'];
    final l$$__typename = json['__typename'];
    return Query$Bookings(
      bookings: Query$Bookings$bookings.fromJson(
        (l$bookings as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Bookings$bookings bookings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$bookings = bookings;
    _resultData['bookings'] = l$bookings.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$bookings = bookings;
    final l$$__typename = $__typename;
    return Object.hashAll([l$bookings, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Bookings || runtimeType != other.runtimeType) {
      return false;
    }
    final l$bookings = bookings;
    final lOther$bookings = other.bookings;
    if (l$bookings != lOther$bookings) {
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

extension UtilityExtension$Query$Bookings on Query$Bookings {
  CopyWith$Query$Bookings<Query$Bookings> get copyWith =>
      CopyWith$Query$Bookings(this, (i) => i);
}

abstract class CopyWith$Query$Bookings<TRes> {
  factory CopyWith$Query$Bookings(
    Query$Bookings instance,
    TRes Function(Query$Bookings) then,
  ) = _CopyWithImpl$Query$Bookings;

  factory CopyWith$Query$Bookings.stub(TRes res) =
      _CopyWithStubImpl$Query$Bookings;

  TRes call({Query$Bookings$bookings? bookings, String? $__typename});
  CopyWith$Query$Bookings$bookings<TRes> get bookings;
}

class _CopyWithImpl$Query$Bookings<TRes>
    implements CopyWith$Query$Bookings<TRes> {
  _CopyWithImpl$Query$Bookings(this._instance, this._then);

  final Query$Bookings _instance;

  final TRes Function(Query$Bookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? bookings = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Bookings(
      bookings: bookings == _undefined || bookings == null
          ? _instance.bookings
          : (bookings as Query$Bookings$bookings),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Bookings$bookings<TRes> get bookings {
    final local$bookings = _instance.bookings;
    return CopyWith$Query$Bookings$bookings(
      local$bookings,
      (e) => call(bookings: e),
    );
  }
}

class _CopyWithStubImpl$Query$Bookings<TRes>
    implements CopyWith$Query$Bookings<TRes> {
  _CopyWithStubImpl$Query$Bookings(this._res);

  TRes _res;

  call({Query$Bookings$bookings? bookings, String? $__typename}) => _res;

  CopyWith$Query$Bookings$bookings<TRes> get bookings =>
      CopyWith$Query$Bookings$bookings.stub(_res);
}

const documentNodeQueryBookings = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Bookings'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'filter')),
          type: NamedTypeNode(
            name: NameNode(value: 'BookingFilterInput'),
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
            name: NameNode(value: 'bookings'),
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
                        name: NameNode(value: 'facilityId'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'userId'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'facility'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'name'),
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
                        name: NameNode(value: 'user'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
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
                        name: NameNode(value: 'startTime'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'endTime'),
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
                        name: NameNode(value: 'notes'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'participants'),
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
Query$Bookings _parserFn$Query$Bookings(Map<String, dynamic> data) =>
    Query$Bookings.fromJson(data);
typedef OnQueryComplete$Query$Bookings =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Bookings?);

class Options$Query$Bookings extends graphql.QueryOptions<Query$Bookings> {
  Options$Query$Bookings({
    String? operationName,
    Variables$Query$Bookings? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Bookings? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Bookings? onComplete,
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
                 data == null ? null : _parserFn$Query$Bookings(data),
               ),
         onError: onError,
         document: documentNodeQueryBookings,
         parserFn: _parserFn$Query$Bookings,
       );

  final OnQueryComplete$Query$Bookings? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Bookings
    extends graphql.WatchQueryOptions<Query$Bookings> {
  WatchOptions$Query$Bookings({
    String? operationName,
    Variables$Query$Bookings? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Bookings? typedOptimisticResult,
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
         document: documentNodeQueryBookings,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Bookings,
       );
}

class FetchMoreOptions$Query$Bookings extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Bookings({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$Bookings? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryBookings,
       );
}

extension ClientExtension$Query$Bookings on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Bookings>> query$Bookings([
    Options$Query$Bookings? options,
  ]) async => await this.query(options ?? Options$Query$Bookings());

  graphql.ObservableQuery<Query$Bookings> watchQuery$Bookings([
    WatchOptions$Query$Bookings? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$Bookings());

  void writeQuery$Bookings({
    required Query$Bookings data,
    Variables$Query$Bookings? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryBookings),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$Bookings? readQuery$Bookings({
    Variables$Query$Bookings? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryBookings),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Bookings.fromJson(result);
  }
}

class Query$Bookings$bookings {
  Query$Bookings$bookings({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'BookingConnection',
  });

  factory Query$Bookings$bookings.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$Bookings$bookings(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$Bookings$bookings$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$Bookings$bookings$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Bookings$bookings$nodes> nodes;

  final Query$Bookings$bookings$pageInfo pageInfo;

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
    if (other is! Query$Bookings$bookings || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Bookings$bookings on Query$Bookings$bookings {
  CopyWith$Query$Bookings$bookings<Query$Bookings$bookings> get copyWith =>
      CopyWith$Query$Bookings$bookings(this, (i) => i);
}

abstract class CopyWith$Query$Bookings$bookings<TRes> {
  factory CopyWith$Query$Bookings$bookings(
    Query$Bookings$bookings instance,
    TRes Function(Query$Bookings$bookings) then,
  ) = _CopyWithImpl$Query$Bookings$bookings;

  factory CopyWith$Query$Bookings$bookings.stub(TRes res) =
      _CopyWithStubImpl$Query$Bookings$bookings;

  TRes call({
    List<Query$Bookings$bookings$nodes>? nodes,
    Query$Bookings$bookings$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$Bookings$bookings$nodes> Function(
      Iterable<
        CopyWith$Query$Bookings$bookings$nodes<Query$Bookings$bookings$nodes>
      >,
    )
    _fn,
  );
  CopyWith$Query$Bookings$bookings$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$Bookings$bookings<TRes>
    implements CopyWith$Query$Bookings$bookings<TRes> {
  _CopyWithImpl$Query$Bookings$bookings(this._instance, this._then);

  final Query$Bookings$bookings _instance;

  final TRes Function(Query$Bookings$bookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Bookings$bookings(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$Bookings$bookings$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$Bookings$bookings$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$Bookings$bookings$nodes> Function(
      Iterable<
        CopyWith$Query$Bookings$bookings$nodes<Query$Bookings$bookings$nodes>
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$Bookings$bookings$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$Bookings$bookings$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$Bookings$bookings$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$Bookings$bookings<TRes>
    implements CopyWith$Query$Bookings$bookings<TRes> {
  _CopyWithStubImpl$Query$Bookings$bookings(this._res);

  TRes _res;

  call({
    List<Query$Bookings$bookings$nodes>? nodes,
    Query$Bookings$bookings$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$Bookings$bookings$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$Bookings$bookings$pageInfo.stub(_res);
}

class Query$Bookings$bookings$nodes {
  Query$Bookings$bookings$nodes({
    required this.id,
    required this.facilityId,
    required this.userId,
    required this.facility,
    required this.user,
    required this.startTime,
    required this.endTime,
    required this.status,
    this.notes,
    this.participants,
    required this.createdAt,
    this.$__typename = 'Booking',
  });

  factory Query$Bookings$bookings$nodes.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$facilityId = json['facilityId'];
    final l$userId = json['userId'];
    final l$facility = json['facility'];
    final l$user = json['user'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$status = json['status'];
    final l$notes = json['notes'];
    final l$participants = json['participants'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$Bookings$bookings$nodes(
      id: (l$id as String),
      facilityId: (l$facilityId as String),
      userId: (l$userId as String),
      facility: Query$Bookings$bookings$nodes$facility.fromJson(
        (l$facility as Map<String, dynamic>),
      ),
      user: Query$Bookings$bookings$nodes$user.fromJson(
        (l$user as Map<String, dynamic>),
      ),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      notes: (l$notes as String?),
      participants: (l$participants as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList(),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String facilityId;

  final String userId;

  final Query$Bookings$bookings$nodes$facility facility;

  final Query$Bookings$bookings$nodes$user user;

  final DateTime startTime;

  final DateTime endTime;

  final Enum$BookingStatus status;

  final String? notes;

  final List<String>? participants;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$facilityId = facilityId;
    _resultData['facilityId'] = l$facilityId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$facility = facility;
    _resultData['facility'] = l$facility.toJson();
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime.toIso8601String();
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$participants = participants;
    _resultData['participants'] = l$participants?.map((e) => e).toList();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$facilityId = facilityId;
    final l$userId = userId;
    final l$facility = facility;
    final l$user = user;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$status = status;
    final l$notes = notes;
    final l$participants = participants;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$facilityId,
      l$userId,
      l$facility,
      l$user,
      l$startTime,
      l$endTime,
      l$status,
      l$notes,
      l$participants == null
          ? null
          : Object.hashAll(l$participants.map((v) => v)),
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Bookings$bookings$nodes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$facilityId = facilityId;
    final lOther$facilityId = other.facilityId;
    if (l$facilityId != lOther$facilityId) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$facility = facility;
    final lOther$facility = other.facility;
    if (l$facility != lOther$facility) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$startTime = startTime;
    final lOther$startTime = other.startTime;
    if (l$startTime != lOther$startTime) {
      return false;
    }
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (l$endTime != lOther$endTime) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$participants = participants;
    final lOther$participants = other.participants;
    if (l$participants != null && lOther$participants != null) {
      if (l$participants.length != lOther$participants.length) {
        return false;
      }
      for (int i = 0; i < l$participants.length; i++) {
        final l$participants$entry = l$participants[i];
        final lOther$participants$entry = lOther$participants[i];
        if (l$participants$entry != lOther$participants$entry) {
          return false;
        }
      }
    } else if (l$participants != lOther$participants) {
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

extension UtilityExtension$Query$Bookings$bookings$nodes
    on Query$Bookings$bookings$nodes {
  CopyWith$Query$Bookings$bookings$nodes<Query$Bookings$bookings$nodes>
  get copyWith => CopyWith$Query$Bookings$bookings$nodes(this, (i) => i);
}

abstract class CopyWith$Query$Bookings$bookings$nodes<TRes> {
  factory CopyWith$Query$Bookings$bookings$nodes(
    Query$Bookings$bookings$nodes instance,
    TRes Function(Query$Bookings$bookings$nodes) then,
  ) = _CopyWithImpl$Query$Bookings$bookings$nodes;

  factory CopyWith$Query$Bookings$bookings$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$Bookings$bookings$nodes;

  TRes call({
    String? id,
    String? facilityId,
    String? userId,
    Query$Bookings$bookings$nodes$facility? facility,
    Query$Bookings$bookings$nodes$user? user,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? notes,
    List<String>? participants,
    DateTime? createdAt,
    String? $__typename,
  });
  CopyWith$Query$Bookings$bookings$nodes$facility<TRes> get facility;
  CopyWith$Query$Bookings$bookings$nodes$user<TRes> get user;
}

class _CopyWithImpl$Query$Bookings$bookings$nodes<TRes>
    implements CopyWith$Query$Bookings$bookings$nodes<TRes> {
  _CopyWithImpl$Query$Bookings$bookings$nodes(this._instance, this._then);

  final Query$Bookings$bookings$nodes _instance;

  final TRes Function(Query$Bookings$bookings$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? facilityId = _undefined,
    Object? userId = _undefined,
    Object? facility = _undefined,
    Object? user = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? status = _undefined,
    Object? notes = _undefined,
    Object? participants = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Bookings$bookings$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      facilityId: facilityId == _undefined || facilityId == null
          ? _instance.facilityId
          : (facilityId as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      facility: facility == _undefined || facility == null
          ? _instance.facility
          : (facility as Query$Bookings$bookings$nodes$facility),
      user: user == _undefined || user == null
          ? _instance.user
          : (user as Query$Bookings$bookings$nodes$user),
      startTime: startTime == _undefined || startTime == null
          ? _instance.startTime
          : (startTime as DateTime),
      endTime: endTime == _undefined || endTime == null
          ? _instance.endTime
          : (endTime as DateTime),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$BookingStatus),
      notes: notes == _undefined ? _instance.notes : (notes as String?),
      participants: participants == _undefined
          ? _instance.participants
          : (participants as List<String>?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Bookings$bookings$nodes$facility<TRes> get facility {
    final local$facility = _instance.facility;
    return CopyWith$Query$Bookings$bookings$nodes$facility(
      local$facility,
      (e) => call(facility: e),
    );
  }

  CopyWith$Query$Bookings$bookings$nodes$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$Bookings$bookings$nodes$user(
      local$user,
      (e) => call(user: e),
    );
  }
}

class _CopyWithStubImpl$Query$Bookings$bookings$nodes<TRes>
    implements CopyWith$Query$Bookings$bookings$nodes<TRes> {
  _CopyWithStubImpl$Query$Bookings$bookings$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? facilityId,
    String? userId,
    Query$Bookings$bookings$nodes$facility? facility,
    Query$Bookings$bookings$nodes$user? user,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? notes,
    List<String>? participants,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Bookings$bookings$nodes$facility<TRes> get facility =>
      CopyWith$Query$Bookings$bookings$nodes$facility.stub(_res);

  CopyWith$Query$Bookings$bookings$nodes$user<TRes> get user =>
      CopyWith$Query$Bookings$bookings$nodes$user.stub(_res);
}

class Query$Bookings$bookings$nodes$facility {
  Query$Bookings$bookings$nodes$facility({
    required this.name,
    required this.type,
    this.$__typename = 'Facility',
  });

  factory Query$Bookings$bookings$nodes$facility.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$type = json['type'];
    final l$$__typename = json['__typename'];
    return Query$Bookings$bookings$nodes$facility(
      name: (l$name as String),
      type: fromJson$Enum$FacilityType((l$type as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final Enum$FacilityType type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$type = type;
    _resultData['type'] = toJson$Enum$FacilityType(l$type);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$type = type;
    final l$$__typename = $__typename;
    return Object.hashAll([l$name, l$type, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Bookings$bookings$nodes$facility ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
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

extension UtilityExtension$Query$Bookings$bookings$nodes$facility
    on Query$Bookings$bookings$nodes$facility {
  CopyWith$Query$Bookings$bookings$nodes$facility<
    Query$Bookings$bookings$nodes$facility
  >
  get copyWith =>
      CopyWith$Query$Bookings$bookings$nodes$facility(this, (i) => i);
}

abstract class CopyWith$Query$Bookings$bookings$nodes$facility<TRes> {
  factory CopyWith$Query$Bookings$bookings$nodes$facility(
    Query$Bookings$bookings$nodes$facility instance,
    TRes Function(Query$Bookings$bookings$nodes$facility) then,
  ) = _CopyWithImpl$Query$Bookings$bookings$nodes$facility;

  factory CopyWith$Query$Bookings$bookings$nodes$facility.stub(TRes res) =
      _CopyWithStubImpl$Query$Bookings$bookings$nodes$facility;

  TRes call({String? name, Enum$FacilityType? type, String? $__typename});
}

class _CopyWithImpl$Query$Bookings$bookings$nodes$facility<TRes>
    implements CopyWith$Query$Bookings$bookings$nodes$facility<TRes> {
  _CopyWithImpl$Query$Bookings$bookings$nodes$facility(
    this._instance,
    this._then,
  );

  final Query$Bookings$bookings$nodes$facility _instance;

  final TRes Function(Query$Bookings$bookings$nodes$facility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? type = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Bookings$bookings$nodes$facility(
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$FacilityType),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Bookings$bookings$nodes$facility<TRes>
    implements CopyWith$Query$Bookings$bookings$nodes$facility<TRes> {
  _CopyWithStubImpl$Query$Bookings$bookings$nodes$facility(this._res);

  TRes _res;

  call({String? name, Enum$FacilityType? type, String? $__typename}) => _res;
}

class Query$Bookings$bookings$nodes$user {
  Query$Bookings$bookings$nodes$user({
    this.firstName,
    this.lastName,
    this.$__typename = 'User',
  });

  factory Query$Bookings$bookings$nodes$user.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$$__typename = json['__typename'];
    return Query$Bookings$bookings$nodes$user(
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? firstName;

  final String? lastName;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$$__typename = $__typename;
    return Object.hashAll([l$firstName, l$lastName, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Bookings$bookings$nodes$user ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Bookings$bookings$nodes$user
    on Query$Bookings$bookings$nodes$user {
  CopyWith$Query$Bookings$bookings$nodes$user<
    Query$Bookings$bookings$nodes$user
  >
  get copyWith => CopyWith$Query$Bookings$bookings$nodes$user(this, (i) => i);
}

abstract class CopyWith$Query$Bookings$bookings$nodes$user<TRes> {
  factory CopyWith$Query$Bookings$bookings$nodes$user(
    Query$Bookings$bookings$nodes$user instance,
    TRes Function(Query$Bookings$bookings$nodes$user) then,
  ) = _CopyWithImpl$Query$Bookings$bookings$nodes$user;

  factory CopyWith$Query$Bookings$bookings$nodes$user.stub(TRes res) =
      _CopyWithStubImpl$Query$Bookings$bookings$nodes$user;

  TRes call({String? firstName, String? lastName, String? $__typename});
}

class _CopyWithImpl$Query$Bookings$bookings$nodes$user<TRes>
    implements CopyWith$Query$Bookings$bookings$nodes$user<TRes> {
  _CopyWithImpl$Query$Bookings$bookings$nodes$user(this._instance, this._then);

  final Query$Bookings$bookings$nodes$user _instance;

  final TRes Function(Query$Bookings$bookings$nodes$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Bookings$bookings$nodes$user(
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

class _CopyWithStubImpl$Query$Bookings$bookings$nodes$user<TRes>
    implements CopyWith$Query$Bookings$bookings$nodes$user<TRes> {
  _CopyWithStubImpl$Query$Bookings$bookings$nodes$user(this._res);

  TRes _res;

  call({String? firstName, String? lastName, String? $__typename}) => _res;
}

class Query$Bookings$bookings$pageInfo {
  Query$Bookings$bookings$pageInfo({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$Bookings$bookings$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$pageSize = json['pageSize'];
    final l$total = json['total'];
    final l$totalPages = json['totalPages'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPrevPage = json['hasPrevPage'];
    final l$$__typename = json['__typename'];
    return Query$Bookings$bookings$pageInfo(
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
    if (other is! Query$Bookings$bookings$pageInfo ||
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

extension UtilityExtension$Query$Bookings$bookings$pageInfo
    on Query$Bookings$bookings$pageInfo {
  CopyWith$Query$Bookings$bookings$pageInfo<Query$Bookings$bookings$pageInfo>
  get copyWith => CopyWith$Query$Bookings$bookings$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$Bookings$bookings$pageInfo<TRes> {
  factory CopyWith$Query$Bookings$bookings$pageInfo(
    Query$Bookings$bookings$pageInfo instance,
    TRes Function(Query$Bookings$bookings$pageInfo) then,
  ) = _CopyWithImpl$Query$Bookings$bookings$pageInfo;

  factory CopyWith$Query$Bookings$bookings$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$Bookings$bookings$pageInfo;

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

class _CopyWithImpl$Query$Bookings$bookings$pageInfo<TRes>
    implements CopyWith$Query$Bookings$bookings$pageInfo<TRes> {
  _CopyWithImpl$Query$Bookings$bookings$pageInfo(this._instance, this._then);

  final Query$Bookings$bookings$pageInfo _instance;

  final TRes Function(Query$Bookings$bookings$pageInfo) _then;

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
    Query$Bookings$bookings$pageInfo(
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

class _CopyWithStubImpl$Query$Bookings$bookings$pageInfo<TRes>
    implements CopyWith$Query$Bookings$bookings$pageInfo<TRes> {
  _CopyWithStubImpl$Query$Bookings$bookings$pageInfo(this._res);

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
