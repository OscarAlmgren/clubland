import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Subscription$NotificationReceived {
  Subscription$NotificationReceived({
    required this.notificationReceived,
    this.$__typename = 'Subscription',
  });

  factory Subscription$NotificationReceived.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$notificationReceived = json['notificationReceived'];
    final l$$__typename = json['__typename'];
    return Subscription$NotificationReceived(
      notificationReceived:
          Subscription$NotificationReceived$notificationReceived.fromJson(
            (l$notificationReceived as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Subscription$NotificationReceived$notificationReceived
  notificationReceived;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$notificationReceived = notificationReceived;
    _resultData['notificationReceived'] = l$notificationReceived.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$notificationReceived = notificationReceived;
    final l$$__typename = $__typename;
    return Object.hashAll([l$notificationReceived, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$NotificationReceived ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$notificationReceived = notificationReceived;
    final lOther$notificationReceived = other.notificationReceived;
    if (l$notificationReceived != lOther$notificationReceived) {
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

extension UtilityExtension$Subscription$NotificationReceived
    on Subscription$NotificationReceived {
  CopyWith$Subscription$NotificationReceived<Subscription$NotificationReceived>
  get copyWith => CopyWith$Subscription$NotificationReceived(this, (i) => i);
}

abstract class CopyWith$Subscription$NotificationReceived<TRes> {
  factory CopyWith$Subscription$NotificationReceived(
    Subscription$NotificationReceived instance,
    TRes Function(Subscription$NotificationReceived) then,
  ) = _CopyWithImpl$Subscription$NotificationReceived;

  factory CopyWith$Subscription$NotificationReceived.stub(TRes res) =
      _CopyWithStubImpl$Subscription$NotificationReceived;

  TRes call({
    Subscription$NotificationReceived$notificationReceived?
    notificationReceived,
    String? $__typename,
  });
  CopyWith$Subscription$NotificationReceived$notificationReceived<TRes>
  get notificationReceived;
}

class _CopyWithImpl$Subscription$NotificationReceived<TRes>
    implements CopyWith$Subscription$NotificationReceived<TRes> {
  _CopyWithImpl$Subscription$NotificationReceived(this._instance, this._then);

  final Subscription$NotificationReceived _instance;

  final TRes Function(Subscription$NotificationReceived) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? notificationReceived = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Subscription$NotificationReceived(
      notificationReceived:
          notificationReceived == _undefined || notificationReceived == null
          ? _instance.notificationReceived
          : (notificationReceived
                as Subscription$NotificationReceived$notificationReceived),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Subscription$NotificationReceived$notificationReceived<TRes>
  get notificationReceived {
    final local$notificationReceived = _instance.notificationReceived;
    return CopyWith$Subscription$NotificationReceived$notificationReceived(
      local$notificationReceived,
      (e) => call(notificationReceived: e),
    );
  }
}

class _CopyWithStubImpl$Subscription$NotificationReceived<TRes>
    implements CopyWith$Subscription$NotificationReceived<TRes> {
  _CopyWithStubImpl$Subscription$NotificationReceived(this._res);

  TRes _res;

  call({
    Subscription$NotificationReceived$notificationReceived?
    notificationReceived,
    String? $__typename,
  }) => _res;

  CopyWith$Subscription$NotificationReceived$notificationReceived<TRes>
  get notificationReceived =>
      CopyWith$Subscription$NotificationReceived$notificationReceived.stub(
        _res,
      );
}

const documentNodeSubscriptionNotificationReceived = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'NotificationReceived'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'notificationReceived'),
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
Subscription$NotificationReceived _parserFn$Subscription$NotificationReceived(
  Map<String, dynamic> data,
) => Subscription$NotificationReceived.fromJson(data);

class Options$Subscription$NotificationReceived
    extends graphql.SubscriptionOptions<Subscription$NotificationReceived> {
  Options$Subscription$NotificationReceived({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$NotificationReceived? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeSubscriptionNotificationReceived,
         parserFn: _parserFn$Subscription$NotificationReceived,
       );
}

class WatchOptions$Subscription$NotificationReceived
    extends graphql.WatchQueryOptions<Subscription$NotificationReceived> {
  WatchOptions$Subscription$NotificationReceived({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$NotificationReceived? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeSubscriptionNotificationReceived,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Subscription$NotificationReceived,
       );
}

class FetchMoreOptions$Subscription$NotificationReceived
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$NotificationReceived({
    required graphql.UpdateQuery updateQuery,
  }) : super(
         updateQuery: updateQuery,
         document: documentNodeSubscriptionNotificationReceived,
       );
}

extension ClientExtension$Subscription$NotificationReceived
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$NotificationReceived>>
  subscribe$NotificationReceived([
    Options$Subscription$NotificationReceived? options,
  ]) => this.subscribe(options ?? Options$Subscription$NotificationReceived());

  graphql.ObservableQuery<Subscription$NotificationReceived>
  watchSubscription$NotificationReceived([
    WatchOptions$Subscription$NotificationReceived? options,
  ]) => this.watchQuery(
    options ?? WatchOptions$Subscription$NotificationReceived(),
  );
}

class Subscription$NotificationReceived$notificationReceived {
  Subscription$NotificationReceived$notificationReceived({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.message,
    required this.status,
    required this.channels,
    required this.createdAt,
    this.$__typename = 'Notification',
  });

  factory Subscription$NotificationReceived$notificationReceived.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$userId = json['userId'];
    final l$type = json['type'];
    final l$title = json['title'];
    final l$message = json['message'];
    final l$status = json['status'];
    final l$channels = json['channels'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Subscription$NotificationReceived$notificationReceived(
      id: (l$id as String),
      userId: (l$userId as String),
      type: fromJson$Enum$NotificationType((l$type as String)),
      title: (l$title as String),
      message: (l$message as String),
      status: fromJson$Enum$NotificationStatus((l$status as String)),
      channels: (l$channels as List<dynamic>)
          .map((e) => fromJson$Enum$NotificationChannel((e as String)))
          .toList(),
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
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$NotificationReceived$notificationReceived ||
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

extension UtilityExtension$Subscription$NotificationReceived$notificationReceived
    on Subscription$NotificationReceived$notificationReceived {
  CopyWith$Subscription$NotificationReceived$notificationReceived<
    Subscription$NotificationReceived$notificationReceived
  >
  get copyWith =>
      CopyWith$Subscription$NotificationReceived$notificationReceived(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Subscription$NotificationReceived$notificationReceived<
  TRes
> {
  factory CopyWith$Subscription$NotificationReceived$notificationReceived(
    Subscription$NotificationReceived$notificationReceived instance,
    TRes Function(Subscription$NotificationReceived$notificationReceived) then,
  ) = _CopyWithImpl$Subscription$NotificationReceived$notificationReceived;

  factory CopyWith$Subscription$NotificationReceived$notificationReceived.stub(
    TRes res,
  ) = _CopyWithStubImpl$Subscription$NotificationReceived$notificationReceived;

  TRes call({
    String? id,
    String? userId,
    Enum$NotificationType? type,
    String? title,
    String? message,
    Enum$NotificationStatus? status,
    List<Enum$NotificationChannel>? channels,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$NotificationReceived$notificationReceived<TRes>
    implements
        CopyWith$Subscription$NotificationReceived$notificationReceived<TRes> {
  _CopyWithImpl$Subscription$NotificationReceived$notificationReceived(
    this._instance,
    this._then,
  );

  final Subscription$NotificationReceived$notificationReceived _instance;

  final TRes Function(Subscription$NotificationReceived$notificationReceived)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? userId = _undefined,
    Object? type = _undefined,
    Object? title = _undefined,
    Object? message = _undefined,
    Object? status = _undefined,
    Object? channels = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Subscription$NotificationReceived$notificationReceived(
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
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Subscription$NotificationReceived$notificationReceived<
  TRes
>
    implements
        CopyWith$Subscription$NotificationReceived$notificationReceived<TRes> {
  _CopyWithStubImpl$Subscription$NotificationReceived$notificationReceived(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? userId,
    Enum$NotificationType? type,
    String? title,
    String? message,
    Enum$NotificationStatus? status,
    List<Enum$NotificationChannel>? channels,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}
