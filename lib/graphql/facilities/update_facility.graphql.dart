import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$UpdateFacility {
  factory Variables$Mutation$UpdateFacility({
    required String id,
    required Input$UpdateFacilityInput input,
  }) => Variables$Mutation$UpdateFacility._({r'id': id, r'input': input});

  Variables$Mutation$UpdateFacility._(this._$data);

  factory Variables$Mutation$UpdateFacility.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$input = data['input'];
    result$data['input'] = Input$UpdateFacilityInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateFacility._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Input$UpdateFacilityInput get input =>
      (_$data['input'] as Input$UpdateFacilityInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateFacility<Variables$Mutation$UpdateFacility>
  get copyWith => CopyWith$Variables$Mutation$UpdateFacility(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateFacility ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$input = input;
    return Object.hashAll([l$id, l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateFacility<TRes> {
  factory CopyWith$Variables$Mutation$UpdateFacility(
    Variables$Mutation$UpdateFacility instance,
    TRes Function(Variables$Mutation$UpdateFacility) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateFacility;

  factory CopyWith$Variables$Mutation$UpdateFacility.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateFacility;

  TRes call({String? id, Input$UpdateFacilityInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateFacility<TRes>
    implements CopyWith$Variables$Mutation$UpdateFacility<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateFacility(this._instance, this._then);

  final Variables$Mutation$UpdateFacility _instance;

  final TRes Function(Variables$Mutation$UpdateFacility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateFacility._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (input != _undefined && input != null)
        'input': (input as Input$UpdateFacilityInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateFacility<TRes>
    implements CopyWith$Variables$Mutation$UpdateFacility<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateFacility(this._res);

  TRes _res;

  call({String? id, Input$UpdateFacilityInput? input}) => _res;
}

class Mutation$UpdateFacility {
  Mutation$UpdateFacility({
    required this.updateFacility,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateFacility.fromJson(Map<String, dynamic> json) {
    final l$updateFacility = json['updateFacility'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateFacility(
      updateFacility: Mutation$UpdateFacility$updateFacility.fromJson(
        (l$updateFacility as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateFacility$updateFacility updateFacility;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateFacility = updateFacility;
    _resultData['updateFacility'] = l$updateFacility.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateFacility = updateFacility;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateFacility, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateFacility || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateFacility = updateFacility;
    final lOther$updateFacility = other.updateFacility;
    if (l$updateFacility != lOther$updateFacility) {
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

extension UtilityExtension$Mutation$UpdateFacility on Mutation$UpdateFacility {
  CopyWith$Mutation$UpdateFacility<Mutation$UpdateFacility> get copyWith =>
      CopyWith$Mutation$UpdateFacility(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateFacility<TRes> {
  factory CopyWith$Mutation$UpdateFacility(
    Mutation$UpdateFacility instance,
    TRes Function(Mutation$UpdateFacility) then,
  ) = _CopyWithImpl$Mutation$UpdateFacility;

  factory CopyWith$Mutation$UpdateFacility.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateFacility;

  TRes call({
    Mutation$UpdateFacility$updateFacility? updateFacility,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateFacility$updateFacility<TRes> get updateFacility;
}

class _CopyWithImpl$Mutation$UpdateFacility<TRes>
    implements CopyWith$Mutation$UpdateFacility<TRes> {
  _CopyWithImpl$Mutation$UpdateFacility(this._instance, this._then);

  final Mutation$UpdateFacility _instance;

  final TRes Function(Mutation$UpdateFacility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateFacility = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateFacility(
      updateFacility: updateFacility == _undefined || updateFacility == null
          ? _instance.updateFacility
          : (updateFacility as Mutation$UpdateFacility$updateFacility),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateFacility$updateFacility<TRes> get updateFacility {
    final local$updateFacility = _instance.updateFacility;
    return CopyWith$Mutation$UpdateFacility$updateFacility(
      local$updateFacility,
      (e) => call(updateFacility: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$UpdateFacility<TRes>
    implements CopyWith$Mutation$UpdateFacility<TRes> {
  _CopyWithStubImpl$Mutation$UpdateFacility(this._res);

  TRes _res;

  call({
    Mutation$UpdateFacility$updateFacility? updateFacility,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateFacility$updateFacility<TRes> get updateFacility =>
      CopyWith$Mutation$UpdateFacility$updateFacility.stub(_res);
}

const documentNodeMutationUpdateFacility = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateFacility'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'UpdateFacilityInput'),
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
            name: NameNode(value: 'updateFacility'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
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
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'description'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'capacity'),
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
Mutation$UpdateFacility _parserFn$Mutation$UpdateFacility(
  Map<String, dynamic> data,
) => Mutation$UpdateFacility.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateFacility =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdateFacility?);

class Options$Mutation$UpdateFacility
    extends graphql.MutationOptions<Mutation$UpdateFacility> {
  Options$Mutation$UpdateFacility({
    String? operationName,
    required Variables$Mutation$UpdateFacility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateFacility? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateFacility? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateFacility>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateFacility(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateFacility,
         parserFn: _parserFn$Mutation$UpdateFacility,
       );

  final OnMutationCompleted$Mutation$UpdateFacility? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateFacility
    extends graphql.WatchQueryOptions<Mutation$UpdateFacility> {
  WatchOptions$Mutation$UpdateFacility({
    String? operationName,
    required Variables$Mutation$UpdateFacility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateFacility? typedOptimisticResult,
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
         document: documentNodeMutationUpdateFacility,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateFacility,
       );
}

extension ClientExtension$Mutation$UpdateFacility on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateFacility>> mutate$UpdateFacility(
    Options$Mutation$UpdateFacility options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateFacility> watchMutation$UpdateFacility(
    WatchOptions$Mutation$UpdateFacility options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateFacility$updateFacility {
  Mutation$UpdateFacility$updateFacility({
    required this.id,
    required this.name,
    this.description,
    required this.capacity,
    required this.status,
    required this.updatedAt,
    this.$__typename = 'Facility',
  });

  factory Mutation$UpdateFacility$updateFacility.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$capacity = json['capacity'];
    final l$status = json['status'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateFacility$updateFacility(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String?),
      capacity: (l$capacity as int),
      status: fromJson$Enum$FacilityStatus((l$status as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? description;

  final int capacity;

  final Enum$FacilityStatus status;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$capacity = capacity;
    _resultData['capacity'] = l$capacity;
    final l$status = status;
    _resultData['status'] = toJson$Enum$FacilityStatus(l$status);
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$capacity = capacity;
    final l$status = status;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$capacity,
      l$status,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateFacility$updateFacility ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$capacity = capacity;
    final lOther$capacity = other.capacity;
    if (l$capacity != lOther$capacity) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

extension UtilityExtension$Mutation$UpdateFacility$updateFacility
    on Mutation$UpdateFacility$updateFacility {
  CopyWith$Mutation$UpdateFacility$updateFacility<
    Mutation$UpdateFacility$updateFacility
  >
  get copyWith =>
      CopyWith$Mutation$UpdateFacility$updateFacility(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateFacility$updateFacility<TRes> {
  factory CopyWith$Mutation$UpdateFacility$updateFacility(
    Mutation$UpdateFacility$updateFacility instance,
    TRes Function(Mutation$UpdateFacility$updateFacility) then,
  ) = _CopyWithImpl$Mutation$UpdateFacility$updateFacility;

  factory CopyWith$Mutation$UpdateFacility$updateFacility.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateFacility$updateFacility;

  TRes call({
    String? id,
    String? name,
    String? description,
    int? capacity,
    Enum$FacilityStatus? status,
    DateTime? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateFacility$updateFacility<TRes>
    implements CopyWith$Mutation$UpdateFacility$updateFacility<TRes> {
  _CopyWithImpl$Mutation$UpdateFacility$updateFacility(
    this._instance,
    this._then,
  );

  final Mutation$UpdateFacility$updateFacility _instance;

  final TRes Function(Mutation$UpdateFacility$updateFacility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? capacity = _undefined,
    Object? status = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateFacility$updateFacility(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      capacity: capacity == _undefined || capacity == null
          ? _instance.capacity
          : (capacity as int),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$FacilityStatus),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$UpdateFacility$updateFacility<TRes>
    implements CopyWith$Mutation$UpdateFacility$updateFacility<TRes> {
  _CopyWithStubImpl$Mutation$UpdateFacility$updateFacility(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    int? capacity,
    Enum$FacilityStatus? status,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;
}
