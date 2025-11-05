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
    required this.updateBooking,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateBooking.fromJson(Map<String, dynamic> json) {
    final l$updateBooking = json['updateBooking'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateBooking(
      updateBooking: Mutation$UpdateBooking$updateBooking.fromJson(
        (l$updateBooking as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateBooking$updateBooking updateBooking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateBooking = updateBooking;
    _resultData['updateBooking'] = l$updateBooking.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateBooking = updateBooking;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateBooking, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateBooking || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateBooking = updateBooking;
    final lOther$updateBooking = other.updateBooking;
    if (l$updateBooking != lOther$updateBooking) {
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
    Mutation$UpdateBooking$updateBooking? updateBooking,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateBooking$updateBooking<TRes> get updateBooking;
}

class _CopyWithImpl$Mutation$UpdateBooking<TRes>
    implements CopyWith$Mutation$UpdateBooking<TRes> {
  _CopyWithImpl$Mutation$UpdateBooking(this._instance, this._then);

  final Mutation$UpdateBooking _instance;

  final TRes Function(Mutation$UpdateBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateBooking = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateBooking(
      updateBooking: updateBooking == _undefined || updateBooking == null
          ? _instance.updateBooking
          : (updateBooking as Mutation$UpdateBooking$updateBooking),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateBooking$updateBooking<TRes> get updateBooking {
    final local$updateBooking = _instance.updateBooking;
    return CopyWith$Mutation$UpdateBooking$updateBooking(
      local$updateBooking,
      (e) => call(updateBooking: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$UpdateBooking<TRes>
    implements CopyWith$Mutation$UpdateBooking<TRes> {
  _CopyWithStubImpl$Mutation$UpdateBooking(this._res);

  TRes _res;

  call({
    Mutation$UpdateBooking$updateBooking? updateBooking,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateBooking$updateBooking<TRes> get updateBooking =>
      CopyWith$Mutation$UpdateBooking$updateBooking.stub(_res);
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
            name: NameNode(value: 'updateBooking'),
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
                  name: NameNode(value: 'notes'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'participants'),
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

class Mutation$UpdateBooking$updateBooking {
  Mutation$UpdateBooking$updateBooking({
    required this.id,
    required this.startTime,
    required this.endTime,
    this.notes,
    required this.participants,
    required this.updatedAt,
    this.$__typename = 'Booking',
  });

  factory Mutation$UpdateBooking$updateBooking.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$notes = json['notes'];
    final l$participants = json['participants'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateBooking$updateBooking(
      id: (l$id as String),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      notes: (l$notes as String?),
      participants: (l$participants as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime startTime;

  final DateTime endTime;

  final String? notes;

  final List<String> participants;

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
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$participants = participants;
    _resultData['participants'] = l$participants.map((e) => e).toList();
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
    final l$notes = notes;
    final l$participants = participants;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$startTime,
      l$endTime,
      l$notes,
      Object.hashAll(l$participants.map((v) => v)),
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateBooking$updateBooking ||
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
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$participants = participants;
    final lOther$participants = other.participants;
    if (l$participants.length != lOther$participants.length) {
      return false;
    }
    for (int i = 0; i < l$participants.length; i++) {
      final l$participants$entry = l$participants[i];
      final lOther$participants$entry = lOther$participants[i];
      if (l$participants$entry != lOther$participants$entry) {
        return false;
      }
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

extension UtilityExtension$Mutation$UpdateBooking$updateBooking
    on Mutation$UpdateBooking$updateBooking {
  CopyWith$Mutation$UpdateBooking$updateBooking<
    Mutation$UpdateBooking$updateBooking
  >
  get copyWith => CopyWith$Mutation$UpdateBooking$updateBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateBooking$updateBooking<TRes> {
  factory CopyWith$Mutation$UpdateBooking$updateBooking(
    Mutation$UpdateBooking$updateBooking instance,
    TRes Function(Mutation$UpdateBooking$updateBooking) then,
  ) = _CopyWithImpl$Mutation$UpdateBooking$updateBooking;

  factory CopyWith$Mutation$UpdateBooking$updateBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateBooking$updateBooking;

  TRes call({
    String? id,
    DateTime? startTime,
    DateTime? endTime,
    String? notes,
    List<String>? participants,
    DateTime? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateBooking$updateBooking<TRes>
    implements CopyWith$Mutation$UpdateBooking$updateBooking<TRes> {
  _CopyWithImpl$Mutation$UpdateBooking$updateBooking(
    this._instance,
    this._then,
  );

  final Mutation$UpdateBooking$updateBooking _instance;

  final TRes Function(Mutation$UpdateBooking$updateBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? notes = _undefined,
    Object? participants = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateBooking$updateBooking(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      startTime: startTime == _undefined || startTime == null
          ? _instance.startTime
          : (startTime as DateTime),
      endTime: endTime == _undefined || endTime == null
          ? _instance.endTime
          : (endTime as DateTime),
      notes: notes == _undefined ? _instance.notes : (notes as String?),
      participants: participants == _undefined || participants == null
          ? _instance.participants
          : (participants as List<String>),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$UpdateBooking$updateBooking<TRes>
    implements CopyWith$Mutation$UpdateBooking$updateBooking<TRes> {
  _CopyWithStubImpl$Mutation$UpdateBooking$updateBooking(this._res);

  TRes _res;

  call({
    String? id,
    DateTime? startTime,
    DateTime? endTime,
    String? notes,
    List<String>? participants,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;
}
