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
    required this.createFacilityBooking,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateBooking.fromJson(Map<String, dynamic> json) {
    final l$createFacilityBooking = json['createFacilityBooking'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateBooking(
      createFacilityBooking:
          Mutation$CreateBooking$createFacilityBooking.fromJson(
            (l$createFacilityBooking as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateBooking$createFacilityBooking createFacilityBooking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createFacilityBooking = createFacilityBooking;
    _resultData['createFacilityBooking'] = l$createFacilityBooking.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createFacilityBooking = createFacilityBooking;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createFacilityBooking, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateBooking || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createFacilityBooking = createFacilityBooking;
    final lOther$createFacilityBooking = other.createFacilityBooking;
    if (l$createFacilityBooking != lOther$createFacilityBooking) {
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
    Mutation$CreateBooking$createFacilityBooking? createFacilityBooking,
    String? $__typename,
  });
  CopyWith$Mutation$CreateBooking$createFacilityBooking<TRes>
  get createFacilityBooking;
}

class _CopyWithImpl$Mutation$CreateBooking<TRes>
    implements CopyWith$Mutation$CreateBooking<TRes> {
  _CopyWithImpl$Mutation$CreateBooking(this._instance, this._then);

  final Mutation$CreateBooking _instance;

  final TRes Function(Mutation$CreateBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createFacilityBooking = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateBooking(
      createFacilityBooking:
          createFacilityBooking == _undefined || createFacilityBooking == null
          ? _instance.createFacilityBooking
          : (createFacilityBooking
                as Mutation$CreateBooking$createFacilityBooking),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateBooking$createFacilityBooking<TRes>
  get createFacilityBooking {
    final local$createFacilityBooking = _instance.createFacilityBooking;
    return CopyWith$Mutation$CreateBooking$createFacilityBooking(
      local$createFacilityBooking,
      (e) => call(createFacilityBooking: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CreateBooking<TRes>
    implements CopyWith$Mutation$CreateBooking<TRes> {
  _CopyWithStubImpl$Mutation$CreateBooking(this._res);

  TRes _res;

  call({
    Mutation$CreateBooking$createFacilityBooking? createFacilityBooking,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateBooking$createFacilityBooking<TRes>
  get createFacilityBooking =>
      CopyWith$Mutation$CreateBooking$createFacilityBooking.stub(_res);
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
            name: NameNode(value: 'createFacilityBooking'),
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
                  name: NameNode(value: 'facilityId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'memberId'),
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
                  name: NameNode(value: 'facility'),
                  alias: null,
                  arguments: [],
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

class Mutation$CreateBooking$createFacilityBooking {
  Mutation$CreateBooking$createFacilityBooking({
    required this.id,
    required this.clubId,
    required this.facilityId,
    required this.memberId,
    required this.startTime,
    required this.endTime,
    required this.status,
    this.purpose,
    this.guestCount,
    this.facility,
    required this.createdAt,
    this.$__typename = 'FacilityBooking',
  });

  factory Mutation$CreateBooking$createFacilityBooking.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$facilityId = json['facilityId'];
    final l$memberId = json['memberId'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$status = json['status'];
    final l$purpose = json['purpose'];
    final l$guestCount = json['guestCount'];
    final l$facility = json['facility'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateBooking$createFacilityBooking(
      id: (l$id as String),
      clubId: (l$clubId as String),
      facilityId: (l$facilityId as String),
      memberId: (l$memberId as String),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      purpose: (l$purpose as String?),
      guestCount: (l$guestCount as int?),
      facility: l$facility == null
          ? null
          : Mutation$CreateBooking$createFacilityBooking$facility.fromJson(
              (l$facility as Map<String, dynamic>),
            ),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String facilityId;

  final String memberId;

  final DateTime startTime;

  final DateTime endTime;

  final Enum$BookingStatus status;

  final String? purpose;

  final int? guestCount;

  final Mutation$CreateBooking$createFacilityBooking$facility? facility;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$facilityId = facilityId;
    _resultData['facilityId'] = l$facilityId;
    final l$memberId = memberId;
    _resultData['memberId'] = l$memberId;
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime.toIso8601String();
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$purpose = purpose;
    _resultData['purpose'] = l$purpose;
    final l$guestCount = guestCount;
    _resultData['guestCount'] = l$guestCount;
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
    final l$clubId = clubId;
    final l$facilityId = facilityId;
    final l$memberId = memberId;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$status = status;
    final l$purpose = purpose;
    final l$guestCount = guestCount;
    final l$facility = facility;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$facilityId,
      l$memberId,
      l$startTime,
      l$endTime,
      l$status,
      l$purpose,
      l$guestCount,
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
    if (other is! Mutation$CreateBooking$createFacilityBooking ||
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
    final l$facilityId = facilityId;
    final lOther$facilityId = other.facilityId;
    if (l$facilityId != lOther$facilityId) {
      return false;
    }
    final l$memberId = memberId;
    final lOther$memberId = other.memberId;
    if (l$memberId != lOther$memberId) {
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

extension UtilityExtension$Mutation$CreateBooking$createFacilityBooking
    on Mutation$CreateBooking$createFacilityBooking {
  CopyWith$Mutation$CreateBooking$createFacilityBooking<
    Mutation$CreateBooking$createFacilityBooking
  >
  get copyWith =>
      CopyWith$Mutation$CreateBooking$createFacilityBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateBooking$createFacilityBooking<TRes> {
  factory CopyWith$Mutation$CreateBooking$createFacilityBooking(
    Mutation$CreateBooking$createFacilityBooking instance,
    TRes Function(Mutation$CreateBooking$createFacilityBooking) then,
  ) = _CopyWithImpl$Mutation$CreateBooking$createFacilityBooking;

  factory CopyWith$Mutation$CreateBooking$createFacilityBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateBooking$createFacilityBooking;

  TRes call({
    String? id,
    String? clubId,
    String? facilityId,
    String? memberId,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? purpose,
    int? guestCount,
    Mutation$CreateBooking$createFacilityBooking$facility? facility,
    DateTime? createdAt,
    String? $__typename,
  });
  CopyWith$Mutation$CreateBooking$createFacilityBooking$facility<TRes>
  get facility;
}

class _CopyWithImpl$Mutation$CreateBooking$createFacilityBooking<TRes>
    implements CopyWith$Mutation$CreateBooking$createFacilityBooking<TRes> {
  _CopyWithImpl$Mutation$CreateBooking$createFacilityBooking(
    this._instance,
    this._then,
  );

  final Mutation$CreateBooking$createFacilityBooking _instance;

  final TRes Function(Mutation$CreateBooking$createFacilityBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? facilityId = _undefined,
    Object? memberId = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? status = _undefined,
    Object? purpose = _undefined,
    Object? guestCount = _undefined,
    Object? facility = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateBooking$createFacilityBooking(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      facilityId: facilityId == _undefined || facilityId == null
          ? _instance.facilityId
          : (facilityId as String),
      memberId: memberId == _undefined || memberId == null
          ? _instance.memberId
          : (memberId as String),
      startTime: startTime == _undefined || startTime == null
          ? _instance.startTime
          : (startTime as DateTime),
      endTime: endTime == _undefined || endTime == null
          ? _instance.endTime
          : (endTime as DateTime),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$BookingStatus),
      purpose: purpose == _undefined ? _instance.purpose : (purpose as String?),
      guestCount: guestCount == _undefined
          ? _instance.guestCount
          : (guestCount as int?),
      facility: facility == _undefined
          ? _instance.facility
          : (facility
                as Mutation$CreateBooking$createFacilityBooking$facility?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateBooking$createFacilityBooking$facility<TRes>
  get facility {
    final local$facility = _instance.facility;
    return local$facility == null
        ? CopyWith$Mutation$CreateBooking$createFacilityBooking$facility.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateBooking$createFacilityBooking$facility(
            local$facility,
            (e) => call(facility: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateBooking$createFacilityBooking<TRes>
    implements CopyWith$Mutation$CreateBooking$createFacilityBooking<TRes> {
  _CopyWithStubImpl$Mutation$CreateBooking$createFacilityBooking(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? facilityId,
    String? memberId,
    DateTime? startTime,
    DateTime? endTime,
    Enum$BookingStatus? status,
    String? purpose,
    int? guestCount,
    Mutation$CreateBooking$createFacilityBooking$facility? facility,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateBooking$createFacilityBooking$facility<TRes>
  get facility =>
      CopyWith$Mutation$CreateBooking$createFacilityBooking$facility.stub(_res);
}

class Mutation$CreateBooking$createFacilityBooking$facility {
  Mutation$CreateBooking$createFacilityBooking$facility({
    required this.id,
    required this.name,
    required this.type,
    this.$__typename = 'Facility',
  });

  factory Mutation$CreateBooking$createFacilityBooking$facility.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$type = json['type'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateBooking$createFacilityBooking$facility(
      id: (l$id as String),
      name: (l$name as String),
      type: fromJson$Enum$FacilityType((l$type as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final Enum$FacilityType type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$type = type;
    _resultData['type'] = toJson$Enum$FacilityType(l$type);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$type = type;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$type, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateBooking$createFacilityBooking$facility ||
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

extension UtilityExtension$Mutation$CreateBooking$createFacilityBooking$facility
    on Mutation$CreateBooking$createFacilityBooking$facility {
  CopyWith$Mutation$CreateBooking$createFacilityBooking$facility<
    Mutation$CreateBooking$createFacilityBooking$facility
  >
  get copyWith =>
      CopyWith$Mutation$CreateBooking$createFacilityBooking$facility(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateBooking$createFacilityBooking$facility<
  TRes
> {
  factory CopyWith$Mutation$CreateBooking$createFacilityBooking$facility(
    Mutation$CreateBooking$createFacilityBooking$facility instance,
    TRes Function(Mutation$CreateBooking$createFacilityBooking$facility) then,
  ) = _CopyWithImpl$Mutation$CreateBooking$createFacilityBooking$facility;

  factory CopyWith$Mutation$CreateBooking$createFacilityBooking$facility.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateBooking$createFacilityBooking$facility;

  TRes call({
    String? id,
    String? name,
    Enum$FacilityType? type,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateBooking$createFacilityBooking$facility<TRes>
    implements
        CopyWith$Mutation$CreateBooking$createFacilityBooking$facility<TRes> {
  _CopyWithImpl$Mutation$CreateBooking$createFacilityBooking$facility(
    this._instance,
    this._then,
  );

  final Mutation$CreateBooking$createFacilityBooking$facility _instance;

  final TRes Function(Mutation$CreateBooking$createFacilityBooking$facility)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? type = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateBooking$createFacilityBooking$facility(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$FacilityType),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreateBooking$createFacilityBooking$facility<
  TRes
>
    implements
        CopyWith$Mutation$CreateBooking$createFacilityBooking$facility<TRes> {
  _CopyWithStubImpl$Mutation$CreateBooking$createFacilityBooking$facility(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? name,
    Enum$FacilityType? type,
    String? $__typename,
  }) => _res;
}
