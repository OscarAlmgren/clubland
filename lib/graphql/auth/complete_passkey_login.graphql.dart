import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CompletePasskeyLogin {
  factory Variables$Mutation$CompletePasskeyLogin({
    required String clubSlug,
    required String userId,
    required Input$PasskeyCredentialInput credential,
  }) => Variables$Mutation$CompletePasskeyLogin._({
    r'clubSlug': clubSlug,
    r'userId': userId,
    r'credential': credential,
  });

  Variables$Mutation$CompletePasskeyLogin._(this._$data);

  factory Variables$Mutation$CompletePasskeyLogin.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$clubSlug = data['clubSlug'];
    result$data['clubSlug'] = (l$clubSlug as String);
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    final l$credential = data['credential'];
    result$data['credential'] = Input$PasskeyCredentialInput.fromJson(
      (l$credential as Map<String, dynamic>),
    );
    return Variables$Mutation$CompletePasskeyLogin._(result$data);
  }

  Map<String, dynamic> _$data;

  String get clubSlug => (_$data['clubSlug'] as String);

  String get userId => (_$data['userId'] as String);

  Input$PasskeyCredentialInput get credential =>
      (_$data['credential'] as Input$PasskeyCredentialInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$clubSlug = clubSlug;
    result$data['clubSlug'] = l$clubSlug;
    final l$userId = userId;
    result$data['userId'] = l$userId;
    final l$credential = credential;
    result$data['credential'] = l$credential.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CompletePasskeyLogin<
    Variables$Mutation$CompletePasskeyLogin
  >
  get copyWith =>
      CopyWith$Variables$Mutation$CompletePasskeyLogin(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CompletePasskeyLogin ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$clubSlug = clubSlug;
    final lOther$clubSlug = other.clubSlug;
    if (l$clubSlug != lOther$clubSlug) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$credential = credential;
    final lOther$credential = other.credential;
    if (l$credential != lOther$credential) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$clubSlug = clubSlug;
    final l$userId = userId;
    final l$credential = credential;
    return Object.hashAll([l$clubSlug, l$userId, l$credential]);
  }
}

abstract class CopyWith$Variables$Mutation$CompletePasskeyLogin<TRes> {
  factory CopyWith$Variables$Mutation$CompletePasskeyLogin(
    Variables$Mutation$CompletePasskeyLogin instance,
    TRes Function(Variables$Mutation$CompletePasskeyLogin) then,
  ) = _CopyWithImpl$Variables$Mutation$CompletePasskeyLogin;

  factory CopyWith$Variables$Mutation$CompletePasskeyLogin.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CompletePasskeyLogin;

  TRes call({
    String? clubSlug,
    String? userId,
    Input$PasskeyCredentialInput? credential,
  });
}

class _CopyWithImpl$Variables$Mutation$CompletePasskeyLogin<TRes>
    implements CopyWith$Variables$Mutation$CompletePasskeyLogin<TRes> {
  _CopyWithImpl$Variables$Mutation$CompletePasskeyLogin(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CompletePasskeyLogin _instance;

  final TRes Function(Variables$Mutation$CompletePasskeyLogin) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? clubSlug = _undefined,
    Object? userId = _undefined,
    Object? credential = _undefined,
  }) => _then(
    Variables$Mutation$CompletePasskeyLogin._({
      ..._instance._$data,
      if (clubSlug != _undefined && clubSlug != null)
        'clubSlug': (clubSlug as String),
      if (userId != _undefined && userId != null) 'userId': (userId as String),
      if (credential != _undefined && credential != null)
        'credential': (credential as Input$PasskeyCredentialInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CompletePasskeyLogin<TRes>
    implements CopyWith$Variables$Mutation$CompletePasskeyLogin<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CompletePasskeyLogin(this._res);

  TRes _res;

  call({
    String? clubSlug,
    String? userId,
    Input$PasskeyCredentialInput? credential,
  }) => _res;
}

class Mutation$CompletePasskeyLogin {
  Mutation$CompletePasskeyLogin({
    required this.completePasskeyLogin,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CompletePasskeyLogin.fromJson(Map<String, dynamic> json) {
    final l$completePasskeyLogin = json['completePasskeyLogin'];
    final l$$__typename = json['__typename'];
    return Mutation$CompletePasskeyLogin(
      completePasskeyLogin:
          Mutation$CompletePasskeyLogin$completePasskeyLogin.fromJson(
            (l$completePasskeyLogin as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CompletePasskeyLogin$completePasskeyLogin completePasskeyLogin;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$completePasskeyLogin = completePasskeyLogin;
    _resultData['completePasskeyLogin'] = l$completePasskeyLogin.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$completePasskeyLogin = completePasskeyLogin;
    final l$$__typename = $__typename;
    return Object.hashAll([l$completePasskeyLogin, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CompletePasskeyLogin ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$completePasskeyLogin = completePasskeyLogin;
    final lOther$completePasskeyLogin = other.completePasskeyLogin;
    if (l$completePasskeyLogin != lOther$completePasskeyLogin) {
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

extension UtilityExtension$Mutation$CompletePasskeyLogin
    on Mutation$CompletePasskeyLogin {
  CopyWith$Mutation$CompletePasskeyLogin<Mutation$CompletePasskeyLogin>
  get copyWith => CopyWith$Mutation$CompletePasskeyLogin(this, (i) => i);
}

abstract class CopyWith$Mutation$CompletePasskeyLogin<TRes> {
  factory CopyWith$Mutation$CompletePasskeyLogin(
    Mutation$CompletePasskeyLogin instance,
    TRes Function(Mutation$CompletePasskeyLogin) then,
  ) = _CopyWithImpl$Mutation$CompletePasskeyLogin;

  factory CopyWith$Mutation$CompletePasskeyLogin.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CompletePasskeyLogin;

  TRes call({
    Mutation$CompletePasskeyLogin$completePasskeyLogin? completePasskeyLogin,
    String? $__typename,
  });
  CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin<TRes>
  get completePasskeyLogin;
}

class _CopyWithImpl$Mutation$CompletePasskeyLogin<TRes>
    implements CopyWith$Mutation$CompletePasskeyLogin<TRes> {
  _CopyWithImpl$Mutation$CompletePasskeyLogin(this._instance, this._then);

  final Mutation$CompletePasskeyLogin _instance;

  final TRes Function(Mutation$CompletePasskeyLogin) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? completePasskeyLogin = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CompletePasskeyLogin(
      completePasskeyLogin:
          completePasskeyLogin == _undefined || completePasskeyLogin == null
          ? _instance.completePasskeyLogin
          : (completePasskeyLogin
                as Mutation$CompletePasskeyLogin$completePasskeyLogin),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin<TRes>
  get completePasskeyLogin {
    final local$completePasskeyLogin = _instance.completePasskeyLogin;
    return CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin(
      local$completePasskeyLogin,
      (e) => call(completePasskeyLogin: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CompletePasskeyLogin<TRes>
    implements CopyWith$Mutation$CompletePasskeyLogin<TRes> {
  _CopyWithStubImpl$Mutation$CompletePasskeyLogin(this._res);

  TRes _res;

  call({
    Mutation$CompletePasskeyLogin$completePasskeyLogin? completePasskeyLogin,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin<TRes>
  get completePasskeyLogin =>
      CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin.stub(_res);
}

const documentNodeMutationCompletePasskeyLogin = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CompletePasskeyLogin'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'clubSlug')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'userId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'credential')),
          type: NamedTypeNode(
            name: NameNode(value: 'PasskeyCredentialInput'),
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
            name: NameNode(value: 'completePasskeyLogin'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'clubSlug'),
                value: VariableNode(name: NameNode(value: 'clubSlug')),
              ),
              ArgumentNode(
                name: NameNode(value: 'userId'),
                value: VariableNode(name: NameNode(value: 'userId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'credential'),
                value: VariableNode(name: NameNode(value: 'credential')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'token'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'refreshToken'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'expiresAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'user'),
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
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'name'),
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
Mutation$CompletePasskeyLogin _parserFn$Mutation$CompletePasskeyLogin(
  Map<String, dynamic> data,
) => Mutation$CompletePasskeyLogin.fromJson(data);
typedef OnMutationCompleted$Mutation$CompletePasskeyLogin =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$CompletePasskeyLogin?,
    );

class Options$Mutation$CompletePasskeyLogin
    extends graphql.MutationOptions<Mutation$CompletePasskeyLogin> {
  Options$Mutation$CompletePasskeyLogin({
    String? operationName,
    required Variables$Mutation$CompletePasskeyLogin variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CompletePasskeyLogin? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CompletePasskeyLogin? onCompleted,
    graphql.OnMutationUpdate<Mutation$CompletePasskeyLogin>? update,
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
                     : _parserFn$Mutation$CompletePasskeyLogin(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCompletePasskeyLogin,
         parserFn: _parserFn$Mutation$CompletePasskeyLogin,
       );

  final OnMutationCompleted$Mutation$CompletePasskeyLogin?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CompletePasskeyLogin
    extends graphql.WatchQueryOptions<Mutation$CompletePasskeyLogin> {
  WatchOptions$Mutation$CompletePasskeyLogin({
    String? operationName,
    required Variables$Mutation$CompletePasskeyLogin variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CompletePasskeyLogin? typedOptimisticResult,
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
         document: documentNodeMutationCompletePasskeyLogin,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CompletePasskeyLogin,
       );
}

extension ClientExtension$Mutation$CompletePasskeyLogin
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CompletePasskeyLogin>>
  mutate$CompletePasskeyLogin(
    Options$Mutation$CompletePasskeyLogin options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CompletePasskeyLogin>
  watchMutation$CompletePasskeyLogin(
    WatchOptions$Mutation$CompletePasskeyLogin options,
  ) => this.watchMutation(options);
}

class Mutation$CompletePasskeyLogin$completePasskeyLogin {
  Mutation$CompletePasskeyLogin$completePasskeyLogin({
    required this.token,
    required this.refreshToken,
    required this.expiresAt,
    required this.user,
    this.$__typename = 'AuthPayload',
  });

  factory Mutation$CompletePasskeyLogin$completePasskeyLogin.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$token = json['token'];
    final l$refreshToken = json['refreshToken'];
    final l$expiresAt = json['expiresAt'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$CompletePasskeyLogin$completePasskeyLogin(
      token: (l$token as String),
      refreshToken: (l$refreshToken as String),
      expiresAt: DateTime.parse((l$expiresAt as String)),
      user: Mutation$CompletePasskeyLogin$completePasskeyLogin$user.fromJson(
        (l$user as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final String token;

  final String refreshToken;

  final DateTime expiresAt;

  final Mutation$CompletePasskeyLogin$completePasskeyLogin$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$token = token;
    _resultData['token'] = l$token;
    final l$refreshToken = refreshToken;
    _resultData['refreshToken'] = l$refreshToken;
    final l$expiresAt = expiresAt;
    _resultData['expiresAt'] = l$expiresAt.toIso8601String();
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$refreshToken = refreshToken;
    final l$expiresAt = expiresAt;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$token,
      l$refreshToken,
      l$expiresAt,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CompletePasskeyLogin$completePasskeyLogin ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$refreshToken = refreshToken;
    final lOther$refreshToken = other.refreshToken;
    if (l$refreshToken != lOther$refreshToken) {
      return false;
    }
    final l$expiresAt = expiresAt;
    final lOther$expiresAt = other.expiresAt;
    if (l$expiresAt != lOther$expiresAt) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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

extension UtilityExtension$Mutation$CompletePasskeyLogin$completePasskeyLogin
    on Mutation$CompletePasskeyLogin$completePasskeyLogin {
  CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin<
    Mutation$CompletePasskeyLogin$completePasskeyLogin
  >
  get copyWith => CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin<
  TRes
> {
  factory CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin(
    Mutation$CompletePasskeyLogin$completePasskeyLogin instance,
    TRes Function(Mutation$CompletePasskeyLogin$completePasskeyLogin) then,
  ) = _CopyWithImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin;

  factory CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin;

  TRes call({
    String? token,
    String? refreshToken,
    DateTime? expiresAt,
    Mutation$CompletePasskeyLogin$completePasskeyLogin$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user<TRes>
  get user;
}

class _CopyWithImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin<TRes>
    implements
        CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin<TRes> {
  _CopyWithImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin(
    this._instance,
    this._then,
  );

  final Mutation$CompletePasskeyLogin$completePasskeyLogin _instance;

  final TRes Function(Mutation$CompletePasskeyLogin$completePasskeyLogin) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? token = _undefined,
    Object? refreshToken = _undefined,
    Object? expiresAt = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CompletePasskeyLogin$completePasskeyLogin(
      token: token == _undefined || token == null
          ? _instance.token
          : (token as String),
      refreshToken: refreshToken == _undefined || refreshToken == null
          ? _instance.refreshToken
          : (refreshToken as String),
      expiresAt: expiresAt == _undefined || expiresAt == null
          ? _instance.expiresAt
          : (expiresAt as DateTime),
      user: user == _undefined || user == null
          ? _instance.user
          : (user as Mutation$CompletePasskeyLogin$completePasskeyLogin$user),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user<TRes>
  get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user(
      local$user,
      (e) => call(user: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin<TRes>
    implements
        CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin<TRes> {
  _CopyWithStubImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin(
    this._res,
  );

  TRes _res;

  call({
    String? token,
    String? refreshToken,
    DateTime? expiresAt,
    Mutation$CompletePasskeyLogin$completePasskeyLogin$user? user,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user<TRes>
  get user =>
      CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user.stub(
        _res,
      );
}

class Mutation$CompletePasskeyLogin$completePasskeyLogin$user {
  Mutation$CompletePasskeyLogin$completePasskeyLogin$user({
    required this.id,
    required this.clubId,
    required this.email,
    this.username,
    this.firstName,
    this.lastName,
    required this.status,
    required this.roles,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'User',
  });

  factory Mutation$CompletePasskeyLogin$completePasskeyLogin$user.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$email = json['email'];
    final l$username = json['username'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$status = json['status'];
    final l$roles = json['roles'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$CompletePasskeyLogin$completePasskeyLogin$user(
      id: (l$id as String),
      clubId: (l$clubId as String),
      email: (l$email as String),
      username: (l$username as String?),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      status: fromJson$Enum$UserStatus((l$status as String)),
      roles: (l$roles as List<dynamic>)
          .map(
            (e) =>
                Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String email;

  final String? username;

  final String? firstName;

  final String? lastName;

  final Enum$UserStatus status;

  final List<Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles>
  roles;

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
    _resultData['roles'] = l$roles.map((e) => e.toJson()).toList();
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
    if (other is! Mutation$CompletePasskeyLogin$completePasskeyLogin$user ||
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

extension UtilityExtension$Mutation$CompletePasskeyLogin$completePasskeyLogin$user
    on Mutation$CompletePasskeyLogin$completePasskeyLogin$user {
  CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user<
    Mutation$CompletePasskeyLogin$completePasskeyLogin$user
  >
  get copyWith =>
      CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user<
  TRes
> {
  factory CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user(
    Mutation$CompletePasskeyLogin$completePasskeyLogin$user instance,
    TRes Function(Mutation$CompletePasskeyLogin$completePasskeyLogin$user) then,
  ) = _CopyWithImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin$user;

  factory CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin$user;

  TRes call({
    String? id,
    String? clubId,
    String? email,
    String? username,
    String? firstName,
    String? lastName,
    Enum$UserStatus? status,
    List<Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles>? roles,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
  TRes roles(
    Iterable<Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles>
    Function(
      Iterable<
        CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles<
          Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin$user<
  TRes
>
    implements
        CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user<TRes> {
  _CopyWithImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin$user(
    this._instance,
    this._then,
  );

  final Mutation$CompletePasskeyLogin$completePasskeyLogin$user _instance;

  final TRes Function(Mutation$CompletePasskeyLogin$completePasskeyLogin$user)
  _then;

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
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CompletePasskeyLogin$completePasskeyLogin$user(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      username: username == _undefined
          ? _instance.username
          : (username as String?),
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
          : (roles
                as List<
                  Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles
                >),
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

  TRes roles(
    Iterable<Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles>
    Function(
      Iterable<
        CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles<
          Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles
        >
      >,
    )
    _fn,
  ) => call(
    roles: _fn(
      _instance.roles.map(
        (e) =>
            CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles(
              e,
              (i) => i,
            ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin$user<
  TRes
>
    implements
        CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user<TRes> {
  _CopyWithStubImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin$user(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? email,
    String? username,
    String? firstName,
    String? lastName,
    Enum$UserStatus? status,
    List<Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles>? roles,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  roles(_fn) => _res;
}

class Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles {
  Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles({
    required this.name,
    this.$__typename = 'Role',
  });

  factory Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles(
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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

extension UtilityExtension$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles
    on Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles {
  CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles<
    Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles
  >
  get copyWith =>
      CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles<
  TRes
> {
  factory CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles(
    Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles instance,
    TRes Function(Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles)
    then,
  ) = _CopyWithImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles;

  factory CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles;

  TRes call({String? name, String? $__typename});
}

class _CopyWithImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles<
  TRes
>
    implements
        CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles<
          TRes
        > {
  _CopyWithImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles(
    this._instance,
    this._then,
  );

  final Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles _instance;

  final TRes Function(
    Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? name = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles(
          name: name == _undefined || name == null
              ? _instance.name
              : (name as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles<
  TRes
>
    implements
        CopyWith$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles<
          TRes
        > {
  _CopyWithStubImpl$Mutation$CompletePasskeyLogin$completePasskeyLogin$user$roles(
    this._res,
  );

  TRes _res;

  call({String? name, String? $__typename}) => _res;
}
