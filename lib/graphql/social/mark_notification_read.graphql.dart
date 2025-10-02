import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$MarkNotificationRead {
  factory Variables$Mutation$MarkNotificationRead({required String id}) =>
      Variables$Mutation$MarkNotificationRead._({r'id': id});

  Variables$Mutation$MarkNotificationRead._(this._$data);

  factory Variables$Mutation$MarkNotificationRead.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$MarkNotificationRead._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$MarkNotificationRead<
    Variables$Mutation$MarkNotificationRead
  >
  get copyWith =>
      CopyWith$Variables$Mutation$MarkNotificationRead(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$MarkNotificationRead ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$MarkNotificationRead<TRes> {
  factory CopyWith$Variables$Mutation$MarkNotificationRead(
    Variables$Mutation$MarkNotificationRead instance,
    TRes Function(Variables$Mutation$MarkNotificationRead) then,
  ) = _CopyWithImpl$Variables$Mutation$MarkNotificationRead;

  factory CopyWith$Variables$Mutation$MarkNotificationRead.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$MarkNotificationRead;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$MarkNotificationRead<TRes>
    implements CopyWith$Variables$Mutation$MarkNotificationRead<TRes> {
  _CopyWithImpl$Variables$Mutation$MarkNotificationRead(
    this._instance,
    this._then,
  );

  final Variables$Mutation$MarkNotificationRead _instance;

  final TRes Function(Variables$Mutation$MarkNotificationRead) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$MarkNotificationRead._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$MarkNotificationRead<TRes>
    implements CopyWith$Variables$Mutation$MarkNotificationRead<TRes> {
  _CopyWithStubImpl$Variables$Mutation$MarkNotificationRead(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$MarkNotificationRead {
  Mutation$MarkNotificationRead({
    required this.markNotificationRead,
    this.$__typename = 'Mutation',
  });

  factory Mutation$MarkNotificationRead.fromJson(Map<String, dynamic> json) {
    final l$markNotificationRead = json['markNotificationRead'];
    final l$$__typename = json['__typename'];
    return Mutation$MarkNotificationRead(
      markNotificationRead:
          Mutation$MarkNotificationRead$markNotificationRead.fromJson(
            (l$markNotificationRead as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$MarkNotificationRead$markNotificationRead markNotificationRead;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$markNotificationRead = markNotificationRead;
    _resultData['markNotificationRead'] = l$markNotificationRead.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$markNotificationRead = markNotificationRead;
    final l$$__typename = $__typename;
    return Object.hashAll([l$markNotificationRead, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$MarkNotificationRead ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$markNotificationRead = markNotificationRead;
    final lOther$markNotificationRead = other.markNotificationRead;
    if (l$markNotificationRead != lOther$markNotificationRead) {
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

extension UtilityExtension$Mutation$MarkNotificationRead
    on Mutation$MarkNotificationRead {
  CopyWith$Mutation$MarkNotificationRead<Mutation$MarkNotificationRead>
  get copyWith => CopyWith$Mutation$MarkNotificationRead(this, (i) => i);
}

abstract class CopyWith$Mutation$MarkNotificationRead<TRes> {
  factory CopyWith$Mutation$MarkNotificationRead(
    Mutation$MarkNotificationRead instance,
    TRes Function(Mutation$MarkNotificationRead) then,
  ) = _CopyWithImpl$Mutation$MarkNotificationRead;

  factory CopyWith$Mutation$MarkNotificationRead.stub(TRes res) =
      _CopyWithStubImpl$Mutation$MarkNotificationRead;

  TRes call({
    Mutation$MarkNotificationRead$markNotificationRead? markNotificationRead,
    String? $__typename,
  });
  CopyWith$Mutation$MarkNotificationRead$markNotificationRead<TRes>
  get markNotificationRead;
}

class _CopyWithImpl$Mutation$MarkNotificationRead<TRes>
    implements CopyWith$Mutation$MarkNotificationRead<TRes> {
  _CopyWithImpl$Mutation$MarkNotificationRead(this._instance, this._then);

  final Mutation$MarkNotificationRead _instance;

  final TRes Function(Mutation$MarkNotificationRead) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? markNotificationRead = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$MarkNotificationRead(
      markNotificationRead:
          markNotificationRead == _undefined || markNotificationRead == null
          ? _instance.markNotificationRead
          : (markNotificationRead
                as Mutation$MarkNotificationRead$markNotificationRead),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$MarkNotificationRead$markNotificationRead<TRes>
  get markNotificationRead {
    final local$markNotificationRead = _instance.markNotificationRead;
    return CopyWith$Mutation$MarkNotificationRead$markNotificationRead(
      local$markNotificationRead,
      (e) => call(markNotificationRead: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$MarkNotificationRead<TRes>
    implements CopyWith$Mutation$MarkNotificationRead<TRes> {
  _CopyWithStubImpl$Mutation$MarkNotificationRead(this._res);

  TRes _res;

  call({
    Mutation$MarkNotificationRead$markNotificationRead? markNotificationRead,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$MarkNotificationRead$markNotificationRead<TRes>
  get markNotificationRead =>
      CopyWith$Mutation$MarkNotificationRead$markNotificationRead.stub(_res);
}

const documentNodeMutationMarkNotificationRead = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'MarkNotificationRead'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'markNotificationRead'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
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
                  name: NameNode(value: 'readAt'),
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
Mutation$MarkNotificationRead _parserFn$Mutation$MarkNotificationRead(
  Map<String, dynamic> data,
) => Mutation$MarkNotificationRead.fromJson(data);
typedef OnMutationCompleted$Mutation$MarkNotificationRead =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$MarkNotificationRead?,
    );

class Options$Mutation$MarkNotificationRead
    extends graphql.MutationOptions<Mutation$MarkNotificationRead> {
  Options$Mutation$MarkNotificationRead({
    String? operationName,
    required Variables$Mutation$MarkNotificationRead variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$MarkNotificationRead? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$MarkNotificationRead? onCompleted,
    graphql.OnMutationUpdate<Mutation$MarkNotificationRead>? update,
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
                     : _parserFn$Mutation$MarkNotificationRead(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationMarkNotificationRead,
         parserFn: _parserFn$Mutation$MarkNotificationRead,
       );

  final OnMutationCompleted$Mutation$MarkNotificationRead?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$MarkNotificationRead
    extends graphql.WatchQueryOptions<Mutation$MarkNotificationRead> {
  WatchOptions$Mutation$MarkNotificationRead({
    String? operationName,
    required Variables$Mutation$MarkNotificationRead variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$MarkNotificationRead? typedOptimisticResult,
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
         document: documentNodeMutationMarkNotificationRead,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$MarkNotificationRead,
       );
}

extension ClientExtension$Mutation$MarkNotificationRead
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$MarkNotificationRead>>
  mutate$MarkNotificationRead(
    Options$Mutation$MarkNotificationRead options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$MarkNotificationRead>
  watchMutation$MarkNotificationRead(
    WatchOptions$Mutation$MarkNotificationRead options,
  ) => this.watchMutation(options);
}

class Mutation$MarkNotificationRead$markNotificationRead {
  Mutation$MarkNotificationRead$markNotificationRead({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.message,
    required this.status,
    this.readAt,
    this.$__typename = 'Notification',
  });

  factory Mutation$MarkNotificationRead$markNotificationRead.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$userId = json['userId'];
    final l$type = json['type'];
    final l$title = json['title'];
    final l$message = json['message'];
    final l$status = json['status'];
    final l$readAt = json['readAt'];
    final l$$__typename = json['__typename'];
    return Mutation$MarkNotificationRead$markNotificationRead(
      id: (l$id as String),
      userId: (l$userId as String),
      type: fromJson$Enum$NotificationType((l$type as String)),
      title: (l$title as String),
      message: (l$message as String),
      status: fromJson$Enum$NotificationStatus((l$status as String)),
      readAt: l$readAt == null ? null : DateTime.parse((l$readAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String userId;

  final Enum$NotificationType type;

  final String title;

  final String message;

  final Enum$NotificationStatus status;

  final DateTime? readAt;

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
    final l$readAt = readAt;
    _resultData['readAt'] = l$readAt?.toIso8601String();
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
    final l$readAt = readAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$userId,
      l$type,
      l$title,
      l$message,
      l$status,
      l$readAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$MarkNotificationRead$markNotificationRead ||
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
    final l$readAt = readAt;
    final lOther$readAt = other.readAt;
    if (l$readAt != lOther$readAt) {
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

extension UtilityExtension$Mutation$MarkNotificationRead$markNotificationRead
    on Mutation$MarkNotificationRead$markNotificationRead {
  CopyWith$Mutation$MarkNotificationRead$markNotificationRead<
    Mutation$MarkNotificationRead$markNotificationRead
  >
  get copyWith => CopyWith$Mutation$MarkNotificationRead$markNotificationRead(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$MarkNotificationRead$markNotificationRead<
  TRes
> {
  factory CopyWith$Mutation$MarkNotificationRead$markNotificationRead(
    Mutation$MarkNotificationRead$markNotificationRead instance,
    TRes Function(Mutation$MarkNotificationRead$markNotificationRead) then,
  ) = _CopyWithImpl$Mutation$MarkNotificationRead$markNotificationRead;

  factory CopyWith$Mutation$MarkNotificationRead$markNotificationRead.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$MarkNotificationRead$markNotificationRead;

  TRes call({
    String? id,
    String? userId,
    Enum$NotificationType? type,
    String? title,
    String? message,
    Enum$NotificationStatus? status,
    DateTime? readAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$MarkNotificationRead$markNotificationRead<TRes>
    implements
        CopyWith$Mutation$MarkNotificationRead$markNotificationRead<TRes> {
  _CopyWithImpl$Mutation$MarkNotificationRead$markNotificationRead(
    this._instance,
    this._then,
  );

  final Mutation$MarkNotificationRead$markNotificationRead _instance;

  final TRes Function(Mutation$MarkNotificationRead$markNotificationRead) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? userId = _undefined,
    Object? type = _undefined,
    Object? title = _undefined,
    Object? message = _undefined,
    Object? status = _undefined,
    Object? readAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$MarkNotificationRead$markNotificationRead(
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
      readAt: readAt == _undefined ? _instance.readAt : (readAt as DateTime?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$MarkNotificationRead$markNotificationRead<TRes>
    implements
        CopyWith$Mutation$MarkNotificationRead$markNotificationRead<TRes> {
  _CopyWithStubImpl$Mutation$MarkNotificationRead$markNotificationRead(
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
    DateTime? readAt,
    String? $__typename,
  }) => _res;
}
