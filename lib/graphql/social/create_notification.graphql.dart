import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CreateNotification {
  factory Variables$Mutation$CreateNotification({
    required Input$CreateNotificationInput input,
  }) => Variables$Mutation$CreateNotification._({r'input': input});

  Variables$Mutation$CreateNotification._(this._$data);

  factory Variables$Mutation$CreateNotification.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$CreateNotificationInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateNotification._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreateNotificationInput get input =>
      (_$data['input'] as Input$CreateNotificationInput);

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

  TRes call({Input$CreateNotificationInput? input});
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
        'input': (input as Input$CreateNotificationInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateNotification<TRes>
    implements CopyWith$Variables$Mutation$CreateNotification<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateNotification(this._res);

  TRes _res;

  call({Input$CreateNotificationInput? input}) => _res;
}

class Mutation$CreateNotification {
  Mutation$CreateNotification({
    required this.createNotification,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateNotification.fromJson(Map<String, dynamic> json) {
    final l$createNotification = json['createNotification'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateNotification(
      createNotification:
          Mutation$CreateNotification$createNotification.fromJson(
            (l$createNotification as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateNotification$createNotification createNotification;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createNotification = createNotification;
    _resultData['createNotification'] = l$createNotification.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createNotification = createNotification;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createNotification, l$$__typename]);
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
    final l$createNotification = createNotification;
    final lOther$createNotification = other.createNotification;
    if (l$createNotification != lOther$createNotification) {
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
    Mutation$CreateNotification$createNotification? createNotification,
    String? $__typename,
  });
  CopyWith$Mutation$CreateNotification$createNotification<TRes>
  get createNotification;
}

class _CopyWithImpl$Mutation$CreateNotification<TRes>
    implements CopyWith$Mutation$CreateNotification<TRes> {
  _CopyWithImpl$Mutation$CreateNotification(this._instance, this._then);

  final Mutation$CreateNotification _instance;

  final TRes Function(Mutation$CreateNotification) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createNotification = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateNotification(
      createNotification:
          createNotification == _undefined || createNotification == null
          ? _instance.createNotification
          : (createNotification
                as Mutation$CreateNotification$createNotification),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateNotification$createNotification<TRes>
  get createNotification {
    final local$createNotification = _instance.createNotification;
    return CopyWith$Mutation$CreateNotification$createNotification(
      local$createNotification,
      (e) => call(createNotification: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CreateNotification<TRes>
    implements CopyWith$Mutation$CreateNotification<TRes> {
  _CopyWithStubImpl$Mutation$CreateNotification(this._res);

  TRes _res;

  call({
    Mutation$CreateNotification$createNotification? createNotification,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateNotification$createNotification<TRes>
  get createNotification =>
      CopyWith$Mutation$CreateNotification$createNotification.stub(_res);
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
            name: NameNode(value: 'CreateNotificationInput'),
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
            name: NameNode(value: 'createNotification'),
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

class Mutation$CreateNotification$createNotification {
  Mutation$CreateNotification$createNotification({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.message,
    required this.status,
    required this.channels,
    this.scheduledAt,
    required this.createdAt,
    this.$__typename = 'Notification',
  });

  factory Mutation$CreateNotification$createNotification.fromJson(
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
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateNotification$createNotification(
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
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateNotification$createNotification ||
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

extension UtilityExtension$Mutation$CreateNotification$createNotification
    on Mutation$CreateNotification$createNotification {
  CopyWith$Mutation$CreateNotification$createNotification<
    Mutation$CreateNotification$createNotification
  >
  get copyWith =>
      CopyWith$Mutation$CreateNotification$createNotification(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateNotification$createNotification<TRes> {
  factory CopyWith$Mutation$CreateNotification$createNotification(
    Mutation$CreateNotification$createNotification instance,
    TRes Function(Mutation$CreateNotification$createNotification) then,
  ) = _CopyWithImpl$Mutation$CreateNotification$createNotification;

  factory CopyWith$Mutation$CreateNotification$createNotification.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateNotification$createNotification;

  TRes call({
    String? id,
    String? userId,
    Enum$NotificationType? type,
    String? title,
    String? message,
    Enum$NotificationStatus? status,
    List<Enum$NotificationChannel>? channels,
    DateTime? scheduledAt,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateNotification$createNotification<TRes>
    implements CopyWith$Mutation$CreateNotification$createNotification<TRes> {
  _CopyWithImpl$Mutation$CreateNotification$createNotification(
    this._instance,
    this._then,
  );

  final Mutation$CreateNotification$createNotification _instance;

  final TRes Function(Mutation$CreateNotification$createNotification) _then;

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
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateNotification$createNotification(
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
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreateNotification$createNotification<TRes>
    implements CopyWith$Mutation$CreateNotification$createNotification<TRes> {
  _CopyWithStubImpl$Mutation$CreateNotification$createNotification(this._res);

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
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}
