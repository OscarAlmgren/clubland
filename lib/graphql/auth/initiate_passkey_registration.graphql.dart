import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Mutation$InitiatePasskeyRegistration {
  Mutation$InitiatePasskeyRegistration({
    required this.initiatePasskeyRegistration,
    this.$__typename = 'Mutation',
  });

  factory Mutation$InitiatePasskeyRegistration.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$initiatePasskeyRegistration = json['initiatePasskeyRegistration'];
    final l$$__typename = json['__typename'];
    return Mutation$InitiatePasskeyRegistration(
      initiatePasskeyRegistration:
          Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration.fromJson(
            (l$initiatePasskeyRegistration as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration
  initiatePasskeyRegistration;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$initiatePasskeyRegistration = initiatePasskeyRegistration;
    _resultData['initiatePasskeyRegistration'] = l$initiatePasskeyRegistration
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$initiatePasskeyRegistration = initiatePasskeyRegistration;
    final l$$__typename = $__typename;
    return Object.hashAll([l$initiatePasskeyRegistration, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$InitiatePasskeyRegistration ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$initiatePasskeyRegistration = initiatePasskeyRegistration;
    final lOther$initiatePasskeyRegistration =
        other.initiatePasskeyRegistration;
    if (l$initiatePasskeyRegistration != lOther$initiatePasskeyRegistration) {
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

extension UtilityExtension$Mutation$InitiatePasskeyRegistration
    on Mutation$InitiatePasskeyRegistration {
  CopyWith$Mutation$InitiatePasskeyRegistration<
    Mutation$InitiatePasskeyRegistration
  >
  get copyWith => CopyWith$Mutation$InitiatePasskeyRegistration(this, (i) => i);
}

abstract class CopyWith$Mutation$InitiatePasskeyRegistration<TRes> {
  factory CopyWith$Mutation$InitiatePasskeyRegistration(
    Mutation$InitiatePasskeyRegistration instance,
    TRes Function(Mutation$InitiatePasskeyRegistration) then,
  ) = _CopyWithImpl$Mutation$InitiatePasskeyRegistration;

  factory CopyWith$Mutation$InitiatePasskeyRegistration.stub(TRes res) =
      _CopyWithStubImpl$Mutation$InitiatePasskeyRegistration;

  TRes call({
    Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration?
    initiatePasskeyRegistration,
    String? $__typename,
  });
  CopyWith$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration<
    TRes
  >
  get initiatePasskeyRegistration;
}

class _CopyWithImpl$Mutation$InitiatePasskeyRegistration<TRes>
    implements CopyWith$Mutation$InitiatePasskeyRegistration<TRes> {
  _CopyWithImpl$Mutation$InitiatePasskeyRegistration(
    this._instance,
    this._then,
  );

  final Mutation$InitiatePasskeyRegistration _instance;

  final TRes Function(Mutation$InitiatePasskeyRegistration) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? initiatePasskeyRegistration = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$InitiatePasskeyRegistration(
      initiatePasskeyRegistration:
          initiatePasskeyRegistration == _undefined ||
              initiatePasskeyRegistration == null
          ? _instance.initiatePasskeyRegistration
          : (initiatePasskeyRegistration
                as Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration<
    TRes
  >
  get initiatePasskeyRegistration {
    final local$initiatePasskeyRegistration =
        _instance.initiatePasskeyRegistration;
    return CopyWith$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration(
      local$initiatePasskeyRegistration,
      (e) => call(initiatePasskeyRegistration: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$InitiatePasskeyRegistration<TRes>
    implements CopyWith$Mutation$InitiatePasskeyRegistration<TRes> {
  _CopyWithStubImpl$Mutation$InitiatePasskeyRegistration(this._res);

  TRes _res;

  call({
    Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration?
    initiatePasskeyRegistration,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration<
    TRes
  >
  get initiatePasskeyRegistration =>
      CopyWith$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration.stub(
        _res,
      );
}

const documentNodeMutationInitiatePasskeyRegistration = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InitiatePasskeyRegistration'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'initiatePasskeyRegistration'),
            alias: null,
            arguments: [],
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
Mutation$InitiatePasskeyRegistration
_parserFn$Mutation$InitiatePasskeyRegistration(Map<String, dynamic> data) =>
    Mutation$InitiatePasskeyRegistration.fromJson(data);
typedef OnMutationCompleted$Mutation$InitiatePasskeyRegistration =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$InitiatePasskeyRegistration?,
    );

class Options$Mutation$InitiatePasskeyRegistration
    extends graphql.MutationOptions<Mutation$InitiatePasskeyRegistration> {
  Options$Mutation$InitiatePasskeyRegistration({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InitiatePasskeyRegistration? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$InitiatePasskeyRegistration? onCompleted,
    graphql.OnMutationUpdate<Mutation$InitiatePasskeyRegistration>? update,
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
                 data == null
                     ? null
                     : _parserFn$Mutation$InitiatePasskeyRegistration(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationInitiatePasskeyRegistration,
         parserFn: _parserFn$Mutation$InitiatePasskeyRegistration,
       );

  final OnMutationCompleted$Mutation$InitiatePasskeyRegistration?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$InitiatePasskeyRegistration
    extends graphql.WatchQueryOptions<Mutation$InitiatePasskeyRegistration> {
  WatchOptions$Mutation$InitiatePasskeyRegistration({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InitiatePasskeyRegistration? typedOptimisticResult,
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
         document: documentNodeMutationInitiatePasskeyRegistration,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$InitiatePasskeyRegistration,
       );
}

extension ClientExtension$Mutation$InitiatePasskeyRegistration
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$InitiatePasskeyRegistration>>
  mutate$InitiatePasskeyRegistration([
    Options$Mutation$InitiatePasskeyRegistration? options,
  ]) async => await this.mutate(
    options ?? Options$Mutation$InitiatePasskeyRegistration(),
  );

  graphql.ObservableQuery<Mutation$InitiatePasskeyRegistration>
  watchMutation$InitiatePasskeyRegistration([
    WatchOptions$Mutation$InitiatePasskeyRegistration? options,
  ]) => this.watchMutation(
    options ?? WatchOptions$Mutation$InitiatePasskeyRegistration(),
  );
}

class Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration {
  Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration({
    required this.options,
    required this.userId,
    this.$__typename = 'PasskeyRegistrationInit',
  });

  factory Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$options = json['options'];
    final l$userId = json['userId'];
    final l$$__typename = json['__typename'];
    return Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration(
      options: (l$options as dynamic),
      userId: (l$userId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final dynamic options;

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
    if (other
            is! Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration ||
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

extension UtilityExtension$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration
    on Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration {
  CopyWith$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration<
    Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration
  >
  get copyWith =>
      CopyWith$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration<
  TRes
> {
  factory CopyWith$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration(
    Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration instance,
    TRes Function(
      Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration,
    )
    then,
  ) = _CopyWithImpl$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration;

  factory CopyWith$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration;

  TRes call({dynamic? options, String? userId, String? $__typename});
}

class _CopyWithImpl$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration<
  TRes
>
    implements
        CopyWith$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration<
          TRes
        > {
  _CopyWithImpl$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration(
    this._instance,
    this._then,
  );

  final Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration
  _instance;

  final TRes Function(
    Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? options = _undefined,
    Object? userId = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration(
      options: options == _undefined || options == null
          ? _instance.options
          : (options as dynamic),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration<
  TRes
>
    implements
        CopyWith$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration<
          TRes
        > {
  _CopyWithStubImpl$Mutation$InitiatePasskeyRegistration$initiatePasskeyRegistration(
    this._res,
  );

  TRes _res;

  call({dynamic? options, String? userId, String? $__typename}) => _res;
}
