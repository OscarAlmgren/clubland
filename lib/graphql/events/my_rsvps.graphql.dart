import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$MyRSVPs {
  factory Variables$Query$MyRSVPs({
    required String clubId,
    List<Enum$RSVPStatus>? status,
    required Input$PaginationInput pagination,
  }) => Variables$Query$MyRSVPs._({
    r'clubId': clubId,
    if (status != null) r'status': status,
    r'pagination': pagination,
  });

  Variables$Query$MyRSVPs._(this._$data);

  factory Variables$Query$MyRSVPs.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$clubId = data['clubId'];
    result$data['clubId'] = (l$clubId as String);
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = (l$status as List<dynamic>?)
          ?.map((e) => fromJson$Enum$RSVPStatus((e as String)))
          .toList();
    }
    final l$pagination = data['pagination'];
    result$data['pagination'] = Input$PaginationInput.fromJson(
      (l$pagination as Map<String, dynamic>),
    );
    return Variables$Query$MyRSVPs._(result$data);
  }

  Map<String, dynamic> _$data;

  String get clubId => (_$data['clubId'] as String);

  List<Enum$RSVPStatus>? get status =>
      (_$data['status'] as List<Enum$RSVPStatus>?);

  Input$PaginationInput get pagination =>
      (_$data['pagination'] as Input$PaginationInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$clubId = clubId;
    result$data['clubId'] = l$clubId;
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status
          ?.map((e) => toJson$Enum$RSVPStatus(e))
          .toList();
    }
    final l$pagination = pagination;
    result$data['pagination'] = l$pagination.toJson();
    return result$data;
  }

  CopyWith$Variables$Query$MyRSVPs<Variables$Query$MyRSVPs> get copyWith =>
      CopyWith$Variables$Query$MyRSVPs(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$MyRSVPs || runtimeType != other.runtimeType) {
      return false;
    }
    final l$clubId = clubId;
    final lOther$clubId = other.clubId;
    if (l$clubId != lOther$clubId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != null && lOther$status != null) {
      if (l$status.length != lOther$status.length) {
        return false;
      }
      for (int i = 0; i < l$status.length; i++) {
        final l$status$entry = l$status[i];
        final lOther$status$entry = lOther$status[i];
        if (l$status$entry != lOther$status$entry) {
          return false;
        }
      }
    } else if (l$status != lOther$status) {
      return false;
    }
    final l$pagination = pagination;
    final lOther$pagination = other.pagination;
    if (l$pagination != lOther$pagination) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$clubId = clubId;
    final l$status = status;
    final l$pagination = pagination;
    return Object.hashAll([
      l$clubId,
      _$data.containsKey('status')
          ? l$status == null
                ? null
                : Object.hashAll(l$status.map((v) => v))
          : const {},
      l$pagination,
    ]);
  }
}

abstract class CopyWith$Variables$Query$MyRSVPs<TRes> {
  factory CopyWith$Variables$Query$MyRSVPs(
    Variables$Query$MyRSVPs instance,
    TRes Function(Variables$Query$MyRSVPs) then,
  ) = _CopyWithImpl$Variables$Query$MyRSVPs;

  factory CopyWith$Variables$Query$MyRSVPs.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$MyRSVPs;

  TRes call({
    String? clubId,
    List<Enum$RSVPStatus>? status,
    Input$PaginationInput? pagination,
  });
}

class _CopyWithImpl$Variables$Query$MyRSVPs<TRes>
    implements CopyWith$Variables$Query$MyRSVPs<TRes> {
  _CopyWithImpl$Variables$Query$MyRSVPs(this._instance, this._then);

  final Variables$Query$MyRSVPs _instance;

  final TRes Function(Variables$Query$MyRSVPs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? clubId = _undefined,
    Object? status = _undefined,
    Object? pagination = _undefined,
  }) => _then(
    Variables$Query$MyRSVPs._({
      ..._instance._$data,
      if (clubId != _undefined && clubId != null) 'clubId': (clubId as String),
      if (status != _undefined) 'status': (status as List<Enum$RSVPStatus>?),
      if (pagination != _undefined && pagination != null)
        'pagination': (pagination as Input$PaginationInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$MyRSVPs<TRes>
    implements CopyWith$Variables$Query$MyRSVPs<TRes> {
  _CopyWithStubImpl$Variables$Query$MyRSVPs(this._res);

  TRes _res;

  call({
    String? clubId,
    List<Enum$RSVPStatus>? status,
    Input$PaginationInput? pagination,
  }) => _res;
}

class Query$MyRSVPs {
  Query$MyRSVPs({required this.myRSVPs, this.$__typename = 'Query'});

  factory Query$MyRSVPs.fromJson(Map<String, dynamic> json) {
    final l$myRSVPs = json['myRSVPs'];
    final l$$__typename = json['__typename'];
    return Query$MyRSVPs(
      myRSVPs: Query$MyRSVPs$myRSVPs.fromJson(
        (l$myRSVPs as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MyRSVPs$myRSVPs myRSVPs;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myRSVPs = myRSVPs;
    _resultData['myRSVPs'] = l$myRSVPs.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myRSVPs = myRSVPs;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myRSVPs, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyRSVPs || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myRSVPs = myRSVPs;
    final lOther$myRSVPs = other.myRSVPs;
    if (l$myRSVPs != lOther$myRSVPs) {
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

extension UtilityExtension$Query$MyRSVPs on Query$MyRSVPs {
  CopyWith$Query$MyRSVPs<Query$MyRSVPs> get copyWith =>
      CopyWith$Query$MyRSVPs(this, (i) => i);
}

abstract class CopyWith$Query$MyRSVPs<TRes> {
  factory CopyWith$Query$MyRSVPs(
    Query$MyRSVPs instance,
    TRes Function(Query$MyRSVPs) then,
  ) = _CopyWithImpl$Query$MyRSVPs;

  factory CopyWith$Query$MyRSVPs.stub(TRes res) =
      _CopyWithStubImpl$Query$MyRSVPs;

  TRes call({Query$MyRSVPs$myRSVPs? myRSVPs, String? $__typename});
  CopyWith$Query$MyRSVPs$myRSVPs<TRes> get myRSVPs;
}

class _CopyWithImpl$Query$MyRSVPs<TRes>
    implements CopyWith$Query$MyRSVPs<TRes> {
  _CopyWithImpl$Query$MyRSVPs(this._instance, this._then);

  final Query$MyRSVPs _instance;

  final TRes Function(Query$MyRSVPs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? myRSVPs = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$MyRSVPs(
          myRSVPs: myRSVPs == _undefined || myRSVPs == null
              ? _instance.myRSVPs
              : (myRSVPs as Query$MyRSVPs$myRSVPs),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$MyRSVPs$myRSVPs<TRes> get myRSVPs {
    final local$myRSVPs = _instance.myRSVPs;
    return CopyWith$Query$MyRSVPs$myRSVPs(
      local$myRSVPs,
      (e) => call(myRSVPs: e),
    );
  }
}

class _CopyWithStubImpl$Query$MyRSVPs<TRes>
    implements CopyWith$Query$MyRSVPs<TRes> {
  _CopyWithStubImpl$Query$MyRSVPs(this._res);

  TRes _res;

  call({Query$MyRSVPs$myRSVPs? myRSVPs, String? $__typename}) => _res;

  CopyWith$Query$MyRSVPs$myRSVPs<TRes> get myRSVPs =>
      CopyWith$Query$MyRSVPs$myRSVPs.stub(_res);
}

const documentNodeQueryMyRSVPs = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyRSVPs'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'clubId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'status')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'RSVPStatus'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'pagination')),
          type: NamedTypeNode(
            name: NameNode(value: 'PaginationInput'),
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
            name: NameNode(value: 'myRSVPs'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'clubId'),
                value: VariableNode(name: NameNode(value: 'clubId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'status'),
                value: VariableNode(name: NameNode(value: 'status')),
              ),
              ArgumentNode(
                name: NameNode(value: 'pagination'),
                value: VariableNode(name: NameNode(value: 'pagination')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'node'),
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
                  name: NameNode(value: 'pageInfo'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'hasNextPage'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'hasPreviousPage'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'startCursor'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'endCursor'),
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
                  name: NameNode(value: 'totalCount'),
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
Query$MyRSVPs _parserFn$Query$MyRSVPs(Map<String, dynamic> data) =>
    Query$MyRSVPs.fromJson(data);
typedef OnQueryComplete$Query$MyRSVPs =
    FutureOr<void> Function(Map<String, dynamic>?, Query$MyRSVPs?);

class Options$Query$MyRSVPs extends graphql.QueryOptions<Query$MyRSVPs> {
  Options$Query$MyRSVPs({
    String? operationName,
    required Variables$Query$MyRSVPs variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MyRSVPs? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$MyRSVPs? onComplete,
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
                 data == null ? null : _parserFn$Query$MyRSVPs(data),
               ),
         onError: onError,
         document: documentNodeQueryMyRSVPs,
         parserFn: _parserFn$Query$MyRSVPs,
       );

  final OnQueryComplete$Query$MyRSVPs? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$MyRSVPs
    extends graphql.WatchQueryOptions<Query$MyRSVPs> {
  WatchOptions$Query$MyRSVPs({
    String? operationName,
    required Variables$Query$MyRSVPs variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MyRSVPs? typedOptimisticResult,
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
         document: documentNodeQueryMyRSVPs,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$MyRSVPs,
       );
}

class FetchMoreOptions$Query$MyRSVPs extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$MyRSVPs({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$MyRSVPs variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryMyRSVPs,
       );
}

extension ClientExtension$Query$MyRSVPs on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$MyRSVPs>> query$MyRSVPs(
    Options$Query$MyRSVPs options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$MyRSVPs> watchQuery$MyRSVPs(
    WatchOptions$Query$MyRSVPs options,
  ) => this.watchQuery(options);

  void writeQuery$MyRSVPs({
    required Query$MyRSVPs data,
    required Variables$Query$MyRSVPs variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryMyRSVPs),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$MyRSVPs? readQuery$MyRSVPs({
    required Variables$Query$MyRSVPs variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMyRSVPs),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$MyRSVPs.fromJson(result);
  }
}

class Query$MyRSVPs$myRSVPs {
  Query$MyRSVPs$myRSVPs({
    required this.edges,
    required this.pageInfo,
    required this.totalCount,
    this.$__typename = 'RSVPConnection',
  });

  factory Query$MyRSVPs$myRSVPs.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$totalCount = json['totalCount'];
    final l$$__typename = json['__typename'];
    return Query$MyRSVPs$myRSVPs(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => Query$MyRSVPs$myRSVPs$edges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$MyRSVPs$myRSVPs$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      totalCount: (l$totalCount as int),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MyRSVPs$myRSVPs$edges> edges;

  final Query$MyRSVPs$myRSVPs$pageInfo pageInfo;

  final int totalCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$totalCount = totalCount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$totalCount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyRSVPs$myRSVPs || runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$totalCount = totalCount;
    final lOther$totalCount = other.totalCount;
    if (l$totalCount != lOther$totalCount) {
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

extension UtilityExtension$Query$MyRSVPs$myRSVPs on Query$MyRSVPs$myRSVPs {
  CopyWith$Query$MyRSVPs$myRSVPs<Query$MyRSVPs$myRSVPs> get copyWith =>
      CopyWith$Query$MyRSVPs$myRSVPs(this, (i) => i);
}

abstract class CopyWith$Query$MyRSVPs$myRSVPs<TRes> {
  factory CopyWith$Query$MyRSVPs$myRSVPs(
    Query$MyRSVPs$myRSVPs instance,
    TRes Function(Query$MyRSVPs$myRSVPs) then,
  ) = _CopyWithImpl$Query$MyRSVPs$myRSVPs;

  factory CopyWith$Query$MyRSVPs$myRSVPs.stub(TRes res) =
      _CopyWithStubImpl$Query$MyRSVPs$myRSVPs;

  TRes call({
    List<Query$MyRSVPs$myRSVPs$edges>? edges,
    Query$MyRSVPs$myRSVPs$pageInfo? pageInfo,
    int? totalCount,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$MyRSVPs$myRSVPs$edges> Function(
      Iterable<
        CopyWith$Query$MyRSVPs$myRSVPs$edges<Query$MyRSVPs$myRSVPs$edges>
      >,
    )
    _fn,
  );
  CopyWith$Query$MyRSVPs$myRSVPs$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$MyRSVPs$myRSVPs<TRes>
    implements CopyWith$Query$MyRSVPs$myRSVPs<TRes> {
  _CopyWithImpl$Query$MyRSVPs$myRSVPs(this._instance, this._then);

  final Query$MyRSVPs$myRSVPs _instance;

  final TRes Function(Query$MyRSVPs$myRSVPs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? totalCount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyRSVPs$myRSVPs(
      edges: edges == _undefined || edges == null
          ? _instance.edges
          : (edges as List<Query$MyRSVPs$myRSVPs$edges>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$MyRSVPs$myRSVPs$pageInfo),
      totalCount: totalCount == _undefined || totalCount == null
          ? _instance.totalCount
          : (totalCount as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$MyRSVPs$myRSVPs$edges> Function(
      Iterable<
        CopyWith$Query$MyRSVPs$myRSVPs$edges<Query$MyRSVPs$myRSVPs$edges>
      >,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges.map(
        (e) => CopyWith$Query$MyRSVPs$myRSVPs$edges(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$MyRSVPs$myRSVPs$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$MyRSVPs$myRSVPs$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$MyRSVPs$myRSVPs<TRes>
    implements CopyWith$Query$MyRSVPs$myRSVPs<TRes> {
  _CopyWithStubImpl$Query$MyRSVPs$myRSVPs(this._res);

  TRes _res;

  call({
    List<Query$MyRSVPs$myRSVPs$edges>? edges,
    Query$MyRSVPs$myRSVPs$pageInfo? pageInfo,
    int? totalCount,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$MyRSVPs$myRSVPs$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$MyRSVPs$myRSVPs$pageInfo.stub(_res);
}

class Query$MyRSVPs$myRSVPs$edges {
  Query$MyRSVPs$myRSVPs$edges({
    required this.node,
    this.$__typename = 'RSVPEdge',
  });

  factory Query$MyRSVPs$myRSVPs$edges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$MyRSVPs$myRSVPs$edges(
      node: Query$MyRSVPs$myRSVPs$edges$node.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MyRSVPs$myRSVPs$edges$node node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([l$node, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyRSVPs$myRSVPs$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
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

extension UtilityExtension$Query$MyRSVPs$myRSVPs$edges
    on Query$MyRSVPs$myRSVPs$edges {
  CopyWith$Query$MyRSVPs$myRSVPs$edges<Query$MyRSVPs$myRSVPs$edges>
  get copyWith => CopyWith$Query$MyRSVPs$myRSVPs$edges(this, (i) => i);
}

abstract class CopyWith$Query$MyRSVPs$myRSVPs$edges<TRes> {
  factory CopyWith$Query$MyRSVPs$myRSVPs$edges(
    Query$MyRSVPs$myRSVPs$edges instance,
    TRes Function(Query$MyRSVPs$myRSVPs$edges) then,
  ) = _CopyWithImpl$Query$MyRSVPs$myRSVPs$edges;

  factory CopyWith$Query$MyRSVPs$myRSVPs$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$MyRSVPs$myRSVPs$edges;

  TRes call({Query$MyRSVPs$myRSVPs$edges$node? node, String? $__typename});
  CopyWith$Query$MyRSVPs$myRSVPs$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$MyRSVPs$myRSVPs$edges<TRes>
    implements CopyWith$Query$MyRSVPs$myRSVPs$edges<TRes> {
  _CopyWithImpl$Query$MyRSVPs$myRSVPs$edges(this._instance, this._then);

  final Query$MyRSVPs$myRSVPs$edges _instance;

  final TRes Function(Query$MyRSVPs$myRSVPs$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$MyRSVPs$myRSVPs$edges(
          node: node == _undefined || node == null
              ? _instance.node
              : (node as Query$MyRSVPs$myRSVPs$edges$node),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$MyRSVPs$myRSVPs$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$MyRSVPs$myRSVPs$edges$node(
      local$node,
      (e) => call(node: e),
    );
  }
}

class _CopyWithStubImpl$Query$MyRSVPs$myRSVPs$edges<TRes>
    implements CopyWith$Query$MyRSVPs$myRSVPs$edges<TRes> {
  _CopyWithStubImpl$Query$MyRSVPs$myRSVPs$edges(this._res);

  TRes _res;

  call({Query$MyRSVPs$myRSVPs$edges$node? node, String? $__typename}) => _res;

  CopyWith$Query$MyRSVPs$myRSVPs$edges$node<TRes> get node =>
      CopyWith$Query$MyRSVPs$myRSVPs$edges$node.stub(_res);
}

class Query$MyRSVPs$myRSVPs$edges$node {
  Query$MyRSVPs$myRSVPs$edges$node({
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
    this.$__typename = 'RSVP',
  });

  factory Query$MyRSVPs$myRSVPs$edges$node.fromJson(Map<String, dynamic> json) {
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
    final l$$__typename = json['__typename'];
    return Query$MyRSVPs$myRSVPs$edges$node(
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
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyRSVPs$myRSVPs$edges$node ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MyRSVPs$myRSVPs$edges$node
    on Query$MyRSVPs$myRSVPs$edges$node {
  CopyWith$Query$MyRSVPs$myRSVPs$edges$node<Query$MyRSVPs$myRSVPs$edges$node>
  get copyWith => CopyWith$Query$MyRSVPs$myRSVPs$edges$node(this, (i) => i);
}

abstract class CopyWith$Query$MyRSVPs$myRSVPs$edges$node<TRes> {
  factory CopyWith$Query$MyRSVPs$myRSVPs$edges$node(
    Query$MyRSVPs$myRSVPs$edges$node instance,
    TRes Function(Query$MyRSVPs$myRSVPs$edges$node) then,
  ) = _CopyWithImpl$Query$MyRSVPs$myRSVPs$edges$node;

  factory CopyWith$Query$MyRSVPs$myRSVPs$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$MyRSVPs$myRSVPs$edges$node;

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
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MyRSVPs$myRSVPs$edges$node<TRes>
    implements CopyWith$Query$MyRSVPs$myRSVPs$edges$node<TRes> {
  _CopyWithImpl$Query$MyRSVPs$myRSVPs$edges$node(this._instance, this._then);

  final Query$MyRSVPs$myRSVPs$edges$node _instance;

  final TRes Function(Query$MyRSVPs$myRSVPs$edges$node) _then;

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
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyRSVPs$myRSVPs$edges$node(
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
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$MyRSVPs$myRSVPs$edges$node<TRes>
    implements CopyWith$Query$MyRSVPs$myRSVPs$edges$node<TRes> {
  _CopyWithStubImpl$Query$MyRSVPs$myRSVPs$edges$node(this._res);

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
    String? $__typename,
  }) => _res;
}

class Query$MyRSVPs$myRSVPs$pageInfo {
  Query$MyRSVPs$myRSVPs$pageInfo({
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.startCursor,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$MyRSVPs$myRSVPs$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$startCursor = json['startCursor'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$MyRSVPs$myRSVPs$pageInfo(
      hasNextPage: (l$hasNextPage as bool),
      hasPreviousPage: (l$hasPreviousPage as bool),
      startCursor: (l$startCursor as String?),
      endCursor: (l$endCursor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final bool hasPreviousPage;

  final String? startCursor;

  final String? endCursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$hasPreviousPage = hasPreviousPage;
    _resultData['hasPreviousPage'] = l$hasPreviousPage;
    final l$startCursor = startCursor;
    _resultData['startCursor'] = l$startCursor;
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$hasPreviousPage = hasPreviousPage;
    final l$startCursor = startCursor;
    final l$endCursor = endCursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$hasNextPage,
      l$hasPreviousPage,
      l$startCursor,
      l$endCursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyRSVPs$myRSVPs$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$hasPreviousPage = hasPreviousPage;
    final lOther$hasPreviousPage = other.hasPreviousPage;
    if (l$hasPreviousPage != lOther$hasPreviousPage) {
      return false;
    }
    final l$startCursor = startCursor;
    final lOther$startCursor = other.startCursor;
    if (l$startCursor != lOther$startCursor) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
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

extension UtilityExtension$Query$MyRSVPs$myRSVPs$pageInfo
    on Query$MyRSVPs$myRSVPs$pageInfo {
  CopyWith$Query$MyRSVPs$myRSVPs$pageInfo<Query$MyRSVPs$myRSVPs$pageInfo>
  get copyWith => CopyWith$Query$MyRSVPs$myRSVPs$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$MyRSVPs$myRSVPs$pageInfo<TRes> {
  factory CopyWith$Query$MyRSVPs$myRSVPs$pageInfo(
    Query$MyRSVPs$myRSVPs$pageInfo instance,
    TRes Function(Query$MyRSVPs$myRSVPs$pageInfo) then,
  ) = _CopyWithImpl$Query$MyRSVPs$myRSVPs$pageInfo;

  factory CopyWith$Query$MyRSVPs$myRSVPs$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$MyRSVPs$myRSVPs$pageInfo;

  TRes call({
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? endCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MyRSVPs$myRSVPs$pageInfo<TRes>
    implements CopyWith$Query$MyRSVPs$myRSVPs$pageInfo<TRes> {
  _CopyWithImpl$Query$MyRSVPs$myRSVPs$pageInfo(this._instance, this._then);

  final Query$MyRSVPs$myRSVPs$pageInfo _instance;

  final TRes Function(Query$MyRSVPs$myRSVPs$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? startCursor = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyRSVPs$myRSVPs$pageInfo(
      hasNextPage: hasNextPage == _undefined || hasNextPage == null
          ? _instance.hasNextPage
          : (hasNextPage as bool),
      hasPreviousPage: hasPreviousPage == _undefined || hasPreviousPage == null
          ? _instance.hasPreviousPage
          : (hasPreviousPage as bool),
      startCursor: startCursor == _undefined
          ? _instance.startCursor
          : (startCursor as String?),
      endCursor: endCursor == _undefined
          ? _instance.endCursor
          : (endCursor as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$MyRSVPs$myRSVPs$pageInfo<TRes>
    implements CopyWith$Query$MyRSVPs$myRSVPs$pageInfo<TRes> {
  _CopyWithStubImpl$Query$MyRSVPs$myRSVPs$pageInfo(this._res);

  TRes _res;

  call({
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? endCursor,
    String? $__typename,
  }) => _res;
}
