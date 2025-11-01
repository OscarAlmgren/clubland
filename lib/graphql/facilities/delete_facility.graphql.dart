import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$DeleteFacility {
  factory Variables$Mutation$DeleteFacility({required String id}) =>
      Variables$Mutation$DeleteFacility._({r'id': id});

  Variables$Mutation$DeleteFacility._(this._$data);

  factory Variables$Mutation$DeleteFacility.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$DeleteFacility._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteFacility<Variables$Mutation$DeleteFacility>
  get copyWith => CopyWith$Variables$Mutation$DeleteFacility(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteFacility ||
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

abstract class CopyWith$Variables$Mutation$DeleteFacility<TRes> {
  factory CopyWith$Variables$Mutation$DeleteFacility(
    Variables$Mutation$DeleteFacility instance,
    TRes Function(Variables$Mutation$DeleteFacility) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteFacility;

  factory CopyWith$Variables$Mutation$DeleteFacility.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteFacility;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$DeleteFacility<TRes>
    implements CopyWith$Variables$Mutation$DeleteFacility<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteFacility(this._instance, this._then);

  final Variables$Mutation$DeleteFacility _instance;

  final TRes Function(Variables$Mutation$DeleteFacility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$DeleteFacility._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeleteFacility<TRes>
    implements CopyWith$Variables$Mutation$DeleteFacility<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteFacility(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$DeleteFacility {
  Mutation$DeleteFacility({
    required this.deleteFacility,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteFacility.fromJson(Map<String, dynamic> json) {
    final l$deleteFacility = json['deleteFacility'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteFacility(
      deleteFacility: (l$deleteFacility as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool deleteFacility;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFacility = deleteFacility;
    _resultData['deleteFacility'] = l$deleteFacility;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFacility = deleteFacility;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFacility, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteFacility || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFacility = deleteFacility;
    final lOther$deleteFacility = other.deleteFacility;
    if (l$deleteFacility != lOther$deleteFacility) {
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

extension UtilityExtension$Mutation$DeleteFacility on Mutation$DeleteFacility {
  CopyWith$Mutation$DeleteFacility<Mutation$DeleteFacility> get copyWith =>
      CopyWith$Mutation$DeleteFacility(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteFacility<TRes> {
  factory CopyWith$Mutation$DeleteFacility(
    Mutation$DeleteFacility instance,
    TRes Function(Mutation$DeleteFacility) then,
  ) = _CopyWithImpl$Mutation$DeleteFacility;

  factory CopyWith$Mutation$DeleteFacility.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteFacility;

  TRes call({bool? deleteFacility, String? $__typename});
}

class _CopyWithImpl$Mutation$DeleteFacility<TRes>
    implements CopyWith$Mutation$DeleteFacility<TRes> {
  _CopyWithImpl$Mutation$DeleteFacility(this._instance, this._then);

  final Mutation$DeleteFacility _instance;

  final TRes Function(Mutation$DeleteFacility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteFacility = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteFacility(
      deleteFacility: deleteFacility == _undefined || deleteFacility == null
          ? _instance.deleteFacility
          : (deleteFacility as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DeleteFacility<TRes>
    implements CopyWith$Mutation$DeleteFacility<TRes> {
  _CopyWithStubImpl$Mutation$DeleteFacility(this._res);

  TRes _res;

  call({bool? deleteFacility, String? $__typename}) => _res;
}

const documentNodeMutationDeleteFacility = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteFacility'),
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
            name: NameNode(value: 'deleteFacility'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
            ],
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
  ],
);
Mutation$DeleteFacility _parserFn$Mutation$DeleteFacility(
  Map<String, dynamic> data,
) => Mutation$DeleteFacility.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteFacility =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$DeleteFacility?);

class Options$Mutation$DeleteFacility
    extends graphql.MutationOptions<Mutation$DeleteFacility> {
  Options$Mutation$DeleteFacility({
    String? operationName,
    required Variables$Mutation$DeleteFacility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteFacility? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteFacility? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteFacility>? update,
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
                 data == null ? null : _parserFn$Mutation$DeleteFacility(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteFacility,
         parserFn: _parserFn$Mutation$DeleteFacility,
       );

  final OnMutationCompleted$Mutation$DeleteFacility? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$DeleteFacility
    extends graphql.WatchQueryOptions<Mutation$DeleteFacility> {
  WatchOptions$Mutation$DeleteFacility({
    String? operationName,
    required Variables$Mutation$DeleteFacility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteFacility? typedOptimisticResult,
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
         document: documentNodeMutationDeleteFacility,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$DeleteFacility,
       );
}

extension ClientExtension$Mutation$DeleteFacility on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteFacility>> mutate$DeleteFacility(
    Options$Mutation$DeleteFacility options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteFacility> watchMutation$DeleteFacility(
    WatchOptions$Mutation$DeleteFacility options,
  ) => this.watchMutation(options);
}
