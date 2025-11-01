import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Analytics {
  factory Variables$Query$Analytics({DateTime? startDate, DateTime? endDate}) =>
      Variables$Query$Analytics._({
        if (startDate != null) r'startDate': startDate,
        if (endDate != null) r'endDate': endDate,
      });

  Variables$Query$Analytics._(this._$data);

  factory Variables$Query$Analytics.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('startDate')) {
      final l$startDate = data['startDate'];
      result$data['startDate'] = l$startDate == null
          ? null
          : DateTime.parse((l$startDate as String));
    }
    if (data.containsKey('endDate')) {
      final l$endDate = data['endDate'];
      result$data['endDate'] = l$endDate == null
          ? null
          : DateTime.parse((l$endDate as String));
    }
    return Variables$Query$Analytics._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime? get startDate => (_$data['startDate'] as DateTime?);

  DateTime? get endDate => (_$data['endDate'] as DateTime?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('startDate')) {
      final l$startDate = startDate;
      result$data['startDate'] = l$startDate?.toIso8601String();
    }
    if (_$data.containsKey('endDate')) {
      final l$endDate = endDate;
      result$data['endDate'] = l$endDate?.toIso8601String();
    }
    return result$data;
  }

  CopyWith$Variables$Query$Analytics<Variables$Query$Analytics> get copyWith =>
      CopyWith$Variables$Query$Analytics(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Analytics ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (_$data.containsKey('startDate') !=
        other._$data.containsKey('startDate')) {
      return false;
    }
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (_$data.containsKey('endDate') != other._$data.containsKey('endDate')) {
      return false;
    }
    if (l$endDate != lOther$endDate) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$startDate = startDate;
    final l$endDate = endDate;
    return Object.hashAll([
      _$data.containsKey('startDate') ? l$startDate : const {},
      _$data.containsKey('endDate') ? l$endDate : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$Analytics<TRes> {
  factory CopyWith$Variables$Query$Analytics(
    Variables$Query$Analytics instance,
    TRes Function(Variables$Query$Analytics) then,
  ) = _CopyWithImpl$Variables$Query$Analytics;

  factory CopyWith$Variables$Query$Analytics.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Analytics;

  TRes call({DateTime? startDate, DateTime? endDate});
}

class _CopyWithImpl$Variables$Query$Analytics<TRes>
    implements CopyWith$Variables$Query$Analytics<TRes> {
  _CopyWithImpl$Variables$Query$Analytics(this._instance, this._then);

  final Variables$Query$Analytics _instance;

  final TRes Function(Variables$Query$Analytics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? startDate = _undefined, Object? endDate = _undefined}) =>
      _then(
        Variables$Query$Analytics._({
          ..._instance._$data,
          if (startDate != _undefined) 'startDate': (startDate as DateTime?),
          if (endDate != _undefined) 'endDate': (endDate as DateTime?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$Analytics<TRes>
    implements CopyWith$Variables$Query$Analytics<TRes> {
  _CopyWithStubImpl$Variables$Query$Analytics(this._res);

  TRes _res;

  call({DateTime? startDate, DateTime? endDate}) => _res;
}

class Query$Analytics {
  Query$Analytics({required this.analytics, this.$__typename = 'Query'});

  factory Query$Analytics.fromJson(Map<String, dynamic> json) {
    final l$analytics = json['analytics'];
    final l$$__typename = json['__typename'];
    return Query$Analytics(
      analytics: Query$Analytics$analytics.fromJson(
        (l$analytics as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Analytics$analytics analytics;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$analytics = analytics;
    _resultData['analytics'] = l$analytics.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$analytics = analytics;
    final l$$__typename = $__typename;
    return Object.hashAll([l$analytics, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Analytics || runtimeType != other.runtimeType) {
      return false;
    }
    final l$analytics = analytics;
    final lOther$analytics = other.analytics;
    if (l$analytics != lOther$analytics) {
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

extension UtilityExtension$Query$Analytics on Query$Analytics {
  CopyWith$Query$Analytics<Query$Analytics> get copyWith =>
      CopyWith$Query$Analytics(this, (i) => i);
}

abstract class CopyWith$Query$Analytics<TRes> {
  factory CopyWith$Query$Analytics(
    Query$Analytics instance,
    TRes Function(Query$Analytics) then,
  ) = _CopyWithImpl$Query$Analytics;

  factory CopyWith$Query$Analytics.stub(TRes res) =
      _CopyWithStubImpl$Query$Analytics;

  TRes call({Query$Analytics$analytics? analytics, String? $__typename});
  CopyWith$Query$Analytics$analytics<TRes> get analytics;
}

class _CopyWithImpl$Query$Analytics<TRes>
    implements CopyWith$Query$Analytics<TRes> {
  _CopyWithImpl$Query$Analytics(this._instance, this._then);

  final Query$Analytics _instance;

  final TRes Function(Query$Analytics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? analytics = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Analytics(
      analytics: analytics == _undefined || analytics == null
          ? _instance.analytics
          : (analytics as Query$Analytics$analytics),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Analytics$analytics<TRes> get analytics {
    final local$analytics = _instance.analytics;
    return CopyWith$Query$Analytics$analytics(
      local$analytics,
      (e) => call(analytics: e),
    );
  }
}

class _CopyWithStubImpl$Query$Analytics<TRes>
    implements CopyWith$Query$Analytics<TRes> {
  _CopyWithStubImpl$Query$Analytics(this._res);

  TRes _res;

  call({Query$Analytics$analytics? analytics, String? $__typename}) => _res;

  CopyWith$Query$Analytics$analytics<TRes> get analytics =>
      CopyWith$Query$Analytics$analytics.stub(_res);
}

const documentNodeQueryAnalytics = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Analytics'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'startDate')),
          type: NamedTypeNode(name: NameNode(value: 'Time'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'endDate')),
          type: NamedTypeNode(name: NameNode(value: 'Time'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'analytics'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'startDate'),
                value: VariableNode(name: NameNode(value: 'startDate')),
              ),
              ArgumentNode(
                name: NameNode(value: 'endDate'),
                value: VariableNode(name: NameNode(value: 'endDate')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'visits'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'totalVisits'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'monthlyVisits'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'month'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'count'),
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
                        name: NameNode(value: 'topDestinations'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'club'),
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
                                    name: NameNode(value: 'location'),
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
                              name: NameNode(value: 'count'),
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
                        name: NameNode(value: 'averageVisitDuration'),
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
                  name: NameNode(value: 'members'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'totalMembers'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'activeMembers'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'newMembersThisMonth'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'membershipDistribution'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'type'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'count'),
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
                FieldNode(
                  name: NameNode(value: 'reciprocals'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'totalAgreements'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'activeAgreements'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'pendingAgreements'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'monthlyReciprocalUsage'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'month'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'count'),
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
Query$Analytics _parserFn$Query$Analytics(Map<String, dynamic> data) =>
    Query$Analytics.fromJson(data);
typedef OnQueryComplete$Query$Analytics =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Analytics?);

class Options$Query$Analytics extends graphql.QueryOptions<Query$Analytics> {
  Options$Query$Analytics({
    String? operationName,
    Variables$Query$Analytics? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Analytics? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Analytics? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables?.toJson() ?? {},
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
                 data == null ? null : _parserFn$Query$Analytics(data),
               ),
         onError: onError,
         document: documentNodeQueryAnalytics,
         parserFn: _parserFn$Query$Analytics,
       );

  final OnQueryComplete$Query$Analytics? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Analytics
    extends graphql.WatchQueryOptions<Query$Analytics> {
  WatchOptions$Query$Analytics({
    String? operationName,
    Variables$Query$Analytics? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Analytics? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryAnalytics,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Analytics,
       );
}

class FetchMoreOptions$Query$Analytics extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Analytics({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$Analytics? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryAnalytics,
       );
}

extension ClientExtension$Query$Analytics on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Analytics>> query$Analytics([
    Options$Query$Analytics? options,
  ]) async => await this.query(options ?? Options$Query$Analytics());

  graphql.ObservableQuery<Query$Analytics> watchQuery$Analytics([
    WatchOptions$Query$Analytics? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$Analytics());

  void writeQuery$Analytics({
    required Query$Analytics data,
    Variables$Query$Analytics? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryAnalytics),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$Analytics? readQuery$Analytics({
    Variables$Query$Analytics? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryAnalytics),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Analytics.fromJson(result);
  }
}

class Query$Analytics$analytics {
  Query$Analytics$analytics({
    required this.visits,
    required this.members,
    required this.reciprocals,
    this.$__typename = 'Analytics',
  });

  factory Query$Analytics$analytics.fromJson(Map<String, dynamic> json) {
    final l$visits = json['visits'];
    final l$members = json['members'];
    final l$reciprocals = json['reciprocals'];
    final l$$__typename = json['__typename'];
    return Query$Analytics$analytics(
      visits: Query$Analytics$analytics$visits.fromJson(
        (l$visits as Map<String, dynamic>),
      ),
      members: Query$Analytics$analytics$members.fromJson(
        (l$members as Map<String, dynamic>),
      ),
      reciprocals: Query$Analytics$analytics$reciprocals.fromJson(
        (l$reciprocals as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Analytics$analytics$visits visits;

  final Query$Analytics$analytics$members members;

  final Query$Analytics$analytics$reciprocals reciprocals;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$visits = visits;
    _resultData['visits'] = l$visits.toJson();
    final l$members = members;
    _resultData['members'] = l$members.toJson();
    final l$reciprocals = reciprocals;
    _resultData['reciprocals'] = l$reciprocals.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$visits = visits;
    final l$members = members;
    final l$reciprocals = reciprocals;
    final l$$__typename = $__typename;
    return Object.hashAll([l$visits, l$members, l$reciprocals, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Analytics$analytics ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$visits = visits;
    final lOther$visits = other.visits;
    if (l$visits != lOther$visits) {
      return false;
    }
    final l$members = members;
    final lOther$members = other.members;
    if (l$members != lOther$members) {
      return false;
    }
    final l$reciprocals = reciprocals;
    final lOther$reciprocals = other.reciprocals;
    if (l$reciprocals != lOther$reciprocals) {
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

extension UtilityExtension$Query$Analytics$analytics
    on Query$Analytics$analytics {
  CopyWith$Query$Analytics$analytics<Query$Analytics$analytics> get copyWith =>
      CopyWith$Query$Analytics$analytics(this, (i) => i);
}

abstract class CopyWith$Query$Analytics$analytics<TRes> {
  factory CopyWith$Query$Analytics$analytics(
    Query$Analytics$analytics instance,
    TRes Function(Query$Analytics$analytics) then,
  ) = _CopyWithImpl$Query$Analytics$analytics;

  factory CopyWith$Query$Analytics$analytics.stub(TRes res) =
      _CopyWithStubImpl$Query$Analytics$analytics;

  TRes call({
    Query$Analytics$analytics$visits? visits,
    Query$Analytics$analytics$members? members,
    Query$Analytics$analytics$reciprocals? reciprocals,
    String? $__typename,
  });
  CopyWith$Query$Analytics$analytics$visits<TRes> get visits;
  CopyWith$Query$Analytics$analytics$members<TRes> get members;
  CopyWith$Query$Analytics$analytics$reciprocals<TRes> get reciprocals;
}

class _CopyWithImpl$Query$Analytics$analytics<TRes>
    implements CopyWith$Query$Analytics$analytics<TRes> {
  _CopyWithImpl$Query$Analytics$analytics(this._instance, this._then);

  final Query$Analytics$analytics _instance;

  final TRes Function(Query$Analytics$analytics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? visits = _undefined,
    Object? members = _undefined,
    Object? reciprocals = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Analytics$analytics(
      visits: visits == _undefined || visits == null
          ? _instance.visits
          : (visits as Query$Analytics$analytics$visits),
      members: members == _undefined || members == null
          ? _instance.members
          : (members as Query$Analytics$analytics$members),
      reciprocals: reciprocals == _undefined || reciprocals == null
          ? _instance.reciprocals
          : (reciprocals as Query$Analytics$analytics$reciprocals),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Analytics$analytics$visits<TRes> get visits {
    final local$visits = _instance.visits;
    return CopyWith$Query$Analytics$analytics$visits(
      local$visits,
      (e) => call(visits: e),
    );
  }

  CopyWith$Query$Analytics$analytics$members<TRes> get members {
    final local$members = _instance.members;
    return CopyWith$Query$Analytics$analytics$members(
      local$members,
      (e) => call(members: e),
    );
  }

  CopyWith$Query$Analytics$analytics$reciprocals<TRes> get reciprocals {
    final local$reciprocals = _instance.reciprocals;
    return CopyWith$Query$Analytics$analytics$reciprocals(
      local$reciprocals,
      (e) => call(reciprocals: e),
    );
  }
}

class _CopyWithStubImpl$Query$Analytics$analytics<TRes>
    implements CopyWith$Query$Analytics$analytics<TRes> {
  _CopyWithStubImpl$Query$Analytics$analytics(this._res);

  TRes _res;

  call({
    Query$Analytics$analytics$visits? visits,
    Query$Analytics$analytics$members? members,
    Query$Analytics$analytics$reciprocals? reciprocals,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Analytics$analytics$visits<TRes> get visits =>
      CopyWith$Query$Analytics$analytics$visits.stub(_res);

  CopyWith$Query$Analytics$analytics$members<TRes> get members =>
      CopyWith$Query$Analytics$analytics$members.stub(_res);

  CopyWith$Query$Analytics$analytics$reciprocals<TRes> get reciprocals =>
      CopyWith$Query$Analytics$analytics$reciprocals.stub(_res);
}

class Query$Analytics$analytics$visits {
  Query$Analytics$analytics$visits({
    required this.totalVisits,
    required this.monthlyVisits,
    required this.topDestinations,
    this.averageVisitDuration,
    this.$__typename = 'VisitAnalytics',
  });

  factory Query$Analytics$analytics$visits.fromJson(Map<String, dynamic> json) {
    final l$totalVisits = json['totalVisits'];
    final l$monthlyVisits = json['monthlyVisits'];
    final l$topDestinations = json['topDestinations'];
    final l$averageVisitDuration = json['averageVisitDuration'];
    final l$$__typename = json['__typename'];
    return Query$Analytics$analytics$visits(
      totalVisits: (l$totalVisits as int),
      monthlyVisits: (l$monthlyVisits as List<dynamic>)
          .map(
            (e) => Query$Analytics$analytics$visits$monthlyVisits.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      topDestinations: (l$topDestinations as List<dynamic>)
          .map(
            (e) => Query$Analytics$analytics$visits$topDestinations.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      averageVisitDuration: (l$averageVisitDuration as num?)?.toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final int totalVisits;

  final List<Query$Analytics$analytics$visits$monthlyVisits> monthlyVisits;

  final List<Query$Analytics$analytics$visits$topDestinations> topDestinations;

  final double? averageVisitDuration;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$totalVisits = totalVisits;
    _resultData['totalVisits'] = l$totalVisits;
    final l$monthlyVisits = monthlyVisits;
    _resultData['monthlyVisits'] = l$monthlyVisits
        .map((e) => e.toJson())
        .toList();
    final l$topDestinations = topDestinations;
    _resultData['topDestinations'] = l$topDestinations
        .map((e) => e.toJson())
        .toList();
    final l$averageVisitDuration = averageVisitDuration;
    _resultData['averageVisitDuration'] = l$averageVisitDuration;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$totalVisits = totalVisits;
    final l$monthlyVisits = monthlyVisits;
    final l$topDestinations = topDestinations;
    final l$averageVisitDuration = averageVisitDuration;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$totalVisits,
      Object.hashAll(l$monthlyVisits.map((v) => v)),
      Object.hashAll(l$topDestinations.map((v) => v)),
      l$averageVisitDuration,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Analytics$analytics$visits ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$totalVisits = totalVisits;
    final lOther$totalVisits = other.totalVisits;
    if (l$totalVisits != lOther$totalVisits) {
      return false;
    }
    final l$monthlyVisits = monthlyVisits;
    final lOther$monthlyVisits = other.monthlyVisits;
    if (l$monthlyVisits.length != lOther$monthlyVisits.length) {
      return false;
    }
    for (int i = 0; i < l$monthlyVisits.length; i++) {
      final l$monthlyVisits$entry = l$monthlyVisits[i];
      final lOther$monthlyVisits$entry = lOther$monthlyVisits[i];
      if (l$monthlyVisits$entry != lOther$monthlyVisits$entry) {
        return false;
      }
    }
    final l$topDestinations = topDestinations;
    final lOther$topDestinations = other.topDestinations;
    if (l$topDestinations.length != lOther$topDestinations.length) {
      return false;
    }
    for (int i = 0; i < l$topDestinations.length; i++) {
      final l$topDestinations$entry = l$topDestinations[i];
      final lOther$topDestinations$entry = lOther$topDestinations[i];
      if (l$topDestinations$entry != lOther$topDestinations$entry) {
        return false;
      }
    }
    final l$averageVisitDuration = averageVisitDuration;
    final lOther$averageVisitDuration = other.averageVisitDuration;
    if (l$averageVisitDuration != lOther$averageVisitDuration) {
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

extension UtilityExtension$Query$Analytics$analytics$visits
    on Query$Analytics$analytics$visits {
  CopyWith$Query$Analytics$analytics$visits<Query$Analytics$analytics$visits>
  get copyWith => CopyWith$Query$Analytics$analytics$visits(this, (i) => i);
}

abstract class CopyWith$Query$Analytics$analytics$visits<TRes> {
  factory CopyWith$Query$Analytics$analytics$visits(
    Query$Analytics$analytics$visits instance,
    TRes Function(Query$Analytics$analytics$visits) then,
  ) = _CopyWithImpl$Query$Analytics$analytics$visits;

  factory CopyWith$Query$Analytics$analytics$visits.stub(TRes res) =
      _CopyWithStubImpl$Query$Analytics$analytics$visits;

  TRes call({
    int? totalVisits,
    List<Query$Analytics$analytics$visits$monthlyVisits>? monthlyVisits,
    List<Query$Analytics$analytics$visits$topDestinations>? topDestinations,
    double? averageVisitDuration,
    String? $__typename,
  });
  TRes monthlyVisits(
    Iterable<Query$Analytics$analytics$visits$monthlyVisits> Function(
      Iterable<
        CopyWith$Query$Analytics$analytics$visits$monthlyVisits<
          Query$Analytics$analytics$visits$monthlyVisits
        >
      >,
    )
    _fn,
  );
  TRes topDestinations(
    Iterable<Query$Analytics$analytics$visits$topDestinations> Function(
      Iterable<
        CopyWith$Query$Analytics$analytics$visits$topDestinations<
          Query$Analytics$analytics$visits$topDestinations
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$Analytics$analytics$visits<TRes>
    implements CopyWith$Query$Analytics$analytics$visits<TRes> {
  _CopyWithImpl$Query$Analytics$analytics$visits(this._instance, this._then);

  final Query$Analytics$analytics$visits _instance;

  final TRes Function(Query$Analytics$analytics$visits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? totalVisits = _undefined,
    Object? monthlyVisits = _undefined,
    Object? topDestinations = _undefined,
    Object? averageVisitDuration = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Analytics$analytics$visits(
      totalVisits: totalVisits == _undefined || totalVisits == null
          ? _instance.totalVisits
          : (totalVisits as int),
      monthlyVisits: monthlyVisits == _undefined || monthlyVisits == null
          ? _instance.monthlyVisits
          : (monthlyVisits
                as List<Query$Analytics$analytics$visits$monthlyVisits>),
      topDestinations: topDestinations == _undefined || topDestinations == null
          ? _instance.topDestinations
          : (topDestinations
                as List<Query$Analytics$analytics$visits$topDestinations>),
      averageVisitDuration: averageVisitDuration == _undefined
          ? _instance.averageVisitDuration
          : (averageVisitDuration as double?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes monthlyVisits(
    Iterable<Query$Analytics$analytics$visits$monthlyVisits> Function(
      Iterable<
        CopyWith$Query$Analytics$analytics$visits$monthlyVisits<
          Query$Analytics$analytics$visits$monthlyVisits
        >
      >,
    )
    _fn,
  ) => call(
    monthlyVisits: _fn(
      _instance.monthlyVisits.map(
        (e) => CopyWith$Query$Analytics$analytics$visits$monthlyVisits(
          e,
          (i) => i,
        ),
      ),
    ).toList(),
  );

  TRes topDestinations(
    Iterable<Query$Analytics$analytics$visits$topDestinations> Function(
      Iterable<
        CopyWith$Query$Analytics$analytics$visits$topDestinations<
          Query$Analytics$analytics$visits$topDestinations
        >
      >,
    )
    _fn,
  ) => call(
    topDestinations: _fn(
      _instance.topDestinations.map(
        (e) => CopyWith$Query$Analytics$analytics$visits$topDestinations(
          e,
          (i) => i,
        ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$Analytics$analytics$visits<TRes>
    implements CopyWith$Query$Analytics$analytics$visits<TRes> {
  _CopyWithStubImpl$Query$Analytics$analytics$visits(this._res);

  TRes _res;

  call({
    int? totalVisits,
    List<Query$Analytics$analytics$visits$monthlyVisits>? monthlyVisits,
    List<Query$Analytics$analytics$visits$topDestinations>? topDestinations,
    double? averageVisitDuration,
    String? $__typename,
  }) => _res;

  monthlyVisits(_fn) => _res;

  topDestinations(_fn) => _res;
}

class Query$Analytics$analytics$visits$monthlyVisits {
  Query$Analytics$analytics$visits$monthlyVisits({
    required this.month,
    required this.count,
    this.$__typename = 'MonthlyVisit',
  });

  factory Query$Analytics$analytics$visits$monthlyVisits.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$month = json['month'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$Analytics$analytics$visits$monthlyVisits(
      month: (l$month as String),
      count: (l$count as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String month;

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$month = month;
    _resultData['month'] = l$month;
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$month = month;
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([l$month, l$count, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Analytics$analytics$visits$monthlyVisits ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$month = month;
    final lOther$month = other.month;
    if (l$month != lOther$month) {
      return false;
    }
    final l$count = count;
    final lOther$count = other.count;
    if (l$count != lOther$count) {
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

extension UtilityExtension$Query$Analytics$analytics$visits$monthlyVisits
    on Query$Analytics$analytics$visits$monthlyVisits {
  CopyWith$Query$Analytics$analytics$visits$monthlyVisits<
    Query$Analytics$analytics$visits$monthlyVisits
  >
  get copyWith =>
      CopyWith$Query$Analytics$analytics$visits$monthlyVisits(this, (i) => i);
}

abstract class CopyWith$Query$Analytics$analytics$visits$monthlyVisits<TRes> {
  factory CopyWith$Query$Analytics$analytics$visits$monthlyVisits(
    Query$Analytics$analytics$visits$monthlyVisits instance,
    TRes Function(Query$Analytics$analytics$visits$monthlyVisits) then,
  ) = _CopyWithImpl$Query$Analytics$analytics$visits$monthlyVisits;

  factory CopyWith$Query$Analytics$analytics$visits$monthlyVisits.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Analytics$analytics$visits$monthlyVisits;

  TRes call({String? month, int? count, String? $__typename});
}

class _CopyWithImpl$Query$Analytics$analytics$visits$monthlyVisits<TRes>
    implements CopyWith$Query$Analytics$analytics$visits$monthlyVisits<TRes> {
  _CopyWithImpl$Query$Analytics$analytics$visits$monthlyVisits(
    this._instance,
    this._then,
  );

  final Query$Analytics$analytics$visits$monthlyVisits _instance;

  final TRes Function(Query$Analytics$analytics$visits$monthlyVisits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? month = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Analytics$analytics$visits$monthlyVisits(
      month: month == _undefined || month == null
          ? _instance.month
          : (month as String),
      count: count == _undefined || count == null
          ? _instance.count
          : (count as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Analytics$analytics$visits$monthlyVisits<TRes>
    implements CopyWith$Query$Analytics$analytics$visits$monthlyVisits<TRes> {
  _CopyWithStubImpl$Query$Analytics$analytics$visits$monthlyVisits(this._res);

  TRes _res;

  call({String? month, int? count, String? $__typename}) => _res;
}

class Query$Analytics$analytics$visits$topDestinations {
  Query$Analytics$analytics$visits$topDestinations({
    required this.club,
    required this.count,
    this.$__typename = 'ClubVisitCount',
  });

  factory Query$Analytics$analytics$visits$topDestinations.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$club = json['club'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$Analytics$analytics$visits$topDestinations(
      club: Query$Analytics$analytics$visits$topDestinations$club.fromJson(
        (l$club as Map<String, dynamic>),
      ),
      count: (l$count as int),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Analytics$analytics$visits$topDestinations$club club;

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$club = club;
    _resultData['club'] = l$club.toJson();
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$club = club;
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([l$club, l$count, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Analytics$analytics$visits$topDestinations ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$club = club;
    final lOther$club = other.club;
    if (l$club != lOther$club) {
      return false;
    }
    final l$count = count;
    final lOther$count = other.count;
    if (l$count != lOther$count) {
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

extension UtilityExtension$Query$Analytics$analytics$visits$topDestinations
    on Query$Analytics$analytics$visits$topDestinations {
  CopyWith$Query$Analytics$analytics$visits$topDestinations<
    Query$Analytics$analytics$visits$topDestinations
  >
  get copyWith =>
      CopyWith$Query$Analytics$analytics$visits$topDestinations(this, (i) => i);
}

abstract class CopyWith$Query$Analytics$analytics$visits$topDestinations<TRes> {
  factory CopyWith$Query$Analytics$analytics$visits$topDestinations(
    Query$Analytics$analytics$visits$topDestinations instance,
    TRes Function(Query$Analytics$analytics$visits$topDestinations) then,
  ) = _CopyWithImpl$Query$Analytics$analytics$visits$topDestinations;

  factory CopyWith$Query$Analytics$analytics$visits$topDestinations.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Analytics$analytics$visits$topDestinations;

  TRes call({
    Query$Analytics$analytics$visits$topDestinations$club? club,
    int? count,
    String? $__typename,
  });
  CopyWith$Query$Analytics$analytics$visits$topDestinations$club<TRes> get club;
}

class _CopyWithImpl$Query$Analytics$analytics$visits$topDestinations<TRes>
    implements CopyWith$Query$Analytics$analytics$visits$topDestinations<TRes> {
  _CopyWithImpl$Query$Analytics$analytics$visits$topDestinations(
    this._instance,
    this._then,
  );

  final Query$Analytics$analytics$visits$topDestinations _instance;

  final TRes Function(Query$Analytics$analytics$visits$topDestinations) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? club = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Analytics$analytics$visits$topDestinations(
      club: club == _undefined || club == null
          ? _instance.club
          : (club as Query$Analytics$analytics$visits$topDestinations$club),
      count: count == _undefined || count == null
          ? _instance.count
          : (count as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Analytics$analytics$visits$topDestinations$club<TRes>
  get club {
    final local$club = _instance.club;
    return CopyWith$Query$Analytics$analytics$visits$topDestinations$club(
      local$club,
      (e) => call(club: e),
    );
  }
}

class _CopyWithStubImpl$Query$Analytics$analytics$visits$topDestinations<TRes>
    implements CopyWith$Query$Analytics$analytics$visits$topDestinations<TRes> {
  _CopyWithStubImpl$Query$Analytics$analytics$visits$topDestinations(this._res);

  TRes _res;

  call({
    Query$Analytics$analytics$visits$topDestinations$club? club,
    int? count,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Analytics$analytics$visits$topDestinations$club<TRes>
  get club =>
      CopyWith$Query$Analytics$analytics$visits$topDestinations$club.stub(_res);
}

class Query$Analytics$analytics$visits$topDestinations$club {
  Query$Analytics$analytics$visits$topDestinations$club({
    required this.name,
    required this.location,
    this.$__typename = 'Club',
  });

  factory Query$Analytics$analytics$visits$topDestinations$club.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$Analytics$analytics$visits$topDestinations$club(
      name: (l$name as String),
      location: (l$location as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location = location;
    _resultData['location'] = l$location;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([l$name, l$location, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Analytics$analytics$visits$topDestinations$club ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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

extension UtilityExtension$Query$Analytics$analytics$visits$topDestinations$club
    on Query$Analytics$analytics$visits$topDestinations$club {
  CopyWith$Query$Analytics$analytics$visits$topDestinations$club<
    Query$Analytics$analytics$visits$topDestinations$club
  >
  get copyWith =>
      CopyWith$Query$Analytics$analytics$visits$topDestinations$club(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Analytics$analytics$visits$topDestinations$club<
  TRes
> {
  factory CopyWith$Query$Analytics$analytics$visits$topDestinations$club(
    Query$Analytics$analytics$visits$topDestinations$club instance,
    TRes Function(Query$Analytics$analytics$visits$topDestinations$club) then,
  ) = _CopyWithImpl$Query$Analytics$analytics$visits$topDestinations$club;

  factory CopyWith$Query$Analytics$analytics$visits$topDestinations$club.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Analytics$analytics$visits$topDestinations$club;

  TRes call({String? name, String? location, String? $__typename});
}

class _CopyWithImpl$Query$Analytics$analytics$visits$topDestinations$club<TRes>
    implements
        CopyWith$Query$Analytics$analytics$visits$topDestinations$club<TRes> {
  _CopyWithImpl$Query$Analytics$analytics$visits$topDestinations$club(
    this._instance,
    this._then,
  );

  final Query$Analytics$analytics$visits$topDestinations$club _instance;

  final TRes Function(Query$Analytics$analytics$visits$topDestinations$club)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Analytics$analytics$visits$topDestinations$club(
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      location: location == _undefined || location == null
          ? _instance.location
          : (location as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Analytics$analytics$visits$topDestinations$club<
  TRes
>
    implements
        CopyWith$Query$Analytics$analytics$visits$topDestinations$club<TRes> {
  _CopyWithStubImpl$Query$Analytics$analytics$visits$topDestinations$club(
    this._res,
  );

  TRes _res;

  call({String? name, String? location, String? $__typename}) => _res;
}

class Query$Analytics$analytics$members {
  Query$Analytics$analytics$members({
    required this.totalMembers,
    required this.activeMembers,
    required this.newMembersThisMonth,
    required this.membershipDistribution,
    this.$__typename = 'MemberAnalytics',
  });

  factory Query$Analytics$analytics$members.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$totalMembers = json['totalMembers'];
    final l$activeMembers = json['activeMembers'];
    final l$newMembersThisMonth = json['newMembersThisMonth'];
    final l$membershipDistribution = json['membershipDistribution'];
    final l$$__typename = json['__typename'];
    return Query$Analytics$analytics$members(
      totalMembers: (l$totalMembers as int),
      activeMembers: (l$activeMembers as int),
      newMembersThisMonth: (l$newMembersThisMonth as int),
      membershipDistribution: (l$membershipDistribution as List<dynamic>)
          .map(
            (e) =>
                Query$Analytics$analytics$members$membershipDistribution.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int totalMembers;

  final int activeMembers;

  final int newMembersThisMonth;

  final List<Query$Analytics$analytics$members$membershipDistribution>
  membershipDistribution;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$totalMembers = totalMembers;
    _resultData['totalMembers'] = l$totalMembers;
    final l$activeMembers = activeMembers;
    _resultData['activeMembers'] = l$activeMembers;
    final l$newMembersThisMonth = newMembersThisMonth;
    _resultData['newMembersThisMonth'] = l$newMembersThisMonth;
    final l$membershipDistribution = membershipDistribution;
    _resultData['membershipDistribution'] = l$membershipDistribution
        .map((e) => e.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$totalMembers = totalMembers;
    final l$activeMembers = activeMembers;
    final l$newMembersThisMonth = newMembersThisMonth;
    final l$membershipDistribution = membershipDistribution;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$totalMembers,
      l$activeMembers,
      l$newMembersThisMonth,
      Object.hashAll(l$membershipDistribution.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Analytics$analytics$members ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$totalMembers = totalMembers;
    final lOther$totalMembers = other.totalMembers;
    if (l$totalMembers != lOther$totalMembers) {
      return false;
    }
    final l$activeMembers = activeMembers;
    final lOther$activeMembers = other.activeMembers;
    if (l$activeMembers != lOther$activeMembers) {
      return false;
    }
    final l$newMembersThisMonth = newMembersThisMonth;
    final lOther$newMembersThisMonth = other.newMembersThisMonth;
    if (l$newMembersThisMonth != lOther$newMembersThisMonth) {
      return false;
    }
    final l$membershipDistribution = membershipDistribution;
    final lOther$membershipDistribution = other.membershipDistribution;
    if (l$membershipDistribution.length !=
        lOther$membershipDistribution.length) {
      return false;
    }
    for (int i = 0; i < l$membershipDistribution.length; i++) {
      final l$membershipDistribution$entry = l$membershipDistribution[i];
      final lOther$membershipDistribution$entry =
          lOther$membershipDistribution[i];
      if (l$membershipDistribution$entry !=
          lOther$membershipDistribution$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Analytics$analytics$members
    on Query$Analytics$analytics$members {
  CopyWith$Query$Analytics$analytics$members<Query$Analytics$analytics$members>
  get copyWith => CopyWith$Query$Analytics$analytics$members(this, (i) => i);
}

abstract class CopyWith$Query$Analytics$analytics$members<TRes> {
  factory CopyWith$Query$Analytics$analytics$members(
    Query$Analytics$analytics$members instance,
    TRes Function(Query$Analytics$analytics$members) then,
  ) = _CopyWithImpl$Query$Analytics$analytics$members;

  factory CopyWith$Query$Analytics$analytics$members.stub(TRes res) =
      _CopyWithStubImpl$Query$Analytics$analytics$members;

  TRes call({
    int? totalMembers,
    int? activeMembers,
    int? newMembersThisMonth,
    List<Query$Analytics$analytics$members$membershipDistribution>?
    membershipDistribution,
    String? $__typename,
  });
  TRes membershipDistribution(
    Iterable<Query$Analytics$analytics$members$membershipDistribution> Function(
      Iterable<
        CopyWith$Query$Analytics$analytics$members$membershipDistribution<
          Query$Analytics$analytics$members$membershipDistribution
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$Analytics$analytics$members<TRes>
    implements CopyWith$Query$Analytics$analytics$members<TRes> {
  _CopyWithImpl$Query$Analytics$analytics$members(this._instance, this._then);

  final Query$Analytics$analytics$members _instance;

  final TRes Function(Query$Analytics$analytics$members) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? totalMembers = _undefined,
    Object? activeMembers = _undefined,
    Object? newMembersThisMonth = _undefined,
    Object? membershipDistribution = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Analytics$analytics$members(
      totalMembers: totalMembers == _undefined || totalMembers == null
          ? _instance.totalMembers
          : (totalMembers as int),
      activeMembers: activeMembers == _undefined || activeMembers == null
          ? _instance.activeMembers
          : (activeMembers as int),
      newMembersThisMonth:
          newMembersThisMonth == _undefined || newMembersThisMonth == null
          ? _instance.newMembersThisMonth
          : (newMembersThisMonth as int),
      membershipDistribution:
          membershipDistribution == _undefined || membershipDistribution == null
          ? _instance.membershipDistribution
          : (membershipDistribution
                as List<
                  Query$Analytics$analytics$members$membershipDistribution
                >),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes membershipDistribution(
    Iterable<Query$Analytics$analytics$members$membershipDistribution> Function(
      Iterable<
        CopyWith$Query$Analytics$analytics$members$membershipDistribution<
          Query$Analytics$analytics$members$membershipDistribution
        >
      >,
    )
    _fn,
  ) => call(
    membershipDistribution: _fn(
      _instance.membershipDistribution.map(
        (e) =>
            CopyWith$Query$Analytics$analytics$members$membershipDistribution(
              e,
              (i) => i,
            ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$Analytics$analytics$members<TRes>
    implements CopyWith$Query$Analytics$analytics$members<TRes> {
  _CopyWithStubImpl$Query$Analytics$analytics$members(this._res);

  TRes _res;

  call({
    int? totalMembers,
    int? activeMembers,
    int? newMembersThisMonth,
    List<Query$Analytics$analytics$members$membershipDistribution>?
    membershipDistribution,
    String? $__typename,
  }) => _res;

  membershipDistribution(_fn) => _res;
}

class Query$Analytics$analytics$members$membershipDistribution {
  Query$Analytics$analytics$members$membershipDistribution({
    required this.type,
    required this.count,
    this.$__typename = 'MembershipTypeCount',
  });

  factory Query$Analytics$analytics$members$membershipDistribution.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$type = json['type'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$Analytics$analytics$members$membershipDistribution(
      type: fromJson$Enum$MembershipType((l$type as String)),
      count: (l$count as int),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$MembershipType type;

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$MembershipType(l$type);
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([l$type, l$count, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Analytics$analytics$members$membershipDistribution ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$count = count;
    final lOther$count = other.count;
    if (l$count != lOther$count) {
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

extension UtilityExtension$Query$Analytics$analytics$members$membershipDistribution
    on Query$Analytics$analytics$members$membershipDistribution {
  CopyWith$Query$Analytics$analytics$members$membershipDistribution<
    Query$Analytics$analytics$members$membershipDistribution
  >
  get copyWith =>
      CopyWith$Query$Analytics$analytics$members$membershipDistribution(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Analytics$analytics$members$membershipDistribution<
  TRes
> {
  factory CopyWith$Query$Analytics$analytics$members$membershipDistribution(
    Query$Analytics$analytics$members$membershipDistribution instance,
    TRes Function(Query$Analytics$analytics$members$membershipDistribution)
    then,
  ) = _CopyWithImpl$Query$Analytics$analytics$members$membershipDistribution;

  factory CopyWith$Query$Analytics$analytics$members$membershipDistribution.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Analytics$analytics$members$membershipDistribution;

  TRes call({Enum$MembershipType? type, int? count, String? $__typename});
}

class _CopyWithImpl$Query$Analytics$analytics$members$membershipDistribution<
  TRes
>
    implements
        CopyWith$Query$Analytics$analytics$members$membershipDistribution<
          TRes
        > {
  _CopyWithImpl$Query$Analytics$analytics$members$membershipDistribution(
    this._instance,
    this._then,
  );

  final Query$Analytics$analytics$members$membershipDistribution _instance;

  final TRes Function(Query$Analytics$analytics$members$membershipDistribution)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Analytics$analytics$members$membershipDistribution(
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$MembershipType),
      count: count == _undefined || count == null
          ? _instance.count
          : (count as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Analytics$analytics$members$membershipDistribution<
  TRes
>
    implements
        CopyWith$Query$Analytics$analytics$members$membershipDistribution<
          TRes
        > {
  _CopyWithStubImpl$Query$Analytics$analytics$members$membershipDistribution(
    this._res,
  );

  TRes _res;

  call({Enum$MembershipType? type, int? count, String? $__typename}) => _res;
}

class Query$Analytics$analytics$reciprocals {
  Query$Analytics$analytics$reciprocals({
    required this.totalAgreements,
    required this.activeAgreements,
    required this.pendingAgreements,
    required this.monthlyReciprocalUsage,
    this.$__typename = 'ReciprocalAnalytics',
  });

  factory Query$Analytics$analytics$reciprocals.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$totalAgreements = json['totalAgreements'];
    final l$activeAgreements = json['activeAgreements'];
    final l$pendingAgreements = json['pendingAgreements'];
    final l$monthlyReciprocalUsage = json['monthlyReciprocalUsage'];
    final l$$__typename = json['__typename'];
    return Query$Analytics$analytics$reciprocals(
      totalAgreements: (l$totalAgreements as int),
      activeAgreements: (l$activeAgreements as int),
      pendingAgreements: (l$pendingAgreements as int),
      monthlyReciprocalUsage: (l$monthlyReciprocalUsage as List<dynamic>)
          .map(
            (e) =>
                Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int totalAgreements;

  final int activeAgreements;

  final int pendingAgreements;

  final List<Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage>
  monthlyReciprocalUsage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$totalAgreements = totalAgreements;
    _resultData['totalAgreements'] = l$totalAgreements;
    final l$activeAgreements = activeAgreements;
    _resultData['activeAgreements'] = l$activeAgreements;
    final l$pendingAgreements = pendingAgreements;
    _resultData['pendingAgreements'] = l$pendingAgreements;
    final l$monthlyReciprocalUsage = monthlyReciprocalUsage;
    _resultData['monthlyReciprocalUsage'] = l$monthlyReciprocalUsage
        .map((e) => e.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$totalAgreements = totalAgreements;
    final l$activeAgreements = activeAgreements;
    final l$pendingAgreements = pendingAgreements;
    final l$monthlyReciprocalUsage = monthlyReciprocalUsage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$totalAgreements,
      l$activeAgreements,
      l$pendingAgreements,
      Object.hashAll(l$monthlyReciprocalUsage.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Analytics$analytics$reciprocals ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$totalAgreements = totalAgreements;
    final lOther$totalAgreements = other.totalAgreements;
    if (l$totalAgreements != lOther$totalAgreements) {
      return false;
    }
    final l$activeAgreements = activeAgreements;
    final lOther$activeAgreements = other.activeAgreements;
    if (l$activeAgreements != lOther$activeAgreements) {
      return false;
    }
    final l$pendingAgreements = pendingAgreements;
    final lOther$pendingAgreements = other.pendingAgreements;
    if (l$pendingAgreements != lOther$pendingAgreements) {
      return false;
    }
    final l$monthlyReciprocalUsage = monthlyReciprocalUsage;
    final lOther$monthlyReciprocalUsage = other.monthlyReciprocalUsage;
    if (l$monthlyReciprocalUsage.length !=
        lOther$monthlyReciprocalUsage.length) {
      return false;
    }
    for (int i = 0; i < l$monthlyReciprocalUsage.length; i++) {
      final l$monthlyReciprocalUsage$entry = l$monthlyReciprocalUsage[i];
      final lOther$monthlyReciprocalUsage$entry =
          lOther$monthlyReciprocalUsage[i];
      if (l$monthlyReciprocalUsage$entry !=
          lOther$monthlyReciprocalUsage$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Analytics$analytics$reciprocals
    on Query$Analytics$analytics$reciprocals {
  CopyWith$Query$Analytics$analytics$reciprocals<
    Query$Analytics$analytics$reciprocals
  >
  get copyWith =>
      CopyWith$Query$Analytics$analytics$reciprocals(this, (i) => i);
}

abstract class CopyWith$Query$Analytics$analytics$reciprocals<TRes> {
  factory CopyWith$Query$Analytics$analytics$reciprocals(
    Query$Analytics$analytics$reciprocals instance,
    TRes Function(Query$Analytics$analytics$reciprocals) then,
  ) = _CopyWithImpl$Query$Analytics$analytics$reciprocals;

  factory CopyWith$Query$Analytics$analytics$reciprocals.stub(TRes res) =
      _CopyWithStubImpl$Query$Analytics$analytics$reciprocals;

  TRes call({
    int? totalAgreements,
    int? activeAgreements,
    int? pendingAgreements,
    List<Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage>?
    monthlyReciprocalUsage,
    String? $__typename,
  });
  TRes monthlyReciprocalUsage(
    Iterable<Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage>
    Function(
      Iterable<
        CopyWith$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage<
          Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$Analytics$analytics$reciprocals<TRes>
    implements CopyWith$Query$Analytics$analytics$reciprocals<TRes> {
  _CopyWithImpl$Query$Analytics$analytics$reciprocals(
    this._instance,
    this._then,
  );

  final Query$Analytics$analytics$reciprocals _instance;

  final TRes Function(Query$Analytics$analytics$reciprocals) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? totalAgreements = _undefined,
    Object? activeAgreements = _undefined,
    Object? pendingAgreements = _undefined,
    Object? monthlyReciprocalUsage = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Analytics$analytics$reciprocals(
      totalAgreements: totalAgreements == _undefined || totalAgreements == null
          ? _instance.totalAgreements
          : (totalAgreements as int),
      activeAgreements:
          activeAgreements == _undefined || activeAgreements == null
          ? _instance.activeAgreements
          : (activeAgreements as int),
      pendingAgreements:
          pendingAgreements == _undefined || pendingAgreements == null
          ? _instance.pendingAgreements
          : (pendingAgreements as int),
      monthlyReciprocalUsage:
          monthlyReciprocalUsage == _undefined || monthlyReciprocalUsage == null
          ? _instance.monthlyReciprocalUsage
          : (monthlyReciprocalUsage
                as List<
                  Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage
                >),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes monthlyReciprocalUsage(
    Iterable<Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage>
    Function(
      Iterable<
        CopyWith$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage<
          Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage
        >
      >,
    )
    _fn,
  ) => call(
    monthlyReciprocalUsage: _fn(
      _instance.monthlyReciprocalUsage.map(
        (e) =>
            CopyWith$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage(
              e,
              (i) => i,
            ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$Analytics$analytics$reciprocals<TRes>
    implements CopyWith$Query$Analytics$analytics$reciprocals<TRes> {
  _CopyWithStubImpl$Query$Analytics$analytics$reciprocals(this._res);

  TRes _res;

  call({
    int? totalAgreements,
    int? activeAgreements,
    int? pendingAgreements,
    List<Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage>?
    monthlyReciprocalUsage,
    String? $__typename,
  }) => _res;

  monthlyReciprocalUsage(_fn) => _res;
}

class Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage {
  Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage({
    required this.month,
    required this.count,
    this.$__typename = 'MonthlyVisit',
  });

  factory Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$month = json['month'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage(
      month: (l$month as String),
      count: (l$count as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String month;

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$month = month;
    _resultData['month'] = l$month;
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$month = month;
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([l$month, l$count, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$month = month;
    final lOther$month = other.month;
    if (l$month != lOther$month) {
      return false;
    }
    final l$count = count;
    final lOther$count = other.count;
    if (l$count != lOther$count) {
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

extension UtilityExtension$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage
    on Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage {
  CopyWith$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage<
    Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage
  >
  get copyWith =>
      CopyWith$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage<
  TRes
> {
  factory CopyWith$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage(
    Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage instance,
    TRes Function(Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage)
    then,
  ) = _CopyWithImpl$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage;

  factory CopyWith$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage;

  TRes call({String? month, int? count, String? $__typename});
}

class _CopyWithImpl$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage<
  TRes
>
    implements
        CopyWith$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage<
          TRes
        > {
  _CopyWithImpl$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage(
    this._instance,
    this._then,
  );

  final Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage _instance;

  final TRes Function(
    Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? month = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage(
      month: month == _undefined || month == null
          ? _instance.month
          : (month as String),
      count: count == _undefined || count == null
          ? _instance.count
          : (count as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage<
  TRes
>
    implements
        CopyWith$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage<
          TRes
        > {
  _CopyWithStubImpl$Query$Analytics$analytics$reciprocals$monthlyReciprocalUsage(
    this._res,
  );

  TRes _res;

  call({String? month, int? count, String? $__typename}) => _res;
}
