import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$RejectReciprocalAgreement {
  factory Variables$Mutation$RejectReciprocalAgreement({
    required String id,
    String? reason,
  }) => Variables$Mutation$RejectReciprocalAgreement._({
    r'id': id,
    if (reason != null) r'reason': reason,
  });

  Variables$Mutation$RejectReciprocalAgreement._(this._$data);

  factory Variables$Mutation$RejectReciprocalAgreement.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('reason')) {
      final l$reason = data['reason'];
      result$data['reason'] = (l$reason as String?);
    }
    return Variables$Mutation$RejectReciprocalAgreement._(result$data);
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

  CopyWith$Variables$Mutation$RejectReciprocalAgreement<
    Variables$Mutation$RejectReciprocalAgreement
  >
  get copyWith =>
      CopyWith$Variables$Mutation$RejectReciprocalAgreement(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$RejectReciprocalAgreement ||
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

abstract class CopyWith$Variables$Mutation$RejectReciprocalAgreement<TRes> {
  factory CopyWith$Variables$Mutation$RejectReciprocalAgreement(
    Variables$Mutation$RejectReciprocalAgreement instance,
    TRes Function(Variables$Mutation$RejectReciprocalAgreement) then,
  ) = _CopyWithImpl$Variables$Mutation$RejectReciprocalAgreement;

  factory CopyWith$Variables$Mutation$RejectReciprocalAgreement.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$RejectReciprocalAgreement;

  TRes call({String? id, String? reason});
}

class _CopyWithImpl$Variables$Mutation$RejectReciprocalAgreement<TRes>
    implements CopyWith$Variables$Mutation$RejectReciprocalAgreement<TRes> {
  _CopyWithImpl$Variables$Mutation$RejectReciprocalAgreement(
    this._instance,
    this._then,
  );

  final Variables$Mutation$RejectReciprocalAgreement _instance;

  final TRes Function(Variables$Mutation$RejectReciprocalAgreement) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? reason = _undefined}) => _then(
    Variables$Mutation$RejectReciprocalAgreement._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (reason != _undefined) 'reason': (reason as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$RejectReciprocalAgreement<TRes>
    implements CopyWith$Variables$Mutation$RejectReciprocalAgreement<TRes> {
  _CopyWithStubImpl$Variables$Mutation$RejectReciprocalAgreement(this._res);

  TRes _res;

  call({String? id, String? reason}) => _res;
}

class Mutation$RejectReciprocalAgreement {
  Mutation$RejectReciprocalAgreement({
    required this.rejectReciprocalAgreement,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RejectReciprocalAgreement.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$rejectReciprocalAgreement = json['rejectReciprocalAgreement'];
    final l$$__typename = json['__typename'];
    return Mutation$RejectReciprocalAgreement(
      rejectReciprocalAgreement:
          Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement.fromJson(
            (l$rejectReciprocalAgreement as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement
  rejectReciprocalAgreement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$rejectReciprocalAgreement = rejectReciprocalAgreement;
    _resultData['rejectReciprocalAgreement'] = l$rejectReciprocalAgreement
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$rejectReciprocalAgreement = rejectReciprocalAgreement;
    final l$$__typename = $__typename;
    return Object.hashAll([l$rejectReciprocalAgreement, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RejectReciprocalAgreement ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$rejectReciprocalAgreement = rejectReciprocalAgreement;
    final lOther$rejectReciprocalAgreement = other.rejectReciprocalAgreement;
    if (l$rejectReciprocalAgreement != lOther$rejectReciprocalAgreement) {
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

extension UtilityExtension$Mutation$RejectReciprocalAgreement
    on Mutation$RejectReciprocalAgreement {
  CopyWith$Mutation$RejectReciprocalAgreement<
    Mutation$RejectReciprocalAgreement
  >
  get copyWith => CopyWith$Mutation$RejectReciprocalAgreement(this, (i) => i);
}

abstract class CopyWith$Mutation$RejectReciprocalAgreement<TRes> {
  factory CopyWith$Mutation$RejectReciprocalAgreement(
    Mutation$RejectReciprocalAgreement instance,
    TRes Function(Mutation$RejectReciprocalAgreement) then,
  ) = _CopyWithImpl$Mutation$RejectReciprocalAgreement;

  factory CopyWith$Mutation$RejectReciprocalAgreement.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RejectReciprocalAgreement;

  TRes call({
    Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement?
    rejectReciprocalAgreement,
    String? $__typename,
  });
  CopyWith$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement<TRes>
  get rejectReciprocalAgreement;
}

class _CopyWithImpl$Mutation$RejectReciprocalAgreement<TRes>
    implements CopyWith$Mutation$RejectReciprocalAgreement<TRes> {
  _CopyWithImpl$Mutation$RejectReciprocalAgreement(this._instance, this._then);

  final Mutation$RejectReciprocalAgreement _instance;

  final TRes Function(Mutation$RejectReciprocalAgreement) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? rejectReciprocalAgreement = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$RejectReciprocalAgreement(
      rejectReciprocalAgreement:
          rejectReciprocalAgreement == _undefined ||
              rejectReciprocalAgreement == null
          ? _instance.rejectReciprocalAgreement
          : (rejectReciprocalAgreement
                as Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement<TRes>
  get rejectReciprocalAgreement {
    final local$rejectReciprocalAgreement = _instance.rejectReciprocalAgreement;
    return CopyWith$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement(
      local$rejectReciprocalAgreement,
      (e) => call(rejectReciprocalAgreement: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$RejectReciprocalAgreement<TRes>
    implements CopyWith$Mutation$RejectReciprocalAgreement<TRes> {
  _CopyWithStubImpl$Mutation$RejectReciprocalAgreement(this._res);

  TRes _res;

  call({
    Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement?
    rejectReciprocalAgreement,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement<TRes>
  get rejectReciprocalAgreement =>
      CopyWith$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement.stub(
        _res,
      );
}

const documentNodeMutationRejectReciprocalAgreement = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RejectReciprocalAgreement'),
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
            name: NameNode(value: 'rejectReciprocalAgreement'),
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
Mutation$RejectReciprocalAgreement _parserFn$Mutation$RejectReciprocalAgreement(
  Map<String, dynamic> data,
) => Mutation$RejectReciprocalAgreement.fromJson(data);
typedef OnMutationCompleted$Mutation$RejectReciprocalAgreement =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$RejectReciprocalAgreement?,
    );

class Options$Mutation$RejectReciprocalAgreement
    extends graphql.MutationOptions<Mutation$RejectReciprocalAgreement> {
  Options$Mutation$RejectReciprocalAgreement({
    String? operationName,
    required Variables$Mutation$RejectReciprocalAgreement variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RejectReciprocalAgreement? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RejectReciprocalAgreement? onCompleted,
    graphql.OnMutationUpdate<Mutation$RejectReciprocalAgreement>? update,
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
                     : _parserFn$Mutation$RejectReciprocalAgreement(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationRejectReciprocalAgreement,
         parserFn: _parserFn$Mutation$RejectReciprocalAgreement,
       );

  final OnMutationCompleted$Mutation$RejectReciprocalAgreement?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$RejectReciprocalAgreement
    extends graphql.WatchQueryOptions<Mutation$RejectReciprocalAgreement> {
  WatchOptions$Mutation$RejectReciprocalAgreement({
    String? operationName,
    required Variables$Mutation$RejectReciprocalAgreement variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RejectReciprocalAgreement? typedOptimisticResult,
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
         document: documentNodeMutationRejectReciprocalAgreement,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$RejectReciprocalAgreement,
       );
}

extension ClientExtension$Mutation$RejectReciprocalAgreement
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$RejectReciprocalAgreement>>
  mutate$RejectReciprocalAgreement(
    Options$Mutation$RejectReciprocalAgreement options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$RejectReciprocalAgreement>
  watchMutation$RejectReciprocalAgreement(
    WatchOptions$Mutation$RejectReciprocalAgreement options,
  ) => this.watchMutation(options);
}

class Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement {
  Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement({
    required this.id,
    required this.status,
    this.$__typename = 'ReciprocalAgreement',
  });

  factory Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement(
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
            is! Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement ||
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

extension UtilityExtension$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement
    on Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement {
  CopyWith$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement<
    Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement
  >
  get copyWith =>
      CopyWith$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement<
  TRes
> {
  factory CopyWith$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement(
    Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement instance,
    TRes Function(Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement)
    then,
  ) = _CopyWithImpl$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement;

  factory CopyWith$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement;

  TRes call({String? id, Enum$AgreementStatus? status, String? $__typename});
}

class _CopyWithImpl$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement<
  TRes
>
    implements
        CopyWith$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement<
          TRes
        > {
  _CopyWithImpl$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement(
    this._instance,
    this._then,
  );

  final Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement _instance;

  final TRes Function(
    Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement(
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

class _CopyWithStubImpl$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement<
  TRes
>
    implements
        CopyWith$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement<
          TRes
        > {
  _CopyWithStubImpl$Mutation$RejectReciprocalAgreement$rejectReciprocalAgreement(
    this._res,
  );

  TRes _res;

  call({String? id, Enum$AgreementStatus? status, String? $__typename}) => _res;
}
