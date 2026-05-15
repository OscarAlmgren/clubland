import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$GetEvents {
  factory Variables$Query$GetEvents({
    Input$PaginationInput? pagination,
    Enum$EventStatus? status,
    Enum$ClubEventType? type,
    DateTime? startDate,
    DateTime? endDate,
  }) => Variables$Query$GetEvents._({
    if (pagination != null) r'pagination': pagination,
    if (status != null) r'status': status,
    if (type != null) r'type': type,
    if (startDate != null) r'startDate': startDate,
    if (endDate != null) r'endDate': endDate,
  });

  Variables$Query$GetEvents._(this._$data);

  factory Variables$Query$GetEvents.fromJson(Map<String, dynamic> data) {
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
          : fromJson$Enum$EventStatus((l$status as String));
    }
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = l$type == null
          ? null
          : fromJson$Enum$ClubEventType((l$type as String));
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
    return Variables$Query$GetEvents._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Enum$EventStatus? get status => (_$data['status'] as Enum$EventStatus?);

  Enum$ClubEventType? get type => (_$data['type'] as Enum$ClubEventType?);

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
          : toJson$Enum$EventStatus(l$status);
    }
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type == null
          ? null
          : toJson$Enum$ClubEventType(l$type);
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
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
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
    final l$type = type;
    final l$startDate = startDate;
    final l$endDate = endDate;
    return Object.hashAll([
      _$data.containsKey('pagination') ? l$pagination : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('startDate') ? l$startDate : const {},
      _$data.containsKey('endDate') ? l$endDate : const {},
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
    Input$PaginationInput? pagination,
    Enum$EventStatus? status,
    Enum$ClubEventType? type,
    DateTime? startDate,
    DateTime? endDate,
  });
}

class _CopyWithImpl$Variables$Query$GetEvents<TRes>
    implements CopyWith$Variables$Query$GetEvents<TRes> {
  _CopyWithImpl$Variables$Query$GetEvents(this._instance, this._then);

  final Variables$Query$GetEvents _instance;

  final TRes Function(Variables$Query$GetEvents) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? pagination = _undefined,
    Object? status = _undefined,
    Object? type = _undefined,
    Object? startDate = _undefined,
    Object? endDate = _undefined,
  }) => _then(
    Variables$Query$GetEvents._({
      ..._instance._$data,
      if (pagination != _undefined)
        'pagination': (pagination as Input$PaginationInput?),
      if (status != _undefined) 'status': (status as Enum$EventStatus?),
      if (type != _undefined) 'type': (type as Enum$ClubEventType?),
      if (startDate != _undefined) 'startDate': (startDate as DateTime?),
      if (endDate != _undefined) 'endDate': (endDate as DateTime?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetEvents<TRes>
    implements CopyWith$Variables$Query$GetEvents<TRes> {
  _CopyWithStubImpl$Variables$Query$GetEvents(this._res);

  TRes _res;

  call({
    Input$PaginationInput? pagination,
    Enum$EventStatus? status,
    Enum$ClubEventType? type,
    DateTime? startDate,
    DateTime? endDate,
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
            name: NameNode(value: 'EventStatus'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'type')),
          type: NamedTypeNode(
            name: NameNode(value: 'ClubEventType'),
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
            name: NameNode(value: 'events'),
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
                name: NameNode(value: 'type'),
                value: VariableNode(name: NameNode(value: 'type')),
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
                        name: NameNode(value: 'name'),
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
                        name: NameNode(value: 'type'),
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
                        name: NameNode(value: 'rsvpDeadline'),
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
Query$GetEvents _parserFn$Query$GetEvents(Map<String, dynamic> data) =>
    Query$GetEvents.fromJson(data);
typedef OnQueryComplete$Query$GetEvents =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetEvents?);

class Options$Query$GetEvents extends graphql.QueryOptions<Query$GetEvents> {
  Options$Query$GetEvents({
    String? operationName,
    Variables$Query$GetEvents? variables,
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
    Variables$Query$GetEvents? variables,
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
         variables: variables?.toJson() ?? {},
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
    Variables$Query$GetEvents? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryGetEvents,
       );
}

extension ClientExtension$Query$GetEvents on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetEvents>> query$GetEvents([
    Options$Query$GetEvents? options,
  ]) async => await this.query(options ?? Options$Query$GetEvents());

  graphql.ObservableQuery<Query$GetEvents> watchQuery$GetEvents([
    WatchOptions$Query$GetEvents? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetEvents());

  void writeQuery$GetEvents({
    required Query$GetEvents data,
    Variables$Query$GetEvents? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetEvents),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetEvents? readQuery$GetEvents({
    Variables$Query$GetEvents? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetEvents),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetEvents.fromJson(result);
  }
}

class Query$GetEvents$events {
  Query$GetEvents$events({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'EventConnection',
  });

  factory Query$GetEvents$events.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetEvents$events(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$GetEvents$events$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$GetEvents$events$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetEvents$events$nodes> nodes;

  final Query$GetEvents$events$pageInfo pageInfo;

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
    if (other is! Query$GetEvents$events || runtimeType != other.runtimeType) {
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
    List<Query$GetEvents$events$nodes>? nodes,
    Query$GetEvents$events$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$GetEvents$events$nodes> Function(
      Iterable<
        CopyWith$Query$GetEvents$events$nodes<Query$GetEvents$events$nodes>
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
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetEvents$events(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$GetEvents$events$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$GetEvents$events$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$GetEvents$events$nodes> Function(
      Iterable<
        CopyWith$Query$GetEvents$events$nodes<Query$GetEvents$events$nodes>
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$GetEvents$events$nodes(e, (i) => i),
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
    List<Query$GetEvents$events$nodes>? nodes,
    Query$GetEvents$events$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$GetEvents$events$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetEvents$events$pageInfo.stub(_res);
}

class Query$GetEvents$events$nodes {
  Query$GetEvents$events$nodes({
    required this.id,
    required this.clubId,
    required this.name,
    required this.title,
    this.description,
    required this.type,
    required this.eventType,
    required this.startTime,
    required this.endTime,
    this.location,
    this.imageUrl,
    required this.capacity,
    required this.currentAttendees,
    this.availableSpots,
    this.tentativeCount,
    this.waitlistCount,
    required this.requiresApproval,
    this.requiresPayment,
    this.price,
    this.cancellationDeadline,
    this.rsvpDeadline,
    this.organizerName,
    this.contactEmail,
    this.contactPhone,
    this.paymentInstructions,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Event',
  });

  factory Query$GetEvents$events$nodes.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$name = json['name'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$type = json['type'];
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
    final l$requiresApproval = json['requiresApproval'];
    final l$requiresPayment = json['requiresPayment'];
    final l$price = json['price'];
    final l$cancellationDeadline = json['cancellationDeadline'];
    final l$rsvpDeadline = json['rsvpDeadline'];
    final l$organizerName = json['organizerName'];
    final l$contactEmail = json['contactEmail'];
    final l$contactPhone = json['contactPhone'];
    final l$paymentInstructions = json['paymentInstructions'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$GetEvents$events$nodes(
      id: (l$id as String),
      clubId: (l$clubId as String),
      name: (l$name as String),
      title: (l$title as String),
      description: (l$description as String?),
      type: fromJson$Enum$ClubEventType((l$type as String)),
      eventType: fromJson$Enum$ClubEventType((l$eventType as String)),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      location: (l$location as String?),
      imageUrl: (l$imageUrl as String?),
      capacity: (l$capacity as int),
      currentAttendees: (l$currentAttendees as int),
      availableSpots: (l$availableSpots as int?),
      tentativeCount: (l$tentativeCount as int?),
      waitlistCount: (l$waitlistCount as int?),
      requiresApproval: (l$requiresApproval as bool),
      requiresPayment: (l$requiresPayment as bool?),
      price: (l$price as num?)?.toDouble(),
      cancellationDeadline: l$cancellationDeadline == null
          ? null
          : DateTime.parse((l$cancellationDeadline as String)),
      rsvpDeadline: l$rsvpDeadline == null
          ? null
          : DateTime.parse((l$rsvpDeadline as String)),
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

  final String name;

  final String title;

  final String? description;

  final Enum$ClubEventType type;

  final Enum$ClubEventType eventType;

  final DateTime startTime;

  final DateTime endTime;

  final String? location;

  final String? imageUrl;

  final int capacity;

  final int currentAttendees;

  final int? availableSpots;

  final int? tentativeCount;

  final int? waitlistCount;

  final bool requiresApproval;

  final bool? requiresPayment;

  final double? price;

  final DateTime? cancellationDeadline;

  final DateTime? rsvpDeadline;

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
    final l$name = name;
    _resultData['name'] = l$name;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$type = type;
    _resultData['type'] = toJson$Enum$ClubEventType(l$type);
    final l$eventType = eventType;
    _resultData['eventType'] = toJson$Enum$ClubEventType(l$eventType);
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
    final l$requiresApproval = requiresApproval;
    _resultData['requiresApproval'] = l$requiresApproval;
    final l$requiresPayment = requiresPayment;
    _resultData['requiresPayment'] = l$requiresPayment;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$cancellationDeadline = cancellationDeadline;
    _resultData['cancellationDeadline'] = l$cancellationDeadline
        ?.toIso8601String();
    final l$rsvpDeadline = rsvpDeadline;
    _resultData['rsvpDeadline'] = l$rsvpDeadline?.toIso8601String();
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
    final l$name = name;
    final l$title = title;
    final l$description = description;
    final l$type = type;
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
    final l$requiresApproval = requiresApproval;
    final l$requiresPayment = requiresPayment;
    final l$price = price;
    final l$cancellationDeadline = cancellationDeadline;
    final l$rsvpDeadline = rsvpDeadline;
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
      l$name,
      l$title,
      l$description,
      l$type,
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
      l$requiresApproval,
      l$requiresPayment,
      l$price,
      l$cancellationDeadline,
      l$rsvpDeadline,
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
    if (other is! Query$GetEvents$events$nodes ||
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
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
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
    final l$rsvpDeadline = rsvpDeadline;
    final lOther$rsvpDeadline = other.rsvpDeadline;
    if (l$rsvpDeadline != lOther$rsvpDeadline) {
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

extension UtilityExtension$Query$GetEvents$events$nodes
    on Query$GetEvents$events$nodes {
  CopyWith$Query$GetEvents$events$nodes<Query$GetEvents$events$nodes>
  get copyWith => CopyWith$Query$GetEvents$events$nodes(this, (i) => i);
}

abstract class CopyWith$Query$GetEvents$events$nodes<TRes> {
  factory CopyWith$Query$GetEvents$events$nodes(
    Query$GetEvents$events$nodes instance,
    TRes Function(Query$GetEvents$events$nodes) then,
  ) = _CopyWithImpl$Query$GetEvents$events$nodes;

  factory CopyWith$Query$GetEvents$events$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEvents$events$nodes;

  TRes call({
    String? id,
    String? clubId,
    String? name,
    String? title,
    String? description,
    Enum$ClubEventType? type,
    Enum$ClubEventType? eventType,
    DateTime? startTime,
    DateTime? endTime,
    String? location,
    String? imageUrl,
    int? capacity,
    int? currentAttendees,
    int? availableSpots,
    int? tentativeCount,
    int? waitlistCount,
    bool? requiresApproval,
    bool? requiresPayment,
    double? price,
    DateTime? cancellationDeadline,
    DateTime? rsvpDeadline,
    String? organizerName,
    String? contactEmail,
    String? contactPhone,
    String? paymentInstructions,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetEvents$events$nodes<TRes>
    implements CopyWith$Query$GetEvents$events$nodes<TRes> {
  _CopyWithImpl$Query$GetEvents$events$nodes(this._instance, this._then);

  final Query$GetEvents$events$nodes _instance;

  final TRes Function(Query$GetEvents$events$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? name = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? type = _undefined,
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
    Object? requiresApproval = _undefined,
    Object? requiresPayment = _undefined,
    Object? price = _undefined,
    Object? cancellationDeadline = _undefined,
    Object? rsvpDeadline = _undefined,
    Object? organizerName = _undefined,
    Object? contactEmail = _undefined,
    Object? contactPhone = _undefined,
    Object? paymentInstructions = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetEvents$events$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      title: title == _undefined || title == null
          ? _instance.title
          : (title as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$ClubEventType),
      eventType: eventType == _undefined || eventType == null
          ? _instance.eventType
          : (eventType as Enum$ClubEventType),
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
      capacity: capacity == _undefined || capacity == null
          ? _instance.capacity
          : (capacity as int),
      currentAttendees:
          currentAttendees == _undefined || currentAttendees == null
          ? _instance.currentAttendees
          : (currentAttendees as int),
      availableSpots: availableSpots == _undefined
          ? _instance.availableSpots
          : (availableSpots as int?),
      tentativeCount: tentativeCount == _undefined
          ? _instance.tentativeCount
          : (tentativeCount as int?),
      waitlistCount: waitlistCount == _undefined
          ? _instance.waitlistCount
          : (waitlistCount as int?),
      requiresApproval:
          requiresApproval == _undefined || requiresApproval == null
          ? _instance.requiresApproval
          : (requiresApproval as bool),
      requiresPayment: requiresPayment == _undefined
          ? _instance.requiresPayment
          : (requiresPayment as bool?),
      price: price == _undefined ? _instance.price : (price as double?),
      cancellationDeadline: cancellationDeadline == _undefined
          ? _instance.cancellationDeadline
          : (cancellationDeadline as DateTime?),
      rsvpDeadline: rsvpDeadline == _undefined
          ? _instance.rsvpDeadline
          : (rsvpDeadline as DateTime?),
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

class _CopyWithStubImpl$Query$GetEvents$events$nodes<TRes>
    implements CopyWith$Query$GetEvents$events$nodes<TRes> {
  _CopyWithStubImpl$Query$GetEvents$events$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? name,
    String? title,
    String? description,
    Enum$ClubEventType? type,
    Enum$ClubEventType? eventType,
    DateTime? startTime,
    DateTime? endTime,
    String? location,
    String? imageUrl,
    int? capacity,
    int? currentAttendees,
    int? availableSpots,
    int? tentativeCount,
    int? waitlistCount,
    bool? requiresApproval,
    bool? requiresPayment,
    double? price,
    DateTime? cancellationDeadline,
    DateTime? rsvpDeadline,
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
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$GetEvents$events$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$pageSize = json['pageSize'];
    final l$total = json['total'];
    final l$totalPages = json['totalPages'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPrevPage = json['hasPrevPage'];
    final l$$__typename = json['__typename'];
    return Query$GetEvents$events$pageInfo(
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
    if (other is! Query$GetEvents$events$pageInfo ||
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
    int? page,
    int? pageSize,
    int? total,
    int? totalPages,
    bool? hasNextPage,
    bool? hasPrevPage,
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
    Object? page = _undefined,
    Object? pageSize = _undefined,
    Object? total = _undefined,
    Object? totalPages = _undefined,
    Object? hasNextPage = _undefined,
    Object? hasPrevPage = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetEvents$events$pageInfo(
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

class _CopyWithStubImpl$Query$GetEvents$events$pageInfo<TRes>
    implements CopyWith$Query$GetEvents$events$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetEvents$events$pageInfo(this._res);

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
