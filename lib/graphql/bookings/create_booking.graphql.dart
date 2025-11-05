import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CreateBooking {
  factory Variables$Mutation$CreateBooking({
    required Input$CreateBookingInput input,
  }) => Variables$Mutation$CreateBooking._({r'input': input});

  Variables$Mutation$CreateBooking._(this._$data);

  factory Variables$Mutation$CreateBooking.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$CreateBookingInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateBooking._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreateBookingInput get input =>
      (_$data['input'] as Input$CreateBookingInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateBooking<Variables$Mutation$CreateBooking>
  get copyWith => CopyWith$Variables$Mutation$CreateBooking(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateBooking ||
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

abstract class CopyWith$Variables$Mutation$CreateBooking<TRes> {
  factory CopyWith$Variables$Mutation$CreateBooking(
    Variables$Mutation$CreateBooking instance,
    TRes Function(Variables$Mutation$CreateBooking) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateBooking;

  factory CopyWith$Variables$Mutation$CreateBooking.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateBooking;

  TRes call({Input$CreateBookingInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateBooking<TRes>
    implements CopyWith$Variables$Mutation$CreateBooking<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateBooking(this._instance, this._then);

  final Variables$Mutation$CreateBooking _instance;

  final TRes Function(Variables$Mutation$CreateBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateBooking._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$CreateBookingInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateBooking<TRes>
    implements CopyWith$Variables$Mutation$CreateBooking<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateBooking(this._res);

  TRes _res;

  call({Input$CreateBookingInput? input}) => _res;
}

class Mutation$CreateBooking {
  Mutation$CreateBooking({
    required this.createBooking,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateBooking.fromJson(Map<String, dynamic> json) {
    final l$createBooking = json['createBooking'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateBooking(
      createBooking: Mutation$CreateBooking$createBooking.fromJson(
        (l$createBooking as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateBooking$createBooking createBooking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createBooking = createBooking;
    _resultData['createBooking'] = l$createBooking.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createBooking = createBooking;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createBooking, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateBooking || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createBooking = createBooking;
    final lOther$createBooking = other.createBooking;
    if (l$createBooking != lOther$createBooking) {
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

extension UtilityExtension$Mutation$CreateBooking on Mutation$CreateBooking {
  CopyWith$Mutation$CreateBooking<Mutation$CreateBooking> get copyWith =>
      CopyWith$Mutation$CreateBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateBooking<TRes> {
  factory CopyWith$Mutation$CreateBooking(
    Mutation$CreateBooking instance,
    TRes Function(Mutation$CreateBooking) then,
  ) = _CopyWithImpl$Mutation$CreateBooking;

  factory CopyWith$Mutation$CreateBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateBooking;

  TRes call({
    Mutation$CreateBooking$createBooking? createBooking,
    String? $__typename,
  });
  CopyWith$Mutation$CreateBooking$createBooking<TRes> get createBooking;
}

class _CopyWithImpl$Mutation$CreateBooking<TRes>
    implements CopyWith$Mutation$CreateBooking<TRes> {
  _CopyWithImpl$Mutation$CreateBooking(this._instance, this._then);

  final Mutation$CreateBooking _instance;

  final TRes Function(Mutation$CreateBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createBooking = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateBooking(
      createBooking: createBooking == _undefined || createBooking == null
          ? _instance.createBooking
          : (createBooking as Mutation$CreateBooking$createBooking),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateBooking$createBooking<TRes> get createBooking {
    final local$createBooking = _instance.createBooking;
    return CopyWith$Mutation$CreateBooking$createBooking(
      local$createBooking,
      (e) => call(createBooking: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CreateBooking<TRes>
    implements CopyWith$Mutation$CreateBooking<TRes> {
  _CopyWithStubImpl$Mutation$CreateBooking(this._res);

  TRes _res;

  call({
    Mutation$CreateBooking$createBooking? createBooking,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateBooking$createBooking<TRes> get createBooking =>
      CopyWith$Mutation$CreateBooking$createBooking.stub(_res);
}

const documentNodeMutationCreateBooking = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateBooking'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'CreateBookingInput'),
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
            name: NameNode(value: 'createBooking'),
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
                  name: NameNode(value: 'facilityId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'userId'),
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
                  name: NameNode(value: 'status'),
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
                  name: NameNode(value: 'facility'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
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
Mutation$CreateBooking _parserFn$Mutation$CreateBooking(
  Map<String, dynamic> data,
) => Mutation$CreateBooking.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateBooking =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CreateBooking?);

class Options$Mutation$CreateBooking
    extends graphql.MutationOptions<Mutation$CreateBooking> {
  Options$Mutation$CreateBooking({
    String? operationName,
    required Variables$Mutation$CreateBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateBooking? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateBooking? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateBooking>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateBooking(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateBooking,
         parserFn: _parserFn$Mutation$CreateBooking,
       );

  final OnMutationCompleted$Mutation$CreateBooking? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateBooking
    extends graphql.WatchQueryOptions<Mutation$CreateBooking> {
  WatchOptions$Mutation$CreateBooking({
    String? operationName,
    required Variables$Mutation$CreateBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateBooking? typedOptimisticResult,
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
         document: documentNodeMutationCreateBooking,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateBooking,
       );
}

extension ClientExtension$Mutation$CreateBooking on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateBooking>> mutate$CreateBooking(
    Options$Mutation$CreateBooking options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateBooking> watchMutation$CreateBooking(
    WatchOptions$Mutation$CreateBooking options,
  ) => this.watchMutation(options);
}

class Mutation$CreateBooking$createBooking {
  Mutation$CreateBooking$createBooking({
    required this.id,
    required this.facilityId,
    required this.userId,
    required this.startTime,
    required this.endTime,
    required this.status,
    this.notes,
    required this.participants,
    this.facility,
    required this.createdAt,
    this.$__typename = 'Booking',
  });

  factory Mutation$CreateBooking$createBooking.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$facilityId = json['facilityId'];
    final l$userId = json['userId'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$status = json['status'];
    final l$notes = json['notes'];
    final l$participants = json['participants'];
    final l$facility = json['facility'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateBooking$createBooking(
      id: (l$id as String),
      facilityId: (l$facilityId as String),
      userId: (l$userId as String),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      notes: (l$notes as String?),
      participants: (l$participants as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      facility: l$facility == null
          ? null
          : Mutation$CreateBooking$createBooking$facility.fromJson(
              (l$facility as Map<String, dynamic>),
            ),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String facilityId;

  final String userId;

  final DateTime startTime;

  final DateTime endTime;

  final Enum$BookingStatus status;

  final String? notes;

  final List<String> participants;

  final Mutation$CreateBooking$createBooking$facility? facility;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$facilityId = facilityId;
    _resultData['facilityId'] = l$facilityId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime.toIso8601String();
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$participants = participants;
    _resultData['participants'] = l$participants.map((e) => e).toList();
    final l$facility = facility;
    _resultData['facility'] = l$facility?.toJson();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$facilityId = facilityId;
    final l$userId = userId;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$status = status;
    final l$notes = notes;
    final l$participants = participants;
    final l$facility = facility;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$facilityId,
      l$userId,
      l$startTime,
      l$endTime,
      l$status,
      l$notes,
      Object.hashAll(l$participants.map((v) => v)),
      l$facility,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateBooking$createBooking ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$facilityId = facilityId;
    final lOther$facilityId = other.facilityId;
    if (l$facilityId != lOther$facilityId) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
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
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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
    final l$facility = facility;
    final lOther$facility = other.facility;
    if (l$facility != lOther$facility) {
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

extension UtilityExtension$Mutation$CreateBooking$createBooking
    on Mutation$CreateBooking$createBooking {
  CopyWith$Mutation$CreateBooking$createBooking<
    Mutation$CreateBooking$createBooking
  >
  get copyWith => CopyWith$Mutation$CreateBooking$createBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateBooking$createBooking<TRes> {
  factory CopyWith$Mutation$CreateBooking$createBooking(
    Mutation$CreateBooking$createBooking instance,
    TRes Function(Mutation$CreateBooking$createBooking) then,
  ) = _CopyWithImpl$Mutation$CreateBooking$createBooking;

  factory CopyWith$Mutation$CreateBooking$createBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateBooking$createBooking;

  TRes call({
    String? id,
    String? facilityId,
    String? userId,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? notes,
    List<String>? participants,
    Mutation$CreateBooking$createBooking$facility? facility,
    DateTime? createdAt,
    String? $__typename,
  });
  CopyWith$Mutation$CreateBooking$createBooking$facility<TRes> get facility;
}

class _CopyWithImpl$Mutation$CreateBooking$createBooking<TRes>
    implements CopyWith$Mutation$CreateBooking$createBooking<TRes> {
  _CopyWithImpl$Mutation$CreateBooking$createBooking(
    this._instance,
    this._then,
  );

  final Mutation$CreateBooking$createBooking _instance;

  final TRes Function(Mutation$CreateBooking$createBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? facilityId = _undefined,
    Object? userId = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? status = _undefined,
    Object? notes = _undefined,
    Object? participants = _undefined,
    Object? facility = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateBooking$createBooking(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      facilityId: facilityId == _undefined || facilityId == null
          ? _instance.facilityId
          : (facilityId as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      startTime: startTime == _undefined || startTime == null
          ? _instance.startTime
          : (startTime as DateTime),
      endTime: endTime == _undefined || endTime == null
          ? _instance.endTime
          : (endTime as DateTime),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$BookingStatus),
      notes: notes == _undefined ? _instance.notes : (notes as String?),
      participants: participants == _undefined || participants == null
          ? _instance.participants
          : (participants as List<String>),
      facility: facility == _undefined
          ? _instance.facility
          : (facility as Mutation$CreateBooking$createBooking$facility?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateBooking$createBooking$facility<TRes> get facility {
    final local$facility = _instance.facility;
    return local$facility == null
        ? CopyWith$Mutation$CreateBooking$createBooking$facility.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateBooking$createBooking$facility(
            local$facility,
            (e) => call(facility: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateBooking$createBooking<TRes>
    implements CopyWith$Mutation$CreateBooking$createBooking<TRes> {
  _CopyWithStubImpl$Mutation$CreateBooking$createBooking(this._res);

  TRes _res;

  call({
    String? id,
    String? facilityId,
    String? userId,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? notes,
    List<String>? participants,
    Mutation$CreateBooking$createBooking$facility? facility,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateBooking$createBooking$facility<TRes> get facility =>
      CopyWith$Mutation$CreateBooking$createBooking$facility.stub(_res);
}

class Mutation$CreateBooking$createBooking$facility {
  Mutation$CreateBooking$createBooking$facility({
    required this.name,
    required this.type,
    this.$__typename = 'Facility',
  });

  factory Mutation$CreateBooking$createBooking$facility.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$type = json['type'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateBooking$createBooking$facility(
      name: (l$name as String),
      type: (l$type as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$type = type;
    _resultData['type'] = l$type;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$type = type;
    final l$$__typename = $__typename;
    return Object.hashAll([l$name, l$type, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateBooking$createBooking$facility ||
        runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateBooking$createBooking$facility
    on Mutation$CreateBooking$createBooking$facility {
  CopyWith$Mutation$CreateBooking$createBooking$facility<
    Mutation$CreateBooking$createBooking$facility
  >
  get copyWith =>
      CopyWith$Mutation$CreateBooking$createBooking$facility(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateBooking$createBooking$facility<TRes> {
  factory CopyWith$Mutation$CreateBooking$createBooking$facility(
    Mutation$CreateBooking$createBooking$facility instance,
    TRes Function(Mutation$CreateBooking$createBooking$facility) then,
  ) = _CopyWithImpl$Mutation$CreateBooking$createBooking$facility;

  factory CopyWith$Mutation$CreateBooking$createBooking$facility.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateBooking$createBooking$facility;

  TRes call({String? name, String? type, String? $__typename});
}

class _CopyWithImpl$Mutation$CreateBooking$createBooking$facility<TRes>
    implements CopyWith$Mutation$CreateBooking$createBooking$facility<TRes> {
  _CopyWithImpl$Mutation$CreateBooking$createBooking$facility(
    this._instance,
    this._then,
  );

  final Mutation$CreateBooking$createBooking$facility _instance;

  final TRes Function(Mutation$CreateBooking$createBooking$facility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? type = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateBooking$createBooking$facility(
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreateBooking$createBooking$facility<TRes>
    implements CopyWith$Mutation$CreateBooking$createBooking$facility<TRes> {
  _CopyWithStubImpl$Mutation$CreateBooking$createBooking$facility(this._res);

  TRes _res;

  call({String? name, String? type, String? $__typename}) => _res;
}
