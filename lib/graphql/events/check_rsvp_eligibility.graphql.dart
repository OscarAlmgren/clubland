import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$CheckRSVPEligibility {
  factory Variables$Query$CheckRSVPEligibility({
    required String eventId,
    required String memberId,
  }) => Variables$Query$CheckRSVPEligibility._({
    r'eventId': eventId,
    r'memberId': memberId,
  });

  Variables$Query$CheckRSVPEligibility._(this._$data);

  factory Variables$Query$CheckRSVPEligibility.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$eventId = data['eventId'];
    result$data['eventId'] = (l$eventId as String);
    final l$memberId = data['memberId'];
    result$data['memberId'] = (l$memberId as String);
    return Variables$Query$CheckRSVPEligibility._(result$data);
  }

  Map<String, dynamic> _$data;

  String get eventId => (_$data['eventId'] as String);

  String get memberId => (_$data['memberId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$eventId = eventId;
    result$data['eventId'] = l$eventId;
    final l$memberId = memberId;
    result$data['memberId'] = l$memberId;
    return result$data;
  }

  CopyWith$Variables$Query$CheckRSVPEligibility<
    Variables$Query$CheckRSVPEligibility
  >
  get copyWith => CopyWith$Variables$Query$CheckRSVPEligibility(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$CheckRSVPEligibility ||
        runtimeType != other.runtimeType) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$eventId = eventId;
    final l$memberId = memberId;
    return Object.hashAll([l$eventId, l$memberId]);
  }
}

abstract class CopyWith$Variables$Query$CheckRSVPEligibility<TRes> {
  factory CopyWith$Variables$Query$CheckRSVPEligibility(
    Variables$Query$CheckRSVPEligibility instance,
    TRes Function(Variables$Query$CheckRSVPEligibility) then,
  ) = _CopyWithImpl$Variables$Query$CheckRSVPEligibility;

  factory CopyWith$Variables$Query$CheckRSVPEligibility.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$CheckRSVPEligibility;

  TRes call({String? eventId, String? memberId});
}

class _CopyWithImpl$Variables$Query$CheckRSVPEligibility<TRes>
    implements CopyWith$Variables$Query$CheckRSVPEligibility<TRes> {
  _CopyWithImpl$Variables$Query$CheckRSVPEligibility(
    this._instance,
    this._then,
  );

  final Variables$Query$CheckRSVPEligibility _instance;

  final TRes Function(Variables$Query$CheckRSVPEligibility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? eventId = _undefined, Object? memberId = _undefined}) =>
      _then(
        Variables$Query$CheckRSVPEligibility._({
          ..._instance._$data,
          if (eventId != _undefined && eventId != null)
            'eventId': (eventId as String),
          if (memberId != _undefined && memberId != null)
            'memberId': (memberId as String),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$CheckRSVPEligibility<TRes>
    implements CopyWith$Variables$Query$CheckRSVPEligibility<TRes> {
  _CopyWithStubImpl$Variables$Query$CheckRSVPEligibility(this._res);

  TRes _res;

  call({String? eventId, String? memberId}) => _res;
}

class Query$CheckRSVPEligibility {
  Query$CheckRSVPEligibility({
    required this.checkRSVPEligibility,
    this.$__typename = 'Query',
  });

  factory Query$CheckRSVPEligibility.fromJson(Map<String, dynamic> json) {
    final l$checkRSVPEligibility = json['checkRSVPEligibility'];
    final l$$__typename = json['__typename'];
    return Query$CheckRSVPEligibility(
      checkRSVPEligibility:
          Query$CheckRSVPEligibility$checkRSVPEligibility.fromJson(
            (l$checkRSVPEligibility as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$CheckRSVPEligibility$checkRSVPEligibility checkRSVPEligibility;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$checkRSVPEligibility = checkRSVPEligibility;
    _resultData['checkRSVPEligibility'] = l$checkRSVPEligibility.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$checkRSVPEligibility = checkRSVPEligibility;
    final l$$__typename = $__typename;
    return Object.hashAll([l$checkRSVPEligibility, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$CheckRSVPEligibility ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$checkRSVPEligibility = checkRSVPEligibility;
    final lOther$checkRSVPEligibility = other.checkRSVPEligibility;
    if (l$checkRSVPEligibility != lOther$checkRSVPEligibility) {
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

extension UtilityExtension$Query$CheckRSVPEligibility
    on Query$CheckRSVPEligibility {
  CopyWith$Query$CheckRSVPEligibility<Query$CheckRSVPEligibility>
  get copyWith => CopyWith$Query$CheckRSVPEligibility(this, (i) => i);
}

abstract class CopyWith$Query$CheckRSVPEligibility<TRes> {
  factory CopyWith$Query$CheckRSVPEligibility(
    Query$CheckRSVPEligibility instance,
    TRes Function(Query$CheckRSVPEligibility) then,
  ) = _CopyWithImpl$Query$CheckRSVPEligibility;

  factory CopyWith$Query$CheckRSVPEligibility.stub(TRes res) =
      _CopyWithStubImpl$Query$CheckRSVPEligibility;

  TRes call({
    Query$CheckRSVPEligibility$checkRSVPEligibility? checkRSVPEligibility,
    String? $__typename,
  });
  CopyWith$Query$CheckRSVPEligibility$checkRSVPEligibility<TRes>
  get checkRSVPEligibility;
}

class _CopyWithImpl$Query$CheckRSVPEligibility<TRes>
    implements CopyWith$Query$CheckRSVPEligibility<TRes> {
  _CopyWithImpl$Query$CheckRSVPEligibility(this._instance, this._then);

  final Query$CheckRSVPEligibility _instance;

  final TRes Function(Query$CheckRSVPEligibility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? checkRSVPEligibility = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$CheckRSVPEligibility(
      checkRSVPEligibility:
          checkRSVPEligibility == _undefined || checkRSVPEligibility == null
          ? _instance.checkRSVPEligibility
          : (checkRSVPEligibility
                as Query$CheckRSVPEligibility$checkRSVPEligibility),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$CheckRSVPEligibility$checkRSVPEligibility<TRes>
  get checkRSVPEligibility {
    final local$checkRSVPEligibility = _instance.checkRSVPEligibility;
    return CopyWith$Query$CheckRSVPEligibility$checkRSVPEligibility(
      local$checkRSVPEligibility,
      (e) => call(checkRSVPEligibility: e),
    );
  }
}

class _CopyWithStubImpl$Query$CheckRSVPEligibility<TRes>
    implements CopyWith$Query$CheckRSVPEligibility<TRes> {
  _CopyWithStubImpl$Query$CheckRSVPEligibility(this._res);

  TRes _res;

  call({
    Query$CheckRSVPEligibility$checkRSVPEligibility? checkRSVPEligibility,
    String? $__typename,
  }) => _res;

  CopyWith$Query$CheckRSVPEligibility$checkRSVPEligibility<TRes>
  get checkRSVPEligibility =>
      CopyWith$Query$CheckRSVPEligibility$checkRSVPEligibility.stub(_res);
}

const documentNodeQueryCheckRSVPEligibility = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'CheckRSVPEligibility'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'eventId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'memberId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'checkRSVPEligibility'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'eventId'),
                value: VariableNode(name: NameNode(value: 'eventId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'memberId'),
                value: VariableNode(name: NameNode(value: 'memberId')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'eligible'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'reason'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'memberInGoodStanding'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'hasOutstandingDebt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'debtAmount'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'wouldBeWaitlisted'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'estimatedWaitlistPosition'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'availableSpots'),
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
                  name: NameNode(value: 'requiresApproval'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'isSubgroupMember'),
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
Query$CheckRSVPEligibility _parserFn$Query$CheckRSVPEligibility(
  Map<String, dynamic> data,
) => Query$CheckRSVPEligibility.fromJson(data);
typedef OnQueryComplete$Query$CheckRSVPEligibility =
    FutureOr<void> Function(Map<String, dynamic>?, Query$CheckRSVPEligibility?);

class Options$Query$CheckRSVPEligibility
    extends graphql.QueryOptions<Query$CheckRSVPEligibility> {
  Options$Query$CheckRSVPEligibility({
    String? operationName,
    required Variables$Query$CheckRSVPEligibility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$CheckRSVPEligibility? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$CheckRSVPEligibility? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null
                     ? null
                     : _parserFn$Query$CheckRSVPEligibility(data),
               ),
         onError: onError,
         document: documentNodeQueryCheckRSVPEligibility,
         parserFn: _parserFn$Query$CheckRSVPEligibility,
       );

  final OnQueryComplete$Query$CheckRSVPEligibility? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$CheckRSVPEligibility
    extends graphql.WatchQueryOptions<Query$CheckRSVPEligibility> {
  WatchOptions$Query$CheckRSVPEligibility({
    String? operationName,
    required Variables$Query$CheckRSVPEligibility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$CheckRSVPEligibility? typedOptimisticResult,
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
         document: documentNodeQueryCheckRSVPEligibility,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$CheckRSVPEligibility,
       );
}

class FetchMoreOptions$Query$CheckRSVPEligibility
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$CheckRSVPEligibility({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$CheckRSVPEligibility variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryCheckRSVPEligibility,
       );
}

extension ClientExtension$Query$CheckRSVPEligibility on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$CheckRSVPEligibility>>
  query$CheckRSVPEligibility(
    Options$Query$CheckRSVPEligibility options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$CheckRSVPEligibility>
  watchQuery$CheckRSVPEligibility(
    WatchOptions$Query$CheckRSVPEligibility options,
  ) => this.watchQuery(options);

  void writeQuery$CheckRSVPEligibility({
    required Query$CheckRSVPEligibility data,
    required Variables$Query$CheckRSVPEligibility variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryCheckRSVPEligibility,
      ),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$CheckRSVPEligibility? readQuery$CheckRSVPEligibility({
    required Variables$Query$CheckRSVPEligibility variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryCheckRSVPEligibility,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$CheckRSVPEligibility.fromJson(result);
  }
}

class Query$CheckRSVPEligibility$checkRSVPEligibility {
  Query$CheckRSVPEligibility$checkRSVPEligibility({
    required this.eligible,
    this.reason,
    this.memberInGoodStanding,
    this.hasOutstandingDebt,
    this.debtAmount,
    this.wouldBeWaitlisted,
    this.estimatedWaitlistPosition,
    this.availableSpots,
    this.priority,
    this.requiresApproval,
    this.isSubgroupMember,
    this.$__typename = 'RSVPEligibility',
  });

  factory Query$CheckRSVPEligibility$checkRSVPEligibility.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$eligible = json['eligible'];
    final l$reason = json['reason'];
    final l$memberInGoodStanding = json['memberInGoodStanding'];
    final l$hasOutstandingDebt = json['hasOutstandingDebt'];
    final l$debtAmount = json['debtAmount'];
    final l$wouldBeWaitlisted = json['wouldBeWaitlisted'];
    final l$estimatedWaitlistPosition = json['estimatedWaitlistPosition'];
    final l$availableSpots = json['availableSpots'];
    final l$priority = json['priority'];
    final l$requiresApproval = json['requiresApproval'];
    final l$isSubgroupMember = json['isSubgroupMember'];
    final l$$__typename = json['__typename'];
    return Query$CheckRSVPEligibility$checkRSVPEligibility(
      eligible: (l$eligible as bool),
      reason: (l$reason as String?),
      memberInGoodStanding: (l$memberInGoodStanding as bool?),
      hasOutstandingDebt: (l$hasOutstandingDebt as bool?),
      debtAmount: (l$debtAmount as num?)?.toDouble(),
      wouldBeWaitlisted: (l$wouldBeWaitlisted as bool?),
      estimatedWaitlistPosition: (l$estimatedWaitlistPosition as int?),
      availableSpots: (l$availableSpots as int?),
      priority: (l$priority as int?),
      requiresApproval: (l$requiresApproval as bool?),
      isSubgroupMember: (l$isSubgroupMember as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool eligible;

  final String? reason;

  final bool? memberInGoodStanding;

  final bool? hasOutstandingDebt;

  final double? debtAmount;

  final bool? wouldBeWaitlisted;

  final int? estimatedWaitlistPosition;

  final int? availableSpots;

  final int? priority;

  final bool? requiresApproval;

  final bool? isSubgroupMember;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$eligible = eligible;
    _resultData['eligible'] = l$eligible;
    final l$reason = reason;
    _resultData['reason'] = l$reason;
    final l$memberInGoodStanding = memberInGoodStanding;
    _resultData['memberInGoodStanding'] = l$memberInGoodStanding;
    final l$hasOutstandingDebt = hasOutstandingDebt;
    _resultData['hasOutstandingDebt'] = l$hasOutstandingDebt;
    final l$debtAmount = debtAmount;
    _resultData['debtAmount'] = l$debtAmount;
    final l$wouldBeWaitlisted = wouldBeWaitlisted;
    _resultData['wouldBeWaitlisted'] = l$wouldBeWaitlisted;
    final l$estimatedWaitlistPosition = estimatedWaitlistPosition;
    _resultData['estimatedWaitlistPosition'] = l$estimatedWaitlistPosition;
    final l$availableSpots = availableSpots;
    _resultData['availableSpots'] = l$availableSpots;
    final l$priority = priority;
    _resultData['priority'] = l$priority;
    final l$requiresApproval = requiresApproval;
    _resultData['requiresApproval'] = l$requiresApproval;
    final l$isSubgroupMember = isSubgroupMember;
    _resultData['isSubgroupMember'] = l$isSubgroupMember;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$eligible = eligible;
    final l$reason = reason;
    final l$memberInGoodStanding = memberInGoodStanding;
    final l$hasOutstandingDebt = hasOutstandingDebt;
    final l$debtAmount = debtAmount;
    final l$wouldBeWaitlisted = wouldBeWaitlisted;
    final l$estimatedWaitlistPosition = estimatedWaitlistPosition;
    final l$availableSpots = availableSpots;
    final l$priority = priority;
    final l$requiresApproval = requiresApproval;
    final l$isSubgroupMember = isSubgroupMember;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$eligible,
      l$reason,
      l$memberInGoodStanding,
      l$hasOutstandingDebt,
      l$debtAmount,
      l$wouldBeWaitlisted,
      l$estimatedWaitlistPosition,
      l$availableSpots,
      l$priority,
      l$requiresApproval,
      l$isSubgroupMember,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$CheckRSVPEligibility$checkRSVPEligibility ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$eligible = eligible;
    final lOther$eligible = other.eligible;
    if (l$eligible != lOther$eligible) {
      return false;
    }
    final l$reason = reason;
    final lOther$reason = other.reason;
    if (l$reason != lOther$reason) {
      return false;
    }
    final l$memberInGoodStanding = memberInGoodStanding;
    final lOther$memberInGoodStanding = other.memberInGoodStanding;
    if (l$memberInGoodStanding != lOther$memberInGoodStanding) {
      return false;
    }
    final l$hasOutstandingDebt = hasOutstandingDebt;
    final lOther$hasOutstandingDebt = other.hasOutstandingDebt;
    if (l$hasOutstandingDebt != lOther$hasOutstandingDebt) {
      return false;
    }
    final l$debtAmount = debtAmount;
    final lOther$debtAmount = other.debtAmount;
    if (l$debtAmount != lOther$debtAmount) {
      return false;
    }
    final l$wouldBeWaitlisted = wouldBeWaitlisted;
    final lOther$wouldBeWaitlisted = other.wouldBeWaitlisted;
    if (l$wouldBeWaitlisted != lOther$wouldBeWaitlisted) {
      return false;
    }
    final l$estimatedWaitlistPosition = estimatedWaitlistPosition;
    final lOther$estimatedWaitlistPosition = other.estimatedWaitlistPosition;
    if (l$estimatedWaitlistPosition != lOther$estimatedWaitlistPosition) {
      return false;
    }
    final l$availableSpots = availableSpots;
    final lOther$availableSpots = other.availableSpots;
    if (l$availableSpots != lOther$availableSpots) {
      return false;
    }
    final l$priority = priority;
    final lOther$priority = other.priority;
    if (l$priority != lOther$priority) {
      return false;
    }
    final l$requiresApproval = requiresApproval;
    final lOther$requiresApproval = other.requiresApproval;
    if (l$requiresApproval != lOther$requiresApproval) {
      return false;
    }
    final l$isSubgroupMember = isSubgroupMember;
    final lOther$isSubgroupMember = other.isSubgroupMember;
    if (l$isSubgroupMember != lOther$isSubgroupMember) {
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

extension UtilityExtension$Query$CheckRSVPEligibility$checkRSVPEligibility
    on Query$CheckRSVPEligibility$checkRSVPEligibility {
  CopyWith$Query$CheckRSVPEligibility$checkRSVPEligibility<
    Query$CheckRSVPEligibility$checkRSVPEligibility
  >
  get copyWith =>
      CopyWith$Query$CheckRSVPEligibility$checkRSVPEligibility(this, (i) => i);
}

abstract class CopyWith$Query$CheckRSVPEligibility$checkRSVPEligibility<TRes> {
  factory CopyWith$Query$CheckRSVPEligibility$checkRSVPEligibility(
    Query$CheckRSVPEligibility$checkRSVPEligibility instance,
    TRes Function(Query$CheckRSVPEligibility$checkRSVPEligibility) then,
  ) = _CopyWithImpl$Query$CheckRSVPEligibility$checkRSVPEligibility;

  factory CopyWith$Query$CheckRSVPEligibility$checkRSVPEligibility.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$CheckRSVPEligibility$checkRSVPEligibility;

  TRes call({
    bool? eligible,
    String? reason,
    bool? memberInGoodStanding,
    bool? hasOutstandingDebt,
    double? debtAmount,
    bool? wouldBeWaitlisted,
    int? estimatedWaitlistPosition,
    int? availableSpots,
    int? priority,
    bool? requiresApproval,
    bool? isSubgroupMember,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$CheckRSVPEligibility$checkRSVPEligibility<TRes>
    implements CopyWith$Query$CheckRSVPEligibility$checkRSVPEligibility<TRes> {
  _CopyWithImpl$Query$CheckRSVPEligibility$checkRSVPEligibility(
    this._instance,
    this._then,
  );

  final Query$CheckRSVPEligibility$checkRSVPEligibility _instance;

  final TRes Function(Query$CheckRSVPEligibility$checkRSVPEligibility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? eligible = _undefined,
    Object? reason = _undefined,
    Object? memberInGoodStanding = _undefined,
    Object? hasOutstandingDebt = _undefined,
    Object? debtAmount = _undefined,
    Object? wouldBeWaitlisted = _undefined,
    Object? estimatedWaitlistPosition = _undefined,
    Object? availableSpots = _undefined,
    Object? priority = _undefined,
    Object? requiresApproval = _undefined,
    Object? isSubgroupMember = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$CheckRSVPEligibility$checkRSVPEligibility(
      eligible: eligible == _undefined || eligible == null
          ? _instance.eligible
          : (eligible as bool),
      reason: reason == _undefined ? _instance.reason : (reason as String?),
      memberInGoodStanding: memberInGoodStanding == _undefined
          ? _instance.memberInGoodStanding
          : (memberInGoodStanding as bool?),
      hasOutstandingDebt: hasOutstandingDebt == _undefined
          ? _instance.hasOutstandingDebt
          : (hasOutstandingDebt as bool?),
      debtAmount: debtAmount == _undefined
          ? _instance.debtAmount
          : (debtAmount as double?),
      wouldBeWaitlisted: wouldBeWaitlisted == _undefined
          ? _instance.wouldBeWaitlisted
          : (wouldBeWaitlisted as bool?),
      estimatedWaitlistPosition: estimatedWaitlistPosition == _undefined
          ? _instance.estimatedWaitlistPosition
          : (estimatedWaitlistPosition as int?),
      availableSpots: availableSpots == _undefined
          ? _instance.availableSpots
          : (availableSpots as int?),
      priority: priority == _undefined
          ? _instance.priority
          : (priority as int?),
      requiresApproval: requiresApproval == _undefined
          ? _instance.requiresApproval
          : (requiresApproval as bool?),
      isSubgroupMember: isSubgroupMember == _undefined
          ? _instance.isSubgroupMember
          : (isSubgroupMember as bool?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$CheckRSVPEligibility$checkRSVPEligibility<TRes>
    implements CopyWith$Query$CheckRSVPEligibility$checkRSVPEligibility<TRes> {
  _CopyWithStubImpl$Query$CheckRSVPEligibility$checkRSVPEligibility(this._res);

  TRes _res;

  call({
    bool? eligible,
    String? reason,
    bool? memberInGoodStanding,
    bool? hasOutstandingDebt,
    double? debtAmount,
    bool? wouldBeWaitlisted,
    int? estimatedWaitlistPosition,
    int? availableSpots,
    int? priority,
    bool? requiresApproval,
    bool? isSubgroupMember,
    String? $__typename,
  }) => _res;
}
