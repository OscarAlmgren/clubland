import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$FinalizeProposal {
  factory Variables$Mutation$FinalizeProposal({required String id}) =>
      Variables$Mutation$FinalizeProposal._({r'id': id});

  Variables$Mutation$FinalizeProposal._(this._$data);

  factory Variables$Mutation$FinalizeProposal.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$FinalizeProposal._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$FinalizeProposal<
    Variables$Mutation$FinalizeProposal
  >
  get copyWith => CopyWith$Variables$Mutation$FinalizeProposal(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$FinalizeProposal ||
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

abstract class CopyWith$Variables$Mutation$FinalizeProposal<TRes> {
  factory CopyWith$Variables$Mutation$FinalizeProposal(
    Variables$Mutation$FinalizeProposal instance,
    TRes Function(Variables$Mutation$FinalizeProposal) then,
  ) = _CopyWithImpl$Variables$Mutation$FinalizeProposal;

  factory CopyWith$Variables$Mutation$FinalizeProposal.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$FinalizeProposal;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$FinalizeProposal<TRes>
    implements CopyWith$Variables$Mutation$FinalizeProposal<TRes> {
  _CopyWithImpl$Variables$Mutation$FinalizeProposal(this._instance, this._then);

  final Variables$Mutation$FinalizeProposal _instance;

  final TRes Function(Variables$Mutation$FinalizeProposal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$FinalizeProposal._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$FinalizeProposal<TRes>
    implements CopyWith$Variables$Mutation$FinalizeProposal<TRes> {
  _CopyWithStubImpl$Variables$Mutation$FinalizeProposal(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$FinalizeProposal {
  Mutation$FinalizeProposal({
    required this.finalizeProposal,
    this.$__typename = 'Mutation',
  });

  factory Mutation$FinalizeProposal.fromJson(Map<String, dynamic> json) {
    final l$finalizeProposal = json['finalizeProposal'];
    final l$$__typename = json['__typename'];
    return Mutation$FinalizeProposal(
      finalizeProposal: Mutation$FinalizeProposal$finalizeProposal.fromJson(
        (l$finalizeProposal as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$FinalizeProposal$finalizeProposal finalizeProposal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$finalizeProposal = finalizeProposal;
    _resultData['finalizeProposal'] = l$finalizeProposal.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$finalizeProposal = finalizeProposal;
    final l$$__typename = $__typename;
    return Object.hashAll([l$finalizeProposal, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$FinalizeProposal ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$finalizeProposal = finalizeProposal;
    final lOther$finalizeProposal = other.finalizeProposal;
    if (l$finalizeProposal != lOther$finalizeProposal) {
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

extension UtilityExtension$Mutation$FinalizeProposal
    on Mutation$FinalizeProposal {
  CopyWith$Mutation$FinalizeProposal<Mutation$FinalizeProposal> get copyWith =>
      CopyWith$Mutation$FinalizeProposal(this, (i) => i);
}

abstract class CopyWith$Mutation$FinalizeProposal<TRes> {
  factory CopyWith$Mutation$FinalizeProposal(
    Mutation$FinalizeProposal instance,
    TRes Function(Mutation$FinalizeProposal) then,
  ) = _CopyWithImpl$Mutation$FinalizeProposal;

  factory CopyWith$Mutation$FinalizeProposal.stub(TRes res) =
      _CopyWithStubImpl$Mutation$FinalizeProposal;

  TRes call({
    Mutation$FinalizeProposal$finalizeProposal? finalizeProposal,
    String? $__typename,
  });
  CopyWith$Mutation$FinalizeProposal$finalizeProposal<TRes>
  get finalizeProposal;
}

class _CopyWithImpl$Mutation$FinalizeProposal<TRes>
    implements CopyWith$Mutation$FinalizeProposal<TRes> {
  _CopyWithImpl$Mutation$FinalizeProposal(this._instance, this._then);

  final Mutation$FinalizeProposal _instance;

  final TRes Function(Mutation$FinalizeProposal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? finalizeProposal = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$FinalizeProposal(
      finalizeProposal:
          finalizeProposal == _undefined || finalizeProposal == null
          ? _instance.finalizeProposal
          : (finalizeProposal as Mutation$FinalizeProposal$finalizeProposal),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$FinalizeProposal$finalizeProposal<TRes>
  get finalizeProposal {
    final local$finalizeProposal = _instance.finalizeProposal;
    return CopyWith$Mutation$FinalizeProposal$finalizeProposal(
      local$finalizeProposal,
      (e) => call(finalizeProposal: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$FinalizeProposal<TRes>
    implements CopyWith$Mutation$FinalizeProposal<TRes> {
  _CopyWithStubImpl$Mutation$FinalizeProposal(this._res);

  TRes _res;

  call({
    Mutation$FinalizeProposal$finalizeProposal? finalizeProposal,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$FinalizeProposal$finalizeProposal<TRes>
  get finalizeProposal =>
      CopyWith$Mutation$FinalizeProposal$finalizeProposal.stub(_res);
}

const documentNodeMutationFinalizeProposal = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'FinalizeProposal'),
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
            name: NameNode(value: 'finalizeProposal'),
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
Mutation$FinalizeProposal _parserFn$Mutation$FinalizeProposal(
  Map<String, dynamic> data,
) => Mutation$FinalizeProposal.fromJson(data);
typedef OnMutationCompleted$Mutation$FinalizeProposal =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$FinalizeProposal?);

class Options$Mutation$FinalizeProposal
    extends graphql.MutationOptions<Mutation$FinalizeProposal> {
  Options$Mutation$FinalizeProposal({
    String? operationName,
    required Variables$Mutation$FinalizeProposal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$FinalizeProposal? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$FinalizeProposal? onCompleted,
    graphql.OnMutationUpdate<Mutation$FinalizeProposal>? update,
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
                     : _parserFn$Mutation$FinalizeProposal(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationFinalizeProposal,
         parserFn: _parserFn$Mutation$FinalizeProposal,
       );

  final OnMutationCompleted$Mutation$FinalizeProposal? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$FinalizeProposal
    extends graphql.WatchQueryOptions<Mutation$FinalizeProposal> {
  WatchOptions$Mutation$FinalizeProposal({
    String? operationName,
    required Variables$Mutation$FinalizeProposal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$FinalizeProposal? typedOptimisticResult,
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
         document: documentNodeMutationFinalizeProposal,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$FinalizeProposal,
       );
}

extension ClientExtension$Mutation$FinalizeProposal on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$FinalizeProposal>>
  mutate$FinalizeProposal(Options$Mutation$FinalizeProposal options) async =>
      await this.mutate(options);

  graphql.ObservableQuery<Mutation$FinalizeProposal>
  watchMutation$FinalizeProposal(
    WatchOptions$Mutation$FinalizeProposal options,
  ) => this.watchMutation(options);
}

class Mutation$FinalizeProposal$finalizeProposal {
  Mutation$FinalizeProposal$finalizeProposal({
    required this.id,
    required this.status,
    this.$__typename = 'Proposal',
  });

  factory Mutation$FinalizeProposal$finalizeProposal.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$FinalizeProposal$finalizeProposal(
      id: (l$id as String),
      status: fromJson$Enum$ProposalStatus((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$ProposalStatus status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$ProposalStatus(l$status);
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
    if (other is! Mutation$FinalizeProposal$finalizeProposal ||
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

extension UtilityExtension$Mutation$FinalizeProposal$finalizeProposal
    on Mutation$FinalizeProposal$finalizeProposal {
  CopyWith$Mutation$FinalizeProposal$finalizeProposal<
    Mutation$FinalizeProposal$finalizeProposal
  >
  get copyWith =>
      CopyWith$Mutation$FinalizeProposal$finalizeProposal(this, (i) => i);
}

abstract class CopyWith$Mutation$FinalizeProposal$finalizeProposal<TRes> {
  factory CopyWith$Mutation$FinalizeProposal$finalizeProposal(
    Mutation$FinalizeProposal$finalizeProposal instance,
    TRes Function(Mutation$FinalizeProposal$finalizeProposal) then,
  ) = _CopyWithImpl$Mutation$FinalizeProposal$finalizeProposal;

  factory CopyWith$Mutation$FinalizeProposal$finalizeProposal.stub(TRes res) =
      _CopyWithStubImpl$Mutation$FinalizeProposal$finalizeProposal;

  TRes call({String? id, Enum$ProposalStatus? status, String? $__typename});
}

class _CopyWithImpl$Mutation$FinalizeProposal$finalizeProposal<TRes>
    implements CopyWith$Mutation$FinalizeProposal$finalizeProposal<TRes> {
  _CopyWithImpl$Mutation$FinalizeProposal$finalizeProposal(
    this._instance,
    this._then,
  );

  final Mutation$FinalizeProposal$finalizeProposal _instance;

  final TRes Function(Mutation$FinalizeProposal$finalizeProposal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$FinalizeProposal$finalizeProposal(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$ProposalStatus),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$FinalizeProposal$finalizeProposal<TRes>
    implements CopyWith$Mutation$FinalizeProposal$finalizeProposal<TRes> {
  _CopyWithStubImpl$Mutation$FinalizeProposal$finalizeProposal(this._res);

  TRes _res;

  call({String? id, Enum$ProposalStatus? status, String? $__typename}) => _res;
}
