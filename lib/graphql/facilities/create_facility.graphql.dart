import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CreateFacility {
  factory Variables$Mutation$CreateFacility({
    required Input$CreateFacilityInput input,
  }) => Variables$Mutation$CreateFacility._({r'input': input});

  Variables$Mutation$CreateFacility._(this._$data);

  factory Variables$Mutation$CreateFacility.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$CreateFacilityInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateFacility._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreateFacilityInput get input =>
      (_$data['input'] as Input$CreateFacilityInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateFacility<Variables$Mutation$CreateFacility>
  get copyWith => CopyWith$Variables$Mutation$CreateFacility(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateFacility ||
        runtimeType != other.runtimeType) {
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
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateFacility<TRes> {
  factory CopyWith$Variables$Mutation$CreateFacility(
    Variables$Mutation$CreateFacility instance,
    TRes Function(Variables$Mutation$CreateFacility) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateFacility;

  factory CopyWith$Variables$Mutation$CreateFacility.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateFacility;

  TRes call({Input$CreateFacilityInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateFacility<TRes>
    implements CopyWith$Variables$Mutation$CreateFacility<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateFacility(this._instance, this._then);

  final Variables$Mutation$CreateFacility _instance;

  final TRes Function(Variables$Mutation$CreateFacility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateFacility._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$CreateFacilityInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateFacility<TRes>
    implements CopyWith$Variables$Mutation$CreateFacility<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateFacility(this._res);

  TRes _res;

  call({Input$CreateFacilityInput? input}) => _res;
}

class Mutation$CreateFacility {
  Mutation$CreateFacility({
    required this.createFacility,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateFacility.fromJson(Map<String, dynamic> json) {
    final l$createFacility = json['createFacility'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateFacility(
      createFacility: Mutation$CreateFacility$createFacility.fromJson(
        (l$createFacility as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateFacility$createFacility createFacility;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createFacility = createFacility;
    _resultData['createFacility'] = l$createFacility.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createFacility = createFacility;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createFacility, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateFacility || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createFacility = createFacility;
    final lOther$createFacility = other.createFacility;
    if (l$createFacility != lOther$createFacility) {
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

extension UtilityExtension$Mutation$CreateFacility on Mutation$CreateFacility {
  CopyWith$Mutation$CreateFacility<Mutation$CreateFacility> get copyWith =>
      CopyWith$Mutation$CreateFacility(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateFacility<TRes> {
  factory CopyWith$Mutation$CreateFacility(
    Mutation$CreateFacility instance,
    TRes Function(Mutation$CreateFacility) then,
  ) = _CopyWithImpl$Mutation$CreateFacility;

  factory CopyWith$Mutation$CreateFacility.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateFacility;

  TRes call({
    Mutation$CreateFacility$createFacility? createFacility,
    String? $__typename,
  });
  CopyWith$Mutation$CreateFacility$createFacility<TRes> get createFacility;
}

class _CopyWithImpl$Mutation$CreateFacility<TRes>
    implements CopyWith$Mutation$CreateFacility<TRes> {
  _CopyWithImpl$Mutation$CreateFacility(this._instance, this._then);

  final Mutation$CreateFacility _instance;

  final TRes Function(Mutation$CreateFacility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createFacility = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateFacility(
      createFacility: createFacility == _undefined || createFacility == null
          ? _instance.createFacility
          : (createFacility as Mutation$CreateFacility$createFacility),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateFacility$createFacility<TRes> get createFacility {
    final local$createFacility = _instance.createFacility;
    return CopyWith$Mutation$CreateFacility$createFacility(
      local$createFacility,
      (e) => call(createFacility: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CreateFacility<TRes>
    implements CopyWith$Mutation$CreateFacility<TRes> {
  _CopyWithStubImpl$Mutation$CreateFacility(this._res);

  TRes _res;

  call({
    Mutation$CreateFacility$createFacility? createFacility,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateFacility$createFacility<TRes> get createFacility =>
      CopyWith$Mutation$CreateFacility$createFacility.stub(_res);
}

const documentNodeMutationCreateFacility = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateFacility'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'CreateFacilityInput'),
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
            name: NameNode(value: 'createFacility'),
            alias: null,
            arguments: [
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
                  name: NameNode(value: 'clubId'),
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
                  name: NameNode(value: 'type'),
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
                  name: NameNode(value: 'createdAt'),
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
Mutation$CreateFacility _parserFn$Mutation$CreateFacility(
  Map<String, dynamic> data,
) => Mutation$CreateFacility.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateFacility =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CreateFacility?);

class Options$Mutation$CreateFacility
    extends graphql.MutationOptions<Mutation$CreateFacility> {
  Options$Mutation$CreateFacility({
    String? operationName,
    required Variables$Mutation$CreateFacility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateFacility? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateFacility? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateFacility>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateFacility(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateFacility,
         parserFn: _parserFn$Mutation$CreateFacility,
       );

  final OnMutationCompleted$Mutation$CreateFacility? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateFacility
    extends graphql.WatchQueryOptions<Mutation$CreateFacility> {
  WatchOptions$Mutation$CreateFacility({
    String? operationName,
    required Variables$Mutation$CreateFacility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateFacility? typedOptimisticResult,
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
         document: documentNodeMutationCreateFacility,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateFacility,
       );
}

extension ClientExtension$Mutation$CreateFacility on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateFacility>> mutate$CreateFacility(
    Options$Mutation$CreateFacility options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateFacility> watchMutation$CreateFacility(
    WatchOptions$Mutation$CreateFacility options,
  ) => this.watchMutation(options);
}

class Mutation$CreateFacility$createFacility {
  Mutation$CreateFacility$createFacility({
    required this.id,
    required this.clubId,
    required this.name,
    required this.type,
    this.capacity,
    required this.status,
    required this.createdAt,
    this.$__typename = 'Facility',
  });

  factory Mutation$CreateFacility$createFacility.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$name = json['name'];
    final l$type = json['type'];
    final l$capacity = json['capacity'];
    final l$status = json['status'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateFacility$createFacility(
      id: (l$id as String),
      clubId: (l$clubId as String),
      name: (l$name as String),
      type: fromJson$Enum$FacilityType((l$type as String)),
      capacity: (l$capacity as int?),
      status: fromJson$Enum$FacilityStatus((l$status as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String name;

  final Enum$FacilityType type;

  final int? capacity;

  final Enum$FacilityStatus status;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$type = type;
    _resultData['type'] = toJson$Enum$FacilityType(l$type);
    final l$capacity = capacity;
    _resultData['capacity'] = l$capacity;
    final l$status = status;
    _resultData['status'] = toJson$Enum$FacilityStatus(l$status);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clubId = clubId;
    final l$name = name;
    final l$type = type;
    final l$capacity = capacity;
    final l$status = status;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$name,
      l$type,
      l$capacity,
      l$status,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateFacility$createFacility ||
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
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
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
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

extension UtilityExtension$Mutation$CreateFacility$createFacility
    on Mutation$CreateFacility$createFacility {
  CopyWith$Mutation$CreateFacility$createFacility<
    Mutation$CreateFacility$createFacility
  >
  get copyWith =>
      CopyWith$Mutation$CreateFacility$createFacility(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateFacility$createFacility<TRes> {
  factory CopyWith$Mutation$CreateFacility$createFacility(
    Mutation$CreateFacility$createFacility instance,
    TRes Function(Mutation$CreateFacility$createFacility) then,
  ) = _CopyWithImpl$Mutation$CreateFacility$createFacility;

  factory CopyWith$Mutation$CreateFacility$createFacility.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateFacility$createFacility;

  TRes call({
    String? id,
    String? clubId,
    String? name,
    Enum$FacilityType? type,
    int? capacity,
    Enum$FacilityStatus? status,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateFacility$createFacility<TRes>
    implements CopyWith$Mutation$CreateFacility$createFacility<TRes> {
  _CopyWithImpl$Mutation$CreateFacility$createFacility(
    this._instance,
    this._then,
  );

  final Mutation$CreateFacility$createFacility _instance;

  final TRes Function(Mutation$CreateFacility$createFacility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? name = _undefined,
    Object? type = _undefined,
    Object? capacity = _undefined,
    Object? status = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateFacility$createFacility(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$FacilityType),
      capacity: capacity == _undefined
          ? _instance.capacity
          : (capacity as int?),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$FacilityStatus),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreateFacility$createFacility<TRes>
    implements CopyWith$Mutation$CreateFacility$createFacility<TRes> {
  _CopyWithStubImpl$Mutation$CreateFacility$createFacility(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? name,
    Enum$FacilityType? type,
    int? capacity,
    Enum$FacilityStatus? status,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}
