import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$ApproveReciprocalAgreement {
  factory Variables$Mutation$ApproveReciprocalAgreement({required String id}) =>
      Variables$Mutation$ApproveReciprocalAgreement._({r'id': id});

  Variables$Mutation$ApproveReciprocalAgreement._(this._$data);

  factory Variables$Mutation$ApproveReciprocalAgreement.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$ApproveReciprocalAgreement._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$ApproveReciprocalAgreement<
    Variables$Mutation$ApproveReciprocalAgreement
  >
  get copyWith =>
      CopyWith$Variables$Mutation$ApproveReciprocalAgreement(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ApproveReciprocalAgreement ||
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

abstract class CopyWith$Variables$Mutation$ApproveReciprocalAgreement<TRes> {
  factory CopyWith$Variables$Mutation$ApproveReciprocalAgreement(
    Variables$Mutation$ApproveReciprocalAgreement instance,
    TRes Function(Variables$Mutation$ApproveReciprocalAgreement) then,
  ) = _CopyWithImpl$Variables$Mutation$ApproveReciprocalAgreement;

  factory CopyWith$Variables$Mutation$ApproveReciprocalAgreement.stub(
    TRes res,
  ) = _CopyWithStubImpl$Variables$Mutation$ApproveReciprocalAgreement;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$ApproveReciprocalAgreement<TRes>
    implements CopyWith$Variables$Mutation$ApproveReciprocalAgreement<TRes> {
  _CopyWithImpl$Variables$Mutation$ApproveReciprocalAgreement(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ApproveReciprocalAgreement _instance;

  final TRes Function(Variables$Mutation$ApproveReciprocalAgreement) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$ApproveReciprocalAgreement._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$ApproveReciprocalAgreement<TRes>
    implements CopyWith$Variables$Mutation$ApproveReciprocalAgreement<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ApproveReciprocalAgreement(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$ApproveReciprocalAgreement {
  Mutation$ApproveReciprocalAgreement({
    required this.approveReciprocalAgreement,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ApproveReciprocalAgreement.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$approveReciprocalAgreement = json['approveReciprocalAgreement'];
    final l$$__typename = json['__typename'];
    return Mutation$ApproveReciprocalAgreement(
      approveReciprocalAgreement:
          Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement.fromJson(
            (l$approveReciprocalAgreement as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement
  approveReciprocalAgreement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$approveReciprocalAgreement = approveReciprocalAgreement;
    _resultData['approveReciprocalAgreement'] = l$approveReciprocalAgreement
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$approveReciprocalAgreement = approveReciprocalAgreement;
    final l$$__typename = $__typename;
    return Object.hashAll([l$approveReciprocalAgreement, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ApproveReciprocalAgreement ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$approveReciprocalAgreement = approveReciprocalAgreement;
    final lOther$approveReciprocalAgreement = other.approveReciprocalAgreement;
    if (l$approveReciprocalAgreement != lOther$approveReciprocalAgreement) {
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

extension UtilityExtension$Mutation$ApproveReciprocalAgreement
    on Mutation$ApproveReciprocalAgreement {
  CopyWith$Mutation$ApproveReciprocalAgreement<
    Mutation$ApproveReciprocalAgreement
  >
  get copyWith => CopyWith$Mutation$ApproveReciprocalAgreement(this, (i) => i);
}

abstract class CopyWith$Mutation$ApproveReciprocalAgreement<TRes> {
  factory CopyWith$Mutation$ApproveReciprocalAgreement(
    Mutation$ApproveReciprocalAgreement instance,
    TRes Function(Mutation$ApproveReciprocalAgreement) then,
  ) = _CopyWithImpl$Mutation$ApproveReciprocalAgreement;

  factory CopyWith$Mutation$ApproveReciprocalAgreement.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ApproveReciprocalAgreement;

  TRes call({
    Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement?
    approveReciprocalAgreement,
    String? $__typename,
  });
  CopyWith$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement<TRes>
  get approveReciprocalAgreement;
}

class _CopyWithImpl$Mutation$ApproveReciprocalAgreement<TRes>
    implements CopyWith$Mutation$ApproveReciprocalAgreement<TRes> {
  _CopyWithImpl$Mutation$ApproveReciprocalAgreement(this._instance, this._then);

  final Mutation$ApproveReciprocalAgreement _instance;

  final TRes Function(Mutation$ApproveReciprocalAgreement) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? approveReciprocalAgreement = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ApproveReciprocalAgreement(
      approveReciprocalAgreement:
          approveReciprocalAgreement == _undefined ||
              approveReciprocalAgreement == null
          ? _instance.approveReciprocalAgreement
          : (approveReciprocalAgreement
                as Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement<TRes>
  get approveReciprocalAgreement {
    final local$approveReciprocalAgreement =
        _instance.approveReciprocalAgreement;
    return CopyWith$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement(
      local$approveReciprocalAgreement,
      (e) => call(approveReciprocalAgreement: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$ApproveReciprocalAgreement<TRes>
    implements CopyWith$Mutation$ApproveReciprocalAgreement<TRes> {
  _CopyWithStubImpl$Mutation$ApproveReciprocalAgreement(this._res);

  TRes _res;

  call({
    Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement?
    approveReciprocalAgreement,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement<TRes>
  get approveReciprocalAgreement =>
      CopyWith$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement.stub(
        _res,
      );
}

const documentNodeMutationApproveReciprocalAgreement = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ApproveReciprocalAgreement'),
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
            name: NameNode(value: 'approveReciprocalAgreement'),
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
Mutation$ApproveReciprocalAgreement
_parserFn$Mutation$ApproveReciprocalAgreement(Map<String, dynamic> data) =>
    Mutation$ApproveReciprocalAgreement.fromJson(data);
typedef OnMutationCompleted$Mutation$ApproveReciprocalAgreement =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$ApproveReciprocalAgreement?,
    );

class Options$Mutation$ApproveReciprocalAgreement
    extends graphql.MutationOptions<Mutation$ApproveReciprocalAgreement> {
  Options$Mutation$ApproveReciprocalAgreement({
    String? operationName,
    required Variables$Mutation$ApproveReciprocalAgreement variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ApproveReciprocalAgreement? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ApproveReciprocalAgreement? onCompleted,
    graphql.OnMutationUpdate<Mutation$ApproveReciprocalAgreement>? update,
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
                     : _parserFn$Mutation$ApproveReciprocalAgreement(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationApproveReciprocalAgreement,
         parserFn: _parserFn$Mutation$ApproveReciprocalAgreement,
       );

  final OnMutationCompleted$Mutation$ApproveReciprocalAgreement?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$ApproveReciprocalAgreement
    extends graphql.WatchQueryOptions<Mutation$ApproveReciprocalAgreement> {
  WatchOptions$Mutation$ApproveReciprocalAgreement({
    String? operationName,
    required Variables$Mutation$ApproveReciprocalAgreement variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ApproveReciprocalAgreement? typedOptimisticResult,
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
         document: documentNodeMutationApproveReciprocalAgreement,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$ApproveReciprocalAgreement,
       );
}

extension ClientExtension$Mutation$ApproveReciprocalAgreement
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ApproveReciprocalAgreement>>
  mutate$ApproveReciprocalAgreement(
    Options$Mutation$ApproveReciprocalAgreement options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$ApproveReciprocalAgreement>
  watchMutation$ApproveReciprocalAgreement(
    WatchOptions$Mutation$ApproveReciprocalAgreement options,
  ) => this.watchMutation(options);
}

class Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement {
  Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement({
    required this.id,
    required this.status,
    this.$__typename = 'ReciprocalAgreement',
  });

  factory Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement(
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
            is! Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement ||
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

extension UtilityExtension$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement
    on Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement {
  CopyWith$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement<
    Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement
  >
  get copyWith =>
      CopyWith$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement<
  TRes
> {
  factory CopyWith$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement(
    Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement instance,
    TRes Function(
      Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement,
    )
    then,
  ) = _CopyWithImpl$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement;

  factory CopyWith$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement;

  TRes call({String? id, Enum$AgreementStatus? status, String? $__typename});
}

class _CopyWithImpl$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement<
  TRes
>
    implements
        CopyWith$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement<
          TRes
        > {
  _CopyWithImpl$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement(
    this._instance,
    this._then,
  );

  final Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement
  _instance;

  final TRes Function(
    Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement(
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

class _CopyWithStubImpl$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement<
  TRes
>
    implements
        CopyWith$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement<
          TRes
        > {
  _CopyWithStubImpl$Mutation$ApproveReciprocalAgreement$approveReciprocalAgreement(
    this._res,
  );

  TRes _res;

  call({String? id, Enum$AgreementStatus? status, String? $__typename}) => _res;
}
