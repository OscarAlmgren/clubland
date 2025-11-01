import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$ReciprocalAgreements {
  factory Variables$Query$ReciprocalAgreements({
    Input$PaginationInput? pagination,
    Enum$AgreementStatus? status,
  }) => Variables$Query$ReciprocalAgreements._({
    if (pagination != null) r'pagination': pagination,
    if (status != null) r'status': status,
  });

  Variables$Query$ReciprocalAgreements._(this._$data);

  factory Variables$Query$ReciprocalAgreements.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('pagination')) {
      final l$pagination = data['pagination'];
      result$data['pagination'] = l$pagination == null
          ? null
          : Input$PaginationInput.fromJson(
              (l$pagination as Map<String, dynamic>),
            );
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$AgreementStatus((l$status as String));
    }
    return Variables$Query$ReciprocalAgreements._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Enum$AgreementStatus? get status =>
      (_$data['status'] as Enum$AgreementStatus?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('pagination')) {
      final l$pagination = pagination;
      result$data['pagination'] = l$pagination?.toJson();
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$AgreementStatus(l$status);
    }
    return result$data;
  }

  CopyWith$Variables$Query$ReciprocalAgreements<
    Variables$Query$ReciprocalAgreements
  >
  get copyWith => CopyWith$Variables$Query$ReciprocalAgreements(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$ReciprocalAgreements ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$pagination = pagination;
    final lOther$pagination = other.pagination;
    if (_$data.containsKey('pagination') !=
        other._$data.containsKey('pagination')) {
      return false;
    }
    if (l$pagination != lOther$pagination) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$pagination = pagination;
    final l$status = status;
    return Object.hashAll([
      _$data.containsKey('pagination') ? l$pagination : const {},
      _$data.containsKey('status') ? l$status : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$ReciprocalAgreements<TRes> {
  factory CopyWith$Variables$Query$ReciprocalAgreements(
    Variables$Query$ReciprocalAgreements instance,
    TRes Function(Variables$Query$ReciprocalAgreements) then,
  ) = _CopyWithImpl$Variables$Query$ReciprocalAgreements;

  factory CopyWith$Variables$Query$ReciprocalAgreements.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ReciprocalAgreements;

  TRes call({Input$PaginationInput? pagination, Enum$AgreementStatus? status});
}

class _CopyWithImpl$Variables$Query$ReciprocalAgreements<TRes>
    implements CopyWith$Variables$Query$ReciprocalAgreements<TRes> {
  _CopyWithImpl$Variables$Query$ReciprocalAgreements(
    this._instance,
    this._then,
  );

  final Variables$Query$ReciprocalAgreements _instance;

  final TRes Function(Variables$Query$ReciprocalAgreements) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? pagination = _undefined, Object? status = _undefined}) =>
      _then(
        Variables$Query$ReciprocalAgreements._({
          ..._instance._$data,
          if (pagination != _undefined)
            'pagination': (pagination as Input$PaginationInput?),
          if (status != _undefined) 'status': (status as Enum$AgreementStatus?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$ReciprocalAgreements<TRes>
    implements CopyWith$Variables$Query$ReciprocalAgreements<TRes> {
  _CopyWithStubImpl$Variables$Query$ReciprocalAgreements(this._res);

  TRes _res;

  call({Input$PaginationInput? pagination, Enum$AgreementStatus? status}) =>
      _res;
}

class Query$ReciprocalAgreements {
  Query$ReciprocalAgreements({
    required this.reciprocalAgreements,
    this.$__typename = 'Query',
  });

  factory Query$ReciprocalAgreements.fromJson(Map<String, dynamic> json) {
    final l$reciprocalAgreements = json['reciprocalAgreements'];
    final l$$__typename = json['__typename'];
    return Query$ReciprocalAgreements(
      reciprocalAgreements:
          Query$ReciprocalAgreements$reciprocalAgreements.fromJson(
            (l$reciprocalAgreements as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ReciprocalAgreements$reciprocalAgreements reciprocalAgreements;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reciprocalAgreements = reciprocalAgreements;
    _resultData['reciprocalAgreements'] = l$reciprocalAgreements.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reciprocalAgreements = reciprocalAgreements;
    final l$$__typename = $__typename;
    return Object.hashAll([l$reciprocalAgreements, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ReciprocalAgreements ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reciprocalAgreements = reciprocalAgreements;
    final lOther$reciprocalAgreements = other.reciprocalAgreements;
    if (l$reciprocalAgreements != lOther$reciprocalAgreements) {
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

extension UtilityExtension$Query$ReciprocalAgreements
    on Query$ReciprocalAgreements {
  CopyWith$Query$ReciprocalAgreements<Query$ReciprocalAgreements>
  get copyWith => CopyWith$Query$ReciprocalAgreements(this, (i) => i);
}

abstract class CopyWith$Query$ReciprocalAgreements<TRes> {
  factory CopyWith$Query$ReciprocalAgreements(
    Query$ReciprocalAgreements instance,
    TRes Function(Query$ReciprocalAgreements) then,
  ) = _CopyWithImpl$Query$ReciprocalAgreements;

  factory CopyWith$Query$ReciprocalAgreements.stub(TRes res) =
      _CopyWithStubImpl$Query$ReciprocalAgreements;

  TRes call({
    Query$ReciprocalAgreements$reciprocalAgreements? reciprocalAgreements,
    String? $__typename,
  });
  CopyWith$Query$ReciprocalAgreements$reciprocalAgreements<TRes>
  get reciprocalAgreements;
}

class _CopyWithImpl$Query$ReciprocalAgreements<TRes>
    implements CopyWith$Query$ReciprocalAgreements<TRes> {
  _CopyWithImpl$Query$ReciprocalAgreements(this._instance, this._then);

  final Query$ReciprocalAgreements _instance;

  final TRes Function(Query$ReciprocalAgreements) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? reciprocalAgreements = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ReciprocalAgreements(
      reciprocalAgreements:
          reciprocalAgreements == _undefined || reciprocalAgreements == null
          ? _instance.reciprocalAgreements
          : (reciprocalAgreements
                as Query$ReciprocalAgreements$reciprocalAgreements),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$ReciprocalAgreements$reciprocalAgreements<TRes>
  get reciprocalAgreements {
    final local$reciprocalAgreements = _instance.reciprocalAgreements;
    return CopyWith$Query$ReciprocalAgreements$reciprocalAgreements(
      local$reciprocalAgreements,
      (e) => call(reciprocalAgreements: e),
    );
  }
}

class _CopyWithStubImpl$Query$ReciprocalAgreements<TRes>
    implements CopyWith$Query$ReciprocalAgreements<TRes> {
  _CopyWithStubImpl$Query$ReciprocalAgreements(this._res);

  TRes _res;

  call({
    Query$ReciprocalAgreements$reciprocalAgreements? reciprocalAgreements,
    String? $__typename,
  }) => _res;

  CopyWith$Query$ReciprocalAgreements$reciprocalAgreements<TRes>
  get reciprocalAgreements =>
      CopyWith$Query$ReciprocalAgreements$reciprocalAgreements.stub(_res);
}

const documentNodeQueryReciprocalAgreements = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ReciprocalAgreements'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'pagination')),
          type: NamedTypeNode(
            name: NameNode(value: 'PaginationInput'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'status')),
          type: NamedTypeNode(
            name: NameNode(value: 'AgreementStatus'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'reciprocalAgreements'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'pagination'),
                value: VariableNode(name: NameNode(value: 'pagination')),
              ),
              ArgumentNode(
                name: NameNode(value: 'status'),
                value: VariableNode(name: NameNode(value: 'status')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'nodes'),
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
                        name: NameNode(value: 'clubId'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'partnerClubId'),
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
                        name: NameNode(value: 'terms'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'maxVisitsPerMonth'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'reciprocalFee'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'blackoutDates'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'specialConditions'),
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
                        name: NameNode(value: 'effectiveDate'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'expirationDate'),
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
                  name: NameNode(value: 'pageInfo'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'page'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'pageSize'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'total'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'totalPages'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'hasNextPage'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'hasPrevPage'),
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
  ],
);
Query$ReciprocalAgreements _parserFn$Query$ReciprocalAgreements(
  Map<String, dynamic> data,
) => Query$ReciprocalAgreements.fromJson(data);
typedef OnQueryComplete$Query$ReciprocalAgreements =
    FutureOr<void> Function(Map<String, dynamic>?, Query$ReciprocalAgreements?);

class Options$Query$ReciprocalAgreements
    extends graphql.QueryOptions<Query$ReciprocalAgreements> {
  Options$Query$ReciprocalAgreements({
    String? operationName,
    Variables$Query$ReciprocalAgreements? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ReciprocalAgreements? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ReciprocalAgreements? onComplete,
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
                 data == null
                     ? null
                     : _parserFn$Query$ReciprocalAgreements(data),
               ),
         onError: onError,
         document: documentNodeQueryReciprocalAgreements,
         parserFn: _parserFn$Query$ReciprocalAgreements,
       );

  final OnQueryComplete$Query$ReciprocalAgreements? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$ReciprocalAgreements
    extends graphql.WatchQueryOptions<Query$ReciprocalAgreements> {
  WatchOptions$Query$ReciprocalAgreements({
    String? operationName,
    Variables$Query$ReciprocalAgreements? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ReciprocalAgreements? typedOptimisticResult,
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
         document: documentNodeQueryReciprocalAgreements,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$ReciprocalAgreements,
       );
}

class FetchMoreOptions$Query$ReciprocalAgreements
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ReciprocalAgreements({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$ReciprocalAgreements? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryReciprocalAgreements,
       );
}

extension ClientExtension$Query$ReciprocalAgreements on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ReciprocalAgreements>>
  query$ReciprocalAgreements([
    Options$Query$ReciprocalAgreements? options,
  ]) async => await this.query(options ?? Options$Query$ReciprocalAgreements());

  graphql.ObservableQuery<Query$ReciprocalAgreements>
  watchQuery$ReciprocalAgreements([
    WatchOptions$Query$ReciprocalAgreements? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$ReciprocalAgreements());

  void writeQuery$ReciprocalAgreements({
    required Query$ReciprocalAgreements data,
    Variables$Query$ReciprocalAgreements? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryReciprocalAgreements,
      ),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$ReciprocalAgreements? readQuery$ReciprocalAgreements({
    Variables$Query$ReciprocalAgreements? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryReciprocalAgreements,
        ),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ReciprocalAgreements.fromJson(result);
  }
}

class Query$ReciprocalAgreements$reciprocalAgreements {
  Query$ReciprocalAgreements$reciprocalAgreements({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'ReciprocalAgreementConnection',
  });

  factory Query$ReciprocalAgreements$reciprocalAgreements.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$ReciprocalAgreements$reciprocalAgreements(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) =>
                Query$ReciprocalAgreements$reciprocalAgreements$nodes.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      pageInfo:
          Query$ReciprocalAgreements$reciprocalAgreements$pageInfo.fromJson(
            (l$pageInfo as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$ReciprocalAgreements$reciprocalAgreements$nodes> nodes;

  final Query$ReciprocalAgreements$reciprocalAgreements$pageInfo pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$nodes = nodes;
    _resultData['nodes'] = l$nodes.map((e) => e.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$nodes = nodes;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$nodes.map((v) => v)),
      l$pageInfo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ReciprocalAgreements$reciprocalAgreements ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$nodes = nodes;
    final lOther$nodes = other.nodes;
    if (l$nodes.length != lOther$nodes.length) {
      return false;
    }
    for (int i = 0; i < l$nodes.length; i++) {
      final l$nodes$entry = l$nodes[i];
      final lOther$nodes$entry = lOther$nodes[i];
      if (l$nodes$entry != lOther$nodes$entry) {
        return false;
      }
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
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

extension UtilityExtension$Query$ReciprocalAgreements$reciprocalAgreements
    on Query$ReciprocalAgreements$reciprocalAgreements {
  CopyWith$Query$ReciprocalAgreements$reciprocalAgreements<
    Query$ReciprocalAgreements$reciprocalAgreements
  >
  get copyWith =>
      CopyWith$Query$ReciprocalAgreements$reciprocalAgreements(this, (i) => i);
}

abstract class CopyWith$Query$ReciprocalAgreements$reciprocalAgreements<TRes> {
  factory CopyWith$Query$ReciprocalAgreements$reciprocalAgreements(
    Query$ReciprocalAgreements$reciprocalAgreements instance,
    TRes Function(Query$ReciprocalAgreements$reciprocalAgreements) then,
  ) = _CopyWithImpl$Query$ReciprocalAgreements$reciprocalAgreements;

  factory CopyWith$Query$ReciprocalAgreements$reciprocalAgreements.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$ReciprocalAgreements$reciprocalAgreements;

  TRes call({
    List<Query$ReciprocalAgreements$reciprocalAgreements$nodes>? nodes,
    Query$ReciprocalAgreements$reciprocalAgreements$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$ReciprocalAgreements$reciprocalAgreements$nodes> Function(
      Iterable<
        CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes<
          Query$ReciprocalAgreements$reciprocalAgreements$nodes
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo<TRes>
  get pageInfo;
}

class _CopyWithImpl$Query$ReciprocalAgreements$reciprocalAgreements<TRes>
    implements CopyWith$Query$ReciprocalAgreements$reciprocalAgreements<TRes> {
  _CopyWithImpl$Query$ReciprocalAgreements$reciprocalAgreements(
    this._instance,
    this._then,
  );

  final Query$ReciprocalAgreements$reciprocalAgreements _instance;

  final TRes Function(Query$ReciprocalAgreements$reciprocalAgreements) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ReciprocalAgreements$reciprocalAgreements(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes
                as List<Query$ReciprocalAgreements$reciprocalAgreements$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo
                as Query$ReciprocalAgreements$reciprocalAgreements$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$ReciprocalAgreements$reciprocalAgreements$nodes> Function(
      Iterable<
        CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes<
          Query$ReciprocalAgreements$reciprocalAgreements$nodes
        >
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes(
          e,
          (i) => i,
        ),
      ),
    ).toList(),
  );

  CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo<TRes>
  get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$ReciprocalAgreements$reciprocalAgreements<TRes>
    implements CopyWith$Query$ReciprocalAgreements$reciprocalAgreements<TRes> {
  _CopyWithStubImpl$Query$ReciprocalAgreements$reciprocalAgreements(this._res);

  TRes _res;

  call({
    List<Query$ReciprocalAgreements$reciprocalAgreements$nodes>? nodes,
    Query$ReciprocalAgreements$reciprocalAgreements$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo<TRes>
  get pageInfo =>
      CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo.stub(
        _res,
      );
}

class Query$ReciprocalAgreements$reciprocalAgreements$nodes {
  Query$ReciprocalAgreements$reciprocalAgreements$nodes({
    required this.id,
    required this.clubId,
    required this.partnerClubId,
    required this.status,
    required this.terms,
    required this.effectiveDate,
    this.expirationDate,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'ReciprocalAgreement',
  });

  factory Query$ReciprocalAgreements$reciprocalAgreements$nodes.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$partnerClubId = json['partnerClubId'];
    final l$status = json['status'];
    final l$terms = json['terms'];
    final l$effectiveDate = json['effectiveDate'];
    final l$expirationDate = json['expirationDate'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$ReciprocalAgreements$reciprocalAgreements$nodes(
      id: (l$id as String),
      clubId: (l$clubId as String),
      partnerClubId: (l$partnerClubId as String),
      status: fromJson$Enum$AgreementStatus((l$status as String)),
      terms:
          Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms.fromJson(
            (l$terms as Map<String, dynamic>),
          ),
      effectiveDate: DateTime.parse((l$effectiveDate as String)),
      expirationDate: l$expirationDate == null
          ? null
          : DateTime.parse((l$expirationDate as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String partnerClubId;

  final Enum$AgreementStatus status;

  final Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms terms;

  final DateTime effectiveDate;

  final DateTime? expirationDate;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$partnerClubId = partnerClubId;
    _resultData['partnerClubId'] = l$partnerClubId;
    final l$status = status;
    _resultData['status'] = toJson$Enum$AgreementStatus(l$status);
    final l$terms = terms;
    _resultData['terms'] = l$terms.toJson();
    final l$effectiveDate = effectiveDate;
    _resultData['effectiveDate'] = l$effectiveDate.toIso8601String();
    final l$expirationDate = expirationDate;
    _resultData['expirationDate'] = l$expirationDate?.toIso8601String();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clubId = clubId;
    final l$partnerClubId = partnerClubId;
    final l$status = status;
    final l$terms = terms;
    final l$effectiveDate = effectiveDate;
    final l$expirationDate = expirationDate;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$partnerClubId,
      l$status,
      l$terms,
      l$effectiveDate,
      l$expirationDate,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ReciprocalAgreements$reciprocalAgreements$nodes ||
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
    final l$partnerClubId = partnerClubId;
    final lOther$partnerClubId = other.partnerClubId;
    if (l$partnerClubId != lOther$partnerClubId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$terms = terms;
    final lOther$terms = other.terms;
    if (l$terms != lOther$terms) {
      return false;
    }
    final l$effectiveDate = effectiveDate;
    final lOther$effectiveDate = other.effectiveDate;
    if (l$effectiveDate != lOther$effectiveDate) {
      return false;
    }
    final l$expirationDate = expirationDate;
    final lOther$expirationDate = other.expirationDate;
    if (l$expirationDate != lOther$expirationDate) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

extension UtilityExtension$Query$ReciprocalAgreements$reciprocalAgreements$nodes
    on Query$ReciprocalAgreements$reciprocalAgreements$nodes {
  CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes<
    Query$ReciprocalAgreements$reciprocalAgreements$nodes
  >
  get copyWith =>
      CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes<
  TRes
> {
  factory CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes(
    Query$ReciprocalAgreements$reciprocalAgreements$nodes instance,
    TRes Function(Query$ReciprocalAgreements$reciprocalAgreements$nodes) then,
  ) = _CopyWithImpl$Query$ReciprocalAgreements$reciprocalAgreements$nodes;

  factory CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$ReciprocalAgreements$reciprocalAgreements$nodes;

  TRes call({
    String? id,
    String? clubId,
    String? partnerClubId,
    Enum$AgreementStatus? status,
    Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms? terms,
    DateTime? effectiveDate,
    DateTime? expirationDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
  CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms<TRes>
  get terms;
}

class _CopyWithImpl$Query$ReciprocalAgreements$reciprocalAgreements$nodes<TRes>
    implements
        CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes<TRes> {
  _CopyWithImpl$Query$ReciprocalAgreements$reciprocalAgreements$nodes(
    this._instance,
    this._then,
  );

  final Query$ReciprocalAgreements$reciprocalAgreements$nodes _instance;

  final TRes Function(Query$ReciprocalAgreements$reciprocalAgreements$nodes)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? partnerClubId = _undefined,
    Object? status = _undefined,
    Object? terms = _undefined,
    Object? effectiveDate = _undefined,
    Object? expirationDate = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ReciprocalAgreements$reciprocalAgreements$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      partnerClubId: partnerClubId == _undefined || partnerClubId == null
          ? _instance.partnerClubId
          : (partnerClubId as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$AgreementStatus),
      terms: terms == _undefined || terms == null
          ? _instance.terms
          : (terms
                as Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms),
      effectiveDate: effectiveDate == _undefined || effectiveDate == null
          ? _instance.effectiveDate
          : (effectiveDate as DateTime),
      expirationDate: expirationDate == _undefined
          ? _instance.expirationDate
          : (expirationDate as DateTime?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms<TRes>
  get terms {
    final local$terms = _instance.terms;
    return CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms(
      local$terms,
      (e) => call(terms: e),
    );
  }
}

class _CopyWithStubImpl$Query$ReciprocalAgreements$reciprocalAgreements$nodes<
  TRes
>
    implements
        CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes<TRes> {
  _CopyWithStubImpl$Query$ReciprocalAgreements$reciprocalAgreements$nodes(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? partnerClubId,
    Enum$AgreementStatus? status,
    Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms? terms,
    DateTime? effectiveDate,
    DateTime? expirationDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms<TRes>
  get terms =>
      CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms.stub(
        _res,
      );
}

class Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms {
  Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms({
    required this.maxVisitsPerMonth,
    this.reciprocalFee,
    this.blackoutDates,
    this.specialConditions,
    this.$__typename = 'AgreementTerms',
  });

  factory Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$maxVisitsPerMonth = json['maxVisitsPerMonth'];
    final l$reciprocalFee = json['reciprocalFee'];
    final l$blackoutDates = json['blackoutDates'];
    final l$specialConditions = json['specialConditions'];
    final l$$__typename = json['__typename'];
    return Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms(
      maxVisitsPerMonth: (l$maxVisitsPerMonth as int),
      reciprocalFee: (l$reciprocalFee as num?)?.toDouble(),
      blackoutDates: (l$blackoutDates as List<dynamic>?)
          ?.map((e) => DateTime.parse((e as String)))
          .toList(),
      specialConditions: (l$specialConditions as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final int maxVisitsPerMonth;

  final double? reciprocalFee;

  final List<DateTime>? blackoutDates;

  final String? specialConditions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    _resultData['maxVisitsPerMonth'] = l$maxVisitsPerMonth;
    final l$reciprocalFee = reciprocalFee;
    _resultData['reciprocalFee'] = l$reciprocalFee;
    final l$blackoutDates = blackoutDates;
    _resultData['blackoutDates'] = l$blackoutDates
        ?.map((e) => e.toIso8601String())
        .toList();
    final l$specialConditions = specialConditions;
    _resultData['specialConditions'] = l$specialConditions;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    final l$reciprocalFee = reciprocalFee;
    final l$blackoutDates = blackoutDates;
    final l$specialConditions = specialConditions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$maxVisitsPerMonth,
      l$reciprocalFee,
      l$blackoutDates == null
          ? null
          : Object.hashAll(l$blackoutDates.map((v) => v)),
      l$specialConditions,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    final lOther$maxVisitsPerMonth = other.maxVisitsPerMonth;
    if (l$maxVisitsPerMonth != lOther$maxVisitsPerMonth) {
      return false;
    }
    final l$reciprocalFee = reciprocalFee;
    final lOther$reciprocalFee = other.reciprocalFee;
    if (l$reciprocalFee != lOther$reciprocalFee) {
      return false;
    }
    final l$blackoutDates = blackoutDates;
    final lOther$blackoutDates = other.blackoutDates;
    if (l$blackoutDates != null && lOther$blackoutDates != null) {
      if (l$blackoutDates.length != lOther$blackoutDates.length) {
        return false;
      }
      for (int i = 0; i < l$blackoutDates.length; i++) {
        final l$blackoutDates$entry = l$blackoutDates[i];
        final lOther$blackoutDates$entry = lOther$blackoutDates[i];
        if (l$blackoutDates$entry != lOther$blackoutDates$entry) {
          return false;
        }
      }
    } else if (l$blackoutDates != lOther$blackoutDates) {
      return false;
    }
    final l$specialConditions = specialConditions;
    final lOther$specialConditions = other.specialConditions;
    if (l$specialConditions != lOther$specialConditions) {
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

extension UtilityExtension$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms
    on Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms {
  CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms<
    Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms
  >
  get copyWith =>
      CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms<
  TRes
> {
  factory CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms(
    Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms instance,
    TRes Function(Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms)
    then,
  ) = _CopyWithImpl$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms;

  factory CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms;

  TRes call({
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    List<DateTime>? blackoutDates,
    String? specialConditions,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms<
  TRes
>
    implements
        CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms<
          TRes
        > {
  _CopyWithImpl$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms(
    this._instance,
    this._then,
  );

  final Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms _instance;

  final TRes Function(
    Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? maxVisitsPerMonth = _undefined,
    Object? reciprocalFee = _undefined,
    Object? blackoutDates = _undefined,
    Object? specialConditions = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms(
      maxVisitsPerMonth:
          maxVisitsPerMonth == _undefined || maxVisitsPerMonth == null
          ? _instance.maxVisitsPerMonth
          : (maxVisitsPerMonth as int),
      reciprocalFee: reciprocalFee == _undefined
          ? _instance.reciprocalFee
          : (reciprocalFee as double?),
      blackoutDates: blackoutDates == _undefined
          ? _instance.blackoutDates
          : (blackoutDates as List<DateTime>?),
      specialConditions: specialConditions == _undefined
          ? _instance.specialConditions
          : (specialConditions as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms<
  TRes
>
    implements
        CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms<
          TRes
        > {
  _CopyWithStubImpl$Query$ReciprocalAgreements$reciprocalAgreements$nodes$terms(
    this._res,
  );

  TRes _res;

  call({
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    List<DateTime>? blackoutDates,
    String? specialConditions,
    String? $__typename,
  }) => _res;
}

class Query$ReciprocalAgreements$reciprocalAgreements$pageInfo {
  Query$ReciprocalAgreements$reciprocalAgreements$pageInfo({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$ReciprocalAgreements$reciprocalAgreements$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$page = json['page'];
    final l$pageSize = json['pageSize'];
    final l$total = json['total'];
    final l$totalPages = json['totalPages'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPrevPage = json['hasPrevPage'];
    final l$$__typename = json['__typename'];
    return Query$ReciprocalAgreements$reciprocalAgreements$pageInfo(
      page: (l$page as int),
      pageSize: (l$pageSize as int),
      total: (l$total as int),
      totalPages: (l$totalPages as int),
      hasNextPage: (l$hasNextPage as bool),
      hasPrevPage: (l$hasPrevPage as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final int page;

  final int pageSize;

  final int total;

  final int totalPages;

  final bool hasNextPage;

  final bool hasPrevPage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$page = page;
    _resultData['page'] = l$page;
    final l$pageSize = pageSize;
    _resultData['pageSize'] = l$pageSize;
    final l$total = total;
    _resultData['total'] = l$total;
    final l$totalPages = totalPages;
    _resultData['totalPages'] = l$totalPages;
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$hasPrevPage = hasPrevPage;
    _resultData['hasPrevPage'] = l$hasPrevPage;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$pageSize = pageSize;
    final l$total = total;
    final l$totalPages = totalPages;
    final l$hasNextPage = hasNextPage;
    final l$hasPrevPage = hasPrevPage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$page,
      l$pageSize,
      l$total,
      l$totalPages,
      l$hasNextPage,
      l$hasPrevPage,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ReciprocalAgreements$reciprocalAgreements$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
      return false;
    }
    final l$pageSize = pageSize;
    final lOther$pageSize = other.pageSize;
    if (l$pageSize != lOther$pageSize) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
      return false;
    }
    final l$totalPages = totalPages;
    final lOther$totalPages = other.totalPages;
    if (l$totalPages != lOther$totalPages) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$hasPrevPage = hasPrevPage;
    final lOther$hasPrevPage = other.hasPrevPage;
    if (l$hasPrevPage != lOther$hasPrevPage) {
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

extension UtilityExtension$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo
    on Query$ReciprocalAgreements$reciprocalAgreements$pageInfo {
  CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo<
    Query$ReciprocalAgreements$reciprocalAgreements$pageInfo
  >
  get copyWith =>
      CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo<
  TRes
> {
  factory CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo(
    Query$ReciprocalAgreements$reciprocalAgreements$pageInfo instance,
    TRes Function(Query$ReciprocalAgreements$reciprocalAgreements$pageInfo)
    then,
  ) = _CopyWithImpl$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo;

  factory CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo;

  TRes call({
    int? page,
    int? pageSize,
    int? total,
    int? totalPages,
    bool? hasNextPage,
    bool? hasPrevPage,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo<
  TRes
>
    implements
        CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo<
          TRes
        > {
  _CopyWithImpl$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo(
    this._instance,
    this._then,
  );

  final Query$ReciprocalAgreements$reciprocalAgreements$pageInfo _instance;

  final TRes Function(Query$ReciprocalAgreements$reciprocalAgreements$pageInfo)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? page = _undefined,
    Object? pageSize = _undefined,
    Object? total = _undefined,
    Object? totalPages = _undefined,
    Object? hasNextPage = _undefined,
    Object? hasPrevPage = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ReciprocalAgreements$reciprocalAgreements$pageInfo(
      page: page == _undefined || page == null ? _instance.page : (page as int),
      pageSize: pageSize == _undefined || pageSize == null
          ? _instance.pageSize
          : (pageSize as int),
      total: total == _undefined || total == null
          ? _instance.total
          : (total as int),
      totalPages: totalPages == _undefined || totalPages == null
          ? _instance.totalPages
          : (totalPages as int),
      hasNextPage: hasNextPage == _undefined || hasNextPage == null
          ? _instance.hasNextPage
          : (hasNextPage as bool),
      hasPrevPage: hasPrevPage == _undefined || hasPrevPage == null
          ? _instance.hasPrevPage
          : (hasPrevPage as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo<
  TRes
>
    implements
        CopyWith$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo<
          TRes
        > {
  _CopyWithStubImpl$Query$ReciprocalAgreements$reciprocalAgreements$pageInfo(
    this._res,
  );

  TRes _res;

  call({
    int? page,
    int? pageSize,
    int? total,
    int? totalPages,
    bool? hasNextPage,
    bool? hasPrevPage,
    String? $__typename,
  }) => _res;
}
