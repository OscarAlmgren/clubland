import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CloseProposalVoting {
  factory Variables$Mutation$CloseProposalVoting({required String id}) =>
      Variables$Mutation$CloseProposalVoting._({r'id': id});

  Variables$Mutation$CloseProposalVoting._(this._$data);

  factory Variables$Mutation$CloseProposalVoting.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$CloseProposalVoting._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$CloseProposalVoting<
    Variables$Mutation$CloseProposalVoting
  >
  get copyWith =>
      CopyWith$Variables$Mutation$CloseProposalVoting(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CloseProposalVoting ||
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

abstract class CopyWith$Variables$Mutation$CloseProposalVoting<TRes> {
  factory CopyWith$Variables$Mutation$CloseProposalVoting(
    Variables$Mutation$CloseProposalVoting instance,
    TRes Function(Variables$Mutation$CloseProposalVoting) then,
  ) = _CopyWithImpl$Variables$Mutation$CloseProposalVoting;

  factory CopyWith$Variables$Mutation$CloseProposalVoting.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CloseProposalVoting;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$CloseProposalVoting<TRes>
    implements CopyWith$Variables$Mutation$CloseProposalVoting<TRes> {
  _CopyWithImpl$Variables$Mutation$CloseProposalVoting(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CloseProposalVoting _instance;

  final TRes Function(Variables$Mutation$CloseProposalVoting) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$CloseProposalVoting._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CloseProposalVoting<TRes>
    implements CopyWith$Variables$Mutation$CloseProposalVoting<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CloseProposalVoting(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$CloseProposalVoting {
  Mutation$CloseProposalVoting({
    required this.closeProposalVoting,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CloseProposalVoting.fromJson(Map<String, dynamic> json) {
    final l$closeProposalVoting = json['closeProposalVoting'];
    final l$$__typename = json['__typename'];
    return Mutation$CloseProposalVoting(
      closeProposalVoting:
          Mutation$CloseProposalVoting$closeProposalVoting.fromJson(
            (l$closeProposalVoting as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CloseProposalVoting$closeProposalVoting closeProposalVoting;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$closeProposalVoting = closeProposalVoting;
    _resultData['closeProposalVoting'] = l$closeProposalVoting.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$closeProposalVoting = closeProposalVoting;
    final l$$__typename = $__typename;
    return Object.hashAll([l$closeProposalVoting, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CloseProposalVoting ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$closeProposalVoting = closeProposalVoting;
    final lOther$closeProposalVoting = other.closeProposalVoting;
    if (l$closeProposalVoting != lOther$closeProposalVoting) {
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

extension UtilityExtension$Mutation$CloseProposalVoting
    on Mutation$CloseProposalVoting {
  CopyWith$Mutation$CloseProposalVoting<Mutation$CloseProposalVoting>
  get copyWith => CopyWith$Mutation$CloseProposalVoting(this, (i) => i);
}

abstract class CopyWith$Mutation$CloseProposalVoting<TRes> {
  factory CopyWith$Mutation$CloseProposalVoting(
    Mutation$CloseProposalVoting instance,
    TRes Function(Mutation$CloseProposalVoting) then,
  ) = _CopyWithImpl$Mutation$CloseProposalVoting;

  factory CopyWith$Mutation$CloseProposalVoting.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CloseProposalVoting;

  TRes call({
    Mutation$CloseProposalVoting$closeProposalVoting? closeProposalVoting,
    String? $__typename,
  });
  CopyWith$Mutation$CloseProposalVoting$closeProposalVoting<TRes>
  get closeProposalVoting;
}

class _CopyWithImpl$Mutation$CloseProposalVoting<TRes>
    implements CopyWith$Mutation$CloseProposalVoting<TRes> {
  _CopyWithImpl$Mutation$CloseProposalVoting(this._instance, this._then);

  final Mutation$CloseProposalVoting _instance;

  final TRes Function(Mutation$CloseProposalVoting) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? closeProposalVoting = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CloseProposalVoting(
      closeProposalVoting:
          closeProposalVoting == _undefined || closeProposalVoting == null
          ? _instance.closeProposalVoting
          : (closeProposalVoting
                as Mutation$CloseProposalVoting$closeProposalVoting),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CloseProposalVoting$closeProposalVoting<TRes>
  get closeProposalVoting {
    final local$closeProposalVoting = _instance.closeProposalVoting;
    return CopyWith$Mutation$CloseProposalVoting$closeProposalVoting(
      local$closeProposalVoting,
      (e) => call(closeProposalVoting: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CloseProposalVoting<TRes>
    implements CopyWith$Mutation$CloseProposalVoting<TRes> {
  _CopyWithStubImpl$Mutation$CloseProposalVoting(this._res);

  TRes _res;

  call({
    Mutation$CloseProposalVoting$closeProposalVoting? closeProposalVoting,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CloseProposalVoting$closeProposalVoting<TRes>
  get closeProposalVoting =>
      CopyWith$Mutation$CloseProposalVoting$closeProposalVoting.stub(_res);
}

const documentNodeMutationCloseProposalVoting = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CloseProposalVoting'),
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
            name: NameNode(value: 'closeProposalVoting'),
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
Mutation$CloseProposalVoting _parserFn$Mutation$CloseProposalVoting(
  Map<String, dynamic> data,
) => Mutation$CloseProposalVoting.fromJson(data);
typedef OnMutationCompleted$Mutation$CloseProposalVoting =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$CloseProposalVoting?,
    );

class Options$Mutation$CloseProposalVoting
    extends graphql.MutationOptions<Mutation$CloseProposalVoting> {
  Options$Mutation$CloseProposalVoting({
    String? operationName,
    required Variables$Mutation$CloseProposalVoting variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CloseProposalVoting? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CloseProposalVoting? onCompleted,
    graphql.OnMutationUpdate<Mutation$CloseProposalVoting>? update,
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
                     : _parserFn$Mutation$CloseProposalVoting(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCloseProposalVoting,
         parserFn: _parserFn$Mutation$CloseProposalVoting,
       );

  final OnMutationCompleted$Mutation$CloseProposalVoting? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CloseProposalVoting
    extends graphql.WatchQueryOptions<Mutation$CloseProposalVoting> {
  WatchOptions$Mutation$CloseProposalVoting({
    String? operationName,
    required Variables$Mutation$CloseProposalVoting variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CloseProposalVoting? typedOptimisticResult,
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
         document: documentNodeMutationCloseProposalVoting,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CloseProposalVoting,
       );
}

extension ClientExtension$Mutation$CloseProposalVoting
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CloseProposalVoting>>
  mutate$CloseProposalVoting(
    Options$Mutation$CloseProposalVoting options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CloseProposalVoting>
  watchMutation$CloseProposalVoting(
    WatchOptions$Mutation$CloseProposalVoting options,
  ) => this.watchMutation(options);
}

class Mutation$CloseProposalVoting$closeProposalVoting {
  Mutation$CloseProposalVoting$closeProposalVoting({
    required this.id,
    required this.status,
    this.$__typename = 'Proposal',
  });

  factory Mutation$CloseProposalVoting$closeProposalVoting.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$CloseProposalVoting$closeProposalVoting(
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
    if (other is! Mutation$CloseProposalVoting$closeProposalVoting ||
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

extension UtilityExtension$Mutation$CloseProposalVoting$closeProposalVoting
    on Mutation$CloseProposalVoting$closeProposalVoting {
  CopyWith$Mutation$CloseProposalVoting$closeProposalVoting<
    Mutation$CloseProposalVoting$closeProposalVoting
  >
  get copyWith =>
      CopyWith$Mutation$CloseProposalVoting$closeProposalVoting(this, (i) => i);
}

abstract class CopyWith$Mutation$CloseProposalVoting$closeProposalVoting<TRes> {
  factory CopyWith$Mutation$CloseProposalVoting$closeProposalVoting(
    Mutation$CloseProposalVoting$closeProposalVoting instance,
    TRes Function(Mutation$CloseProposalVoting$closeProposalVoting) then,
  ) = _CopyWithImpl$Mutation$CloseProposalVoting$closeProposalVoting;

  factory CopyWith$Mutation$CloseProposalVoting$closeProposalVoting.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CloseProposalVoting$closeProposalVoting;

  TRes call({String? id, Enum$ProposalStatus? status, String? $__typename});
}

class _CopyWithImpl$Mutation$CloseProposalVoting$closeProposalVoting<TRes>
    implements CopyWith$Mutation$CloseProposalVoting$closeProposalVoting<TRes> {
  _CopyWithImpl$Mutation$CloseProposalVoting$closeProposalVoting(
    this._instance,
    this._then,
  );

  final Mutation$CloseProposalVoting$closeProposalVoting _instance;

  final TRes Function(Mutation$CloseProposalVoting$closeProposalVoting) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CloseProposalVoting$closeProposalVoting(
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

class _CopyWithStubImpl$Mutation$CloseProposalVoting$closeProposalVoting<TRes>
    implements CopyWith$Mutation$CloseProposalVoting$closeProposalVoting<TRes> {
  _CopyWithStubImpl$Mutation$CloseProposalVoting$closeProposalVoting(this._res);

  TRes _res;

  call({String? id, Enum$ProposalStatus? status, String? $__typename}) => _res;
}
