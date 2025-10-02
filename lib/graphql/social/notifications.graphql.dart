import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Notifications {
  factory Variables$Query$Notifications({
    Input$PaginationInput? pagination,
    bool? unreadOnly,
  }) => Variables$Query$Notifications._({
    if (pagination != null) r'pagination': pagination,
    if (unreadOnly != null) r'unreadOnly': unreadOnly,
  });

  Variables$Query$Notifications._(this._$data);

  factory Variables$Query$Notifications.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('pagination')) {
      final l$pagination = data['pagination'];
      result$data['pagination'] = l$pagination == null
          ? null
          : Input$PaginationInput.fromJson(
              (l$pagination as Map<String, dynamic>),
            );
    }
    if (data.containsKey('unreadOnly')) {
      final l$unreadOnly = data['unreadOnly'];
      result$data['unreadOnly'] = (l$unreadOnly as bool?);
    }
    return Variables$Query$Notifications._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  bool? get unreadOnly => (_$data['unreadOnly'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('pagination')) {
      final l$pagination = pagination;
      result$data['pagination'] = l$pagination?.toJson();
    }
    if (_$data.containsKey('unreadOnly')) {
      final l$unreadOnly = unreadOnly;
      result$data['unreadOnly'] = l$unreadOnly;
    }
    return result$data;
  }

  CopyWith$Variables$Query$Notifications<Variables$Query$Notifications>
  get copyWith => CopyWith$Variables$Query$Notifications(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Notifications ||
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
    final l$unreadOnly = unreadOnly;
    final lOther$unreadOnly = other.unreadOnly;
    if (_$data.containsKey('unreadOnly') !=
        other._$data.containsKey('unreadOnly')) {
      return false;
    }
    if (l$unreadOnly != lOther$unreadOnly) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$pagination = pagination;
    final l$unreadOnly = unreadOnly;
    return Object.hashAll([
      _$data.containsKey('pagination') ? l$pagination : const {},
      _$data.containsKey('unreadOnly') ? l$unreadOnly : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$Notifications<TRes> {
  factory CopyWith$Variables$Query$Notifications(
    Variables$Query$Notifications instance,
    TRes Function(Variables$Query$Notifications) then,
  ) = _CopyWithImpl$Variables$Query$Notifications;

  factory CopyWith$Variables$Query$Notifications.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Notifications;

  TRes call({Input$PaginationInput? pagination, bool? unreadOnly});
}

class _CopyWithImpl$Variables$Query$Notifications<TRes>
    implements CopyWith$Variables$Query$Notifications<TRes> {
  _CopyWithImpl$Variables$Query$Notifications(this._instance, this._then);

  final Variables$Query$Notifications _instance;

  final TRes Function(Variables$Query$Notifications) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? pagination = _undefined,
    Object? unreadOnly = _undefined,
  }) => _then(
    Variables$Query$Notifications._({
      ..._instance._$data,
      if (pagination != _undefined)
        'pagination': (pagination as Input$PaginationInput?),
      if (unreadOnly != _undefined) 'unreadOnly': (unreadOnly as bool?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$Notifications<TRes>
    implements CopyWith$Variables$Query$Notifications<TRes> {
  _CopyWithStubImpl$Variables$Query$Notifications(this._res);

  TRes _res;

  call({Input$PaginationInput? pagination, bool? unreadOnly}) => _res;
}

class Query$Notifications {
  Query$Notifications({
    required this.notifications,
    this.$__typename = 'Query',
  });

  factory Query$Notifications.fromJson(Map<String, dynamic> json) {
    final l$notifications = json['notifications'];
    final l$$__typename = json['__typename'];
    return Query$Notifications(
      notifications: Query$Notifications$notifications.fromJson(
        (l$notifications as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Notifications$notifications notifications;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$notifications = notifications;
    _resultData['notifications'] = l$notifications.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$notifications = notifications;
    final l$$__typename = $__typename;
    return Object.hashAll([l$notifications, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Notifications || runtimeType != other.runtimeType) {
      return false;
    }
    final l$notifications = notifications;
    final lOther$notifications = other.notifications;
    if (l$notifications != lOther$notifications) {
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

extension UtilityExtension$Query$Notifications on Query$Notifications {
  CopyWith$Query$Notifications<Query$Notifications> get copyWith =>
      CopyWith$Query$Notifications(this, (i) => i);
}

abstract class CopyWith$Query$Notifications<TRes> {
  factory CopyWith$Query$Notifications(
    Query$Notifications instance,
    TRes Function(Query$Notifications) then,
  ) = _CopyWithImpl$Query$Notifications;

  factory CopyWith$Query$Notifications.stub(TRes res) =
      _CopyWithStubImpl$Query$Notifications;

  TRes call({
    Query$Notifications$notifications? notifications,
    String? $__typename,
  });
  CopyWith$Query$Notifications$notifications<TRes> get notifications;
}

class _CopyWithImpl$Query$Notifications<TRes>
    implements CopyWith$Query$Notifications<TRes> {
  _CopyWithImpl$Query$Notifications(this._instance, this._then);

  final Query$Notifications _instance;

  final TRes Function(Query$Notifications) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? notifications = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Notifications(
      notifications: notifications == _undefined || notifications == null
          ? _instance.notifications
          : (notifications as Query$Notifications$notifications),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Notifications$notifications<TRes> get notifications {
    final local$notifications = _instance.notifications;
    return CopyWith$Query$Notifications$notifications(
      local$notifications,
      (e) => call(notifications: e),
    );
  }
}

class _CopyWithStubImpl$Query$Notifications<TRes>
    implements CopyWith$Query$Notifications<TRes> {
  _CopyWithStubImpl$Query$Notifications(this._res);

  TRes _res;

  call({
    Query$Notifications$notifications? notifications,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Notifications$notifications<TRes> get notifications =>
      CopyWith$Query$Notifications$notifications.stub(_res);
}

const documentNodeQueryNotifications = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Notifications'),
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
          variable: VariableNode(name: NameNode(value: 'unreadOnly')),
          type: NamedTypeNode(
            name: NameNode(value: 'Boolean'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: BooleanValueNode(value: false)),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'notifications'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'pagination'),
                value: VariableNode(name: NameNode(value: 'pagination')),
              ),
              ArgumentNode(
                name: NameNode(value: 'unreadOnly'),
                value: VariableNode(name: NameNode(value: 'unreadOnly')),
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
                        name: NameNode(value: 'userId'),
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
                        name: NameNode(value: 'title'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'message'),
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
                        name: NameNode(value: 'channels'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'scheduledAt'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'sentAt'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'readAt'),
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
Query$Notifications _parserFn$Query$Notifications(Map<String, dynamic> data) =>
    Query$Notifications.fromJson(data);
typedef OnQueryComplete$Query$Notifications =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Notifications?);

class Options$Query$Notifications
    extends graphql.QueryOptions<Query$Notifications> {
  Options$Query$Notifications({
    String? operationName,
    Variables$Query$Notifications? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Notifications? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Notifications? onComplete,
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
                 data == null ? null : _parserFn$Query$Notifications(data),
               ),
         onError: onError,
         document: documentNodeQueryNotifications,
         parserFn: _parserFn$Query$Notifications,
       );

  final OnQueryComplete$Query$Notifications? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Notifications
    extends graphql.WatchQueryOptions<Query$Notifications> {
  WatchOptions$Query$Notifications({
    String? operationName,
    Variables$Query$Notifications? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Notifications? typedOptimisticResult,
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
         document: documentNodeQueryNotifications,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Notifications,
       );
}

class FetchMoreOptions$Query$Notifications extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Notifications({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$Notifications? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryNotifications,
       );
}

extension ClientExtension$Query$Notifications on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Notifications>> query$Notifications([
    Options$Query$Notifications? options,
  ]) async => await this.query(options ?? Options$Query$Notifications());

  graphql.ObservableQuery<Query$Notifications> watchQuery$Notifications([
    WatchOptions$Query$Notifications? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$Notifications());

  void writeQuery$Notifications({
    required Query$Notifications data,
    Variables$Query$Notifications? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryNotifications),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$Notifications? readQuery$Notifications({
    Variables$Query$Notifications? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryNotifications),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Notifications.fromJson(result);
  }
}

class Query$Notifications$notifications {
  Query$Notifications$notifications({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'NotificationConnection',
  });

  factory Query$Notifications$notifications.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$Notifications$notifications(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$Notifications$notifications$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$Notifications$notifications$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Notifications$notifications$nodes> nodes;

  final Query$Notifications$notifications$pageInfo pageInfo;

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
    if (other is! Query$Notifications$notifications ||
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

extension UtilityExtension$Query$Notifications$notifications
    on Query$Notifications$notifications {
  CopyWith$Query$Notifications$notifications<Query$Notifications$notifications>
  get copyWith => CopyWith$Query$Notifications$notifications(this, (i) => i);
}

abstract class CopyWith$Query$Notifications$notifications<TRes> {
  factory CopyWith$Query$Notifications$notifications(
    Query$Notifications$notifications instance,
    TRes Function(Query$Notifications$notifications) then,
  ) = _CopyWithImpl$Query$Notifications$notifications;

  factory CopyWith$Query$Notifications$notifications.stub(TRes res) =
      _CopyWithStubImpl$Query$Notifications$notifications;

  TRes call({
    List<Query$Notifications$notifications$nodes>? nodes,
    Query$Notifications$notifications$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$Notifications$notifications$nodes> Function(
      Iterable<
        CopyWith$Query$Notifications$notifications$nodes<
          Query$Notifications$notifications$nodes
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$Notifications$notifications$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$Notifications$notifications<TRes>
    implements CopyWith$Query$Notifications$notifications<TRes> {
  _CopyWithImpl$Query$Notifications$notifications(this._instance, this._then);

  final Query$Notifications$notifications _instance;

  final TRes Function(Query$Notifications$notifications) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Notifications$notifications(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$Notifications$notifications$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$Notifications$notifications$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$Notifications$notifications$nodes> Function(
      Iterable<
        CopyWith$Query$Notifications$notifications$nodes<
          Query$Notifications$notifications$nodes
        >
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$Notifications$notifications$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$Notifications$notifications$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$Notifications$notifications$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$Notifications$notifications<TRes>
    implements CopyWith$Query$Notifications$notifications<TRes> {
  _CopyWithStubImpl$Query$Notifications$notifications(this._res);

  TRes _res;

  call({
    List<Query$Notifications$notifications$nodes>? nodes,
    Query$Notifications$notifications$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$Notifications$notifications$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$Notifications$notifications$pageInfo.stub(_res);
}

class Query$Notifications$notifications$nodes {
  Query$Notifications$notifications$nodes({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.message,
    required this.status,
    required this.channels,
    this.scheduledAt,
    this.sentAt,
    this.readAt,
    required this.createdAt,
    this.$__typename = 'Notification',
  });

  factory Query$Notifications$notifications$nodes.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$userId = json['userId'];
    final l$type = json['type'];
    final l$title = json['title'];
    final l$message = json['message'];
    final l$status = json['status'];
    final l$channels = json['channels'];
    final l$scheduledAt = json['scheduledAt'];
    final l$sentAt = json['sentAt'];
    final l$readAt = json['readAt'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$Notifications$notifications$nodes(
      id: (l$id as String),
      userId: (l$userId as String),
      type: fromJson$Enum$NotificationType((l$type as String)),
      title: (l$title as String),
      message: (l$message as String),
      status: fromJson$Enum$NotificationStatus((l$status as String)),
      channels: (l$channels as List<dynamic>)
          .map((e) => fromJson$Enum$NotificationChannel((e as String)))
          .toList(),
      scheduledAt: l$scheduledAt == null
          ? null
          : DateTime.parse((l$scheduledAt as String)),
      sentAt: l$sentAt == null ? null : DateTime.parse((l$sentAt as String)),
      readAt: l$readAt == null ? null : DateTime.parse((l$readAt as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String userId;

  final Enum$NotificationType type;

  final String title;

  final String message;

  final Enum$NotificationStatus status;

  final List<Enum$NotificationChannel> channels;

  final DateTime? scheduledAt;

  final DateTime? sentAt;

  final DateTime? readAt;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$type = type;
    _resultData['type'] = toJson$Enum$NotificationType(l$type);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$status = status;
    _resultData['status'] = toJson$Enum$NotificationStatus(l$status);
    final l$channels = channels;
    _resultData['channels'] = l$channels
        .map((e) => toJson$Enum$NotificationChannel(e))
        .toList();
    final l$scheduledAt = scheduledAt;
    _resultData['scheduledAt'] = l$scheduledAt?.toIso8601String();
    final l$sentAt = sentAt;
    _resultData['sentAt'] = l$sentAt?.toIso8601String();
    final l$readAt = readAt;
    _resultData['readAt'] = l$readAt?.toIso8601String();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$userId = userId;
    final l$type = type;
    final l$title = title;
    final l$message = message;
    final l$status = status;
    final l$channels = channels;
    final l$scheduledAt = scheduledAt;
    final l$sentAt = sentAt;
    final l$readAt = readAt;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$userId,
      l$type,
      l$title,
      l$message,
      l$status,
      Object.hashAll(l$channels.map((v) => v)),
      l$scheduledAt,
      l$sentAt,
      l$readAt,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Notifications$notifications$nodes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$channels = channels;
    final lOther$channels = other.channels;
    if (l$channels.length != lOther$channels.length) {
      return false;
    }
    for (int i = 0; i < l$channels.length; i++) {
      final l$channels$entry = l$channels[i];
      final lOther$channels$entry = lOther$channels[i];
      if (l$channels$entry != lOther$channels$entry) {
        return false;
      }
    }
    final l$scheduledAt = scheduledAt;
    final lOther$scheduledAt = other.scheduledAt;
    if (l$scheduledAt != lOther$scheduledAt) {
      return false;
    }
    final l$sentAt = sentAt;
    final lOther$sentAt = other.sentAt;
    if (l$sentAt != lOther$sentAt) {
      return false;
    }
    final l$readAt = readAt;
    final lOther$readAt = other.readAt;
    if (l$readAt != lOther$readAt) {
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

extension UtilityExtension$Query$Notifications$notifications$nodes
    on Query$Notifications$notifications$nodes {
  CopyWith$Query$Notifications$notifications$nodes<
    Query$Notifications$notifications$nodes
  >
  get copyWith =>
      CopyWith$Query$Notifications$notifications$nodes(this, (i) => i);
}

abstract class CopyWith$Query$Notifications$notifications$nodes<TRes> {
  factory CopyWith$Query$Notifications$notifications$nodes(
    Query$Notifications$notifications$nodes instance,
    TRes Function(Query$Notifications$notifications$nodes) then,
  ) = _CopyWithImpl$Query$Notifications$notifications$nodes;

  factory CopyWith$Query$Notifications$notifications$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$Notifications$notifications$nodes;

  TRes call({
    String? id,
    String? userId,
    Enum$NotificationType? type,
    String? title,
    String? message,
    Enum$NotificationStatus? status,
    List<Enum$NotificationChannel>? channels,
    DateTime? scheduledAt,
    DateTime? sentAt,
    DateTime? readAt,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Notifications$notifications$nodes<TRes>
    implements CopyWith$Query$Notifications$notifications$nodes<TRes> {
  _CopyWithImpl$Query$Notifications$notifications$nodes(
    this._instance,
    this._then,
  );

  final Query$Notifications$notifications$nodes _instance;

  final TRes Function(Query$Notifications$notifications$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? userId = _undefined,
    Object? type = _undefined,
    Object? title = _undefined,
    Object? message = _undefined,
    Object? status = _undefined,
    Object? channels = _undefined,
    Object? scheduledAt = _undefined,
    Object? sentAt = _undefined,
    Object? readAt = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Notifications$notifications$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$NotificationType),
      title: title == _undefined || title == null
          ? _instance.title
          : (title as String),
      message: message == _undefined || message == null
          ? _instance.message
          : (message as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$NotificationStatus),
      channels: channels == _undefined || channels == null
          ? _instance.channels
          : (channels as List<Enum$NotificationChannel>),
      scheduledAt: scheduledAt == _undefined
          ? _instance.scheduledAt
          : (scheduledAt as DateTime?),
      sentAt: sentAt == _undefined ? _instance.sentAt : (sentAt as DateTime?),
      readAt: readAt == _undefined ? _instance.readAt : (readAt as DateTime?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Notifications$notifications$nodes<TRes>
    implements CopyWith$Query$Notifications$notifications$nodes<TRes> {
  _CopyWithStubImpl$Query$Notifications$notifications$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? userId,
    Enum$NotificationType? type,
    String? title,
    String? message,
    Enum$NotificationStatus? status,
    List<Enum$NotificationChannel>? channels,
    DateTime? scheduledAt,
    DateTime? sentAt,
    DateTime? readAt,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}

class Query$Notifications$notifications$pageInfo {
  Query$Notifications$notifications$pageInfo({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$Notifications$notifications$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$page = json['page'];
    final l$pageSize = json['pageSize'];
    final l$total = json['total'];
    final l$totalPages = json['totalPages'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPrevPage = json['hasPrevPage'];
    final l$$__typename = json['__typename'];
    return Query$Notifications$notifications$pageInfo(
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
    if (other is! Query$Notifications$notifications$pageInfo ||
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

extension UtilityExtension$Query$Notifications$notifications$pageInfo
    on Query$Notifications$notifications$pageInfo {
  CopyWith$Query$Notifications$notifications$pageInfo<
    Query$Notifications$notifications$pageInfo
  >
  get copyWith =>
      CopyWith$Query$Notifications$notifications$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$Notifications$notifications$pageInfo<TRes> {
  factory CopyWith$Query$Notifications$notifications$pageInfo(
    Query$Notifications$notifications$pageInfo instance,
    TRes Function(Query$Notifications$notifications$pageInfo) then,
  ) = _CopyWithImpl$Query$Notifications$notifications$pageInfo;

  factory CopyWith$Query$Notifications$notifications$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$Notifications$notifications$pageInfo;

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

class _CopyWithImpl$Query$Notifications$notifications$pageInfo<TRes>
    implements CopyWith$Query$Notifications$notifications$pageInfo<TRes> {
  _CopyWithImpl$Query$Notifications$notifications$pageInfo(
    this._instance,
    this._then,
  );

  final Query$Notifications$notifications$pageInfo _instance;

  final TRes Function(Query$Notifications$notifications$pageInfo) _then;

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
    Query$Notifications$notifications$pageInfo(
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

class _CopyWithStubImpl$Query$Notifications$notifications$pageInfo<TRes>
    implements CopyWith$Query$Notifications$notifications$pageInfo<TRes> {
  _CopyWithStubImpl$Query$Notifications$notifications$pageInfo(this._res);

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
