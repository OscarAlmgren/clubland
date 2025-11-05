import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$UpcomingBookings {
  factory Variables$Query$UpcomingBookings({
    int? days,
    Input$PaginationInput? pagination,
  }) => Variables$Query$UpcomingBookings._({
    if (days != null) r'days': days,
    if (pagination != null) r'pagination': pagination,
  });

  Variables$Query$UpcomingBookings._(this._$data);

  factory Variables$Query$UpcomingBookings.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('days')) {
      final l$days = data['days'];
      result$data['days'] = (l$days as int?);
    }
    if (data.containsKey('pagination')) {
      final l$pagination = data['pagination'];
      result$data['pagination'] = l$pagination == null
          ? null
          : Input$PaginationInput.fromJson(
              (l$pagination as Map<String, dynamic>),
            );
    }
    return Variables$Query$UpcomingBookings._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get days => (_$data['days'] as int?);

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('days')) {
      final l$days = days;
      result$data['days'] = l$days;
    }
    if (_$data.containsKey('pagination')) {
      final l$pagination = pagination;
      result$data['pagination'] = l$pagination?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$UpcomingBookings<Variables$Query$UpcomingBookings>
  get copyWith => CopyWith$Variables$Query$UpcomingBookings(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$UpcomingBookings ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$days = days;
    final lOther$days = other.days;
    if (_$data.containsKey('days') != other._$data.containsKey('days')) {
      return false;
    }
    if (l$days != lOther$days) {
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
    final l$days = days;
    final l$pagination = pagination;
    return Object.hashAll([
      _$data.containsKey('days') ? l$days : const {},
      _$data.containsKey('pagination') ? l$pagination : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$UpcomingBookings<TRes> {
  factory CopyWith$Variables$Query$UpcomingBookings(
    Variables$Query$UpcomingBookings instance,
    TRes Function(Variables$Query$UpcomingBookings) then,
  ) = _CopyWithImpl$Variables$Query$UpcomingBookings;

  factory CopyWith$Variables$Query$UpcomingBookings.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$UpcomingBookings;

  TRes call({int? days, Input$PaginationInput? pagination});
}

class _CopyWithImpl$Variables$Query$UpcomingBookings<TRes>
    implements CopyWith$Variables$Query$UpcomingBookings<TRes> {
  _CopyWithImpl$Variables$Query$UpcomingBookings(this._instance, this._then);

  final Variables$Query$UpcomingBookings _instance;

  final TRes Function(Variables$Query$UpcomingBookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? days = _undefined, Object? pagination = _undefined}) =>
      _then(
        Variables$Query$UpcomingBookings._({
          ..._instance._$data,
          if (days != _undefined) 'days': (days as int?),
          if (pagination != _undefined)
            'pagination': (pagination as Input$PaginationInput?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$UpcomingBookings<TRes>
    implements CopyWith$Variables$Query$UpcomingBookings<TRes> {
  _CopyWithStubImpl$Variables$Query$UpcomingBookings(this._res);

  TRes _res;

  call({int? days, Input$PaginationInput? pagination}) => _res;
}

class Query$UpcomingBookings {
  Query$UpcomingBookings({
    required this.upcomingBookings,
    this.$__typename = 'Query',
  });

  factory Query$UpcomingBookings.fromJson(Map<String, dynamic> json) {
    final l$upcomingBookings = json['upcomingBookings'];
    final l$$__typename = json['__typename'];
    return Query$UpcomingBookings(
      upcomingBookings: Query$UpcomingBookings$upcomingBookings.fromJson(
        (l$upcomingBookings as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$UpcomingBookings$upcomingBookings upcomingBookings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$upcomingBookings = upcomingBookings;
    _resultData['upcomingBookings'] = l$upcomingBookings.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$upcomingBookings = upcomingBookings;
    final l$$__typename = $__typename;
    return Object.hashAll([l$upcomingBookings, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$UpcomingBookings || runtimeType != other.runtimeType) {
      return false;
    }
    final l$upcomingBookings = upcomingBookings;
    final lOther$upcomingBookings = other.upcomingBookings;
    if (l$upcomingBookings != lOther$upcomingBookings) {
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

extension UtilityExtension$Query$UpcomingBookings on Query$UpcomingBookings {
  CopyWith$Query$UpcomingBookings<Query$UpcomingBookings> get copyWith =>
      CopyWith$Query$UpcomingBookings(this, (i) => i);
}

abstract class CopyWith$Query$UpcomingBookings<TRes> {
  factory CopyWith$Query$UpcomingBookings(
    Query$UpcomingBookings instance,
    TRes Function(Query$UpcomingBookings) then,
  ) = _CopyWithImpl$Query$UpcomingBookings;

  factory CopyWith$Query$UpcomingBookings.stub(TRes res) =
      _CopyWithStubImpl$Query$UpcomingBookings;

  TRes call({
    Query$UpcomingBookings$upcomingBookings? upcomingBookings,
    String? $__typename,
  });
  CopyWith$Query$UpcomingBookings$upcomingBookings<TRes> get upcomingBookings;
}

class _CopyWithImpl$Query$UpcomingBookings<TRes>
    implements CopyWith$Query$UpcomingBookings<TRes> {
  _CopyWithImpl$Query$UpcomingBookings(this._instance, this._then);

  final Query$UpcomingBookings _instance;

  final TRes Function(Query$UpcomingBookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? upcomingBookings = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$UpcomingBookings(
      upcomingBookings:
          upcomingBookings == _undefined || upcomingBookings == null
          ? _instance.upcomingBookings
          : (upcomingBookings as Query$UpcomingBookings$upcomingBookings),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$UpcomingBookings$upcomingBookings<TRes> get upcomingBookings {
    final local$upcomingBookings = _instance.upcomingBookings;
    return CopyWith$Query$UpcomingBookings$upcomingBookings(
      local$upcomingBookings,
      (e) => call(upcomingBookings: e),
    );
  }
}

class _CopyWithStubImpl$Query$UpcomingBookings<TRes>
    implements CopyWith$Query$UpcomingBookings<TRes> {
  _CopyWithStubImpl$Query$UpcomingBookings(this._res);

  TRes _res;

  call({
    Query$UpcomingBookings$upcomingBookings? upcomingBookings,
    String? $__typename,
  }) => _res;

  CopyWith$Query$UpcomingBookings$upcomingBookings<TRes> get upcomingBookings =>
      CopyWith$Query$UpcomingBookings$upcomingBookings.stub(_res);
}

const documentNodeQueryUpcomingBookings = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'UpcomingBookings'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'days')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
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
            name: NameNode(value: 'upcomingBookings'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'days'),
                value: VariableNode(name: NameNode(value: 'days')),
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
Query$UpcomingBookings _parserFn$Query$UpcomingBookings(
  Map<String, dynamic> data,
) => Query$UpcomingBookings.fromJson(data);
typedef OnQueryComplete$Query$UpcomingBookings =
    FutureOr<void> Function(Map<String, dynamic>?, Query$UpcomingBookings?);

class Options$Query$UpcomingBookings
    extends graphql.QueryOptions<Query$UpcomingBookings> {
  Options$Query$UpcomingBookings({
    String? operationName,
    Variables$Query$UpcomingBookings? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$UpcomingBookings? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$UpcomingBookings? onComplete,
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
                 data == null ? null : _parserFn$Query$UpcomingBookings(data),
               ),
         onError: onError,
         document: documentNodeQueryUpcomingBookings,
         parserFn: _parserFn$Query$UpcomingBookings,
       );

  final OnQueryComplete$Query$UpcomingBookings? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$UpcomingBookings
    extends graphql.WatchQueryOptions<Query$UpcomingBookings> {
  WatchOptions$Query$UpcomingBookings({
    String? operationName,
    Variables$Query$UpcomingBookings? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$UpcomingBookings? typedOptimisticResult,
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
         document: documentNodeQueryUpcomingBookings,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$UpcomingBookings,
       );
}

class FetchMoreOptions$Query$UpcomingBookings extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$UpcomingBookings({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$UpcomingBookings? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryUpcomingBookings,
       );
}

extension ClientExtension$Query$UpcomingBookings on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$UpcomingBookings>> query$UpcomingBookings([
    Options$Query$UpcomingBookings? options,
  ]) async => await this.query(options ?? Options$Query$UpcomingBookings());

  graphql.ObservableQuery<Query$UpcomingBookings> watchQuery$UpcomingBookings([
    WatchOptions$Query$UpcomingBookings? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$UpcomingBookings());

  void writeQuery$UpcomingBookings({
    required Query$UpcomingBookings data,
    Variables$Query$UpcomingBookings? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryUpcomingBookings),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$UpcomingBookings? readQuery$UpcomingBookings({
    Variables$Query$UpcomingBookings? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryUpcomingBookings,
        ),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$UpcomingBookings.fromJson(result);
  }
}

class Query$UpcomingBookings$upcomingBookings {
  Query$UpcomingBookings$upcomingBookings({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'BookingConnection',
  });

  factory Query$UpcomingBookings$upcomingBookings.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$UpcomingBookings$upcomingBookings(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$UpcomingBookings$upcomingBookings$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$UpcomingBookings$upcomingBookings$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$UpcomingBookings$upcomingBookings$nodes> nodes;

  final Query$UpcomingBookings$upcomingBookings$pageInfo pageInfo;

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
    if (other is! Query$UpcomingBookings$upcomingBookings ||
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

extension UtilityExtension$Query$UpcomingBookings$upcomingBookings
    on Query$UpcomingBookings$upcomingBookings {
  CopyWith$Query$UpcomingBookings$upcomingBookings<
    Query$UpcomingBookings$upcomingBookings
  >
  get copyWith =>
      CopyWith$Query$UpcomingBookings$upcomingBookings(this, (i) => i);
}

abstract class CopyWith$Query$UpcomingBookings$upcomingBookings<TRes> {
  factory CopyWith$Query$UpcomingBookings$upcomingBookings(
    Query$UpcomingBookings$upcomingBookings instance,
    TRes Function(Query$UpcomingBookings$upcomingBookings) then,
  ) = _CopyWithImpl$Query$UpcomingBookings$upcomingBookings;

  factory CopyWith$Query$UpcomingBookings$upcomingBookings.stub(TRes res) =
      _CopyWithStubImpl$Query$UpcomingBookings$upcomingBookings;

  TRes call({
    List<Query$UpcomingBookings$upcomingBookings$nodes>? nodes,
    Query$UpcomingBookings$upcomingBookings$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$UpcomingBookings$upcomingBookings$nodes> Function(
      Iterable<
        CopyWith$Query$UpcomingBookings$upcomingBookings$nodes<
          Query$UpcomingBookings$upcomingBookings$nodes
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$UpcomingBookings$upcomingBookings$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$UpcomingBookings$upcomingBookings<TRes>
    implements CopyWith$Query$UpcomingBookings$upcomingBookings<TRes> {
  _CopyWithImpl$Query$UpcomingBookings$upcomingBookings(
    this._instance,
    this._then,
  );

  final Query$UpcomingBookings$upcomingBookings _instance;

  final TRes Function(Query$UpcomingBookings$upcomingBookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$UpcomingBookings$upcomingBookings(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$UpcomingBookings$upcomingBookings$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$UpcomingBookings$upcomingBookings$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$UpcomingBookings$upcomingBookings$nodes> Function(
      Iterable<
        CopyWith$Query$UpcomingBookings$upcomingBookings$nodes<
          Query$UpcomingBookings$upcomingBookings$nodes
        >
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) =>
            CopyWith$Query$UpcomingBookings$upcomingBookings$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$UpcomingBookings$upcomingBookings$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$UpcomingBookings$upcomingBookings$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$UpcomingBookings$upcomingBookings<TRes>
    implements CopyWith$Query$UpcomingBookings$upcomingBookings<TRes> {
  _CopyWithStubImpl$Query$UpcomingBookings$upcomingBookings(this._res);

  TRes _res;

  call({
    List<Query$UpcomingBookings$upcomingBookings$nodes>? nodes,
    Query$UpcomingBookings$upcomingBookings$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$UpcomingBookings$upcomingBookings$pageInfo<TRes>
  get pageInfo =>
      CopyWith$Query$UpcomingBookings$upcomingBookings$pageInfo.stub(_res);
}

class Query$UpcomingBookings$upcomingBookings$nodes {
  Query$UpcomingBookings$upcomingBookings$nodes({
    required this.id,
    this.facility,
    required this.startTime,
    required this.endTime,
    required this.status,
    this.$__typename = 'Booking',
  });

  factory Query$UpcomingBookings$upcomingBookings$nodes.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$facility = json['facility'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Query$UpcomingBookings$upcomingBookings$nodes(
      id: (l$id as String),
      facility: l$facility == null
          ? null
          : Query$UpcomingBookings$upcomingBookings$nodes$facility.fromJson(
              (l$facility as Map<String, dynamic>),
            ),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$UpcomingBookings$upcomingBookings$nodes$facility? facility;

  final DateTime startTime;

  final DateTime endTime;

  final Enum$BookingStatus status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$facility = facility;
    _resultData['facility'] = l$facility?.toJson();
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime.toIso8601String();
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$facility = facility;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$facility,
      l$startTime,
      l$endTime,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$UpcomingBookings$upcomingBookings$nodes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$facility = facility;
    final lOther$facility = other.facility;
    if (l$facility != lOther$facility) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$UpcomingBookings$upcomingBookings$nodes
    on Query$UpcomingBookings$upcomingBookings$nodes {
  CopyWith$Query$UpcomingBookings$upcomingBookings$nodes<
    Query$UpcomingBookings$upcomingBookings$nodes
  >
  get copyWith =>
      CopyWith$Query$UpcomingBookings$upcomingBookings$nodes(this, (i) => i);
}

abstract class CopyWith$Query$UpcomingBookings$upcomingBookings$nodes<TRes> {
  factory CopyWith$Query$UpcomingBookings$upcomingBookings$nodes(
    Query$UpcomingBookings$upcomingBookings$nodes instance,
    TRes Function(Query$UpcomingBookings$upcomingBookings$nodes) then,
  ) = _CopyWithImpl$Query$UpcomingBookings$upcomingBookings$nodes;

  factory CopyWith$Query$UpcomingBookings$upcomingBookings$nodes.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$UpcomingBookings$upcomingBookings$nodes;

  TRes call({
    String? id,
    Query$UpcomingBookings$upcomingBookings$nodes$facility? facility,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? $__typename,
  });
  CopyWith$Query$UpcomingBookings$upcomingBookings$nodes$facility<TRes>
  get facility;
}

class _CopyWithImpl$Query$UpcomingBookings$upcomingBookings$nodes<TRes>
    implements CopyWith$Query$UpcomingBookings$upcomingBookings$nodes<TRes> {
  _CopyWithImpl$Query$UpcomingBookings$upcomingBookings$nodes(
    this._instance,
    this._then,
  );

  final Query$UpcomingBookings$upcomingBookings$nodes _instance;

  final TRes Function(Query$UpcomingBookings$upcomingBookings$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? facility = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$UpcomingBookings$upcomingBookings$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      facility: facility == _undefined
          ? _instance.facility
          : (facility
                as Query$UpcomingBookings$upcomingBookings$nodes$facility?),
      startTime: startTime == _undefined || startTime == null
          ? _instance.startTime
          : (startTime as DateTime),
      endTime: endTime == _undefined || endTime == null
          ? _instance.endTime
          : (endTime as DateTime),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$BookingStatus),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$UpcomingBookings$upcomingBookings$nodes$facility<TRes>
  get facility {
    final local$facility = _instance.facility;
    return local$facility == null
        ? CopyWith$Query$UpcomingBookings$upcomingBookings$nodes$facility.stub(
            _then(_instance),
          )
        : CopyWith$Query$UpcomingBookings$upcomingBookings$nodes$facility(
            local$facility,
            (e) => call(facility: e),
          );
  }
}

class _CopyWithStubImpl$Query$UpcomingBookings$upcomingBookings$nodes<TRes>
    implements CopyWith$Query$UpcomingBookings$upcomingBookings$nodes<TRes> {
  _CopyWithStubImpl$Query$UpcomingBookings$upcomingBookings$nodes(this._res);

  TRes _res;

  call({
    String? id,
    Query$UpcomingBookings$upcomingBookings$nodes$facility? facility,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? $__typename,
  }) => _res;

  CopyWith$Query$UpcomingBookings$upcomingBookings$nodes$facility<TRes>
  get facility =>
      CopyWith$Query$UpcomingBookings$upcomingBookings$nodes$facility.stub(
        _res,
      );
}

class Query$UpcomingBookings$upcomingBookings$nodes$facility {
  Query$UpcomingBookings$upcomingBookings$nodes$facility({
    required this.name,
    required this.type,
    this.$__typename = 'Facility',
  });

  factory Query$UpcomingBookings$upcomingBookings$nodes$facility.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$type = json['type'];
    final l$$__typename = json['__typename'];
    return Query$UpcomingBookings$upcomingBookings$nodes$facility(
      name: (l$name as String),
      type: (l$type as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$type = type;
    _resultData['type'] = l$type;
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
    if (other is! Query$UpcomingBookings$upcomingBookings$nodes$facility ||
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

extension UtilityExtension$Query$UpcomingBookings$upcomingBookings$nodes$facility
    on Query$UpcomingBookings$upcomingBookings$nodes$facility {
  CopyWith$Query$UpcomingBookings$upcomingBookings$nodes$facility<
    Query$UpcomingBookings$upcomingBookings$nodes$facility
  >
  get copyWith =>
      CopyWith$Query$UpcomingBookings$upcomingBookings$nodes$facility(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$UpcomingBookings$upcomingBookings$nodes$facility<
  TRes
> {
  factory CopyWith$Query$UpcomingBookings$upcomingBookings$nodes$facility(
    Query$UpcomingBookings$upcomingBookings$nodes$facility instance,
    TRes Function(Query$UpcomingBookings$upcomingBookings$nodes$facility) then,
  ) = _CopyWithImpl$Query$UpcomingBookings$upcomingBookings$nodes$facility;

  factory CopyWith$Query$UpcomingBookings$upcomingBookings$nodes$facility.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$UpcomingBookings$upcomingBookings$nodes$facility;

  TRes call({String? name, String? type, String? $__typename});
}

class _CopyWithImpl$Query$UpcomingBookings$upcomingBookings$nodes$facility<TRes>
    implements
        CopyWith$Query$UpcomingBookings$upcomingBookings$nodes$facility<TRes> {
  _CopyWithImpl$Query$UpcomingBookings$upcomingBookings$nodes$facility(
    this._instance,
    this._then,
  );

  final Query$UpcomingBookings$upcomingBookings$nodes$facility _instance;

  final TRes Function(Query$UpcomingBookings$upcomingBookings$nodes$facility)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? type = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$UpcomingBookings$upcomingBookings$nodes$facility(
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$UpcomingBookings$upcomingBookings$nodes$facility<
  TRes
>
    implements
        CopyWith$Query$UpcomingBookings$upcomingBookings$nodes$facility<TRes> {
  _CopyWithStubImpl$Query$UpcomingBookings$upcomingBookings$nodes$facility(
    this._res,
  );

  TRes _res;

  call({String? name, String? type, String? $__typename}) => _res;
}

class Query$UpcomingBookings$upcomingBookings$pageInfo {
  Query$UpcomingBookings$upcomingBookings$pageInfo({
    required this.total,
    this.$__typename = 'PageInfo',
  });

  factory Query$UpcomingBookings$upcomingBookings$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$total = json['total'];
    final l$$__typename = json['__typename'];
    return Query$UpcomingBookings$upcomingBookings$pageInfo(
      total: (l$total as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int total;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$total = total;
    _resultData['total'] = l$total;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$total = total;
    final l$$__typename = $__typename;
    return Object.hashAll([l$total, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$UpcomingBookings$upcomingBookings$pageInfo ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$UpcomingBookings$upcomingBookings$pageInfo
    on Query$UpcomingBookings$upcomingBookings$pageInfo {
  CopyWith$Query$UpcomingBookings$upcomingBookings$pageInfo<
    Query$UpcomingBookings$upcomingBookings$pageInfo
  >
  get copyWith =>
      CopyWith$Query$UpcomingBookings$upcomingBookings$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$UpcomingBookings$upcomingBookings$pageInfo<TRes> {
  factory CopyWith$Query$UpcomingBookings$upcomingBookings$pageInfo(
    Query$UpcomingBookings$upcomingBookings$pageInfo instance,
    TRes Function(Query$UpcomingBookings$upcomingBookings$pageInfo) then,
  ) = _CopyWithImpl$Query$UpcomingBookings$upcomingBookings$pageInfo;

  factory CopyWith$Query$UpcomingBookings$upcomingBookings$pageInfo.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$UpcomingBookings$upcomingBookings$pageInfo;

  TRes call({int? total, String? $__typename});
}

class _CopyWithImpl$Query$UpcomingBookings$upcomingBookings$pageInfo<TRes>
    implements CopyWith$Query$UpcomingBookings$upcomingBookings$pageInfo<TRes> {
  _CopyWithImpl$Query$UpcomingBookings$upcomingBookings$pageInfo(
    this._instance,
    this._then,
  );

  final Query$UpcomingBookings$upcomingBookings$pageInfo _instance;

  final TRes Function(Query$UpcomingBookings$upcomingBookings$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? total = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$UpcomingBookings$upcomingBookings$pageInfo(
          total: total == _undefined || total == null
              ? _instance.total
              : (total as int),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Query$UpcomingBookings$upcomingBookings$pageInfo<TRes>
    implements CopyWith$Query$UpcomingBookings$upcomingBookings$pageInfo<TRes> {
  _CopyWithStubImpl$Query$UpcomingBookings$upcomingBookings$pageInfo(this._res);

  TRes _res;

  call({int? total, String? $__typename}) => _res;
}
