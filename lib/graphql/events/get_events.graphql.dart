import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$GetEvents {
  factory Variables$Query$GetEvents({
    required String clubId,
    Input$EventFilters? filters,
    required Input$PaginationInput pagination,
  }) => Variables$Query$GetEvents._({
    r'clubId': clubId,
    if (filters != null) r'filters': filters,
    r'pagination': pagination,
  });

  Variables$Query$GetEvents._(this._$data);

  factory Variables$Query$GetEvents.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$clubId = data['clubId'];
    result$data['clubId'] = (l$clubId as String);
    if (data.containsKey('filters')) {
      final l$filters = data['filters'];
      result$data['filters'] = l$filters == null
          ? null
          : Input$EventFilters.fromJson((l$filters as Map<String, dynamic>));
    }
    final l$pagination = data['pagination'];
    result$data['pagination'] = Input$PaginationInput.fromJson(
      (l$pagination as Map<String, dynamic>),
    );
    return Variables$Query$GetEvents._(result$data);
  }

  Map<String, dynamic> _$data;

  String get clubId => (_$data['clubId'] as String);

  Input$EventFilters? get filters => (_$data['filters'] as Input$EventFilters?);

  Input$PaginationInput get pagination =>
      (_$data['pagination'] as Input$PaginationInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$clubId = clubId;
    result$data['clubId'] = l$clubId;
    if (_$data.containsKey('filters')) {
      final l$filters = filters;
      result$data['filters'] = l$filters?.toJson();
    }
    final l$pagination = pagination;
    result$data['pagination'] = l$pagination.toJson();
    return result$data;
  }

  CopyWith$Variables$Query$GetEvents<Variables$Query$GetEvents> get copyWith =>
      CopyWith$Variables$Query$GetEvents(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetEvents ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$clubId = clubId;
    final lOther$clubId = other.clubId;
    if (l$clubId != lOther$clubId) {
      return false;
    }
    final l$filters = filters;
    final lOther$filters = other.filters;
    if (_$data.containsKey('filters') != other._$data.containsKey('filters')) {
      return false;
    }
    if (l$filters != lOther$filters) {
      return false;
    }
    final l$pagination = pagination;
    final lOther$pagination = other.pagination;
    if (l$pagination != lOther$pagination) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$clubId = clubId;
    final l$filters = filters;
    final l$pagination = pagination;
    return Object.hashAll([
      l$clubId,
      _$data.containsKey('filters') ? l$filters : const {},
      l$pagination,
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetEvents<TRes> {
  factory CopyWith$Variables$Query$GetEvents(
    Variables$Query$GetEvents instance,
    TRes Function(Variables$Query$GetEvents) then,
  ) = _CopyWithImpl$Variables$Query$GetEvents;

  factory CopyWith$Variables$Query$GetEvents.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetEvents;

  TRes call({
    String? clubId,
    Input$EventFilters? filters,
    Input$PaginationInput? pagination,
  });
}

class _CopyWithImpl$Variables$Query$GetEvents<TRes>
    implements CopyWith$Variables$Query$GetEvents<TRes> {
  _CopyWithImpl$Variables$Query$GetEvents(this._instance, this._then);

  final Variables$Query$GetEvents _instance;

  final TRes Function(Variables$Query$GetEvents) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? clubId = _undefined,
    Object? filters = _undefined,
    Object? pagination = _undefined,
  }) => _then(
    Variables$Query$GetEvents._({
      ..._instance._$data,
      if (clubId != _undefined && clubId != null) 'clubId': (clubId as String),
      if (filters != _undefined) 'filters': (filters as Input$EventFilters?),
      if (pagination != _undefined && pagination != null)
        'pagination': (pagination as Input$PaginationInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetEvents<TRes>
    implements CopyWith$Variables$Query$GetEvents<TRes> {
  _CopyWithStubImpl$Variables$Query$GetEvents(this._res);

  TRes _res;

  call({
    String? clubId,
    Input$EventFilters? filters,
    Input$PaginationInput? pagination,
  }) => _res;
}

class Query$GetEvents {
  Query$GetEvents({required this.events, this.$__typename = 'Query'});

  factory Query$GetEvents.fromJson(Map<String, dynamic> json) {
    final l$events = json['events'];
    final l$$__typename = json['__typename'];
    return Query$GetEvents(
      events: Query$GetEvents$events.fromJson(
        (l$events as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetEvents$events events;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$events = events;
    _resultData['events'] = l$events.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$events = events;
    final l$$__typename = $__typename;
    return Object.hashAll([l$events, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetEvents || runtimeType != other.runtimeType) {
      return false;
    }
    final l$events = events;
    final lOther$events = other.events;
    if (l$events != lOther$events) {
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

extension UtilityExtension$Query$GetEvents on Query$GetEvents {
  CopyWith$Query$GetEvents<Query$GetEvents> get copyWith =>
      CopyWith$Query$GetEvents(this, (i) => i);
}

abstract class CopyWith$Query$GetEvents<TRes> {
  factory CopyWith$Query$GetEvents(
    Query$GetEvents instance,
    TRes Function(Query$GetEvents) then,
  ) = _CopyWithImpl$Query$GetEvents;

  factory CopyWith$Query$GetEvents.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEvents;

  TRes call({Query$GetEvents$events? events, String? $__typename});
  CopyWith$Query$GetEvents$events<TRes> get events;
}

class _CopyWithImpl$Query$GetEvents<TRes>
    implements CopyWith$Query$GetEvents<TRes> {
  _CopyWithImpl$Query$GetEvents(this._instance, this._then);

  final Query$GetEvents _instance;

  final TRes Function(Query$GetEvents) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? events = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetEvents(
          events: events == _undefined || events == null
              ? _instance.events
              : (events as Query$GetEvents$events),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetEvents$events<TRes> get events {
    final local$events = _instance.events;
    return CopyWith$Query$GetEvents$events(
      local$events,
      (e) => call(events: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetEvents<TRes>
    implements CopyWith$Query$GetEvents<TRes> {
  _CopyWithStubImpl$Query$GetEvents(this._res);

  TRes _res;

  call({Query$GetEvents$events? events, String? $__typename}) => _res;

  CopyWith$Query$GetEvents$events<TRes> get events =>
      CopyWith$Query$GetEvents$events.stub(_res);
}

const documentNodeQueryGetEvents = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetEvents'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'clubId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'filters')),
          type: NamedTypeNode(
            name: NameNode(value: 'EventFilters'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'pagination')),
          type: NamedTypeNode(
            name: NameNode(value: 'PaginationInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'events'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'clubId'),
                value: VariableNode(name: NameNode(value: 'clubId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'filters'),
                value: VariableNode(name: NameNode(value: 'filters')),
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
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'node'),
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
                              name: NameNode(value: 'title'),
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
                              name: NameNode(value: 'eventType'),
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
                              name: NameNode(value: 'location'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'imageUrl'),
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
                              name: NameNode(value: 'currentAttendees'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'availableSpots'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'tentativeCount'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'waitlistCount'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'guestPolicy'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'maxGuestsPerMember'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'requiresApproval'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'requiresPayment'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'price'),
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
                              name: NameNode(value: 'freeCancellationDays'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(
                                value: 'cancellationFeePercentage',
                              ),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'allowsSubgroupPriority'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'fullHouseExclusive'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'rsvpDeadline'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'subgroupId'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'organizerName'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'contactEmail'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'contactPhone'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'paymentInstructions'),
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
                        name: NameNode(value: 'hasPreviousPage'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'startCursor'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'endCursor'),
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
  ],
);
Query$GetEvents _parserFn$Query$GetEvents(Map<String, dynamic> data) =>
    Query$GetEvents.fromJson(data);
typedef OnQueryComplete$Query$GetEvents =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetEvents?);

class Options$Query$GetEvents extends graphql.QueryOptions<Query$GetEvents> {
  Options$Query$GetEvents({
    String? operationName,
    required Variables$Query$GetEvents variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEvents? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetEvents? onComplete,
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
                 data == null ? null : _parserFn$Query$GetEvents(data),
               ),
         onError: onError,
         document: documentNodeQueryGetEvents,
         parserFn: _parserFn$Query$GetEvents,
       );

  final OnQueryComplete$Query$GetEvents? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetEvents
    extends graphql.WatchQueryOptions<Query$GetEvents> {
  WatchOptions$Query$GetEvents({
    String? operationName,
    required Variables$Query$GetEvents variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEvents? typedOptimisticResult,
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
         document: documentNodeQueryGetEvents,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetEvents,
       );
}

class FetchMoreOptions$Query$GetEvents extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetEvents({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetEvents variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetEvents,
       );
}

extension ClientExtension$Query$GetEvents on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetEvents>> query$GetEvents(
    Options$Query$GetEvents options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetEvents> watchQuery$GetEvents(
    WatchOptions$Query$GetEvents options,
  ) => this.watchQuery(options);

  void writeQuery$GetEvents({
    required Query$GetEvents data,
    required Variables$Query$GetEvents variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetEvents),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetEvents? readQuery$GetEvents({
    required Variables$Query$GetEvents variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetEvents),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetEvents.fromJson(result);
  }
}

class Query$GetEvents$events {
  Query$GetEvents$events({
    required this.edges,
    required this.pageInfo,
    required this.totalCount,
    this.$__typename = 'EventConnection',
  });

  factory Query$GetEvents$events.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$totalCount = json['totalCount'];
    final l$$__typename = json['__typename'];
    return Query$GetEvents$events(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => Query$GetEvents$events$edges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$GetEvents$events$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      totalCount: (l$totalCount as int),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetEvents$events$edges> edges;

  final Query$GetEvents$events$pageInfo pageInfo;

  final int totalCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$totalCount = totalCount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$totalCount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetEvents$events || runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
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

extension UtilityExtension$Query$GetEvents$events on Query$GetEvents$events {
  CopyWith$Query$GetEvents$events<Query$GetEvents$events> get copyWith =>
      CopyWith$Query$GetEvents$events(this, (i) => i);
}

abstract class CopyWith$Query$GetEvents$events<TRes> {
  factory CopyWith$Query$GetEvents$events(
    Query$GetEvents$events instance,
    TRes Function(Query$GetEvents$events) then,
  ) = _CopyWithImpl$Query$GetEvents$events;

  factory CopyWith$Query$GetEvents$events.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEvents$events;

  TRes call({
    List<Query$GetEvents$events$edges>? edges,
    Query$GetEvents$events$pageInfo? pageInfo,
    int? totalCount,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetEvents$events$edges> Function(
      Iterable<
        CopyWith$Query$GetEvents$events$edges<Query$GetEvents$events$edges>
      >,
    )
    _fn,
  );
  CopyWith$Query$GetEvents$events$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetEvents$events<TRes>
    implements CopyWith$Query$GetEvents$events<TRes> {
  _CopyWithImpl$Query$GetEvents$events(this._instance, this._then);

  final Query$GetEvents$events _instance;

  final TRes Function(Query$GetEvents$events) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? totalCount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetEvents$events(
      edges: edges == _undefined || edges == null
          ? _instance.edges
          : (edges as List<Query$GetEvents$events$edges>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$GetEvents$events$pageInfo),
      totalCount: totalCount == _undefined || totalCount == null
          ? _instance.totalCount
          : (totalCount as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetEvents$events$edges> Function(
      Iterable<
        CopyWith$Query$GetEvents$events$edges<Query$GetEvents$events$edges>
      >,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges.map(
        (e) => CopyWith$Query$GetEvents$events$edges(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$GetEvents$events$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetEvents$events$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetEvents$events<TRes>
    implements CopyWith$Query$GetEvents$events<TRes> {
  _CopyWithStubImpl$Query$GetEvents$events(this._res);

  TRes _res;

  call({
    List<Query$GetEvents$events$edges>? edges,
    Query$GetEvents$events$pageInfo? pageInfo,
    int? totalCount,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$GetEvents$events$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetEvents$events$pageInfo.stub(_res);
}

class Query$GetEvents$events$edges {
  Query$GetEvents$events$edges({
    required this.node,
    this.$__typename = 'EventEdge',
  });

  factory Query$GetEvents$events$edges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetEvents$events$edges(
      node: Query$GetEvents$events$edges$node.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetEvents$events$edges$node node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([l$node, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetEvents$events$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
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

extension UtilityExtension$Query$GetEvents$events$edges
    on Query$GetEvents$events$edges {
  CopyWith$Query$GetEvents$events$edges<Query$GetEvents$events$edges>
  get copyWith => CopyWith$Query$GetEvents$events$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetEvents$events$edges<TRes> {
  factory CopyWith$Query$GetEvents$events$edges(
    Query$GetEvents$events$edges instance,
    TRes Function(Query$GetEvents$events$edges) then,
  ) = _CopyWithImpl$Query$GetEvents$events$edges;

  factory CopyWith$Query$GetEvents$events$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEvents$events$edges;

  TRes call({Query$GetEvents$events$edges$node? node, String? $__typename});
  CopyWith$Query$GetEvents$events$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetEvents$events$edges<TRes>
    implements CopyWith$Query$GetEvents$events$edges<TRes> {
  _CopyWithImpl$Query$GetEvents$events$edges(this._instance, this._then);

  final Query$GetEvents$events$edges _instance;

  final TRes Function(Query$GetEvents$events$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetEvents$events$edges(
          node: node == _undefined || node == null
              ? _instance.node
              : (node as Query$GetEvents$events$edges$node),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetEvents$events$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$GetEvents$events$edges$node(
      local$node,
      (e) => call(node: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetEvents$events$edges<TRes>
    implements CopyWith$Query$GetEvents$events$edges<TRes> {
  _CopyWithStubImpl$Query$GetEvents$events$edges(this._res);

  TRes _res;

  call({Query$GetEvents$events$edges$node? node, String? $__typename}) => _res;

  CopyWith$Query$GetEvents$events$edges$node<TRes> get node =>
      CopyWith$Query$GetEvents$events$edges$node.stub(_res);
}

class Query$GetEvents$events$edges$node {
  Query$GetEvents$events$edges$node({
    required this.id,
    required this.clubId,
    required this.title,
    this.description,
    this.eventType,
    required this.startTime,
    required this.endTime,
    this.location,
    this.imageUrl,
    this.capacity,
    this.currentAttendees,
    this.availableSpots,
    this.tentativeCount,
    this.waitlistCount,
    this.guestPolicy,
    this.maxGuestsPerMember,
    this.requiresApproval,
    this.requiresPayment,
    this.price,
    this.cancellationDeadline,
    this.freeCancellationDays,
    this.cancellationFeePercentage,
    this.allowsSubgroupPriority,
    this.fullHouseExclusive,
    this.rsvpDeadline,
    this.subgroupId,
    this.organizerName,
    this.contactEmail,
    this.contactPhone,
    this.paymentInstructions,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Event',
  });

  factory Query$GetEvents$events$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$eventType = json['eventType'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$location = json['location'];
    final l$imageUrl = json['imageUrl'];
    final l$capacity = json['capacity'];
    final l$currentAttendees = json['currentAttendees'];
    final l$availableSpots = json['availableSpots'];
    final l$tentativeCount = json['tentativeCount'];
    final l$waitlistCount = json['waitlistCount'];
    final l$guestPolicy = json['guestPolicy'];
    final l$maxGuestsPerMember = json['maxGuestsPerMember'];
    final l$requiresApproval = json['requiresApproval'];
    final l$requiresPayment = json['requiresPayment'];
    final l$price = json['price'];
    final l$cancellationDeadline = json['cancellationDeadline'];
    final l$freeCancellationDays = json['freeCancellationDays'];
    final l$cancellationFeePercentage = json['cancellationFeePercentage'];
    final l$allowsSubgroupPriority = json['allowsSubgroupPriority'];
    final l$fullHouseExclusive = json['fullHouseExclusive'];
    final l$rsvpDeadline = json['rsvpDeadline'];
    final l$subgroupId = json['subgroupId'];
    final l$organizerName = json['organizerName'];
    final l$contactEmail = json['contactEmail'];
    final l$contactPhone = json['contactPhone'];
    final l$paymentInstructions = json['paymentInstructions'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$GetEvents$events$edges$node(
      id: (l$id as String),
      clubId: (l$clubId as String),
      title: (l$title as String),
      description: (l$description as String?),
      eventType: (l$eventType as String?),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      location: (l$location as String?),
      imageUrl: (l$imageUrl as String?),
      capacity: (l$capacity as int?),
      currentAttendees: (l$currentAttendees as int?),
      availableSpots: (l$availableSpots as int?),
      tentativeCount: (l$tentativeCount as int?),
      waitlistCount: (l$waitlistCount as int?),
      guestPolicy: (l$guestPolicy as String?),
      maxGuestsPerMember: (l$maxGuestsPerMember as int?),
      requiresApproval: (l$requiresApproval as bool?),
      requiresPayment: (l$requiresPayment as bool?),
      price: (l$price as num?)?.toDouble(),
      cancellationDeadline: l$cancellationDeadline == null
          ? null
          : DateTime.parse((l$cancellationDeadline as String)),
      freeCancellationDays: (l$freeCancellationDays as int?),
      cancellationFeePercentage: (l$cancellationFeePercentage as num?)
          ?.toDouble(),
      allowsSubgroupPriority: (l$allowsSubgroupPriority as bool?),
      fullHouseExclusive: (l$fullHouseExclusive as bool?),
      rsvpDeadline: l$rsvpDeadline == null
          ? null
          : DateTime.parse((l$rsvpDeadline as String)),
      subgroupId: (l$subgroupId as String?),
      organizerName: (l$organizerName as String?),
      contactEmail: (l$contactEmail as String?),
      contactPhone: (l$contactPhone as String?),
      paymentInstructions: (l$paymentInstructions as String?),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String title;

  final String? description;

  final String? eventType;

  final DateTime startTime;

  final DateTime endTime;

  final String? location;

  final String? imageUrl;

  final int? capacity;

  final int? currentAttendees;

  final int? availableSpots;

  final int? tentativeCount;

  final int? waitlistCount;

  final String? guestPolicy;

  final int? maxGuestsPerMember;

  final bool? requiresApproval;

  final bool? requiresPayment;

  final double? price;

  final DateTime? cancellationDeadline;

  final int? freeCancellationDays;

  final double? cancellationFeePercentage;

  final bool? allowsSubgroupPriority;

  final bool? fullHouseExclusive;

  final DateTime? rsvpDeadline;

  final String? subgroupId;

  final String? organizerName;

  final String? contactEmail;

  final String? contactPhone;

  final String? paymentInstructions;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$eventType = eventType;
    _resultData['eventType'] = l$eventType;
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime.toIso8601String();
    final l$location = location;
    _resultData['location'] = l$location;
    final l$imageUrl = imageUrl;
    _resultData['imageUrl'] = l$imageUrl;
    final l$capacity = capacity;
    _resultData['capacity'] = l$capacity;
    final l$currentAttendees = currentAttendees;
    _resultData['currentAttendees'] = l$currentAttendees;
    final l$availableSpots = availableSpots;
    _resultData['availableSpots'] = l$availableSpots;
    final l$tentativeCount = tentativeCount;
    _resultData['tentativeCount'] = l$tentativeCount;
    final l$waitlistCount = waitlistCount;
    _resultData['waitlistCount'] = l$waitlistCount;
    final l$guestPolicy = guestPolicy;
    _resultData['guestPolicy'] = l$guestPolicy;
    final l$maxGuestsPerMember = maxGuestsPerMember;
    _resultData['maxGuestsPerMember'] = l$maxGuestsPerMember;
    final l$requiresApproval = requiresApproval;
    _resultData['requiresApproval'] = l$requiresApproval;
    final l$requiresPayment = requiresPayment;
    _resultData['requiresPayment'] = l$requiresPayment;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$cancellationDeadline = cancellationDeadline;
    _resultData['cancellationDeadline'] = l$cancellationDeadline
        ?.toIso8601String();
    final l$freeCancellationDays = freeCancellationDays;
    _resultData['freeCancellationDays'] = l$freeCancellationDays;
    final l$cancellationFeePercentage = cancellationFeePercentage;
    _resultData['cancellationFeePercentage'] = l$cancellationFeePercentage;
    final l$allowsSubgroupPriority = allowsSubgroupPriority;
    _resultData['allowsSubgroupPriority'] = l$allowsSubgroupPriority;
    final l$fullHouseExclusive = fullHouseExclusive;
    _resultData['fullHouseExclusive'] = l$fullHouseExclusive;
    final l$rsvpDeadline = rsvpDeadline;
    _resultData['rsvpDeadline'] = l$rsvpDeadline?.toIso8601String();
    final l$subgroupId = subgroupId;
    _resultData['subgroupId'] = l$subgroupId;
    final l$organizerName = organizerName;
    _resultData['organizerName'] = l$organizerName;
    final l$contactEmail = contactEmail;
    _resultData['contactEmail'] = l$contactEmail;
    final l$contactPhone = contactPhone;
    _resultData['contactPhone'] = l$contactPhone;
    final l$paymentInstructions = paymentInstructions;
    _resultData['paymentInstructions'] = l$paymentInstructions;
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
    final l$title = title;
    final l$description = description;
    final l$eventType = eventType;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$location = location;
    final l$imageUrl = imageUrl;
    final l$capacity = capacity;
    final l$currentAttendees = currentAttendees;
    final l$availableSpots = availableSpots;
    final l$tentativeCount = tentativeCount;
    final l$waitlistCount = waitlistCount;
    final l$guestPolicy = guestPolicy;
    final l$maxGuestsPerMember = maxGuestsPerMember;
    final l$requiresApproval = requiresApproval;
    final l$requiresPayment = requiresPayment;
    final l$price = price;
    final l$cancellationDeadline = cancellationDeadline;
    final l$freeCancellationDays = freeCancellationDays;
    final l$cancellationFeePercentage = cancellationFeePercentage;
    final l$allowsSubgroupPriority = allowsSubgroupPriority;
    final l$fullHouseExclusive = fullHouseExclusive;
    final l$rsvpDeadline = rsvpDeadline;
    final l$subgroupId = subgroupId;
    final l$organizerName = organizerName;
    final l$contactEmail = contactEmail;
    final l$contactPhone = contactPhone;
    final l$paymentInstructions = paymentInstructions;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$title,
      l$description,
      l$eventType,
      l$startTime,
      l$endTime,
      l$location,
      l$imageUrl,
      l$capacity,
      l$currentAttendees,
      l$availableSpots,
      l$tentativeCount,
      l$waitlistCount,
      l$guestPolicy,
      l$maxGuestsPerMember,
      l$requiresApproval,
      l$requiresPayment,
      l$price,
      l$cancellationDeadline,
      l$freeCancellationDays,
      l$cancellationFeePercentage,
      l$allowsSubgroupPriority,
      l$fullHouseExclusive,
      l$rsvpDeadline,
      l$subgroupId,
      l$organizerName,
      l$contactEmail,
      l$contactPhone,
      l$paymentInstructions,
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
    if (other is! Query$GetEvents$events$edges$node ||
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
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$eventType = eventType;
    final lOther$eventType = other.eventType;
    if (l$eventType != lOther$eventType) {
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
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$imageUrl = imageUrl;
    final lOther$imageUrl = other.imageUrl;
    if (l$imageUrl != lOther$imageUrl) {
      return false;
    }
    final l$capacity = capacity;
    final lOther$capacity = other.capacity;
    if (l$capacity != lOther$capacity) {
      return false;
    }
    final l$currentAttendees = currentAttendees;
    final lOther$currentAttendees = other.currentAttendees;
    if (l$currentAttendees != lOther$currentAttendees) {
      return false;
    }
    final l$availableSpots = availableSpots;
    final lOther$availableSpots = other.availableSpots;
    if (l$availableSpots != lOther$availableSpots) {
      return false;
    }
    final l$tentativeCount = tentativeCount;
    final lOther$tentativeCount = other.tentativeCount;
    if (l$tentativeCount != lOther$tentativeCount) {
      return false;
    }
    final l$waitlistCount = waitlistCount;
    final lOther$waitlistCount = other.waitlistCount;
    if (l$waitlistCount != lOther$waitlistCount) {
      return false;
    }
    final l$guestPolicy = guestPolicy;
    final lOther$guestPolicy = other.guestPolicy;
    if (l$guestPolicy != lOther$guestPolicy) {
      return false;
    }
    final l$maxGuestsPerMember = maxGuestsPerMember;
    final lOther$maxGuestsPerMember = other.maxGuestsPerMember;
    if (l$maxGuestsPerMember != lOther$maxGuestsPerMember) {
      return false;
    }
    final l$requiresApproval = requiresApproval;
    final lOther$requiresApproval = other.requiresApproval;
    if (l$requiresApproval != lOther$requiresApproval) {
      return false;
    }
    final l$requiresPayment = requiresPayment;
    final lOther$requiresPayment = other.requiresPayment;
    if (l$requiresPayment != lOther$requiresPayment) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$cancellationDeadline = cancellationDeadline;
    final lOther$cancellationDeadline = other.cancellationDeadline;
    if (l$cancellationDeadline != lOther$cancellationDeadline) {
      return false;
    }
    final l$freeCancellationDays = freeCancellationDays;
    final lOther$freeCancellationDays = other.freeCancellationDays;
    if (l$freeCancellationDays != lOther$freeCancellationDays) {
      return false;
    }
    final l$cancellationFeePercentage = cancellationFeePercentage;
    final lOther$cancellationFeePercentage = other.cancellationFeePercentage;
    if (l$cancellationFeePercentage != lOther$cancellationFeePercentage) {
      return false;
    }
    final l$allowsSubgroupPriority = allowsSubgroupPriority;
    final lOther$allowsSubgroupPriority = other.allowsSubgroupPriority;
    if (l$allowsSubgroupPriority != lOther$allowsSubgroupPriority) {
      return false;
    }
    final l$fullHouseExclusive = fullHouseExclusive;
    final lOther$fullHouseExclusive = other.fullHouseExclusive;
    if (l$fullHouseExclusive != lOther$fullHouseExclusive) {
      return false;
    }
    final l$rsvpDeadline = rsvpDeadline;
    final lOther$rsvpDeadline = other.rsvpDeadline;
    if (l$rsvpDeadline != lOther$rsvpDeadline) {
      return false;
    }
    final l$subgroupId = subgroupId;
    final lOther$subgroupId = other.subgroupId;
    if (l$subgroupId != lOther$subgroupId) {
      return false;
    }
    final l$organizerName = organizerName;
    final lOther$organizerName = other.organizerName;
    if (l$organizerName != lOther$organizerName) {
      return false;
    }
    final l$contactEmail = contactEmail;
    final lOther$contactEmail = other.contactEmail;
    if (l$contactEmail != lOther$contactEmail) {
      return false;
    }
    final l$contactPhone = contactPhone;
    final lOther$contactPhone = other.contactPhone;
    if (l$contactPhone != lOther$contactPhone) {
      return false;
    }
    final l$paymentInstructions = paymentInstructions;
    final lOther$paymentInstructions = other.paymentInstructions;
    if (l$paymentInstructions != lOther$paymentInstructions) {
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

extension UtilityExtension$Query$GetEvents$events$edges$node
    on Query$GetEvents$events$edges$node {
  CopyWith$Query$GetEvents$events$edges$node<Query$GetEvents$events$edges$node>
  get copyWith => CopyWith$Query$GetEvents$events$edges$node(this, (i) => i);
}

abstract class CopyWith$Query$GetEvents$events$edges$node<TRes> {
  factory CopyWith$Query$GetEvents$events$edges$node(
    Query$GetEvents$events$edges$node instance,
    TRes Function(Query$GetEvents$events$edges$node) then,
  ) = _CopyWithImpl$Query$GetEvents$events$edges$node;

  factory CopyWith$Query$GetEvents$events$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEvents$events$edges$node;

  TRes call({
    String? id,
    String? clubId,
    String? title,
    String? description,
    String? eventType,
    DateTime? startTime,
    DateTime? endTime,
    String? location,
    String? imageUrl,
    int? capacity,
    int? currentAttendees,
    int? availableSpots,
    int? tentativeCount,
    int? waitlistCount,
    String? guestPolicy,
    int? maxGuestsPerMember,
    bool? requiresApproval,
    bool? requiresPayment,
    double? price,
    DateTime? cancellationDeadline,
    int? freeCancellationDays,
    double? cancellationFeePercentage,
    bool? allowsSubgroupPriority,
    bool? fullHouseExclusive,
    DateTime? rsvpDeadline,
    String? subgroupId,
    String? organizerName,
    String? contactEmail,
    String? contactPhone,
    String? paymentInstructions,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetEvents$events$edges$node<TRes>
    implements CopyWith$Query$GetEvents$events$edges$node<TRes> {
  _CopyWithImpl$Query$GetEvents$events$edges$node(this._instance, this._then);

  final Query$GetEvents$events$edges$node _instance;

  final TRes Function(Query$GetEvents$events$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? eventType = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? location = _undefined,
    Object? imageUrl = _undefined,
    Object? capacity = _undefined,
    Object? currentAttendees = _undefined,
    Object? availableSpots = _undefined,
    Object? tentativeCount = _undefined,
    Object? waitlistCount = _undefined,
    Object? guestPolicy = _undefined,
    Object? maxGuestsPerMember = _undefined,
    Object? requiresApproval = _undefined,
    Object? requiresPayment = _undefined,
    Object? price = _undefined,
    Object? cancellationDeadline = _undefined,
    Object? freeCancellationDays = _undefined,
    Object? cancellationFeePercentage = _undefined,
    Object? allowsSubgroupPriority = _undefined,
    Object? fullHouseExclusive = _undefined,
    Object? rsvpDeadline = _undefined,
    Object? subgroupId = _undefined,
    Object? organizerName = _undefined,
    Object? contactEmail = _undefined,
    Object? contactPhone = _undefined,
    Object? paymentInstructions = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetEvents$events$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      title: title == _undefined || title == null
          ? _instance.title
          : (title as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      eventType: eventType == _undefined
          ? _instance.eventType
          : (eventType as String?),
      startTime: startTime == _undefined || startTime == null
          ? _instance.startTime
          : (startTime as DateTime),
      endTime: endTime == _undefined || endTime == null
          ? _instance.endTime
          : (endTime as DateTime),
      location: location == _undefined
          ? _instance.location
          : (location as String?),
      imageUrl: imageUrl == _undefined
          ? _instance.imageUrl
          : (imageUrl as String?),
      capacity: capacity == _undefined
          ? _instance.capacity
          : (capacity as int?),
      currentAttendees: currentAttendees == _undefined
          ? _instance.currentAttendees
          : (currentAttendees as int?),
      availableSpots: availableSpots == _undefined
          ? _instance.availableSpots
          : (availableSpots as int?),
      tentativeCount: tentativeCount == _undefined
          ? _instance.tentativeCount
          : (tentativeCount as int?),
      waitlistCount: waitlistCount == _undefined
          ? _instance.waitlistCount
          : (waitlistCount as int?),
      guestPolicy: guestPolicy == _undefined
          ? _instance.guestPolicy
          : (guestPolicy as String?),
      maxGuestsPerMember: maxGuestsPerMember == _undefined
          ? _instance.maxGuestsPerMember
          : (maxGuestsPerMember as int?),
      requiresApproval: requiresApproval == _undefined
          ? _instance.requiresApproval
          : (requiresApproval as bool?),
      requiresPayment: requiresPayment == _undefined
          ? _instance.requiresPayment
          : (requiresPayment as bool?),
      price: price == _undefined ? _instance.price : (price as double?),
      cancellationDeadline: cancellationDeadline == _undefined
          ? _instance.cancellationDeadline
          : (cancellationDeadline as DateTime?),
      freeCancellationDays: freeCancellationDays == _undefined
          ? _instance.freeCancellationDays
          : (freeCancellationDays as int?),
      cancellationFeePercentage: cancellationFeePercentage == _undefined
          ? _instance.cancellationFeePercentage
          : (cancellationFeePercentage as double?),
      allowsSubgroupPriority: allowsSubgroupPriority == _undefined
          ? _instance.allowsSubgroupPriority
          : (allowsSubgroupPriority as bool?),
      fullHouseExclusive: fullHouseExclusive == _undefined
          ? _instance.fullHouseExclusive
          : (fullHouseExclusive as bool?),
      rsvpDeadline: rsvpDeadline == _undefined
          ? _instance.rsvpDeadline
          : (rsvpDeadline as DateTime?),
      subgroupId: subgroupId == _undefined
          ? _instance.subgroupId
          : (subgroupId as String?),
      organizerName: organizerName == _undefined
          ? _instance.organizerName
          : (organizerName as String?),
      contactEmail: contactEmail == _undefined
          ? _instance.contactEmail
          : (contactEmail as String?),
      contactPhone: contactPhone == _undefined
          ? _instance.contactPhone
          : (contactPhone as String?),
      paymentInstructions: paymentInstructions == _undefined
          ? _instance.paymentInstructions
          : (paymentInstructions as String?),
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

class _CopyWithStubImpl$Query$GetEvents$events$edges$node<TRes>
    implements CopyWith$Query$GetEvents$events$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetEvents$events$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? title,
    String? description,
    String? eventType,
    DateTime? startTime,
    DateTime? endTime,
    String? location,
    String? imageUrl,
    int? capacity,
    int? currentAttendees,
    int? availableSpots,
    int? tentativeCount,
    int? waitlistCount,
    String? guestPolicy,
    int? maxGuestsPerMember,
    bool? requiresApproval,
    bool? requiresPayment,
    double? price,
    DateTime? cancellationDeadline,
    int? freeCancellationDays,
    double? cancellationFeePercentage,
    bool? allowsSubgroupPriority,
    bool? fullHouseExclusive,
    DateTime? rsvpDeadline,
    String? subgroupId,
    String? organizerName,
    String? contactEmail,
    String? contactPhone,
    String? paymentInstructions,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;
}

class Query$GetEvents$events$pageInfo {
  Query$GetEvents$events$pageInfo({
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.startCursor,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$GetEvents$events$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$startCursor = json['startCursor'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetEvents$events$pageInfo(
      hasNextPage: (l$hasNextPage as bool),
      hasPreviousPage: (l$hasPreviousPage as bool),
      startCursor: (l$startCursor as String?),
      endCursor: (l$endCursor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final bool hasPreviousPage;

  final String? startCursor;

  final String? endCursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$hasPreviousPage = hasPreviousPage;
    _resultData['hasPreviousPage'] = l$hasPreviousPage;
    final l$startCursor = startCursor;
    _resultData['startCursor'] = l$startCursor;
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$hasPreviousPage = hasPreviousPage;
    final l$startCursor = startCursor;
    final l$endCursor = endCursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$hasNextPage,
      l$hasPreviousPage,
      l$startCursor,
      l$endCursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetEvents$events$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$hasPreviousPage = hasPreviousPage;
    final lOther$hasPreviousPage = other.hasPreviousPage;
    if (l$hasPreviousPage != lOther$hasPreviousPage) {
      return false;
    }
    final l$startCursor = startCursor;
    final lOther$startCursor = other.startCursor;
    if (l$startCursor != lOther$startCursor) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
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

extension UtilityExtension$Query$GetEvents$events$pageInfo
    on Query$GetEvents$events$pageInfo {
  CopyWith$Query$GetEvents$events$pageInfo<Query$GetEvents$events$pageInfo>
  get copyWith => CopyWith$Query$GetEvents$events$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$GetEvents$events$pageInfo<TRes> {
  factory CopyWith$Query$GetEvents$events$pageInfo(
    Query$GetEvents$events$pageInfo instance,
    TRes Function(Query$GetEvents$events$pageInfo) then,
  ) = _CopyWithImpl$Query$GetEvents$events$pageInfo;

  factory CopyWith$Query$GetEvents$events$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEvents$events$pageInfo;

  TRes call({
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? endCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetEvents$events$pageInfo<TRes>
    implements CopyWith$Query$GetEvents$events$pageInfo<TRes> {
  _CopyWithImpl$Query$GetEvents$events$pageInfo(this._instance, this._then);

  final Query$GetEvents$events$pageInfo _instance;

  final TRes Function(Query$GetEvents$events$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? startCursor = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetEvents$events$pageInfo(
      hasNextPage: hasNextPage == _undefined || hasNextPage == null
          ? _instance.hasNextPage
          : (hasNextPage as bool),
      hasPreviousPage: hasPreviousPage == _undefined || hasPreviousPage == null
          ? _instance.hasPreviousPage
          : (hasPreviousPage as bool),
      startCursor: startCursor == _undefined
          ? _instance.startCursor
          : (startCursor as String?),
      endCursor: endCursor == _undefined
          ? _instance.endCursor
          : (endCursor as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetEvents$events$pageInfo<TRes>
    implements CopyWith$Query$GetEvents$events$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetEvents$events$pageInfo(this._res);

  TRes _res;

  call({
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? endCursor,
    String? $__typename,
  }) => _res;
}
