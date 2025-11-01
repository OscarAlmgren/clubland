import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$SuspendReciprocalAgreement {
  factory Variables$Mutation$SuspendReciprocalAgreement({
    required String id,
    String? reason,
  }) => Variables$Mutation$SuspendReciprocalAgreement._({
    r'id': id,
    if (reason != null) r'reason': reason,
  });

  Variables$Mutation$SuspendReciprocalAgreement._(this._$data);

  factory Variables$Mutation$SuspendReciprocalAgreement.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('reason')) {
      final l$reason = data['reason'];
      result$data['reason'] = (l$reason as String?);
    }
    return Variables$Mutation$SuspendReciprocalAgreement._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get reason => (_$data['reason'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('reason')) {
      final l$reason = reason;
      result$data['reason'] = l$reason;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$SuspendReciprocalAgreement<
    Variables$Mutation$SuspendReciprocalAgreement
  >
  get copyWith =>
      CopyWith$Variables$Mutation$SuspendReciprocalAgreement(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$SuspendReciprocalAgreement ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$reason = reason;
    final lOther$reason = other.reason;
    if (_$data.containsKey('reason') != other._$data.containsKey('reason')) {
      return false;
    }
    if (l$reason != lOther$reason) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$reason = reason;
    return Object.hashAll([
      l$id,
      _$data.containsKey('reason') ? l$reason : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SuspendReciprocalAgreement<TRes> {
  factory CopyWith$Variables$Mutation$SuspendReciprocalAgreement(
    Variables$Mutation$SuspendReciprocalAgreement instance,
    TRes Function(Variables$Mutation$SuspendReciprocalAgreement) then,
  ) = _CopyWithImpl$Variables$Mutation$SuspendReciprocalAgreement;

  factory CopyWith$Variables$Mutation$SuspendReciprocalAgreement.stub(
    TRes res,
  ) = _CopyWithStubImpl$Variables$Mutation$SuspendReciprocalAgreement;

  TRes call({String? id, String? reason});
}

class _CopyWithImpl$Variables$Mutation$SuspendReciprocalAgreement<TRes>
    implements CopyWith$Variables$Mutation$SuspendReciprocalAgreement<TRes> {
  _CopyWithImpl$Variables$Mutation$SuspendReciprocalAgreement(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SuspendReciprocalAgreement _instance;

  final TRes Function(Variables$Mutation$SuspendReciprocalAgreement) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? reason = _undefined}) => _then(
    Variables$Mutation$SuspendReciprocalAgreement._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (reason != _undefined) 'reason': (reason as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$SuspendReciprocalAgreement<TRes>
    implements CopyWith$Variables$Mutation$SuspendReciprocalAgreement<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SuspendReciprocalAgreement(this._res);

  TRes _res;

  call({String? id, String? reason}) => _res;
}

class Mutation$SuspendReciprocalAgreement {
  Mutation$SuspendReciprocalAgreement({
    required this.suspendReciprocalAgreement,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SuspendReciprocalAgreement.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$suspendReciprocalAgreement = json['suspendReciprocalAgreement'];
    final l$$__typename = json['__typename'];
    return Mutation$SuspendReciprocalAgreement(
      suspendReciprocalAgreement:
          Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement.fromJson(
            (l$suspendReciprocalAgreement as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement
  suspendReciprocalAgreement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$suspendReciprocalAgreement = suspendReciprocalAgreement;
    _resultData['suspendReciprocalAgreement'] = l$suspendReciprocalAgreement
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$suspendReciprocalAgreement = suspendReciprocalAgreement;
    final l$$__typename = $__typename;
    return Object.hashAll([l$suspendReciprocalAgreement, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SuspendReciprocalAgreement ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$suspendReciprocalAgreement = suspendReciprocalAgreement;
    final lOther$suspendReciprocalAgreement = other.suspendReciprocalAgreement;
    if (l$suspendReciprocalAgreement != lOther$suspendReciprocalAgreement) {
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

extension UtilityExtension$Mutation$SuspendReciprocalAgreement
    on Mutation$SuspendReciprocalAgreement {
  CopyWith$Mutation$SuspendReciprocalAgreement<
    Mutation$SuspendReciprocalAgreement
  >
  get copyWith => CopyWith$Mutation$SuspendReciprocalAgreement(this, (i) => i);
}

abstract class CopyWith$Mutation$SuspendReciprocalAgreement<TRes> {
  factory CopyWith$Mutation$SuspendReciprocalAgreement(
    Mutation$SuspendReciprocalAgreement instance,
    TRes Function(Mutation$SuspendReciprocalAgreement) then,
  ) = _CopyWithImpl$Mutation$SuspendReciprocalAgreement;

  factory CopyWith$Mutation$SuspendReciprocalAgreement.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SuspendReciprocalAgreement;

  TRes call({
    Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement?
    suspendReciprocalAgreement,
    String? $__typename,
  });
  CopyWith$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement<TRes>
  get suspendReciprocalAgreement;
}

class _CopyWithImpl$Mutation$SuspendReciprocalAgreement<TRes>
    implements CopyWith$Mutation$SuspendReciprocalAgreement<TRes> {
  _CopyWithImpl$Mutation$SuspendReciprocalAgreement(this._instance, this._then);

  final Mutation$SuspendReciprocalAgreement _instance;

  final TRes Function(Mutation$SuspendReciprocalAgreement) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? suspendReciprocalAgreement = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$SuspendReciprocalAgreement(
      suspendReciprocalAgreement:
          suspendReciprocalAgreement == _undefined ||
              suspendReciprocalAgreement == null
          ? _instance.suspendReciprocalAgreement
          : (suspendReciprocalAgreement
                as Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement<TRes>
  get suspendReciprocalAgreement {
    final local$suspendReciprocalAgreement =
        _instance.suspendReciprocalAgreement;
    return CopyWith$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement(
      local$suspendReciprocalAgreement,
      (e) => call(suspendReciprocalAgreement: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$SuspendReciprocalAgreement<TRes>
    implements CopyWith$Mutation$SuspendReciprocalAgreement<TRes> {
  _CopyWithStubImpl$Mutation$SuspendReciprocalAgreement(this._res);

  TRes _res;

  call({
    Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement?
    suspendReciprocalAgreement,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement<TRes>
  get suspendReciprocalAgreement =>
      CopyWith$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement.stub(
        _res,
      );
}

const documentNodeMutationSuspendReciprocalAgreement = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SuspendReciprocalAgreement'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'reason')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'suspendReciprocalAgreement'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'reason'),
                value: VariableNode(name: NameNode(value: 'reason')),
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
                  name: NameNode(value: 'status'),
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
Mutation$SuspendReciprocalAgreement
_parserFn$Mutation$SuspendReciprocalAgreement(Map<String, dynamic> data) =>
    Mutation$SuspendReciprocalAgreement.fromJson(data);
typedef OnMutationCompleted$Mutation$SuspendReciprocalAgreement =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$SuspendReciprocalAgreement?,
    );

class Options$Mutation$SuspendReciprocalAgreement
    extends graphql.MutationOptions<Mutation$SuspendReciprocalAgreement> {
  Options$Mutation$SuspendReciprocalAgreement({
    String? operationName,
    required Variables$Mutation$SuspendReciprocalAgreement variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SuspendReciprocalAgreement? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SuspendReciprocalAgreement? onCompleted,
    graphql.OnMutationUpdate<Mutation$SuspendReciprocalAgreement>? update,
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
                     : _parserFn$Mutation$SuspendReciprocalAgreement(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSuspendReciprocalAgreement,
         parserFn: _parserFn$Mutation$SuspendReciprocalAgreement,
       );

  final OnMutationCompleted$Mutation$SuspendReciprocalAgreement?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$SuspendReciprocalAgreement
    extends graphql.WatchQueryOptions<Mutation$SuspendReciprocalAgreement> {
  WatchOptions$Mutation$SuspendReciprocalAgreement({
    String? operationName,
    required Variables$Mutation$SuspendReciprocalAgreement variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SuspendReciprocalAgreement? typedOptimisticResult,
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
         document: documentNodeMutationSuspendReciprocalAgreement,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$SuspendReciprocalAgreement,
       );
}

extension ClientExtension$Mutation$SuspendReciprocalAgreement
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SuspendReciprocalAgreement>>
  mutate$SuspendReciprocalAgreement(
    Options$Mutation$SuspendReciprocalAgreement options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$SuspendReciprocalAgreement>
  watchMutation$SuspendReciprocalAgreement(
    WatchOptions$Mutation$SuspendReciprocalAgreement options,
  ) => this.watchMutation(options);
}

class Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement {
  Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement({
    required this.id,
    required this.status,
    this.$__typename = 'ReciprocalAgreement',
  });

  factory Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement(
      id: (l$id as String),
      status: fromJson$Enum$AgreementStatus((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$AgreementStatus status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$AgreementStatus(l$status);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$status, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

extension UtilityExtension$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement
    on Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement {
  CopyWith$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement<
    Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement
  >
  get copyWith =>
      CopyWith$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement<
  TRes
> {
  factory CopyWith$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement(
    Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement instance,
    TRes Function(
      Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement,
    )
    then,
  ) = _CopyWithImpl$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement;

  factory CopyWith$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement;

  TRes call({String? id, Enum$AgreementStatus? status, String? $__typename});
}

class _CopyWithImpl$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement<
  TRes
>
    implements
        CopyWith$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement<
          TRes
        > {
  _CopyWithImpl$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement(
    this._instance,
    this._then,
  );

  final Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement
  _instance;

  final TRes Function(
    Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$AgreementStatus),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement<
  TRes
>
    implements
        CopyWith$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement<
          TRes
        > {
  _CopyWithStubImpl$Mutation$SuspendReciprocalAgreement$suspendReciprocalAgreement(
    this._res,
  );

  TRes _res;

  call({String? id, Enum$AgreementStatus? status, String? $__typename}) => _res;
}
