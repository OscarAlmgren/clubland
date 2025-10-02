import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Query$CurrentUser {
  Query$CurrentUser({this.me, this.$__typename = 'Query'});

  factory Query$CurrentUser.fromJson(Map<String, dynamic> json) {
    final l$me = json['me'];
    final l$$__typename = json['__typename'];
    return Query$CurrentUser(
      me: l$me == null
          ? null
          : Query$CurrentUser$me.fromJson((l$me as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$CurrentUser$me? me;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$me = me;
    _resultData['me'] = l$me?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$me = me;
    final l$$__typename = $__typename;
    return Object.hashAll([l$me, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$CurrentUser || runtimeType != other.runtimeType) {
      return false;
    }
    final l$me = me;
    final lOther$me = other.me;
    if (l$me != lOther$me) {
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

extension UtilityExtension$Query$CurrentUser on Query$CurrentUser {
  CopyWith$Query$CurrentUser<Query$CurrentUser> get copyWith =>
      CopyWith$Query$CurrentUser(this, (i) => i);
}

abstract class CopyWith$Query$CurrentUser<TRes> {
  factory CopyWith$Query$CurrentUser(
    Query$CurrentUser instance,
    TRes Function(Query$CurrentUser) then,
  ) = _CopyWithImpl$Query$CurrentUser;

  factory CopyWith$Query$CurrentUser.stub(TRes res) =
      _CopyWithStubImpl$Query$CurrentUser;

  TRes call({Query$CurrentUser$me? me, String? $__typename});
  CopyWith$Query$CurrentUser$me<TRes> get me;
}

class _CopyWithImpl$Query$CurrentUser<TRes>
    implements CopyWith$Query$CurrentUser<TRes> {
  _CopyWithImpl$Query$CurrentUser(this._instance, this._then);

  final Query$CurrentUser _instance;

  final TRes Function(Query$CurrentUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? me = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$CurrentUser(
          me: me == _undefined ? _instance.me : (me as Query$CurrentUser$me?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$CurrentUser$me<TRes> get me {
    final local$me = _instance.me;
    return local$me == null
        ? CopyWith$Query$CurrentUser$me.stub(_then(_instance))
        : CopyWith$Query$CurrentUser$me(local$me, (e) => call(me: e));
  }
}

class _CopyWithStubImpl$Query$CurrentUser<TRes>
    implements CopyWith$Query$CurrentUser<TRes> {
  _CopyWithStubImpl$Query$CurrentUser(this._res);

  TRes _res;

  call({Query$CurrentUser$me? me, String? $__typename}) => _res;

  CopyWith$Query$CurrentUser$me<TRes> get me =>
      CopyWith$Query$CurrentUser$me.stub(_res);
}

const documentNodeQueryCurrentUser = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'CurrentUser'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'me'),
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
                  name: NameNode(value: 'roles'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'permissions'),
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
Query$CurrentUser _parserFn$Query$CurrentUser(Map<String, dynamic> data) =>
    Query$CurrentUser.fromJson(data);
typedef OnQueryComplete$Query$CurrentUser =
    FutureOr<void> Function(Map<String, dynamic>?, Query$CurrentUser?);

class Options$Query$CurrentUser
    extends graphql.QueryOptions<Query$CurrentUser> {
  Options$Query$CurrentUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$CurrentUser? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$CurrentUser? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
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
                 data == null ? null : _parserFn$Query$CurrentUser(data),
               ),
         onError: onError,
         document: documentNodeQueryCurrentUser,
         parserFn: _parserFn$Query$CurrentUser,
       );

  final OnQueryComplete$Query$CurrentUser? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$CurrentUser
    extends graphql.WatchQueryOptions<Query$CurrentUser> {
  WatchOptions$Query$CurrentUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$CurrentUser? typedOptimisticResult,
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
         document: documentNodeQueryCurrentUser,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$CurrentUser,
       );
}

class FetchMoreOptions$Query$CurrentUser extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$CurrentUser({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryCurrentUser);
}

extension ClientExtension$Query$CurrentUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$CurrentUser>> query$CurrentUser([
    Options$Query$CurrentUser? options,
  ]) async => await this.query(options ?? Options$Query$CurrentUser());

  graphql.ObservableQuery<Query$CurrentUser> watchQuery$CurrentUser([
    WatchOptions$Query$CurrentUser? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$CurrentUser());

  void writeQuery$CurrentUser({
    required Query$CurrentUser data,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryCurrentUser),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$CurrentUser? readQuery$CurrentUser({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryCurrentUser),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$CurrentUser.fromJson(result);
  }
}

class Query$CurrentUser$me {
  Query$CurrentUser$me({
    required this.id,
    required this.clubId,
    required this.email,
    required this.username,
    this.firstName,
    this.lastName,
    required this.status,
    required this.roles,
    required this.permissions,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'User',
  });

  factory Query$CurrentUser$me.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$email = json['email'];
    final l$username = json['username'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$status = json['status'];
    final l$roles = json['roles'];
    final l$permissions = json['permissions'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$CurrentUser$me(
      id: (l$id as String),
      clubId: (l$clubId as String),
      email: (l$email as String),
      username: (l$username as String),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      status: fromJson$Enum$UserStatus((l$status as String)),
      roles: (l$roles as List<dynamic>).map((e) => (e as String)).toList(),
      permissions: (l$permissions as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
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

  final List<String> roles;

  final List<String> permissions;

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
    final l$roles = roles;
    _resultData['roles'] = l$roles.map((e) => e).toList();
    final l$permissions = permissions;
    _resultData['permissions'] = l$permissions.map((e) => e).toList();
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
    final l$roles = roles;
    final l$permissions = permissions;
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
      Object.hashAll(l$roles.map((v) => v)),
      Object.hashAll(l$permissions.map((v) => v)),
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
    if (other is! Query$CurrentUser$me || runtimeType != other.runtimeType) {
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
    final l$roles = roles;
    final lOther$roles = other.roles;
    if (l$roles.length != lOther$roles.length) {
      return false;
    }
    for (int i = 0; i < l$roles.length; i++) {
      final l$roles$entry = l$roles[i];
      final lOther$roles$entry = lOther$roles[i];
      if (l$roles$entry != lOther$roles$entry) {
        return false;
      }
    }
    final l$permissions = permissions;
    final lOther$permissions = other.permissions;
    if (l$permissions.length != lOther$permissions.length) {
      return false;
    }
    for (int i = 0; i < l$permissions.length; i++) {
      final l$permissions$entry = l$permissions[i];
      final lOther$permissions$entry = lOther$permissions[i];
      if (l$permissions$entry != lOther$permissions$entry) {
        return false;
      }
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

extension UtilityExtension$Query$CurrentUser$me on Query$CurrentUser$me {
  CopyWith$Query$CurrentUser$me<Query$CurrentUser$me> get copyWith =>
      CopyWith$Query$CurrentUser$me(this, (i) => i);
}

abstract class CopyWith$Query$CurrentUser$me<TRes> {
  factory CopyWith$Query$CurrentUser$me(
    Query$CurrentUser$me instance,
    TRes Function(Query$CurrentUser$me) then,
  ) = _CopyWithImpl$Query$CurrentUser$me;

  factory CopyWith$Query$CurrentUser$me.stub(TRes res) =
      _CopyWithStubImpl$Query$CurrentUser$me;

  TRes call({
    String? id,
    String? clubId,
    String? email,
    String? username,
    String? firstName,
    String? lastName,
    Enum$UserStatus? status,
    List<String>? roles,
    List<String>? permissions,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$CurrentUser$me<TRes>
    implements CopyWith$Query$CurrentUser$me<TRes> {
  _CopyWithImpl$Query$CurrentUser$me(this._instance, this._then);

  final Query$CurrentUser$me _instance;

  final TRes Function(Query$CurrentUser$me) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? email = _undefined,
    Object? username = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? status = _undefined,
    Object? roles = _undefined,
    Object? permissions = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$CurrentUser$me(
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
      roles: roles == _undefined || roles == null
          ? _instance.roles
          : (roles as List<String>),
      permissions: permissions == _undefined || permissions == null
          ? _instance.permissions
          : (permissions as List<String>),
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

class _CopyWithStubImpl$Query$CurrentUser$me<TRes>
    implements CopyWith$Query$CurrentUser$me<TRes> {
  _CopyWithStubImpl$Query$CurrentUser$me(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? email,
    String? username,
    String? firstName,
    String? lastName,
    Enum$UserStatus? status,
    List<String>? roles,
    List<String>? permissions,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;
}
