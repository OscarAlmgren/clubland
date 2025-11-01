import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$MyBookings {
  factory Variables$Query$MyBookings({
    Input$BookingFilterInput? filter,
    Input$PaginationInput? pagination,
  }) => Variables$Query$MyBookings._({
    if (filter != null) r'filter': filter,
    if (pagination != null) r'pagination': pagination,
  });

  Variables$Query$MyBookings._(this._$data);

  factory Variables$Query$MyBookings.fromJson(Map<String, dynamic> data) {
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
    return Variables$Query$MyBookings._(result$data);
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

  CopyWith$Variables$Query$MyBookings<Variables$Query$MyBookings>
  get copyWith => CopyWith$Variables$Query$MyBookings(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$MyBookings ||
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

abstract class CopyWith$Variables$Query$MyBookings<TRes> {
  factory CopyWith$Variables$Query$MyBookings(
    Variables$Query$MyBookings instance,
    TRes Function(Variables$Query$MyBookings) then,
  ) = _CopyWithImpl$Variables$Query$MyBookings;

  factory CopyWith$Variables$Query$MyBookings.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$MyBookings;

  TRes call({
    Input$BookingFilterInput? filter,
    Input$PaginationInput? pagination,
  });
}

class _CopyWithImpl$Variables$Query$MyBookings<TRes>
    implements CopyWith$Variables$Query$MyBookings<TRes> {
  _CopyWithImpl$Variables$Query$MyBookings(this._instance, this._then);

  final Variables$Query$MyBookings _instance;

  final TRes Function(Variables$Query$MyBookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? filter = _undefined, Object? pagination = _undefined}) =>
      _then(
        Variables$Query$MyBookings._({
          ..._instance._$data,
          if (filter != _undefined)
            'filter': (filter as Input$BookingFilterInput?),
          if (pagination != _undefined)
            'pagination': (pagination as Input$PaginationInput?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$MyBookings<TRes>
    implements CopyWith$Variables$Query$MyBookings<TRes> {
  _CopyWithStubImpl$Variables$Query$MyBookings(this._res);

  TRes _res;

  call({Input$BookingFilterInput? filter, Input$PaginationInput? pagination}) =>
      _res;
}

class Query$MyBookings {
  Query$MyBookings({required this.myBookings, this.$__typename = 'Query'});

  factory Query$MyBookings.fromJson(Map<String, dynamic> json) {
    final l$myBookings = json['myBookings'];
    final l$$__typename = json['__typename'];
    return Query$MyBookings(
      myBookings: Query$MyBookings$myBookings.fromJson(
        (l$myBookings as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MyBookings$myBookings myBookings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myBookings = myBookings;
    _resultData['myBookings'] = l$myBookings.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myBookings = myBookings;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myBookings, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyBookings || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myBookings = myBookings;
    final lOther$myBookings = other.myBookings;
    if (l$myBookings != lOther$myBookings) {
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

extension UtilityExtension$Query$MyBookings on Query$MyBookings {
  CopyWith$Query$MyBookings<Query$MyBookings> get copyWith =>
      CopyWith$Query$MyBookings(this, (i) => i);
}

abstract class CopyWith$Query$MyBookings<TRes> {
  factory CopyWith$Query$MyBookings(
    Query$MyBookings instance,
    TRes Function(Query$MyBookings) then,
  ) = _CopyWithImpl$Query$MyBookings;

  factory CopyWith$Query$MyBookings.stub(TRes res) =
      _CopyWithStubImpl$Query$MyBookings;

  TRes call({Query$MyBookings$myBookings? myBookings, String? $__typename});
  CopyWith$Query$MyBookings$myBookings<TRes> get myBookings;
}

class _CopyWithImpl$Query$MyBookings<TRes>
    implements CopyWith$Query$MyBookings<TRes> {
  _CopyWithImpl$Query$MyBookings(this._instance, this._then);

  final Query$MyBookings _instance;

  final TRes Function(Query$MyBookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? myBookings = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyBookings(
      myBookings: myBookings == _undefined || myBookings == null
          ? _instance.myBookings
          : (myBookings as Query$MyBookings$myBookings),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$MyBookings$myBookings<TRes> get myBookings {
    final local$myBookings = _instance.myBookings;
    return CopyWith$Query$MyBookings$myBookings(
      local$myBookings,
      (e) => call(myBookings: e),
    );
  }
}

class _CopyWithStubImpl$Query$MyBookings<TRes>
    implements CopyWith$Query$MyBookings<TRes> {
  _CopyWithStubImpl$Query$MyBookings(this._res);

  TRes _res;

  call({Query$MyBookings$myBookings? myBookings, String? $__typename}) => _res;

  CopyWith$Query$MyBookings$myBookings<TRes> get myBookings =>
      CopyWith$Query$MyBookings$myBookings.stub(_res);
}

const documentNodeQueryMyBookings = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyBookings'),
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
            name: NameNode(value: 'myBookings'),
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
Query$MyBookings _parserFn$Query$MyBookings(Map<String, dynamic> data) =>
    Query$MyBookings.fromJson(data);
typedef OnQueryComplete$Query$MyBookings =
    FutureOr<void> Function(Map<String, dynamic>?, Query$MyBookings?);

class Options$Query$MyBookings extends graphql.QueryOptions<Query$MyBookings> {
  Options$Query$MyBookings({
    String? operationName,
    Variables$Query$MyBookings? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MyBookings? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$MyBookings? onComplete,
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
                 data == null ? null : _parserFn$Query$MyBookings(data),
               ),
         onError: onError,
         document: documentNodeQueryMyBookings,
         parserFn: _parserFn$Query$MyBookings,
       );

  final OnQueryComplete$Query$MyBookings? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$MyBookings
    extends graphql.WatchQueryOptions<Query$MyBookings> {
  WatchOptions$Query$MyBookings({
    String? operationName,
    Variables$Query$MyBookings? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MyBookings? typedOptimisticResult,
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
         document: documentNodeQueryMyBookings,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$MyBookings,
       );
}

class FetchMoreOptions$Query$MyBookings extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$MyBookings({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$MyBookings? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryMyBookings,
       );
}

extension ClientExtension$Query$MyBookings on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$MyBookings>> query$MyBookings([
    Options$Query$MyBookings? options,
  ]) async => await this.query(options ?? Options$Query$MyBookings());

  graphql.ObservableQuery<Query$MyBookings> watchQuery$MyBookings([
    WatchOptions$Query$MyBookings? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$MyBookings());

  void writeQuery$MyBookings({
    required Query$MyBookings data,
    Variables$Query$MyBookings? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryMyBookings),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$MyBookings? readQuery$MyBookings({
    Variables$Query$MyBookings? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMyBookings),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$MyBookings.fromJson(result);
  }
}

class Query$MyBookings$myBookings {
  Query$MyBookings$myBookings({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'BookingConnection',
  });

  factory Query$MyBookings$myBookings.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$MyBookings$myBookings(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$MyBookings$myBookings$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$MyBookings$myBookings$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MyBookings$myBookings$nodes> nodes;

  final Query$MyBookings$myBookings$pageInfo pageInfo;

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
    if (other is! Query$MyBookings$myBookings ||
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

extension UtilityExtension$Query$MyBookings$myBookings
    on Query$MyBookings$myBookings {
  CopyWith$Query$MyBookings$myBookings<Query$MyBookings$myBookings>
  get copyWith => CopyWith$Query$MyBookings$myBookings(this, (i) => i);
}

abstract class CopyWith$Query$MyBookings$myBookings<TRes> {
  factory CopyWith$Query$MyBookings$myBookings(
    Query$MyBookings$myBookings instance,
    TRes Function(Query$MyBookings$myBookings) then,
  ) = _CopyWithImpl$Query$MyBookings$myBookings;

  factory CopyWith$Query$MyBookings$myBookings.stub(TRes res) =
      _CopyWithStubImpl$Query$MyBookings$myBookings;

  TRes call({
    List<Query$MyBookings$myBookings$nodes>? nodes,
    Query$MyBookings$myBookings$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$MyBookings$myBookings$nodes> Function(
      Iterable<
        CopyWith$Query$MyBookings$myBookings$nodes<
          Query$MyBookings$myBookings$nodes
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$MyBookings$myBookings$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$MyBookings$myBookings<TRes>
    implements CopyWith$Query$MyBookings$myBookings<TRes> {
  _CopyWithImpl$Query$MyBookings$myBookings(this._instance, this._then);

  final Query$MyBookings$myBookings _instance;

  final TRes Function(Query$MyBookings$myBookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyBookings$myBookings(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$MyBookings$myBookings$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$MyBookings$myBookings$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$MyBookings$myBookings$nodes> Function(
      Iterable<
        CopyWith$Query$MyBookings$myBookings$nodes<
          Query$MyBookings$myBookings$nodes
        >
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$MyBookings$myBookings$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$MyBookings$myBookings$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$MyBookings$myBookings$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$MyBookings$myBookings<TRes>
    implements CopyWith$Query$MyBookings$myBookings<TRes> {
  _CopyWithStubImpl$Query$MyBookings$myBookings(this._res);

  TRes _res;

  call({
    List<Query$MyBookings$myBookings$nodes>? nodes,
    Query$MyBookings$myBookings$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$MyBookings$myBookings$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$MyBookings$myBookings$pageInfo.stub(_res);
}

class Query$MyBookings$myBookings$nodes {
  Query$MyBookings$myBookings$nodes({
    required this.id,
    required this.facilityId,
    required this.startTime,
    required this.endTime,
    required this.status,
    this.notes,
    required this.facility,
    required this.user,
    required this.createdAt,
    this.$__typename = 'Booking',
  });

  factory Query$MyBookings$myBookings$nodes.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$facilityId = json['facilityId'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$status = json['status'];
    final l$notes = json['notes'];
    final l$facility = json['facility'];
    final l$user = json['user'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$MyBookings$myBookings$nodes(
      id: (l$id as String),
      facilityId: (l$facilityId as String),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      notes: (l$notes as String?),
      facility: Query$MyBookings$myBookings$nodes$facility.fromJson(
        (l$facility as Map<String, dynamic>),
      ),
      user: Query$MyBookings$myBookings$nodes$user.fromJson(
        (l$user as Map<String, dynamic>),
      ),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String facilityId;

  final DateTime startTime;

  final DateTime endTime;

  final Enum$BookingStatus status;

  final String? notes;

  final Query$MyBookings$myBookings$nodes$facility facility;

  final Query$MyBookings$myBookings$nodes$user user;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$facilityId = facilityId;
    _resultData['facilityId'] = l$facilityId;
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime.toIso8601String();
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$facility = facility;
    _resultData['facility'] = l$facility.toJson();
    final l$user = user;
    _resultData['user'] = l$user.toJson();
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
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$status = status;
    final l$notes = notes;
    final l$facility = facility;
    final l$user = user;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$facilityId,
      l$startTime,
      l$endTime,
      l$status,
      l$notes,
      l$facility,
      l$user,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyBookings$myBookings$nodes ||
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

extension UtilityExtension$Query$MyBookings$myBookings$nodes
    on Query$MyBookings$myBookings$nodes {
  CopyWith$Query$MyBookings$myBookings$nodes<Query$MyBookings$myBookings$nodes>
  get copyWith => CopyWith$Query$MyBookings$myBookings$nodes(this, (i) => i);
}

abstract class CopyWith$Query$MyBookings$myBookings$nodes<TRes> {
  factory CopyWith$Query$MyBookings$myBookings$nodes(
    Query$MyBookings$myBookings$nodes instance,
    TRes Function(Query$MyBookings$myBookings$nodes) then,
  ) = _CopyWithImpl$Query$MyBookings$myBookings$nodes;

  factory CopyWith$Query$MyBookings$myBookings$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$MyBookings$myBookings$nodes;

  TRes call({
    String? id,
    String? facilityId,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? notes,
    Query$MyBookings$myBookings$nodes$facility? facility,
    Query$MyBookings$myBookings$nodes$user? user,
    DateTime? createdAt,
    String? $__typename,
  });
  CopyWith$Query$MyBookings$myBookings$nodes$facility<TRes> get facility;
  CopyWith$Query$MyBookings$myBookings$nodes$user<TRes> get user;
}

class _CopyWithImpl$Query$MyBookings$myBookings$nodes<TRes>
    implements CopyWith$Query$MyBookings$myBookings$nodes<TRes> {
  _CopyWithImpl$Query$MyBookings$myBookings$nodes(this._instance, this._then);

  final Query$MyBookings$myBookings$nodes _instance;

  final TRes Function(Query$MyBookings$myBookings$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? facilityId = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? status = _undefined,
    Object? notes = _undefined,
    Object? facility = _undefined,
    Object? user = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyBookings$myBookings$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      facilityId: facilityId == _undefined || facilityId == null
          ? _instance.facilityId
          : (facilityId as String),
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
      facility: facility == _undefined || facility == null
          ? _instance.facility
          : (facility as Query$MyBookings$myBookings$nodes$facility),
      user: user == _undefined || user == null
          ? _instance.user
          : (user as Query$MyBookings$myBookings$nodes$user),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$MyBookings$myBookings$nodes$facility<TRes> get facility {
    final local$facility = _instance.facility;
    return CopyWith$Query$MyBookings$myBookings$nodes$facility(
      local$facility,
      (e) => call(facility: e),
    );
  }

  CopyWith$Query$MyBookings$myBookings$nodes$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$MyBookings$myBookings$nodes$user(
      local$user,
      (e) => call(user: e),
    );
  }
}

class _CopyWithStubImpl$Query$MyBookings$myBookings$nodes<TRes>
    implements CopyWith$Query$MyBookings$myBookings$nodes<TRes> {
  _CopyWithStubImpl$Query$MyBookings$myBookings$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? facilityId,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? notes,
    Query$MyBookings$myBookings$nodes$facility? facility,
    Query$MyBookings$myBookings$nodes$user? user,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$MyBookings$myBookings$nodes$facility<TRes> get facility =>
      CopyWith$Query$MyBookings$myBookings$nodes$facility.stub(_res);

  CopyWith$Query$MyBookings$myBookings$nodes$user<TRes> get user =>
      CopyWith$Query$MyBookings$myBookings$nodes$user.stub(_res);
}

class Query$MyBookings$myBookings$nodes$facility {
  Query$MyBookings$myBookings$nodes$facility({
    required this.name,
    required this.type,
    this.$__typename = 'Facility',
  });

  factory Query$MyBookings$myBookings$nodes$facility.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$type = json['type'];
    final l$$__typename = json['__typename'];
    return Query$MyBookings$myBookings$nodes$facility(
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
    if (other is! Query$MyBookings$myBookings$nodes$facility ||
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

extension UtilityExtension$Query$MyBookings$myBookings$nodes$facility
    on Query$MyBookings$myBookings$nodes$facility {
  CopyWith$Query$MyBookings$myBookings$nodes$facility<
    Query$MyBookings$myBookings$nodes$facility
  >
  get copyWith =>
      CopyWith$Query$MyBookings$myBookings$nodes$facility(this, (i) => i);
}

abstract class CopyWith$Query$MyBookings$myBookings$nodes$facility<TRes> {
  factory CopyWith$Query$MyBookings$myBookings$nodes$facility(
    Query$MyBookings$myBookings$nodes$facility instance,
    TRes Function(Query$MyBookings$myBookings$nodes$facility) then,
  ) = _CopyWithImpl$Query$MyBookings$myBookings$nodes$facility;

  factory CopyWith$Query$MyBookings$myBookings$nodes$facility.stub(TRes res) =
      _CopyWithStubImpl$Query$MyBookings$myBookings$nodes$facility;

  TRes call({String? name, Enum$FacilityType? type, String? $__typename});
}

class _CopyWithImpl$Query$MyBookings$myBookings$nodes$facility<TRes>
    implements CopyWith$Query$MyBookings$myBookings$nodes$facility<TRes> {
  _CopyWithImpl$Query$MyBookings$myBookings$nodes$facility(
    this._instance,
    this._then,
  );

  final Query$MyBookings$myBookings$nodes$facility _instance;

  final TRes Function(Query$MyBookings$myBookings$nodes$facility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? type = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyBookings$myBookings$nodes$facility(
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

class _CopyWithStubImpl$Query$MyBookings$myBookings$nodes$facility<TRes>
    implements CopyWith$Query$MyBookings$myBookings$nodes$facility<TRes> {
  _CopyWithStubImpl$Query$MyBookings$myBookings$nodes$facility(this._res);

  TRes _res;

  call({String? name, Enum$FacilityType? type, String? $__typename}) => _res;
}

class Query$MyBookings$myBookings$nodes$user {
  Query$MyBookings$myBookings$nodes$user({
    this.firstName,
    this.lastName,
    this.$__typename = 'User',
  });

  factory Query$MyBookings$myBookings$nodes$user.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$$__typename = json['__typename'];
    return Query$MyBookings$myBookings$nodes$user(
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
    if (other is! Query$MyBookings$myBookings$nodes$user ||
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

extension UtilityExtension$Query$MyBookings$myBookings$nodes$user
    on Query$MyBookings$myBookings$nodes$user {
  CopyWith$Query$MyBookings$myBookings$nodes$user<
    Query$MyBookings$myBookings$nodes$user
  >
  get copyWith =>
      CopyWith$Query$MyBookings$myBookings$nodes$user(this, (i) => i);
}

abstract class CopyWith$Query$MyBookings$myBookings$nodes$user<TRes> {
  factory CopyWith$Query$MyBookings$myBookings$nodes$user(
    Query$MyBookings$myBookings$nodes$user instance,
    TRes Function(Query$MyBookings$myBookings$nodes$user) then,
  ) = _CopyWithImpl$Query$MyBookings$myBookings$nodes$user;

  factory CopyWith$Query$MyBookings$myBookings$nodes$user.stub(TRes res) =
      _CopyWithStubImpl$Query$MyBookings$myBookings$nodes$user;

  TRes call({String? firstName, String? lastName, String? $__typename});
}

class _CopyWithImpl$Query$MyBookings$myBookings$nodes$user<TRes>
    implements CopyWith$Query$MyBookings$myBookings$nodes$user<TRes> {
  _CopyWithImpl$Query$MyBookings$myBookings$nodes$user(
    this._instance,
    this._then,
  );

  final Query$MyBookings$myBookings$nodes$user _instance;

  final TRes Function(Query$MyBookings$myBookings$nodes$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyBookings$myBookings$nodes$user(
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

class _CopyWithStubImpl$Query$MyBookings$myBookings$nodes$user<TRes>
    implements CopyWith$Query$MyBookings$myBookings$nodes$user<TRes> {
  _CopyWithStubImpl$Query$MyBookings$myBookings$nodes$user(this._res);

  TRes _res;

  call({String? firstName, String? lastName, String? $__typename}) => _res;
}

class Query$MyBookings$myBookings$pageInfo {
  Query$MyBookings$myBookings$pageInfo({
    required this.page,
    required this.total,
    required this.hasNextPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$MyBookings$myBookings$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$page = json['page'];
    final l$total = json['total'];
    final l$hasNextPage = json['hasNextPage'];
    final l$$__typename = json['__typename'];
    return Query$MyBookings$myBookings$pageInfo(
      page: (l$page as int),
      total: (l$total as int),
      hasNextPage: (l$hasNextPage as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final int page;

  final int total;

  final bool hasNextPage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$page = page;
    _resultData['page'] = l$page;
    final l$total = total;
    _resultData['total'] = l$total;
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$total = total;
    final l$hasNextPage = hasNextPage;
    final l$$__typename = $__typename;
    return Object.hashAll([l$page, l$total, l$hasNextPage, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyBookings$myBookings$pageInfo ||
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

extension UtilityExtension$Query$MyBookings$myBookings$pageInfo
    on Query$MyBookings$myBookings$pageInfo {
  CopyWith$Query$MyBookings$myBookings$pageInfo<
    Query$MyBookings$myBookings$pageInfo
  >
  get copyWith => CopyWith$Query$MyBookings$myBookings$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$MyBookings$myBookings$pageInfo<TRes> {
  factory CopyWith$Query$MyBookings$myBookings$pageInfo(
    Query$MyBookings$myBookings$pageInfo instance,
    TRes Function(Query$MyBookings$myBookings$pageInfo) then,
  ) = _CopyWithImpl$Query$MyBookings$myBookings$pageInfo;

  factory CopyWith$Query$MyBookings$myBookings$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$MyBookings$myBookings$pageInfo;

  TRes call({int? page, int? total, bool? hasNextPage, String? $__typename});
}

class _CopyWithImpl$Query$MyBookings$myBookings$pageInfo<TRes>
    implements CopyWith$Query$MyBookings$myBookings$pageInfo<TRes> {
  _CopyWithImpl$Query$MyBookings$myBookings$pageInfo(
    this._instance,
    this._then,
  );

  final Query$MyBookings$myBookings$pageInfo _instance;

  final TRes Function(Query$MyBookings$myBookings$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? page = _undefined,
    Object? total = _undefined,
    Object? hasNextPage = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyBookings$myBookings$pageInfo(
      page: page == _undefined || page == null ? _instance.page : (page as int),
      total: total == _undefined || total == null
          ? _instance.total
          : (total as int),
      hasNextPage: hasNextPage == _undefined || hasNextPage == null
          ? _instance.hasNextPage
          : (hasNextPage as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$MyBookings$myBookings$pageInfo<TRes>
    implements CopyWith$Query$MyBookings$myBookings$pageInfo<TRes> {
  _CopyWithStubImpl$Query$MyBookings$myBookings$pageInfo(this._res);

  TRes _res;

  call({int? page, int? total, bool? hasNextPage, String? $__typename}) => _res;
}
