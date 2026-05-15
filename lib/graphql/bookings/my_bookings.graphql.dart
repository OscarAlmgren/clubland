import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$MyBookings {
  factory Variables$Query$MyBookings({
    Input$PaginationInput? pagination,
    Enum$BookingStatus? status,
  }) => Variables$Query$MyBookings._({
    if (pagination != null) r'pagination': pagination,
    if (status != null) r'status': status,
  });

  Variables$Query$MyBookings._(this._$data);

  factory Variables$Query$MyBookings.fromJson(Map<String, dynamic> data) {
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
          : fromJson$Enum$BookingStatus((l$status as String));
    }
    return Variables$Query$MyBookings._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Enum$BookingStatus? get status => (_$data['status'] as Enum$BookingStatus?);

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
          : toJson$Enum$BookingStatus(l$status);
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

abstract class CopyWith$Variables$Query$MyBookings<TRes> {
  factory CopyWith$Variables$Query$MyBookings(
    Variables$Query$MyBookings instance,
    TRes Function(Variables$Query$MyBookings) then,
  ) = _CopyWithImpl$Variables$Query$MyBookings;

  factory CopyWith$Variables$Query$MyBookings.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$MyBookings;

  TRes call({Input$PaginationInput? pagination, Enum$BookingStatus? status});
}

class _CopyWithImpl$Variables$Query$MyBookings<TRes>
    implements CopyWith$Variables$Query$MyBookings<TRes> {
  _CopyWithImpl$Variables$Query$MyBookings(this._instance, this._then);

  final Variables$Query$MyBookings _instance;

  final TRes Function(Variables$Query$MyBookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? pagination = _undefined, Object? status = _undefined}) =>
      _then(
        Variables$Query$MyBookings._({
          ..._instance._$data,
          if (pagination != _undefined)
            'pagination': (pagination as Input$PaginationInput?),
          if (status != _undefined) 'status': (status as Enum$BookingStatus?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$MyBookings<TRes>
    implements CopyWith$Variables$Query$MyBookings<TRes> {
  _CopyWithStubImpl$Variables$Query$MyBookings(this._res);

  TRes _res;

  call({Input$PaginationInput? pagination, Enum$BookingStatus? status}) => _res;
}

class Query$MyBookings {
  Query$MyBookings({
    required this.myFacilityBookings,
    this.$__typename = 'Query',
  });

  factory Query$MyBookings.fromJson(Map<String, dynamic> json) {
    final l$myFacilityBookings = json['myFacilityBookings'];
    final l$$__typename = json['__typename'];
    return Query$MyBookings(
      myFacilityBookings: Query$MyBookings$myFacilityBookings.fromJson(
        (l$myFacilityBookings as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MyBookings$myFacilityBookings myFacilityBookings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myFacilityBookings = myFacilityBookings;
    _resultData['myFacilityBookings'] = l$myFacilityBookings.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myFacilityBookings = myFacilityBookings;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myFacilityBookings, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyBookings || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myFacilityBookings = myFacilityBookings;
    final lOther$myFacilityBookings = other.myFacilityBookings;
    if (l$myFacilityBookings != lOther$myFacilityBookings) {
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

  TRes call({
    Query$MyBookings$myFacilityBookings? myFacilityBookings,
    String? $__typename,
  });
  CopyWith$Query$MyBookings$myFacilityBookings<TRes> get myFacilityBookings;
}

class _CopyWithImpl$Query$MyBookings<TRes>
    implements CopyWith$Query$MyBookings<TRes> {
  _CopyWithImpl$Query$MyBookings(this._instance, this._then);

  final Query$MyBookings _instance;

  final TRes Function(Query$MyBookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? myFacilityBookings = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyBookings(
      myFacilityBookings:
          myFacilityBookings == _undefined || myFacilityBookings == null
          ? _instance.myFacilityBookings
          : (myFacilityBookings as Query$MyBookings$myFacilityBookings),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$MyBookings$myFacilityBookings<TRes> get myFacilityBookings {
    final local$myFacilityBookings = _instance.myFacilityBookings;
    return CopyWith$Query$MyBookings$myFacilityBookings(
      local$myFacilityBookings,
      (e) => call(myFacilityBookings: e),
    );
  }
}

class _CopyWithStubImpl$Query$MyBookings<TRes>
    implements CopyWith$Query$MyBookings<TRes> {
  _CopyWithStubImpl$Query$MyBookings(this._res);

  TRes _res;

  call({
    Query$MyBookings$myFacilityBookings? myFacilityBookings,
    String? $__typename,
  }) => _res;

  CopyWith$Query$MyBookings$myFacilityBookings<TRes> get myFacilityBookings =>
      CopyWith$Query$MyBookings$myFacilityBookings.stub(_res);
}

const documentNodeQueryMyBookings = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyBookings'),
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
            name: NameNode(value: 'BookingStatus'),
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
            name: NameNode(value: 'myFacilityBookings'),
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
                        name: NameNode(value: 'clubId'),
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
                        name: NameNode(value: 'memberId'),
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
                        name: NameNode(value: 'purpose'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'guestCount'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'paymentStatus'),
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

class Query$MyBookings$myFacilityBookings {
  Query$MyBookings$myFacilityBookings({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'BookingConnection',
  });

  factory Query$MyBookings$myFacilityBookings.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$MyBookings$myFacilityBookings(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$MyBookings$myFacilityBookings$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$MyBookings$myFacilityBookings$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MyBookings$myFacilityBookings$nodes> nodes;

  final Query$MyBookings$myFacilityBookings$pageInfo pageInfo;

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
    if (other is! Query$MyBookings$myFacilityBookings ||
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

extension UtilityExtension$Query$MyBookings$myFacilityBookings
    on Query$MyBookings$myFacilityBookings {
  CopyWith$Query$MyBookings$myFacilityBookings<
    Query$MyBookings$myFacilityBookings
  >
  get copyWith => CopyWith$Query$MyBookings$myFacilityBookings(this, (i) => i);
}

abstract class CopyWith$Query$MyBookings$myFacilityBookings<TRes> {
  factory CopyWith$Query$MyBookings$myFacilityBookings(
    Query$MyBookings$myFacilityBookings instance,
    TRes Function(Query$MyBookings$myFacilityBookings) then,
  ) = _CopyWithImpl$Query$MyBookings$myFacilityBookings;

  factory CopyWith$Query$MyBookings$myFacilityBookings.stub(TRes res) =
      _CopyWithStubImpl$Query$MyBookings$myFacilityBookings;

  TRes call({
    List<Query$MyBookings$myFacilityBookings$nodes>? nodes,
    Query$MyBookings$myFacilityBookings$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$MyBookings$myFacilityBookings$nodes> Function(
      Iterable<
        CopyWith$Query$MyBookings$myFacilityBookings$nodes<
          Query$MyBookings$myFacilityBookings$nodes
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$MyBookings$myFacilityBookings$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$MyBookings$myFacilityBookings<TRes>
    implements CopyWith$Query$MyBookings$myFacilityBookings<TRes> {
  _CopyWithImpl$Query$MyBookings$myFacilityBookings(this._instance, this._then);

  final Query$MyBookings$myFacilityBookings _instance;

  final TRes Function(Query$MyBookings$myFacilityBookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyBookings$myFacilityBookings(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$MyBookings$myFacilityBookings$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$MyBookings$myFacilityBookings$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$MyBookings$myFacilityBookings$nodes> Function(
      Iterable<
        CopyWith$Query$MyBookings$myFacilityBookings$nodes<
          Query$MyBookings$myFacilityBookings$nodes
        >
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$MyBookings$myFacilityBookings$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$MyBookings$myFacilityBookings$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$MyBookings$myFacilityBookings$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$MyBookings$myFacilityBookings<TRes>
    implements CopyWith$Query$MyBookings$myFacilityBookings<TRes> {
  _CopyWithStubImpl$Query$MyBookings$myFacilityBookings(this._res);

  TRes _res;

  call({
    List<Query$MyBookings$myFacilityBookings$nodes>? nodes,
    Query$MyBookings$myFacilityBookings$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$MyBookings$myFacilityBookings$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$MyBookings$myFacilityBookings$pageInfo.stub(_res);
}

class Query$MyBookings$myFacilityBookings$nodes {
  Query$MyBookings$myFacilityBookings$nodes({
    required this.id,
    required this.clubId,
    required this.facilityId,
    required this.memberId,
    required this.startTime,
    required this.endTime,
    required this.status,
    this.purpose,
    this.guestCount,
    required this.paymentStatus,
    this.facility,
    required this.createdAt,
    this.$__typename = 'FacilityBooking',
  });

  factory Query$MyBookings$myFacilityBookings$nodes.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$facilityId = json['facilityId'];
    final l$memberId = json['memberId'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$status = json['status'];
    final l$purpose = json['purpose'];
    final l$guestCount = json['guestCount'];
    final l$paymentStatus = json['paymentStatus'];
    final l$facility = json['facility'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$MyBookings$myFacilityBookings$nodes(
      id: (l$id as String),
      clubId: (l$clubId as String),
      facilityId: (l$facilityId as String),
      memberId: (l$memberId as String),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      purpose: (l$purpose as String?),
      guestCount: (l$guestCount as int?),
      paymentStatus: fromJson$Enum$PaymentStatus((l$paymentStatus as String)),
      facility: l$facility == null
          ? null
          : Query$MyBookings$myFacilityBookings$nodes$facility.fromJson(
              (l$facility as Map<String, dynamic>),
            ),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String facilityId;

  final String memberId;

  final DateTime startTime;

  final DateTime endTime;

  final Enum$BookingStatus status;

  final String? purpose;

  final int? guestCount;

  final Enum$PaymentStatus paymentStatus;

  final Query$MyBookings$myFacilityBookings$nodes$facility? facility;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$facilityId = facilityId;
    _resultData['facilityId'] = l$facilityId;
    final l$memberId = memberId;
    _resultData['memberId'] = l$memberId;
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime.toIso8601String();
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$purpose = purpose;
    _resultData['purpose'] = l$purpose;
    final l$guestCount = guestCount;
    _resultData['guestCount'] = l$guestCount;
    final l$paymentStatus = paymentStatus;
    _resultData['paymentStatus'] = toJson$Enum$PaymentStatus(l$paymentStatus);
    final l$facility = facility;
    _resultData['facility'] = l$facility?.toJson();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clubId = clubId;
    final l$facilityId = facilityId;
    final l$memberId = memberId;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$status = status;
    final l$purpose = purpose;
    final l$guestCount = guestCount;
    final l$paymentStatus = paymentStatus;
    final l$facility = facility;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$facilityId,
      l$memberId,
      l$startTime,
      l$endTime,
      l$status,
      l$purpose,
      l$guestCount,
      l$paymentStatus,
      l$facility,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyBookings$myFacilityBookings$nodes ||
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
    final l$facilityId = facilityId;
    final lOther$facilityId = other.facilityId;
    if (l$facilityId != lOther$facilityId) {
      return false;
    }
    final l$memberId = memberId;
    final lOther$memberId = other.memberId;
    if (l$memberId != lOther$memberId) {
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
    final l$purpose = purpose;
    final lOther$purpose = other.purpose;
    if (l$purpose != lOther$purpose) {
      return false;
    }
    final l$guestCount = guestCount;
    final lOther$guestCount = other.guestCount;
    if (l$guestCount != lOther$guestCount) {
      return false;
    }
    final l$paymentStatus = paymentStatus;
    final lOther$paymentStatus = other.paymentStatus;
    if (l$paymentStatus != lOther$paymentStatus) {
      return false;
    }
    final l$facility = facility;
    final lOther$facility = other.facility;
    if (l$facility != lOther$facility) {
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

extension UtilityExtension$Query$MyBookings$myFacilityBookings$nodes
    on Query$MyBookings$myFacilityBookings$nodes {
  CopyWith$Query$MyBookings$myFacilityBookings$nodes<
    Query$MyBookings$myFacilityBookings$nodes
  >
  get copyWith =>
      CopyWith$Query$MyBookings$myFacilityBookings$nodes(this, (i) => i);
}

abstract class CopyWith$Query$MyBookings$myFacilityBookings$nodes<TRes> {
  factory CopyWith$Query$MyBookings$myFacilityBookings$nodes(
    Query$MyBookings$myFacilityBookings$nodes instance,
    TRes Function(Query$MyBookings$myFacilityBookings$nodes) then,
  ) = _CopyWithImpl$Query$MyBookings$myFacilityBookings$nodes;

  factory CopyWith$Query$MyBookings$myFacilityBookings$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$MyBookings$myFacilityBookings$nodes;

  TRes call({
    String? id,
    String? clubId,
    String? facilityId,
    String? memberId,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? purpose,
    int? guestCount,
    Enum$PaymentStatus? paymentStatus,
    Query$MyBookings$myFacilityBookings$nodes$facility? facility,
    DateTime? createdAt,
    String? $__typename,
  });
  CopyWith$Query$MyBookings$myFacilityBookings$nodes$facility<TRes>
  get facility;
}

class _CopyWithImpl$Query$MyBookings$myFacilityBookings$nodes<TRes>
    implements CopyWith$Query$MyBookings$myFacilityBookings$nodes<TRes> {
  _CopyWithImpl$Query$MyBookings$myFacilityBookings$nodes(
    this._instance,
    this._then,
  );

  final Query$MyBookings$myFacilityBookings$nodes _instance;

  final TRes Function(Query$MyBookings$myFacilityBookings$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? facilityId = _undefined,
    Object? memberId = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? status = _undefined,
    Object? purpose = _undefined,
    Object? guestCount = _undefined,
    Object? paymentStatus = _undefined,
    Object? facility = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyBookings$myFacilityBookings$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      facilityId: facilityId == _undefined || facilityId == null
          ? _instance.facilityId
          : (facilityId as String),
      memberId: memberId == _undefined || memberId == null
          ? _instance.memberId
          : (memberId as String),
      startTime: startTime == _undefined || startTime == null
          ? _instance.startTime
          : (startTime as DateTime),
      endTime: endTime == _undefined || endTime == null
          ? _instance.endTime
          : (endTime as DateTime),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$BookingStatus),
      purpose: purpose == _undefined ? _instance.purpose : (purpose as String?),
      guestCount: guestCount == _undefined
          ? _instance.guestCount
          : (guestCount as int?),
      paymentStatus: paymentStatus == _undefined || paymentStatus == null
          ? _instance.paymentStatus
          : (paymentStatus as Enum$PaymentStatus),
      facility: facility == _undefined
          ? _instance.facility
          : (facility as Query$MyBookings$myFacilityBookings$nodes$facility?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$MyBookings$myFacilityBookings$nodes$facility<TRes>
  get facility {
    final local$facility = _instance.facility;
    return local$facility == null
        ? CopyWith$Query$MyBookings$myFacilityBookings$nodes$facility.stub(
            _then(_instance),
          )
        : CopyWith$Query$MyBookings$myFacilityBookings$nodes$facility(
            local$facility,
            (e) => call(facility: e),
          );
  }
}

class _CopyWithStubImpl$Query$MyBookings$myFacilityBookings$nodes<TRes>
    implements CopyWith$Query$MyBookings$myFacilityBookings$nodes<TRes> {
  _CopyWithStubImpl$Query$MyBookings$myFacilityBookings$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? facilityId,
    String? memberId,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? purpose,
    int? guestCount,
    Enum$PaymentStatus? paymentStatus,
    Query$MyBookings$myFacilityBookings$nodes$facility? facility,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$MyBookings$myFacilityBookings$nodes$facility<TRes>
  get facility =>
      CopyWith$Query$MyBookings$myFacilityBookings$nodes$facility.stub(_res);
}

class Query$MyBookings$myFacilityBookings$nodes$facility {
  Query$MyBookings$myFacilityBookings$nodes$facility({
    required this.id,
    required this.name,
    required this.type,
    this.$__typename = 'Facility',
  });

  factory Query$MyBookings$myFacilityBookings$nodes$facility.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$type = json['type'];
    final l$$__typename = json['__typename'];
    return Query$MyBookings$myFacilityBookings$nodes$facility(
      id: (l$id as String),
      name: (l$name as String),
      type: fromJson$Enum$FacilityType((l$type as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final Enum$FacilityType type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$id = id;
    final l$name = name;
    final l$type = type;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$type, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyBookings$myFacilityBookings$nodes$facility ||
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

extension UtilityExtension$Query$MyBookings$myFacilityBookings$nodes$facility
    on Query$MyBookings$myFacilityBookings$nodes$facility {
  CopyWith$Query$MyBookings$myFacilityBookings$nodes$facility<
    Query$MyBookings$myFacilityBookings$nodes$facility
  >
  get copyWith => CopyWith$Query$MyBookings$myFacilityBookings$nodes$facility(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$MyBookings$myFacilityBookings$nodes$facility<
  TRes
> {
  factory CopyWith$Query$MyBookings$myFacilityBookings$nodes$facility(
    Query$MyBookings$myFacilityBookings$nodes$facility instance,
    TRes Function(Query$MyBookings$myFacilityBookings$nodes$facility) then,
  ) = _CopyWithImpl$Query$MyBookings$myFacilityBookings$nodes$facility;

  factory CopyWith$Query$MyBookings$myFacilityBookings$nodes$facility.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$MyBookings$myFacilityBookings$nodes$facility;

  TRes call({
    String? id,
    String? name,
    Enum$FacilityType? type,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MyBookings$myFacilityBookings$nodes$facility<TRes>
    implements
        CopyWith$Query$MyBookings$myFacilityBookings$nodes$facility<TRes> {
  _CopyWithImpl$Query$MyBookings$myFacilityBookings$nodes$facility(
    this._instance,
    this._then,
  );

  final Query$MyBookings$myFacilityBookings$nodes$facility _instance;

  final TRes Function(Query$MyBookings$myFacilityBookings$nodes$facility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? type = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyBookings$myFacilityBookings$nodes$facility(
      id: id == _undefined || id == null ? _instance.id : (id as String),
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

class _CopyWithStubImpl$Query$MyBookings$myFacilityBookings$nodes$facility<TRes>
    implements
        CopyWith$Query$MyBookings$myFacilityBookings$nodes$facility<TRes> {
  _CopyWithStubImpl$Query$MyBookings$myFacilityBookings$nodes$facility(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? name,
    Enum$FacilityType? type,
    String? $__typename,
  }) => _res;
}

class Query$MyBookings$myFacilityBookings$pageInfo {
  Query$MyBookings$myFacilityBookings$pageInfo({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$MyBookings$myFacilityBookings$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$page = json['page'];
    final l$pageSize = json['pageSize'];
    final l$total = json['total'];
    final l$totalPages = json['totalPages'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPrevPage = json['hasPrevPage'];
    final l$$__typename = json['__typename'];
    return Query$MyBookings$myFacilityBookings$pageInfo(
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
    if (other is! Query$MyBookings$myFacilityBookings$pageInfo ||
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

extension UtilityExtension$Query$MyBookings$myFacilityBookings$pageInfo
    on Query$MyBookings$myFacilityBookings$pageInfo {
  CopyWith$Query$MyBookings$myFacilityBookings$pageInfo<
    Query$MyBookings$myFacilityBookings$pageInfo
  >
  get copyWith =>
      CopyWith$Query$MyBookings$myFacilityBookings$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$MyBookings$myFacilityBookings$pageInfo<TRes> {
  factory CopyWith$Query$MyBookings$myFacilityBookings$pageInfo(
    Query$MyBookings$myFacilityBookings$pageInfo instance,
    TRes Function(Query$MyBookings$myFacilityBookings$pageInfo) then,
  ) = _CopyWithImpl$Query$MyBookings$myFacilityBookings$pageInfo;

  factory CopyWith$Query$MyBookings$myFacilityBookings$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$MyBookings$myFacilityBookings$pageInfo;

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

class _CopyWithImpl$Query$MyBookings$myFacilityBookings$pageInfo<TRes>
    implements CopyWith$Query$MyBookings$myFacilityBookings$pageInfo<TRes> {
  _CopyWithImpl$Query$MyBookings$myFacilityBookings$pageInfo(
    this._instance,
    this._then,
  );

  final Query$MyBookings$myFacilityBookings$pageInfo _instance;

  final TRes Function(Query$MyBookings$myFacilityBookings$pageInfo) _then;

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
    Query$MyBookings$myFacilityBookings$pageInfo(
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

class _CopyWithStubImpl$Query$MyBookings$myFacilityBookings$pageInfo<TRes>
    implements CopyWith$Query$MyBookings$myFacilityBookings$pageInfo<TRes> {
  _CopyWithStubImpl$Query$MyBookings$myFacilityBookings$pageInfo(this._res);

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
