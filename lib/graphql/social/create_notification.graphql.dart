import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CreateNotification {
  factory Variables$Mutation$CreateNotification({
    required Input$SendNotificationInput input,
  }) => Variables$Mutation$CreateNotification._({r'input': input});

  Variables$Mutation$CreateNotification._(this._$data);

  factory Variables$Mutation$CreateNotification.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$SendNotificationInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateNotification._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$SendNotificationInput get input =>
      (_$data['input'] as Input$SendNotificationInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateNotification<
    Variables$Mutation$CreateNotification
  >
  get copyWith =>
      CopyWith$Variables$Mutation$CreateNotification(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateNotification ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateNotification<TRes> {
  factory CopyWith$Variables$Mutation$CreateNotification(
    Variables$Mutation$CreateNotification instance,
    TRes Function(Variables$Mutation$CreateNotification) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateNotification;

  factory CopyWith$Variables$Mutation$CreateNotification.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateNotification;

  TRes call({Input$SendNotificationInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateNotification<TRes>
    implements CopyWith$Variables$Mutation$CreateNotification<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateNotification(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateNotification _instance;

  final TRes Function(Variables$Mutation$CreateNotification) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateNotification._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$SendNotificationInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateNotification<TRes>
    implements CopyWith$Variables$Mutation$CreateNotification<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateNotification(this._res);

  TRes _res;

  call({Input$SendNotificationInput? input}) => _res;
}

class Mutation$CreateNotification {
  Mutation$CreateNotification({
    required this.sendNotification,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateNotification.fromJson(Map<String, dynamic> json) {
    final l$sendNotification = json['sendNotification'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateNotification(
      sendNotification: Mutation$CreateNotification$sendNotification.fromJson(
        (l$sendNotification as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateNotification$sendNotification sendNotification;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sendNotification = sendNotification;
    _resultData['sendNotification'] = l$sendNotification.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sendNotification = sendNotification;
    final l$$__typename = $__typename;
    return Object.hashAll([l$sendNotification, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateNotification ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sendNotification = sendNotification;
    final lOther$sendNotification = other.sendNotification;
    if (l$sendNotification != lOther$sendNotification) {
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

extension UtilityExtension$Mutation$CreateNotification
    on Mutation$CreateNotification {
  CopyWith$Mutation$CreateNotification<Mutation$CreateNotification>
  get copyWith => CopyWith$Mutation$CreateNotification(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateNotification<TRes> {
  factory CopyWith$Mutation$CreateNotification(
    Mutation$CreateNotification instance,
    TRes Function(Mutation$CreateNotification) then,
  ) = _CopyWithImpl$Mutation$CreateNotification;

  factory CopyWith$Mutation$CreateNotification.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateNotification;

  TRes call({
    Mutation$CreateNotification$sendNotification? sendNotification,
    String? $__typename,
  });
  CopyWith$Mutation$CreateNotification$sendNotification<TRes>
  get sendNotification;
}

class _CopyWithImpl$Mutation$CreateNotification<TRes>
    implements CopyWith$Mutation$CreateNotification<TRes> {
  _CopyWithImpl$Mutation$CreateNotification(this._instance, this._then);

  final Mutation$CreateNotification _instance;

  final TRes Function(Mutation$CreateNotification) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sendNotification = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateNotification(
      sendNotification:
          sendNotification == _undefined || sendNotification == null
          ? _instance.sendNotification
          : (sendNotification as Mutation$CreateNotification$sendNotification),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateNotification$sendNotification<TRes>
  get sendNotification {
    final local$sendNotification = _instance.sendNotification;
    return CopyWith$Mutation$CreateNotification$sendNotification(
      local$sendNotification,
      (e) => call(sendNotification: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CreateNotification<TRes>
    implements CopyWith$Mutation$CreateNotification<TRes> {
  _CopyWithStubImpl$Mutation$CreateNotification(this._res);

  TRes _res;

  call({
    Mutation$CreateNotification$sendNotification? sendNotification,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateNotification$sendNotification<TRes>
  get sendNotification =>
      CopyWith$Mutation$CreateNotification$sendNotification.stub(_res);
}

const documentNodeMutationCreateNotification = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateNotification'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'SendNotificationInput'),
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
            name: NameNode(value: 'sendNotification'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
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
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'body'),
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
                  name: NameNode(value: 'channel'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'priority'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'scheduledFor'),
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
Mutation$CreateNotification _parserFn$Mutation$CreateNotification(
  Map<String, dynamic> data,
) => Mutation$CreateNotification.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateNotification =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$CreateNotification?,
    );

class Options$Mutation$CreateNotification
    extends graphql.MutationOptions<Mutation$CreateNotification> {
  Options$Mutation$CreateNotification({
    String? operationName,
    required Variables$Mutation$CreateNotification variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateNotification? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateNotification? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateNotification>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null
                     ? null
                     : _parserFn$Mutation$CreateNotification(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateNotification,
         parserFn: _parserFn$Mutation$CreateNotification,
       );

  final OnMutationCompleted$Mutation$CreateNotification? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateNotification
    extends graphql.WatchQueryOptions<Mutation$CreateNotification> {
  WatchOptions$Mutation$CreateNotification({
    String? operationName,
    required Variables$Mutation$CreateNotification variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateNotification? typedOptimisticResult,
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
         document: documentNodeMutationCreateNotification,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateNotification,
       );
}

extension ClientExtension$Mutation$CreateNotification on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateNotification>>
  mutate$CreateNotification(
    Options$Mutation$CreateNotification options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateNotification>
  watchMutation$CreateNotification(
    WatchOptions$Mutation$CreateNotification options,
  ) => this.watchMutation(options);
}

class Mutation$CreateNotification$sendNotification {
  Mutation$CreateNotification$sendNotification({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.message,
    required this.status,
    required this.channel,
    required this.priority,
    this.scheduledFor,
    required this.createdAt,
    this.$__typename = 'Notification',
  });

  factory Mutation$CreateNotification$sendNotification.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$userId = json['userId'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$message = json['message'];
    final l$status = json['status'];
    final l$channel = json['channel'];
    final l$priority = json['priority'];
    final l$scheduledFor = json['scheduledFor'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateNotification$sendNotification(
      id: (l$id as String),
      userId: (l$userId as String),
      title: (l$title as String),
      body: (l$body as String),
      message: (l$message as String),
      status: fromJson$Enum$NotificationStatus((l$status as String)),
      channel: fromJson$Enum$NotificationChannel((l$channel as String)),
      priority: fromJson$Enum$NotificationPriority((l$priority as String)),
      scheduledFor: l$scheduledFor == null
          ? null
          : DateTime.parse((l$scheduledFor as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String userId;

  final String title;

  final String body;

  final String message;

  final Enum$NotificationStatus status;

  final Enum$NotificationChannel channel;

  final Enum$NotificationPriority priority;

  final DateTime? scheduledFor;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$status = status;
    _resultData['status'] = toJson$Enum$NotificationStatus(l$status);
    final l$channel = channel;
    _resultData['channel'] = toJson$Enum$NotificationChannel(l$channel);
    final l$priority = priority;
    _resultData['priority'] = toJson$Enum$NotificationPriority(l$priority);
    final l$scheduledFor = scheduledFor;
    _resultData['scheduledFor'] = l$scheduledFor?.toIso8601String();
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
    final l$title = title;
    final l$body = body;
    final l$message = message;
    final l$status = status;
    final l$channel = channel;
    final l$priority = priority;
    final l$scheduledFor = scheduledFor;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$userId,
      l$title,
      l$body,
      l$message,
      l$status,
      l$channel,
      l$priority,
      l$scheduledFor,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateNotification$sendNotification ||
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
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
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
    final l$channel = channel;
    final lOther$channel = other.channel;
    if (l$channel != lOther$channel) {
      return false;
    }
    final l$priority = priority;
    final lOther$priority = other.priority;
    if (l$priority != lOther$priority) {
      return false;
    }
    final l$scheduledFor = scheduledFor;
    final lOther$scheduledFor = other.scheduledFor;
    if (l$scheduledFor != lOther$scheduledFor) {
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

extension UtilityExtension$Mutation$CreateNotification$sendNotification
    on Mutation$CreateNotification$sendNotification {
  CopyWith$Mutation$CreateNotification$sendNotification<
    Mutation$CreateNotification$sendNotification
  >
  get copyWith =>
      CopyWith$Mutation$CreateNotification$sendNotification(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateNotification$sendNotification<TRes> {
  factory CopyWith$Mutation$CreateNotification$sendNotification(
    Mutation$CreateNotification$sendNotification instance,
    TRes Function(Mutation$CreateNotification$sendNotification) then,
  ) = _CopyWithImpl$Mutation$CreateNotification$sendNotification;

  factory CopyWith$Mutation$CreateNotification$sendNotification.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateNotification$sendNotification;

  TRes call({
    String? id,
    String? userId,
    String? title,
    String? body,
    String? message,
    Enum$NotificationStatus? status,
    Enum$NotificationChannel? channel,
    Enum$NotificationPriority? priority,
    DateTime? scheduledFor,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateNotification$sendNotification<TRes>
    implements CopyWith$Mutation$CreateNotification$sendNotification<TRes> {
  _CopyWithImpl$Mutation$CreateNotification$sendNotification(
    this._instance,
    this._then,
  );

  final Mutation$CreateNotification$sendNotification _instance;

  final TRes Function(Mutation$CreateNotification$sendNotification) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? userId = _undefined,
    Object? title = _undefined,
    Object? body = _undefined,
    Object? message = _undefined,
    Object? status = _undefined,
    Object? channel = _undefined,
    Object? priority = _undefined,
    Object? scheduledFor = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateNotification$sendNotification(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      title: title == _undefined || title == null
          ? _instance.title
          : (title as String),
      body: body == _undefined || body == null
          ? _instance.body
          : (body as String),
      message: message == _undefined || message == null
          ? _instance.message
          : (message as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$NotificationStatus),
      channel: channel == _undefined || channel == null
          ? _instance.channel
          : (channel as Enum$NotificationChannel),
      priority: priority == _undefined || priority == null
          ? _instance.priority
          : (priority as Enum$NotificationPriority),
      scheduledFor: scheduledFor == _undefined
          ? _instance.scheduledFor
          : (scheduledFor as DateTime?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreateNotification$sendNotification<TRes>
    implements CopyWith$Mutation$CreateNotification$sendNotification<TRes> {
  _CopyWithStubImpl$Mutation$CreateNotification$sendNotification(this._res);

  TRes _res;

  call({
    String? id,
    String? userId,
    String? title,
    String? body,
    String? message,
    Enum$NotificationStatus? status,
    Enum$NotificationChannel? channel,
    Enum$NotificationPriority? priority,
    DateTime? scheduledFor,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}
