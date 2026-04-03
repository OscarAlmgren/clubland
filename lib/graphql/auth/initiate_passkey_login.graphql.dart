import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$InitiatePasskeyLogin {
  factory Variables$Mutation$InitiatePasskeyLogin({
    required String email,
    required String clubSlug,
  }) => Variables$Mutation$InitiatePasskeyLogin._({
    r'email': email,
    r'clubSlug': clubSlug,
  });

  Variables$Mutation$InitiatePasskeyLogin._(this._$data);

  factory Variables$Mutation$InitiatePasskeyLogin.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$clubSlug = data['clubSlug'];
    result$data['clubSlug'] = (l$clubSlug as String);
    return Variables$Mutation$InitiatePasskeyLogin._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get clubSlug => (_$data['clubSlug'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$clubSlug = clubSlug;
    result$data['clubSlug'] = l$clubSlug;
    return result$data;
  }

  CopyWith$Variables$Mutation$InitiatePasskeyLogin<
    Variables$Mutation$InitiatePasskeyLogin
  >
  get copyWith =>
      CopyWith$Variables$Mutation$InitiatePasskeyLogin(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$InitiatePasskeyLogin ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$clubSlug = clubSlug;
    final lOther$clubSlug = other.clubSlug;
    if (l$clubSlug != lOther$clubSlug) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$clubSlug = clubSlug;
    return Object.hashAll([l$email, l$clubSlug]);
  }
}

abstract class CopyWith$Variables$Mutation$InitiatePasskeyLogin<TRes> {
  factory CopyWith$Variables$Mutation$InitiatePasskeyLogin(
    Variables$Mutation$InitiatePasskeyLogin instance,
    TRes Function(Variables$Mutation$InitiatePasskeyLogin) then,
  ) = _CopyWithImpl$Variables$Mutation$InitiatePasskeyLogin;

  factory CopyWith$Variables$Mutation$InitiatePasskeyLogin.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$InitiatePasskeyLogin;

  TRes call({String? email, String? clubSlug});
}

class _CopyWithImpl$Variables$Mutation$InitiatePasskeyLogin<TRes>
    implements CopyWith$Variables$Mutation$InitiatePasskeyLogin<TRes> {
  _CopyWithImpl$Variables$Mutation$InitiatePasskeyLogin(
    this._instance,
    this._then,
  );

  final Variables$Mutation$InitiatePasskeyLogin _instance;

  final TRes Function(Variables$Mutation$InitiatePasskeyLogin) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? email = _undefined, Object? clubSlug = _undefined}) =>
      _then(
        Variables$Mutation$InitiatePasskeyLogin._({
          ..._instance._$data,
          if (email != _undefined && email != null) 'email': (email as String),
          if (clubSlug != _undefined && clubSlug != null)
            'clubSlug': (clubSlug as String),
        }),
      );
}

class _CopyWithStubImpl$Variables$Mutation$InitiatePasskeyLogin<TRes>
    implements CopyWith$Variables$Mutation$InitiatePasskeyLogin<TRes> {
  _CopyWithStubImpl$Variables$Mutation$InitiatePasskeyLogin(this._res);

  TRes _res;

  call({String? email, String? clubSlug}) => _res;
}

class Mutation$InitiatePasskeyLogin {
  Mutation$InitiatePasskeyLogin({
    required this.initiatePasskeyLogin,
    this.$__typename = 'Mutation',
  });

  factory Mutation$InitiatePasskeyLogin.fromJson(Map<String, dynamic> json) {
    final l$initiatePasskeyLogin = json['initiatePasskeyLogin'];
    final l$$__typename = json['__typename'];
    return Mutation$InitiatePasskeyLogin(
      initiatePasskeyLogin:
          Mutation$InitiatePasskeyLogin$initiatePasskeyLogin.fromJson(
            (l$initiatePasskeyLogin as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$InitiatePasskeyLogin$initiatePasskeyLogin initiatePasskeyLogin;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$initiatePasskeyLogin = initiatePasskeyLogin;
    _resultData['initiatePasskeyLogin'] = l$initiatePasskeyLogin.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$initiatePasskeyLogin = initiatePasskeyLogin;
    final l$$__typename = $__typename;
    return Object.hashAll([l$initiatePasskeyLogin, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$InitiatePasskeyLogin ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$initiatePasskeyLogin = initiatePasskeyLogin;
    final lOther$initiatePasskeyLogin = other.initiatePasskeyLogin;
    if (l$initiatePasskeyLogin != lOther$initiatePasskeyLogin) {
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

extension UtilityExtension$Mutation$InitiatePasskeyLogin
    on Mutation$InitiatePasskeyLogin {
  CopyWith$Mutation$InitiatePasskeyLogin<Mutation$InitiatePasskeyLogin>
  get copyWith => CopyWith$Mutation$InitiatePasskeyLogin(this, (i) => i);
}

abstract class CopyWith$Mutation$InitiatePasskeyLogin<TRes> {
  factory CopyWith$Mutation$InitiatePasskeyLogin(
    Mutation$InitiatePasskeyLogin instance,
    TRes Function(Mutation$InitiatePasskeyLogin) then,
  ) = _CopyWithImpl$Mutation$InitiatePasskeyLogin;

  factory CopyWith$Mutation$InitiatePasskeyLogin.stub(TRes res) =
      _CopyWithStubImpl$Mutation$InitiatePasskeyLogin;

  TRes call({
    Mutation$InitiatePasskeyLogin$initiatePasskeyLogin? initiatePasskeyLogin,
    String? $__typename,
  });
  CopyWith$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin<TRes>
  get initiatePasskeyLogin;
}

class _CopyWithImpl$Mutation$InitiatePasskeyLogin<TRes>
    implements CopyWith$Mutation$InitiatePasskeyLogin<TRes> {
  _CopyWithImpl$Mutation$InitiatePasskeyLogin(this._instance, this._then);

  final Mutation$InitiatePasskeyLogin _instance;

  final TRes Function(Mutation$InitiatePasskeyLogin) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? initiatePasskeyLogin = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$InitiatePasskeyLogin(
      initiatePasskeyLogin:
          initiatePasskeyLogin == _undefined || initiatePasskeyLogin == null
          ? _instance.initiatePasskeyLogin
          : (initiatePasskeyLogin
                as Mutation$InitiatePasskeyLogin$initiatePasskeyLogin),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin<TRes>
  get initiatePasskeyLogin {
    final local$initiatePasskeyLogin = _instance.initiatePasskeyLogin;
    return CopyWith$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin(
      local$initiatePasskeyLogin,
      (e) => call(initiatePasskeyLogin: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$InitiatePasskeyLogin<TRes>
    implements CopyWith$Mutation$InitiatePasskeyLogin<TRes> {
  _CopyWithStubImpl$Mutation$InitiatePasskeyLogin(this._res);

  TRes _res;

  call({
    Mutation$InitiatePasskeyLogin$initiatePasskeyLogin? initiatePasskeyLogin,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin<TRes>
  get initiatePasskeyLogin =>
      CopyWith$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin.stub(_res);
}

const documentNodeMutationInitiatePasskeyLogin = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InitiatePasskeyLogin'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'email')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'clubSlug')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'initiatePasskeyLogin'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'email'),
                value: VariableNode(name: NameNode(value: 'email')),
              ),
              ArgumentNode(
                name: NameNode(value: 'clubSlug'),
                value: VariableNode(name: NameNode(value: 'clubSlug')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'options'),
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
Mutation$InitiatePasskeyLogin _parserFn$Mutation$InitiatePasskeyLogin(
  Map<String, dynamic> data,
) => Mutation$InitiatePasskeyLogin.fromJson(data);
typedef OnMutationCompleted$Mutation$InitiatePasskeyLogin =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$InitiatePasskeyLogin?,
    );

class Options$Mutation$InitiatePasskeyLogin
    extends graphql.MutationOptions<Mutation$InitiatePasskeyLogin> {
  Options$Mutation$InitiatePasskeyLogin({
    String? operationName,
    required Variables$Mutation$InitiatePasskeyLogin variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InitiatePasskeyLogin? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$InitiatePasskeyLogin? onCompleted,
    graphql.OnMutationUpdate<Mutation$InitiatePasskeyLogin>? update,
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
                     : _parserFn$Mutation$InitiatePasskeyLogin(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationInitiatePasskeyLogin,
         parserFn: _parserFn$Mutation$InitiatePasskeyLogin,
       );

  final OnMutationCompleted$Mutation$InitiatePasskeyLogin?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$InitiatePasskeyLogin
    extends graphql.WatchQueryOptions<Mutation$InitiatePasskeyLogin> {
  WatchOptions$Mutation$InitiatePasskeyLogin({
    String? operationName,
    required Variables$Mutation$InitiatePasskeyLogin variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InitiatePasskeyLogin? typedOptimisticResult,
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
         document: documentNodeMutationInitiatePasskeyLogin,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$InitiatePasskeyLogin,
       );
}

extension ClientExtension$Mutation$InitiatePasskeyLogin
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$InitiatePasskeyLogin>>
  mutate$InitiatePasskeyLogin(
    Options$Mutation$InitiatePasskeyLogin options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$InitiatePasskeyLogin>
  watchMutation$InitiatePasskeyLogin(
    WatchOptions$Mutation$InitiatePasskeyLogin options,
  ) => this.watchMutation(options);
}

class Mutation$InitiatePasskeyLogin$initiatePasskeyLogin {
  Mutation$InitiatePasskeyLogin$initiatePasskeyLogin({
    required this.options,
    required this.userId,
    this.$__typename = 'PasskeyLoginInit',
  });

  factory Mutation$InitiatePasskeyLogin$initiatePasskeyLogin.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$options = json['options'];
    final l$userId = json['userId'];
    final l$$__typename = json['__typename'];
    return Mutation$InitiatePasskeyLogin$initiatePasskeyLogin(
      options: (l$options as String),
      userId: (l$userId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String options;

  final String userId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$options = options;
    _resultData['options'] = l$options;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$options = options;
    final l$userId = userId;
    final l$$__typename = $__typename;
    return Object.hashAll([l$options, l$userId, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$InitiatePasskeyLogin$initiatePasskeyLogin ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$options = options;
    final lOther$options = other.options;
    if (l$options != lOther$options) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
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

extension UtilityExtension$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin
    on Mutation$InitiatePasskeyLogin$initiatePasskeyLogin {
  CopyWith$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin<
    Mutation$InitiatePasskeyLogin$initiatePasskeyLogin
  >
  get copyWith => CopyWith$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin<
  TRes
> {
  factory CopyWith$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin(
    Mutation$InitiatePasskeyLogin$initiatePasskeyLogin instance,
    TRes Function(Mutation$InitiatePasskeyLogin$initiatePasskeyLogin) then,
  ) = _CopyWithImpl$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin;

  factory CopyWith$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin;

  TRes call({String? options, String? userId, String? $__typename});
}

class _CopyWithImpl$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin<TRes>
    implements
        CopyWith$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin<TRes> {
  _CopyWithImpl$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin(
    this._instance,
    this._then,
  );

  final Mutation$InitiatePasskeyLogin$initiatePasskeyLogin _instance;

  final TRes Function(Mutation$InitiatePasskeyLogin$initiatePasskeyLogin) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? options = _undefined,
    Object? userId = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$InitiatePasskeyLogin$initiatePasskeyLogin(
      options: options == _undefined || options == null
          ? _instance.options
          : (options as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin<TRes>
    implements
        CopyWith$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin<TRes> {
  _CopyWithStubImpl$Mutation$InitiatePasskeyLogin$initiatePasskeyLogin(
    this._res,
  );

  TRes _res;

  call({String? options, String? userId, String? $__typename}) => _res;
}
