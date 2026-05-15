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
      checkRSVPEligibility: (l$checkRSVPEligibility as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool checkRSVPEligibility;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$checkRSVPEligibility = checkRSVPEligibility;
    _resultData['checkRSVPEligibility'] = l$checkRSVPEligibility;
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

  TRes call({bool? checkRSVPEligibility, String? $__typename});
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
          : (checkRSVPEligibility as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$CheckRSVPEligibility<TRes>
    implements CopyWith$Query$CheckRSVPEligibility<TRes> {
  _CopyWithStubImpl$Query$CheckRSVPEligibility(this._res);

  TRes _res;

  call({bool? checkRSVPEligibility, String? $__typename}) => _res;
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
