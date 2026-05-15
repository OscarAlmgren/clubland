import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$UpdateBooking {
  factory Variables$Mutation$UpdateBooking({
    required String id,
    required Input$UpdateBookingInput input,
  }) => Variables$Mutation$UpdateBooking._({r'id': id, r'input': input});

  Variables$Mutation$UpdateBooking._(this._$data);

  factory Variables$Mutation$UpdateBooking.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$input = data['input'];
    result$data['input'] = Input$UpdateBookingInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateBooking._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Input$UpdateBookingInput get input =>
      (_$data['input'] as Input$UpdateBookingInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateBooking<Variables$Mutation$UpdateBooking>
  get copyWith => CopyWith$Variables$Mutation$UpdateBooking(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateBooking ||
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

abstract class CopyWith$Variables$Mutation$UpdateBooking<TRes> {
  factory CopyWith$Variables$Mutation$UpdateBooking(
    Variables$Mutation$UpdateBooking instance,
    TRes Function(Variables$Mutation$UpdateBooking) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateBooking;

  factory CopyWith$Variables$Mutation$UpdateBooking.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateBooking;

  TRes call({String? id, Input$UpdateBookingInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateBooking<TRes>
    implements CopyWith$Variables$Mutation$UpdateBooking<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateBooking(this._instance, this._then);

  final Variables$Mutation$UpdateBooking _instance;

  final TRes Function(Variables$Mutation$UpdateBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateBooking._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (input != _undefined && input != null)
        'input': (input as Input$UpdateBookingInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateBooking<TRes>
    implements CopyWith$Variables$Mutation$UpdateBooking<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateBooking(this._res);

  TRes _res;

  call({String? id, Input$UpdateBookingInput? input}) => _res;
}

class Mutation$UpdateBooking {
  Mutation$UpdateBooking({
    required this.updateFacilityBooking,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateBooking.fromJson(Map<String, dynamic> json) {
    final l$updateFacilityBooking = json['updateFacilityBooking'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateBooking(
      updateFacilityBooking:
          Mutation$UpdateBooking$updateFacilityBooking.fromJson(
            (l$updateFacilityBooking as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateBooking$updateFacilityBooking updateFacilityBooking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateFacilityBooking = updateFacilityBooking;
    _resultData['updateFacilityBooking'] = l$updateFacilityBooking.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateFacilityBooking = updateFacilityBooking;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateFacilityBooking, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateBooking || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateFacilityBooking = updateFacilityBooking;
    final lOther$updateFacilityBooking = other.updateFacilityBooking;
    if (l$updateFacilityBooking != lOther$updateFacilityBooking) {
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

extension UtilityExtension$Mutation$UpdateBooking on Mutation$UpdateBooking {
  CopyWith$Mutation$UpdateBooking<Mutation$UpdateBooking> get copyWith =>
      CopyWith$Mutation$UpdateBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateBooking<TRes> {
  factory CopyWith$Mutation$UpdateBooking(
    Mutation$UpdateBooking instance,
    TRes Function(Mutation$UpdateBooking) then,
  ) = _CopyWithImpl$Mutation$UpdateBooking;

  factory CopyWith$Mutation$UpdateBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateBooking;

  TRes call({
    Mutation$UpdateBooking$updateFacilityBooking? updateFacilityBooking,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateBooking$updateFacilityBooking<TRes>
  get updateFacilityBooking;
}

class _CopyWithImpl$Mutation$UpdateBooking<TRes>
    implements CopyWith$Mutation$UpdateBooking<TRes> {
  _CopyWithImpl$Mutation$UpdateBooking(this._instance, this._then);

  final Mutation$UpdateBooking _instance;

  final TRes Function(Mutation$UpdateBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateFacilityBooking = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateBooking(
      updateFacilityBooking:
          updateFacilityBooking == _undefined || updateFacilityBooking == null
          ? _instance.updateFacilityBooking
          : (updateFacilityBooking
                as Mutation$UpdateBooking$updateFacilityBooking),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateBooking$updateFacilityBooking<TRes>
  get updateFacilityBooking {
    final local$updateFacilityBooking = _instance.updateFacilityBooking;
    return CopyWith$Mutation$UpdateBooking$updateFacilityBooking(
      local$updateFacilityBooking,
      (e) => call(updateFacilityBooking: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$UpdateBooking<TRes>
    implements CopyWith$Mutation$UpdateBooking<TRes> {
  _CopyWithStubImpl$Mutation$UpdateBooking(this._res);

  TRes _res;

  call({
    Mutation$UpdateBooking$updateFacilityBooking? updateFacilityBooking,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateBooking$updateFacilityBooking<TRes>
  get updateFacilityBooking =>
      CopyWith$Mutation$UpdateBooking$updateFacilityBooking.stub(_res);
}

const documentNodeMutationUpdateBooking = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateBooking'),
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
            name: NameNode(value: 'UpdateBookingInput'),
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
            name: NameNode(value: 'updateFacilityBooking'),
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
                  name: NameNode(value: 'startTime'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'endTime'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'purpose'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'guestCount'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'specialRequests'),
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
Mutation$UpdateBooking _parserFn$Mutation$UpdateBooking(
  Map<String, dynamic> data,
) => Mutation$UpdateBooking.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateBooking =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdateBooking?);

class Options$Mutation$UpdateBooking
    extends graphql.MutationOptions<Mutation$UpdateBooking> {
  Options$Mutation$UpdateBooking({
    String? operationName,
    required Variables$Mutation$UpdateBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateBooking? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateBooking? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateBooking>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateBooking(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateBooking,
         parserFn: _parserFn$Mutation$UpdateBooking,
       );

  final OnMutationCompleted$Mutation$UpdateBooking? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateBooking
    extends graphql.WatchQueryOptions<Mutation$UpdateBooking> {
  WatchOptions$Mutation$UpdateBooking({
    String? operationName,
    required Variables$Mutation$UpdateBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateBooking? typedOptimisticResult,
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
         document: documentNodeMutationUpdateBooking,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateBooking,
       );
}

extension ClientExtension$Mutation$UpdateBooking on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateBooking>> mutate$UpdateBooking(
    Options$Mutation$UpdateBooking options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateBooking> watchMutation$UpdateBooking(
    WatchOptions$Mutation$UpdateBooking options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateBooking$updateFacilityBooking {
  Mutation$UpdateBooking$updateFacilityBooking({
    required this.id,
    required this.startTime,
    required this.endTime,
    this.purpose,
    this.guestCount,
    this.specialRequests,
    required this.updatedAt,
    this.$__typename = 'FacilityBooking',
  });

  factory Mutation$UpdateBooking$updateFacilityBooking.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$purpose = json['purpose'];
    final l$guestCount = json['guestCount'];
    final l$specialRequests = json['specialRequests'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateBooking$updateFacilityBooking(
      id: (l$id as String),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      purpose: (l$purpose as String?),
      guestCount: (l$guestCount as int?),
      specialRequests: (l$specialRequests as String?),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime startTime;

  final DateTime endTime;

  final String? purpose;

  final int? guestCount;

  final String? specialRequests;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime.toIso8601String();
    final l$purpose = purpose;
    _resultData['purpose'] = l$purpose;
    final l$guestCount = guestCount;
    _resultData['guestCount'] = l$guestCount;
    final l$specialRequests = specialRequests;
    _resultData['specialRequests'] = l$specialRequests;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$purpose = purpose;
    final l$guestCount = guestCount;
    final l$specialRequests = specialRequests;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$startTime,
      l$endTime,
      l$purpose,
      l$guestCount,
      l$specialRequests,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateBooking$updateFacilityBooking ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$startTime = startTime;
    final lOther$startTime = other.startTime;
    if (l$startTime != lOther$startTime) {
      return false;
    }
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (l$endTime != lOther$endTime) {
      return false;
    }
    final l$purpose = purpose;
    final lOther$purpose = other.purpose;
    if (l$purpose != lOther$purpose) {
      return false;
    }
    final l$guestCount = guestCount;
    final lOther$guestCount = other.guestCount;
    if (l$guestCount != lOther$guestCount) {
      return false;
    }
    final l$specialRequests = specialRequests;
    final lOther$specialRequests = other.specialRequests;
    if (l$specialRequests != lOther$specialRequests) {
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

extension UtilityExtension$Mutation$UpdateBooking$updateFacilityBooking
    on Mutation$UpdateBooking$updateFacilityBooking {
  CopyWith$Mutation$UpdateBooking$updateFacilityBooking<
    Mutation$UpdateBooking$updateFacilityBooking
  >
  get copyWith =>
      CopyWith$Mutation$UpdateBooking$updateFacilityBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateBooking$updateFacilityBooking<TRes> {
  factory CopyWith$Mutation$UpdateBooking$updateFacilityBooking(
    Mutation$UpdateBooking$updateFacilityBooking instance,
    TRes Function(Mutation$UpdateBooking$updateFacilityBooking) then,
  ) = _CopyWithImpl$Mutation$UpdateBooking$updateFacilityBooking;

  factory CopyWith$Mutation$UpdateBooking$updateFacilityBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateBooking$updateFacilityBooking;

  TRes call({
    String? id,
    DateTime? startTime,
    DateTime? endTime,
    String? purpose,
    int? guestCount,
    String? specialRequests,
    DateTime? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateBooking$updateFacilityBooking<TRes>
    implements CopyWith$Mutation$UpdateBooking$updateFacilityBooking<TRes> {
  _CopyWithImpl$Mutation$UpdateBooking$updateFacilityBooking(
    this._instance,
    this._then,
  );

  final Mutation$UpdateBooking$updateFacilityBooking _instance;

  final TRes Function(Mutation$UpdateBooking$updateFacilityBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? purpose = _undefined,
    Object? guestCount = _undefined,
    Object? specialRequests = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateBooking$updateFacilityBooking(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      startTime: startTime == _undefined || startTime == null
          ? _instance.startTime
          : (startTime as DateTime),
      endTime: endTime == _undefined || endTime == null
          ? _instance.endTime
          : (endTime as DateTime),
      purpose: purpose == _undefined ? _instance.purpose : (purpose as String?),
      guestCount: guestCount == _undefined
          ? _instance.guestCount
          : (guestCount as int?),
      specialRequests: specialRequests == _undefined
          ? _instance.specialRequests
          : (specialRequests as String?),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$UpdateBooking$updateFacilityBooking<TRes>
    implements CopyWith$Mutation$UpdateBooking$updateFacilityBooking<TRes> {
  _CopyWithStubImpl$Mutation$UpdateBooking$updateFacilityBooking(this._res);

  TRes _res;

  call({
    String? id,
    DateTime? startTime,
    DateTime? endTime,
    String? purpose,
    int? guestCount,
    String? specialRequests,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;
}
