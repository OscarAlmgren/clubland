import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Mutation$SyncUser {
  Mutation$SyncUser({required this.syncUser, this.$__typename = 'Mutation'});

  factory Mutation$SyncUser.fromJson(Map<String, dynamic> json) {
    final l$syncUser = json['syncUser'];
    final l$$__typename = json['__typename'];
    return Mutation$SyncUser(
      syncUser: Mutation$SyncUser$syncUser.fromJson(
        (l$syncUser as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SyncUser$syncUser syncUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$syncUser = syncUser;
    _resultData['syncUser'] = l$syncUser.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$syncUser = syncUser;
    final l$$__typename = $__typename;
    return Object.hashAll([l$syncUser, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SyncUser || runtimeType != other.runtimeType) {
      return false;
    }
    final l$syncUser = syncUser;
    final lOther$syncUser = other.syncUser;
    if (l$syncUser != lOther$syncUser) {
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

extension UtilityExtension$Mutation$SyncUser on Mutation$SyncUser {
  CopyWith$Mutation$SyncUser<Mutation$SyncUser> get copyWith =>
      CopyWith$Mutation$SyncUser(this, (i) => i);
}

abstract class CopyWith$Mutation$SyncUser<TRes> {
  factory CopyWith$Mutation$SyncUser(
    Mutation$SyncUser instance,
    TRes Function(Mutation$SyncUser) then,
  ) = _CopyWithImpl$Mutation$SyncUser;

  factory CopyWith$Mutation$SyncUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SyncUser;

  TRes call({Mutation$SyncUser$syncUser? syncUser, String? $__typename});
  CopyWith$Mutation$SyncUser$syncUser<TRes> get syncUser;
}

class _CopyWithImpl$Mutation$SyncUser<TRes>
    implements CopyWith$Mutation$SyncUser<TRes> {
  _CopyWithImpl$Mutation$SyncUser(this._instance, this._then);

  final Mutation$SyncUser _instance;

  final TRes Function(Mutation$SyncUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? syncUser = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$SyncUser(
      syncUser: syncUser == _undefined || syncUser == null
          ? _instance.syncUser
          : (syncUser as Mutation$SyncUser$syncUser),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$SyncUser$syncUser<TRes> get syncUser {
    final local$syncUser = _instance.syncUser;
    return CopyWith$Mutation$SyncUser$syncUser(
      local$syncUser,
      (e) => call(syncUser: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$SyncUser<TRes>
    implements CopyWith$Mutation$SyncUser<TRes> {
  _CopyWithStubImpl$Mutation$SyncUser(this._res);

  TRes _res;

  call({Mutation$SyncUser$syncUser? syncUser, String? $__typename}) => _res;

  CopyWith$Mutation$SyncUser$syncUser<TRes> get syncUser =>
      CopyWith$Mutation$SyncUser$syncUser.stub(_res);
}

const documentNodeMutationSyncUser = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SyncUser'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'syncUser'),
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
                  name: NameNode(value: 'email'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'username'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'firstName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'lastName'),
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
  ],
);
Mutation$SyncUser _parserFn$Mutation$SyncUser(Map<String, dynamic> data) =>
    Mutation$SyncUser.fromJson(data);
typedef OnMutationCompleted$Mutation$SyncUser =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$SyncUser?);

class Options$Mutation$SyncUser
    extends graphql.MutationOptions<Mutation$SyncUser> {
  Options$Mutation$SyncUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SyncUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SyncUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$SyncUser>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
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
                 data == null ? null : _parserFn$Mutation$SyncUser(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSyncUser,
         parserFn: _parserFn$Mutation$SyncUser,
       );

  final OnMutationCompleted$Mutation$SyncUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$SyncUser
    extends graphql.WatchQueryOptions<Mutation$SyncUser> {
  WatchOptions$Mutation$SyncUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SyncUser? typedOptimisticResult,
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
         document: documentNodeMutationSyncUser,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$SyncUser,
       );
}

extension ClientExtension$Mutation$SyncUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SyncUser>> mutate$SyncUser([
    Options$Mutation$SyncUser? options,
  ]) async => await this.mutate(options ?? Options$Mutation$SyncUser());

  graphql.ObservableQuery<Mutation$SyncUser> watchMutation$SyncUser([
    WatchOptions$Mutation$SyncUser? options,
  ]) => this.watchMutation(options ?? WatchOptions$Mutation$SyncUser());
}

class Mutation$SyncUser$syncUser {
  Mutation$SyncUser$syncUser({
    required this.id,
    required this.clubId,
    required this.email,
    required this.username,
    this.firstName,
    this.lastName,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'User',
  });

  factory Mutation$SyncUser$syncUser.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$email = json['email'];
    final l$username = json['username'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$status = json['status'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$SyncUser$syncUser(
      id: (l$id as String),
      clubId: (l$clubId as String),
      email: (l$email as String),
      username: (l$username as String),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      status: fromJson$Enum$UserStatus((l$status as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String email;

  final String username;

  final String? firstName;

  final String? lastName;

  final Enum$UserStatus status;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$username = username;
    _resultData['username'] = l$username;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$status = status;
    _resultData['status'] = toJson$Enum$UserStatus(l$status);
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
    final l$email = email;
    final l$username = username;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$status = status;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$email,
      l$username,
      l$firstName,
      l$lastName,
      l$status,
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
    if (other is! Mutation$SyncUser$syncUser ||
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
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

extension UtilityExtension$Mutation$SyncUser$syncUser
    on Mutation$SyncUser$syncUser {
  CopyWith$Mutation$SyncUser$syncUser<Mutation$SyncUser$syncUser>
  get copyWith => CopyWith$Mutation$SyncUser$syncUser(this, (i) => i);
}

abstract class CopyWith$Mutation$SyncUser$syncUser<TRes> {
  factory CopyWith$Mutation$SyncUser$syncUser(
    Mutation$SyncUser$syncUser instance,
    TRes Function(Mutation$SyncUser$syncUser) then,
  ) = _CopyWithImpl$Mutation$SyncUser$syncUser;

  factory CopyWith$Mutation$SyncUser$syncUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SyncUser$syncUser;

  TRes call({
    String? id,
    String? clubId,
    String? email,
    String? username,
    String? firstName,
    String? lastName,
    Enum$UserStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SyncUser$syncUser<TRes>
    implements CopyWith$Mutation$SyncUser$syncUser<TRes> {
  _CopyWithImpl$Mutation$SyncUser$syncUser(this._instance, this._then);

  final Mutation$SyncUser$syncUser _instance;

  final TRes Function(Mutation$SyncUser$syncUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? email = _undefined,
    Object? username = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? status = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$SyncUser$syncUser(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      username: username == _undefined || username == null
          ? _instance.username
          : (username as String),
      firstName: firstName == _undefined
          ? _instance.firstName
          : (firstName as String?),
      lastName: lastName == _undefined
          ? _instance.lastName
          : (lastName as String?),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$UserStatus),
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

class _CopyWithStubImpl$Mutation$SyncUser$syncUser<TRes>
    implements CopyWith$Mutation$SyncUser$syncUser<TRes> {
  _CopyWithStubImpl$Mutation$SyncUser$syncUser(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? email,
    String? username,
    String? firstName,
    String? lastName,
    Enum$UserStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;
}
