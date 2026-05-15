import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Bookings {
  factory Variables$Query$Bookings({
    Input$PaginationInput? pagination,
    Enum$BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
  }) => Variables$Query$Bookings._({
    if (pagination != null) r'pagination': pagination,
    if (status != null) r'status': status,
    if (startDate != null) r'startDate': startDate,
    if (endDate != null) r'endDate': endDate,
  });

  Variables$Query$Bookings._(this._$data);

  factory Variables$Query$Bookings.fromJson(Map<String, dynamic> data) {
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
    if (data.containsKey('startDate')) {
      final l$startDate = data['startDate'];
      result$data['startDate'] = l$startDate == null
          ? null
          : DateTime.parse((l$startDate as String));
    }
    if (data.containsKey('endDate')) {
      final l$endDate = data['endDate'];
      result$data['endDate'] = l$endDate == null
          ? null
          : DateTime.parse((l$endDate as String));
    }
    return Variables$Query$Bookings._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Enum$BookingStatus? get status => (_$data['status'] as Enum$BookingStatus?);

  DateTime? get startDate => (_$data['startDate'] as DateTime?);

  DateTime? get endDate => (_$data['endDate'] as DateTime?);

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
    if (_$data.containsKey('startDate')) {
      final l$startDate = startDate;
      result$data['startDate'] = l$startDate?.toIso8601String();
    }
    if (_$data.containsKey('endDate')) {
      final l$endDate = endDate;
      result$data['endDate'] = l$endDate?.toIso8601String();
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
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (_$data.containsKey('startDate') !=
        other._$data.containsKey('startDate')) {
      return false;
    }
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (_$data.containsKey('endDate') != other._$data.containsKey('endDate')) {
      return false;
    }
    if (l$endDate != lOther$endDate) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$pagination = pagination;
    final l$status = status;
    final l$startDate = startDate;
    final l$endDate = endDate;
    return Object.hashAll([
      _$data.containsKey('pagination') ? l$pagination : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('startDate') ? l$startDate : const {},
      _$data.containsKey('endDate') ? l$endDate : const {},
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
    Input$PaginationInput? pagination,
    Enum$BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
  });
}

class _CopyWithImpl$Variables$Query$Bookings<TRes>
    implements CopyWith$Variables$Query$Bookings<TRes> {
  _CopyWithImpl$Variables$Query$Bookings(this._instance, this._then);

  final Variables$Query$Bookings _instance;

  final TRes Function(Variables$Query$Bookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? pagination = _undefined,
    Object? status = _undefined,
    Object? startDate = _undefined,
    Object? endDate = _undefined,
  }) => _then(
    Variables$Query$Bookings._({
      ..._instance._$data,
      if (pagination != _undefined)
        'pagination': (pagination as Input$PaginationInput?),
      if (status != _undefined) 'status': (status as Enum$BookingStatus?),
      if (startDate != _undefined) 'startDate': (startDate as DateTime?),
      if (endDate != _undefined) 'endDate': (endDate as DateTime?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$Bookings<TRes>
    implements CopyWith$Variables$Query$Bookings<TRes> {
  _CopyWithStubImpl$Variables$Query$Bookings(this._res);

  TRes _res;

  call({
    Input$PaginationInput? pagination,
    Enum$BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
  }) => _res;
}

class Query$Bookings {
  Query$Bookings({required this.facilityBookings, this.$__typename = 'Query'});

  factory Query$Bookings.fromJson(Map<String, dynamic> json) {
    final l$facilityBookings = json['facilityBookings'];
    final l$$__typename = json['__typename'];
    return Query$Bookings(
      facilityBookings: Query$Bookings$facilityBookings.fromJson(
        (l$facilityBookings as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Bookings$facilityBookings facilityBookings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$facilityBookings = facilityBookings;
    _resultData['facilityBookings'] = l$facilityBookings.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$facilityBookings = facilityBookings;
    final l$$__typename = $__typename;
    return Object.hashAll([l$facilityBookings, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Bookings || runtimeType != other.runtimeType) {
      return false;
    }
    final l$facilityBookings = facilityBookings;
    final lOther$facilityBookings = other.facilityBookings;
    if (l$facilityBookings != lOther$facilityBookings) {
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

  TRes call({
    Query$Bookings$facilityBookings? facilityBookings,
    String? $__typename,
  });
  CopyWith$Query$Bookings$facilityBookings<TRes> get facilityBookings;
}

class _CopyWithImpl$Query$Bookings<TRes>
    implements CopyWith$Query$Bookings<TRes> {
  _CopyWithImpl$Query$Bookings(this._instance, this._then);

  final Query$Bookings _instance;

  final TRes Function(Query$Bookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? facilityBookings = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Bookings(
      facilityBookings:
          facilityBookings == _undefined || facilityBookings == null
          ? _instance.facilityBookings
          : (facilityBookings as Query$Bookings$facilityBookings),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Bookings$facilityBookings<TRes> get facilityBookings {
    final local$facilityBookings = _instance.facilityBookings;
    return CopyWith$Query$Bookings$facilityBookings(
      local$facilityBookings,
      (e) => call(facilityBookings: e),
    );
  }
}

class _CopyWithStubImpl$Query$Bookings<TRes>
    implements CopyWith$Query$Bookings<TRes> {
  _CopyWithStubImpl$Query$Bookings(this._res);

  TRes _res;

  call({
    Query$Bookings$facilityBookings? facilityBookings,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Bookings$facilityBookings<TRes> get facilityBookings =>
      CopyWith$Query$Bookings$facilityBookings.stub(_res);
}

const documentNodeQueryBookings = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Bookings'),
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
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'startDate')),
          type: NamedTypeNode(name: NameNode(value: 'Time'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'endDate')),
          type: NamedTypeNode(name: NameNode(value: 'Time'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'facilityBookings'),
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
              ArgumentNode(
                name: NameNode(value: 'startDate'),
                value: VariableNode(name: NameNode(value: 'startDate')),
              ),
              ArgumentNode(
                name: NameNode(value: 'endDate'),
                value: VariableNode(name: NameNode(value: 'endDate')),
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

class Query$Bookings$facilityBookings {
  Query$Bookings$facilityBookings({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'BookingConnection',
  });

  factory Query$Bookings$facilityBookings.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$Bookings$facilityBookings(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$Bookings$facilityBookings$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$Bookings$facilityBookings$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Bookings$facilityBookings$nodes> nodes;

  final Query$Bookings$facilityBookings$pageInfo pageInfo;

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
    if (other is! Query$Bookings$facilityBookings ||
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

extension UtilityExtension$Query$Bookings$facilityBookings
    on Query$Bookings$facilityBookings {
  CopyWith$Query$Bookings$facilityBookings<Query$Bookings$facilityBookings>
  get copyWith => CopyWith$Query$Bookings$facilityBookings(this, (i) => i);
}

abstract class CopyWith$Query$Bookings$facilityBookings<TRes> {
  factory CopyWith$Query$Bookings$facilityBookings(
    Query$Bookings$facilityBookings instance,
    TRes Function(Query$Bookings$facilityBookings) then,
  ) = _CopyWithImpl$Query$Bookings$facilityBookings;

  factory CopyWith$Query$Bookings$facilityBookings.stub(TRes res) =
      _CopyWithStubImpl$Query$Bookings$facilityBookings;

  TRes call({
    List<Query$Bookings$facilityBookings$nodes>? nodes,
    Query$Bookings$facilityBookings$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$Bookings$facilityBookings$nodes> Function(
      Iterable<
        CopyWith$Query$Bookings$facilityBookings$nodes<
          Query$Bookings$facilityBookings$nodes
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$Bookings$facilityBookings$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$Bookings$facilityBookings<TRes>
    implements CopyWith$Query$Bookings$facilityBookings<TRes> {
  _CopyWithImpl$Query$Bookings$facilityBookings(this._instance, this._then);

  final Query$Bookings$facilityBookings _instance;

  final TRes Function(Query$Bookings$facilityBookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Bookings$facilityBookings(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$Bookings$facilityBookings$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$Bookings$facilityBookings$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$Bookings$facilityBookings$nodes> Function(
      Iterable<
        CopyWith$Query$Bookings$facilityBookings$nodes<
          Query$Bookings$facilityBookings$nodes
        >
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$Bookings$facilityBookings$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$Bookings$facilityBookings$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$Bookings$facilityBookings$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$Bookings$facilityBookings<TRes>
    implements CopyWith$Query$Bookings$facilityBookings<TRes> {
  _CopyWithStubImpl$Query$Bookings$facilityBookings(this._res);

  TRes _res;

  call({
    List<Query$Bookings$facilityBookings$nodes>? nodes,
    Query$Bookings$facilityBookings$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$Bookings$facilityBookings$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$Bookings$facilityBookings$pageInfo.stub(_res);
}

class Query$Bookings$facilityBookings$nodes {
  Query$Bookings$facilityBookings$nodes({
    required this.id,
    required this.clubId,
    required this.facilityId,
    required this.memberId,
    this.facility,
    required this.startTime,
    required this.endTime,
    required this.status,
    this.purpose,
    this.guestCount,
    required this.paymentStatus,
    required this.createdAt,
    this.$__typename = 'FacilityBooking',
  });

  factory Query$Bookings$facilityBookings$nodes.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$facilityId = json['facilityId'];
    final l$memberId = json['memberId'];
    final l$facility = json['facility'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$status = json['status'];
    final l$purpose = json['purpose'];
    final l$guestCount = json['guestCount'];
    final l$paymentStatus = json['paymentStatus'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$Bookings$facilityBookings$nodes(
      id: (l$id as String),
      clubId: (l$clubId as String),
      facilityId: (l$facilityId as String),
      memberId: (l$memberId as String),
      facility: l$facility == null
          ? null
          : Query$Bookings$facilityBookings$nodes$facility.fromJson(
              (l$facility as Map<String, dynamic>),
            ),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      purpose: (l$purpose as String?),
      guestCount: (l$guestCount as int?),
      paymentStatus: fromJson$Enum$PaymentStatus((l$paymentStatus as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String facilityId;

  final String memberId;

  final Query$Bookings$facilityBookings$nodes$facility? facility;

  final DateTime startTime;

  final DateTime endTime;

  final Enum$BookingStatus status;

  final String? purpose;

  final int? guestCount;

  final Enum$PaymentStatus paymentStatus;

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
    final l$facility = facility;
    _resultData['facility'] = l$facility?.toJson();
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
    final l$facility = facility;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$status = status;
    final l$purpose = purpose;
    final l$guestCount = guestCount;
    final l$paymentStatus = paymentStatus;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$facilityId,
      l$memberId,
      l$facility,
      l$startTime,
      l$endTime,
      l$status,
      l$purpose,
      l$guestCount,
      l$paymentStatus,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Bookings$facilityBookings$nodes ||
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

extension UtilityExtension$Query$Bookings$facilityBookings$nodes
    on Query$Bookings$facilityBookings$nodes {
  CopyWith$Query$Bookings$facilityBookings$nodes<
    Query$Bookings$facilityBookings$nodes
  >
  get copyWith =>
      CopyWith$Query$Bookings$facilityBookings$nodes(this, (i) => i);
}

abstract class CopyWith$Query$Bookings$facilityBookings$nodes<TRes> {
  factory CopyWith$Query$Bookings$facilityBookings$nodes(
    Query$Bookings$facilityBookings$nodes instance,
    TRes Function(Query$Bookings$facilityBookings$nodes) then,
  ) = _CopyWithImpl$Query$Bookings$facilityBookings$nodes;

  factory CopyWith$Query$Bookings$facilityBookings$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$Bookings$facilityBookings$nodes;

  TRes call({
    String? id,
    String? clubId,
    String? facilityId,
    String? memberId,
    Query$Bookings$facilityBookings$nodes$facility? facility,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? purpose,
    int? guestCount,
    Enum$PaymentStatus? paymentStatus,
    DateTime? createdAt,
    String? $__typename,
  });
  CopyWith$Query$Bookings$facilityBookings$nodes$facility<TRes> get facility;
}

class _CopyWithImpl$Query$Bookings$facilityBookings$nodes<TRes>
    implements CopyWith$Query$Bookings$facilityBookings$nodes<TRes> {
  _CopyWithImpl$Query$Bookings$facilityBookings$nodes(
    this._instance,
    this._then,
  );

  final Query$Bookings$facilityBookings$nodes _instance;

  final TRes Function(Query$Bookings$facilityBookings$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? facilityId = _undefined,
    Object? memberId = _undefined,
    Object? facility = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? status = _undefined,
    Object? purpose = _undefined,
    Object? guestCount = _undefined,
    Object? paymentStatus = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Bookings$facilityBookings$nodes(
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
      facility: facility == _undefined
          ? _instance.facility
          : (facility as Query$Bookings$facilityBookings$nodes$facility?),
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
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Bookings$facilityBookings$nodes$facility<TRes> get facility {
    final local$facility = _instance.facility;
    return local$facility == null
        ? CopyWith$Query$Bookings$facilityBookings$nodes$facility.stub(
            _then(_instance),
          )
        : CopyWith$Query$Bookings$facilityBookings$nodes$facility(
            local$facility,
            (e) => call(facility: e),
          );
  }
}

class _CopyWithStubImpl$Query$Bookings$facilityBookings$nodes<TRes>
    implements CopyWith$Query$Bookings$facilityBookings$nodes<TRes> {
  _CopyWithStubImpl$Query$Bookings$facilityBookings$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? facilityId,
    String? memberId,
    Query$Bookings$facilityBookings$nodes$facility? facility,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? purpose,
    int? guestCount,
    Enum$PaymentStatus? paymentStatus,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Bookings$facilityBookings$nodes$facility<TRes> get facility =>
      CopyWith$Query$Bookings$facilityBookings$nodes$facility.stub(_res);
}

class Query$Bookings$facilityBookings$nodes$facility {
  Query$Bookings$facilityBookings$nodes$facility({
    required this.id,
    required this.name,
    required this.type,
    this.$__typename = 'Facility',
  });

  factory Query$Bookings$facilityBookings$nodes$facility.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$type = json['type'];
    final l$$__typename = json['__typename'];
    return Query$Bookings$facilityBookings$nodes$facility(
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
    if (other is! Query$Bookings$facilityBookings$nodes$facility ||
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

extension UtilityExtension$Query$Bookings$facilityBookings$nodes$facility
    on Query$Bookings$facilityBookings$nodes$facility {
  CopyWith$Query$Bookings$facilityBookings$nodes$facility<
    Query$Bookings$facilityBookings$nodes$facility
  >
  get copyWith =>
      CopyWith$Query$Bookings$facilityBookings$nodes$facility(this, (i) => i);
}

abstract class CopyWith$Query$Bookings$facilityBookings$nodes$facility<TRes> {
  factory CopyWith$Query$Bookings$facilityBookings$nodes$facility(
    Query$Bookings$facilityBookings$nodes$facility instance,
    TRes Function(Query$Bookings$facilityBookings$nodes$facility) then,
  ) = _CopyWithImpl$Query$Bookings$facilityBookings$nodes$facility;

  factory CopyWith$Query$Bookings$facilityBookings$nodes$facility.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Bookings$facilityBookings$nodes$facility;

  TRes call({
    String? id,
    String? name,
    Enum$FacilityType? type,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Bookings$facilityBookings$nodes$facility<TRes>
    implements CopyWith$Query$Bookings$facilityBookings$nodes$facility<TRes> {
  _CopyWithImpl$Query$Bookings$facilityBookings$nodes$facility(
    this._instance,
    this._then,
  );

  final Query$Bookings$facilityBookings$nodes$facility _instance;

  final TRes Function(Query$Bookings$facilityBookings$nodes$facility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? type = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Bookings$facilityBookings$nodes$facility(
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

class _CopyWithStubImpl$Query$Bookings$facilityBookings$nodes$facility<TRes>
    implements CopyWith$Query$Bookings$facilityBookings$nodes$facility<TRes> {
  _CopyWithStubImpl$Query$Bookings$facilityBookings$nodes$facility(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    Enum$FacilityType? type,
    String? $__typename,
  }) => _res;
}

class Query$Bookings$facilityBookings$pageInfo {
  Query$Bookings$facilityBookings$pageInfo({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$Bookings$facilityBookings$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$page = json['page'];
    final l$pageSize = json['pageSize'];
    final l$total = json['total'];
    final l$totalPages = json['totalPages'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPrevPage = json['hasPrevPage'];
    final l$$__typename = json['__typename'];
    return Query$Bookings$facilityBookings$pageInfo(
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
    if (other is! Query$Bookings$facilityBookings$pageInfo ||
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

extension UtilityExtension$Query$Bookings$facilityBookings$pageInfo
    on Query$Bookings$facilityBookings$pageInfo {
  CopyWith$Query$Bookings$facilityBookings$pageInfo<
    Query$Bookings$facilityBookings$pageInfo
  >
  get copyWith =>
      CopyWith$Query$Bookings$facilityBookings$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$Bookings$facilityBookings$pageInfo<TRes> {
  factory CopyWith$Query$Bookings$facilityBookings$pageInfo(
    Query$Bookings$facilityBookings$pageInfo instance,
    TRes Function(Query$Bookings$facilityBookings$pageInfo) then,
  ) = _CopyWithImpl$Query$Bookings$facilityBookings$pageInfo;

  factory CopyWith$Query$Bookings$facilityBookings$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$Bookings$facilityBookings$pageInfo;

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

class _CopyWithImpl$Query$Bookings$facilityBookings$pageInfo<TRes>
    implements CopyWith$Query$Bookings$facilityBookings$pageInfo<TRes> {
  _CopyWithImpl$Query$Bookings$facilityBookings$pageInfo(
    this._instance,
    this._then,
  );

  final Query$Bookings$facilityBookings$pageInfo _instance;

  final TRes Function(Query$Bookings$facilityBookings$pageInfo) _then;

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
    Query$Bookings$facilityBookings$pageInfo(
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

class _CopyWithStubImpl$Query$Bookings$facilityBookings$pageInfo<TRes>
    implements CopyWith$Query$Bookings$facilityBookings$pageInfo<TRes> {
  _CopyWithStubImpl$Query$Bookings$facilityBookings$pageInfo(this._res);

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
