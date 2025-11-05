import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$UpdateRSVP {
  factory Variables$Mutation$UpdateRSVP({
    required String id,
    required Input$UpdateRSVPInput input,
  }) => Variables$Mutation$UpdateRSVP._({r'id': id, r'input': input});

  Variables$Mutation$UpdateRSVP._(this._$data);

  factory Variables$Mutation$UpdateRSVP.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$input = data['input'];
    result$data['input'] = Input$UpdateRSVPInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateRSVP._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Input$UpdateRSVPInput get input => (_$data['input'] as Input$UpdateRSVPInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateRSVP<Variables$Mutation$UpdateRSVP>
  get copyWith => CopyWith$Variables$Mutation$UpdateRSVP(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateRSVP ||
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

abstract class CopyWith$Variables$Mutation$UpdateRSVP<TRes> {
  factory CopyWith$Variables$Mutation$UpdateRSVP(
    Variables$Mutation$UpdateRSVP instance,
    TRes Function(Variables$Mutation$UpdateRSVP) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateRSVP;

  factory CopyWith$Variables$Mutation$UpdateRSVP.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateRSVP;

  TRes call({String? id, Input$UpdateRSVPInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateRSVP<TRes>
    implements CopyWith$Variables$Mutation$UpdateRSVP<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateRSVP(this._instance, this._then);

  final Variables$Mutation$UpdateRSVP _instance;

  final TRes Function(Variables$Mutation$UpdateRSVP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateRSVP._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (input != _undefined && input != null)
        'input': (input as Input$UpdateRSVPInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateRSVP<TRes>
    implements CopyWith$Variables$Mutation$UpdateRSVP<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateRSVP(this._res);

  TRes _res;

  call({String? id, Input$UpdateRSVPInput? input}) => _res;
}

class Mutation$UpdateRSVP {
  Mutation$UpdateRSVP({
    required this.updateRSVP,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateRSVP.fromJson(Map<String, dynamic> json) {
    final l$updateRSVP = json['updateRSVP'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateRSVP(
      updateRSVP: Mutation$UpdateRSVP$updateRSVP.fromJson(
        (l$updateRSVP as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateRSVP$updateRSVP updateRSVP;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateRSVP = updateRSVP;
    _resultData['updateRSVP'] = l$updateRSVP.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateRSVP = updateRSVP;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateRSVP, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateRSVP || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateRSVP = updateRSVP;
    final lOther$updateRSVP = other.updateRSVP;
    if (l$updateRSVP != lOther$updateRSVP) {
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

extension UtilityExtension$Mutation$UpdateRSVP on Mutation$UpdateRSVP {
  CopyWith$Mutation$UpdateRSVP<Mutation$UpdateRSVP> get copyWith =>
      CopyWith$Mutation$UpdateRSVP(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateRSVP<TRes> {
  factory CopyWith$Mutation$UpdateRSVP(
    Mutation$UpdateRSVP instance,
    TRes Function(Mutation$UpdateRSVP) then,
  ) = _CopyWithImpl$Mutation$UpdateRSVP;

  factory CopyWith$Mutation$UpdateRSVP.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateRSVP;

  TRes call({Mutation$UpdateRSVP$updateRSVP? updateRSVP, String? $__typename});
  CopyWith$Mutation$UpdateRSVP$updateRSVP<TRes> get updateRSVP;
}

class _CopyWithImpl$Mutation$UpdateRSVP<TRes>
    implements CopyWith$Mutation$UpdateRSVP<TRes> {
  _CopyWithImpl$Mutation$UpdateRSVP(this._instance, this._then);

  final Mutation$UpdateRSVP _instance;

  final TRes Function(Mutation$UpdateRSVP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateRSVP = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateRSVP(
      updateRSVP: updateRSVP == _undefined || updateRSVP == null
          ? _instance.updateRSVP
          : (updateRSVP as Mutation$UpdateRSVP$updateRSVP),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateRSVP$updateRSVP<TRes> get updateRSVP {
    final local$updateRSVP = _instance.updateRSVP;
    return CopyWith$Mutation$UpdateRSVP$updateRSVP(
      local$updateRSVP,
      (e) => call(updateRSVP: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$UpdateRSVP<TRes>
    implements CopyWith$Mutation$UpdateRSVP<TRes> {
  _CopyWithStubImpl$Mutation$UpdateRSVP(this._res);

  TRes _res;

  call({Mutation$UpdateRSVP$updateRSVP? updateRSVP, String? $__typename}) =>
      _res;

  CopyWith$Mutation$UpdateRSVP$updateRSVP<TRes> get updateRSVP =>
      CopyWith$Mutation$UpdateRSVP$updateRSVP.stub(_res);
}

const documentNodeMutationUpdateRSVP = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateRSVP'),
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
            name: NameNode(value: 'UpdateRSVPInput'),
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
            name: NameNode(value: 'updateRSVP'),
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
                  name: NameNode(value: 'eventId'),
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
                  name: NameNode(value: 'clubId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'response'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'rsvpType'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'priority'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'attendanceCount'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'guestNames'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'dietaryRestrictions'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'seatingPreferences'),
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
                  name: NameNode(value: 'status'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'paymentRequired'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'paymentVerified'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'paymentAmount'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cancellationFee'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'feeWaived'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'waitlistPosition'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'rsvpedAt'),
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
                  name: NameNode(value: 'cancelledAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cancellationReason'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'approvedBy'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'approvedAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'declineReason'),
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
Mutation$UpdateRSVP _parserFn$Mutation$UpdateRSVP(Map<String, dynamic> data) =>
    Mutation$UpdateRSVP.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateRSVP =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdateRSVP?);

class Options$Mutation$UpdateRSVP
    extends graphql.MutationOptions<Mutation$UpdateRSVP> {
  Options$Mutation$UpdateRSVP({
    String? operationName,
    required Variables$Mutation$UpdateRSVP variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateRSVP? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateRSVP? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateRSVP>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateRSVP(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateRSVP,
         parserFn: _parserFn$Mutation$UpdateRSVP,
       );

  final OnMutationCompleted$Mutation$UpdateRSVP? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateRSVP
    extends graphql.WatchQueryOptions<Mutation$UpdateRSVP> {
  WatchOptions$Mutation$UpdateRSVP({
    String? operationName,
    required Variables$Mutation$UpdateRSVP variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateRSVP? typedOptimisticResult,
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
         document: documentNodeMutationUpdateRSVP,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateRSVP,
       );
}

extension ClientExtension$Mutation$UpdateRSVP on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateRSVP>> mutate$UpdateRSVP(
    Options$Mutation$UpdateRSVP options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateRSVP> watchMutation$UpdateRSVP(
    WatchOptions$Mutation$UpdateRSVP options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateRSVP$updateRSVP {
  Mutation$UpdateRSVP$updateRSVP({
    required this.id,
    required this.eventId,
    required this.memberId,
    required this.clubId,
    this.response,
    this.rsvpType,
    this.priority,
    this.attendanceCount,
    this.guestNames,
    this.dietaryRestrictions,
    this.seatingPreferences,
    this.specialRequests,
    required this.status,
    this.paymentRequired,
    this.paymentVerified,
    this.paymentAmount,
    this.cancellationFee,
    this.feeWaived,
    this.waitlistPosition,
    this.rsvpedAt,
    required this.updatedAt,
    this.cancelledAt,
    this.cancellationReason,
    this.approvedBy,
    this.approvedAt,
    this.declineReason,
    this.$__typename = 'RSVP',
  });

  factory Mutation$UpdateRSVP$updateRSVP.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$eventId = json['eventId'];
    final l$memberId = json['memberId'];
    final l$clubId = json['clubId'];
    final l$response = json['response'];
    final l$rsvpType = json['rsvpType'];
    final l$priority = json['priority'];
    final l$attendanceCount = json['attendanceCount'];
    final l$guestNames = json['guestNames'];
    final l$dietaryRestrictions = json['dietaryRestrictions'];
    final l$seatingPreferences = json['seatingPreferences'];
    final l$specialRequests = json['specialRequests'];
    final l$status = json['status'];
    final l$paymentRequired = json['paymentRequired'];
    final l$paymentVerified = json['paymentVerified'];
    final l$paymentAmount = json['paymentAmount'];
    final l$cancellationFee = json['cancellationFee'];
    final l$feeWaived = json['feeWaived'];
    final l$waitlistPosition = json['waitlistPosition'];
    final l$rsvpedAt = json['rsvpedAt'];
    final l$updatedAt = json['updatedAt'];
    final l$cancelledAt = json['cancelledAt'];
    final l$cancellationReason = json['cancellationReason'];
    final l$approvedBy = json['approvedBy'];
    final l$approvedAt = json['approvedAt'];
    final l$declineReason = json['declineReason'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateRSVP$updateRSVP(
      id: (l$id as String),
      eventId: (l$eventId as String),
      memberId: (l$memberId as String),
      clubId: (l$clubId as String),
      response: (l$response as String?),
      rsvpType: (l$rsvpType as String?),
      priority: (l$priority as int?),
      attendanceCount: (l$attendanceCount as int?),
      guestNames: (l$guestNames as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList(),
      dietaryRestrictions: (l$dietaryRestrictions as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList(),
      seatingPreferences: (l$seatingPreferences as String?),
      specialRequests: (l$specialRequests as String?),
      status: fromJson$Enum$RSVPStatus((l$status as String)),
      paymentRequired: (l$paymentRequired as bool?),
      paymentVerified: (l$paymentVerified as bool?),
      paymentAmount: (l$paymentAmount as num?)?.toDouble(),
      cancellationFee: (l$cancellationFee as num?)?.toDouble(),
      feeWaived: (l$feeWaived as bool?),
      waitlistPosition: (l$waitlistPosition as int?),
      rsvpedAt: l$rsvpedAt == null
          ? null
          : DateTime.parse((l$rsvpedAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      cancelledAt: l$cancelledAt == null
          ? null
          : DateTime.parse((l$cancelledAt as String)),
      cancellationReason: (l$cancellationReason as String?),
      approvedBy: (l$approvedBy as String?),
      approvedAt: l$approvedAt == null
          ? null
          : DateTime.parse((l$approvedAt as String)),
      declineReason: (l$declineReason as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String eventId;

  final String memberId;

  final String clubId;

  final String? response;

  final String? rsvpType;

  final int? priority;

  final int? attendanceCount;

  final List<String>? guestNames;

  final List<String>? dietaryRestrictions;

  final String? seatingPreferences;

  final String? specialRequests;

  final Enum$RSVPStatus status;

  final bool? paymentRequired;

  final bool? paymentVerified;

  final double? paymentAmount;

  final double? cancellationFee;

  final bool? feeWaived;

  final int? waitlistPosition;

  final DateTime? rsvpedAt;

  final DateTime updatedAt;

  final DateTime? cancelledAt;

  final String? cancellationReason;

  final String? approvedBy;

  final DateTime? approvedAt;

  final String? declineReason;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$eventId = eventId;
    _resultData['eventId'] = l$eventId;
    final l$memberId = memberId;
    _resultData['memberId'] = l$memberId;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$response = response;
    _resultData['response'] = l$response;
    final l$rsvpType = rsvpType;
    _resultData['rsvpType'] = l$rsvpType;
    final l$priority = priority;
    _resultData['priority'] = l$priority;
    final l$attendanceCount = attendanceCount;
    _resultData['attendanceCount'] = l$attendanceCount;
    final l$guestNames = guestNames;
    _resultData['guestNames'] = l$guestNames?.map((e) => e).toList();
    final l$dietaryRestrictions = dietaryRestrictions;
    _resultData['dietaryRestrictions'] = l$dietaryRestrictions
        ?.map((e) => e)
        .toList();
    final l$seatingPreferences = seatingPreferences;
    _resultData['seatingPreferences'] = l$seatingPreferences;
    final l$specialRequests = specialRequests;
    _resultData['specialRequests'] = l$specialRequests;
    final l$status = status;
    _resultData['status'] = toJson$Enum$RSVPStatus(l$status);
    final l$paymentRequired = paymentRequired;
    _resultData['paymentRequired'] = l$paymentRequired;
    final l$paymentVerified = paymentVerified;
    _resultData['paymentVerified'] = l$paymentVerified;
    final l$paymentAmount = paymentAmount;
    _resultData['paymentAmount'] = l$paymentAmount;
    final l$cancellationFee = cancellationFee;
    _resultData['cancellationFee'] = l$cancellationFee;
    final l$feeWaived = feeWaived;
    _resultData['feeWaived'] = l$feeWaived;
    final l$waitlistPosition = waitlistPosition;
    _resultData['waitlistPosition'] = l$waitlistPosition;
    final l$rsvpedAt = rsvpedAt;
    _resultData['rsvpedAt'] = l$rsvpedAt?.toIso8601String();
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$cancelledAt = cancelledAt;
    _resultData['cancelledAt'] = l$cancelledAt?.toIso8601String();
    final l$cancellationReason = cancellationReason;
    _resultData['cancellationReason'] = l$cancellationReason;
    final l$approvedBy = approvedBy;
    _resultData['approvedBy'] = l$approvedBy;
    final l$approvedAt = approvedAt;
    _resultData['approvedAt'] = l$approvedAt?.toIso8601String();
    final l$declineReason = declineReason;
    _resultData['declineReason'] = l$declineReason;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$eventId = eventId;
    final l$memberId = memberId;
    final l$clubId = clubId;
    final l$response = response;
    final l$rsvpType = rsvpType;
    final l$priority = priority;
    final l$attendanceCount = attendanceCount;
    final l$guestNames = guestNames;
    final l$dietaryRestrictions = dietaryRestrictions;
    final l$seatingPreferences = seatingPreferences;
    final l$specialRequests = specialRequests;
    final l$status = status;
    final l$paymentRequired = paymentRequired;
    final l$paymentVerified = paymentVerified;
    final l$paymentAmount = paymentAmount;
    final l$cancellationFee = cancellationFee;
    final l$feeWaived = feeWaived;
    final l$waitlistPosition = waitlistPosition;
    final l$rsvpedAt = rsvpedAt;
    final l$updatedAt = updatedAt;
    final l$cancelledAt = cancelledAt;
    final l$cancellationReason = cancellationReason;
    final l$approvedBy = approvedBy;
    final l$approvedAt = approvedAt;
    final l$declineReason = declineReason;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$eventId,
      l$memberId,
      l$clubId,
      l$response,
      l$rsvpType,
      l$priority,
      l$attendanceCount,
      l$guestNames == null ? null : Object.hashAll(l$guestNames.map((v) => v)),
      l$dietaryRestrictions == null
          ? null
          : Object.hashAll(l$dietaryRestrictions.map((v) => v)),
      l$seatingPreferences,
      l$specialRequests,
      l$status,
      l$paymentRequired,
      l$paymentVerified,
      l$paymentAmount,
      l$cancellationFee,
      l$feeWaived,
      l$waitlistPosition,
      l$rsvpedAt,
      l$updatedAt,
      l$cancelledAt,
      l$cancellationReason,
      l$approvedBy,
      l$approvedAt,
      l$declineReason,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateRSVP$updateRSVP ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$eventId = eventId;
    final lOther$eventId = other.eventId;
    if (l$eventId != lOther$eventId) {
      return false;
    }
    final l$memberId = memberId;
    final lOther$memberId = other.memberId;
    if (l$memberId != lOther$memberId) {
      return false;
    }
    final l$clubId = clubId;
    final lOther$clubId = other.clubId;
    if (l$clubId != lOther$clubId) {
      return false;
    }
    final l$response = response;
    final lOther$response = other.response;
    if (l$response != lOther$response) {
      return false;
    }
    final l$rsvpType = rsvpType;
    final lOther$rsvpType = other.rsvpType;
    if (l$rsvpType != lOther$rsvpType) {
      return false;
    }
    final l$priority = priority;
    final lOther$priority = other.priority;
    if (l$priority != lOther$priority) {
      return false;
    }
    final l$attendanceCount = attendanceCount;
    final lOther$attendanceCount = other.attendanceCount;
    if (l$attendanceCount != lOther$attendanceCount) {
      return false;
    }
    final l$guestNames = guestNames;
    final lOther$guestNames = other.guestNames;
    if (l$guestNames != null && lOther$guestNames != null) {
      if (l$guestNames.length != lOther$guestNames.length) {
        return false;
      }
      for (int i = 0; i < l$guestNames.length; i++) {
        final l$guestNames$entry = l$guestNames[i];
        final lOther$guestNames$entry = lOther$guestNames[i];
        if (l$guestNames$entry != lOther$guestNames$entry) {
          return false;
        }
      }
    } else if (l$guestNames != lOther$guestNames) {
      return false;
    }
    final l$dietaryRestrictions = dietaryRestrictions;
    final lOther$dietaryRestrictions = other.dietaryRestrictions;
    if (l$dietaryRestrictions != null && lOther$dietaryRestrictions != null) {
      if (l$dietaryRestrictions.length != lOther$dietaryRestrictions.length) {
        return false;
      }
      for (int i = 0; i < l$dietaryRestrictions.length; i++) {
        final l$dietaryRestrictions$entry = l$dietaryRestrictions[i];
        final lOther$dietaryRestrictions$entry = lOther$dietaryRestrictions[i];
        if (l$dietaryRestrictions$entry != lOther$dietaryRestrictions$entry) {
          return false;
        }
      }
    } else if (l$dietaryRestrictions != lOther$dietaryRestrictions) {
      return false;
    }
    final l$seatingPreferences = seatingPreferences;
    final lOther$seatingPreferences = other.seatingPreferences;
    if (l$seatingPreferences != lOther$seatingPreferences) {
      return false;
    }
    final l$specialRequests = specialRequests;
    final lOther$specialRequests = other.specialRequests;
    if (l$specialRequests != lOther$specialRequests) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$paymentRequired = paymentRequired;
    final lOther$paymentRequired = other.paymentRequired;
    if (l$paymentRequired != lOther$paymentRequired) {
      return false;
    }
    final l$paymentVerified = paymentVerified;
    final lOther$paymentVerified = other.paymentVerified;
    if (l$paymentVerified != lOther$paymentVerified) {
      return false;
    }
    final l$paymentAmount = paymentAmount;
    final lOther$paymentAmount = other.paymentAmount;
    if (l$paymentAmount != lOther$paymentAmount) {
      return false;
    }
    final l$cancellationFee = cancellationFee;
    final lOther$cancellationFee = other.cancellationFee;
    if (l$cancellationFee != lOther$cancellationFee) {
      return false;
    }
    final l$feeWaived = feeWaived;
    final lOther$feeWaived = other.feeWaived;
    if (l$feeWaived != lOther$feeWaived) {
      return false;
    }
    final l$waitlistPosition = waitlistPosition;
    final lOther$waitlistPosition = other.waitlistPosition;
    if (l$waitlistPosition != lOther$waitlistPosition) {
      return false;
    }
    final l$rsvpedAt = rsvpedAt;
    final lOther$rsvpedAt = other.rsvpedAt;
    if (l$rsvpedAt != lOther$rsvpedAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$cancelledAt = cancelledAt;
    final lOther$cancelledAt = other.cancelledAt;
    if (l$cancelledAt != lOther$cancelledAt) {
      return false;
    }
    final l$cancellationReason = cancellationReason;
    final lOther$cancellationReason = other.cancellationReason;
    if (l$cancellationReason != lOther$cancellationReason) {
      return false;
    }
    final l$approvedBy = approvedBy;
    final lOther$approvedBy = other.approvedBy;
    if (l$approvedBy != lOther$approvedBy) {
      return false;
    }
    final l$approvedAt = approvedAt;
    final lOther$approvedAt = other.approvedAt;
    if (l$approvedAt != lOther$approvedAt) {
      return false;
    }
    final l$declineReason = declineReason;
    final lOther$declineReason = other.declineReason;
    if (l$declineReason != lOther$declineReason) {
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

extension UtilityExtension$Mutation$UpdateRSVP$updateRSVP
    on Mutation$UpdateRSVP$updateRSVP {
  CopyWith$Mutation$UpdateRSVP$updateRSVP<Mutation$UpdateRSVP$updateRSVP>
  get copyWith => CopyWith$Mutation$UpdateRSVP$updateRSVP(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateRSVP$updateRSVP<TRes> {
  factory CopyWith$Mutation$UpdateRSVP$updateRSVP(
    Mutation$UpdateRSVP$updateRSVP instance,
    TRes Function(Mutation$UpdateRSVP$updateRSVP) then,
  ) = _CopyWithImpl$Mutation$UpdateRSVP$updateRSVP;

  factory CopyWith$Mutation$UpdateRSVP$updateRSVP.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateRSVP$updateRSVP;

  TRes call({
    String? id,
    String? eventId,
    String? memberId,
    String? clubId,
    String? response,
    String? rsvpType,
    int? priority,
    int? attendanceCount,
    List<String>? guestNames,
    List<String>? dietaryRestrictions,
    String? seatingPreferences,
    String? specialRequests,
    Enum$RSVPStatus? status,
    bool? paymentRequired,
    bool? paymentVerified,
    double? paymentAmount,
    double? cancellationFee,
    bool? feeWaived,
    int? waitlistPosition,
    DateTime? rsvpedAt,
    DateTime? updatedAt,
    DateTime? cancelledAt,
    String? cancellationReason,
    String? approvedBy,
    DateTime? approvedAt,
    String? declineReason,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateRSVP$updateRSVP<TRes>
    implements CopyWith$Mutation$UpdateRSVP$updateRSVP<TRes> {
  _CopyWithImpl$Mutation$UpdateRSVP$updateRSVP(this._instance, this._then);

  final Mutation$UpdateRSVP$updateRSVP _instance;

  final TRes Function(Mutation$UpdateRSVP$updateRSVP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? eventId = _undefined,
    Object? memberId = _undefined,
    Object? clubId = _undefined,
    Object? response = _undefined,
    Object? rsvpType = _undefined,
    Object? priority = _undefined,
    Object? attendanceCount = _undefined,
    Object? guestNames = _undefined,
    Object? dietaryRestrictions = _undefined,
    Object? seatingPreferences = _undefined,
    Object? specialRequests = _undefined,
    Object? status = _undefined,
    Object? paymentRequired = _undefined,
    Object? paymentVerified = _undefined,
    Object? paymentAmount = _undefined,
    Object? cancellationFee = _undefined,
    Object? feeWaived = _undefined,
    Object? waitlistPosition = _undefined,
    Object? rsvpedAt = _undefined,
    Object? updatedAt = _undefined,
    Object? cancelledAt = _undefined,
    Object? cancellationReason = _undefined,
    Object? approvedBy = _undefined,
    Object? approvedAt = _undefined,
    Object? declineReason = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateRSVP$updateRSVP(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      eventId: eventId == _undefined || eventId == null
          ? _instance.eventId
          : (eventId as String),
      memberId: memberId == _undefined || memberId == null
          ? _instance.memberId
          : (memberId as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      response: response == _undefined
          ? _instance.response
          : (response as String?),
      rsvpType: rsvpType == _undefined
          ? _instance.rsvpType
          : (rsvpType as String?),
      priority: priority == _undefined
          ? _instance.priority
          : (priority as int?),
      attendanceCount: attendanceCount == _undefined
          ? _instance.attendanceCount
          : (attendanceCount as int?),
      guestNames: guestNames == _undefined
          ? _instance.guestNames
          : (guestNames as List<String>?),
      dietaryRestrictions: dietaryRestrictions == _undefined
          ? _instance.dietaryRestrictions
          : (dietaryRestrictions as List<String>?),
      seatingPreferences: seatingPreferences == _undefined
          ? _instance.seatingPreferences
          : (seatingPreferences as String?),
      specialRequests: specialRequests == _undefined
          ? _instance.specialRequests
          : (specialRequests as String?),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$RSVPStatus),
      paymentRequired: paymentRequired == _undefined
          ? _instance.paymentRequired
          : (paymentRequired as bool?),
      paymentVerified: paymentVerified == _undefined
          ? _instance.paymentVerified
          : (paymentVerified as bool?),
      paymentAmount: paymentAmount == _undefined
          ? _instance.paymentAmount
          : (paymentAmount as double?),
      cancellationFee: cancellationFee == _undefined
          ? _instance.cancellationFee
          : (cancellationFee as double?),
      feeWaived: feeWaived == _undefined
          ? _instance.feeWaived
          : (feeWaived as bool?),
      waitlistPosition: waitlistPosition == _undefined
          ? _instance.waitlistPosition
          : (waitlistPosition as int?),
      rsvpedAt: rsvpedAt == _undefined
          ? _instance.rsvpedAt
          : (rsvpedAt as DateTime?),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      cancelledAt: cancelledAt == _undefined
          ? _instance.cancelledAt
          : (cancelledAt as DateTime?),
      cancellationReason: cancellationReason == _undefined
          ? _instance.cancellationReason
          : (cancellationReason as String?),
      approvedBy: approvedBy == _undefined
          ? _instance.approvedBy
          : (approvedBy as String?),
      approvedAt: approvedAt == _undefined
          ? _instance.approvedAt
          : (approvedAt as DateTime?),
      declineReason: declineReason == _undefined
          ? _instance.declineReason
          : (declineReason as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$UpdateRSVP$updateRSVP<TRes>
    implements CopyWith$Mutation$UpdateRSVP$updateRSVP<TRes> {
  _CopyWithStubImpl$Mutation$UpdateRSVP$updateRSVP(this._res);

  TRes _res;

  call({
    String? id,
    String? eventId,
    String? memberId,
    String? clubId,
    String? response,
    String? rsvpType,
    int? priority,
    int? attendanceCount,
    List<String>? guestNames,
    List<String>? dietaryRestrictions,
    String? seatingPreferences,
    String? specialRequests,
    Enum$RSVPStatus? status,
    bool? paymentRequired,
    bool? paymentVerified,
    double? paymentAmount,
    double? cancellationFee,
    bool? feeWaived,
    int? waitlistPosition,
    DateTime? rsvpedAt,
    DateTime? updatedAt,
    DateTime? cancelledAt,
    String? cancellationReason,
    String? approvedBy,
    DateTime? approvedAt,
    String? declineReason,
    String? $__typename,
  }) => _res;
}
