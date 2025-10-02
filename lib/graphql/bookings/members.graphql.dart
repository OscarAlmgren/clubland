import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Members {
  factory Variables$Query$Members({
    Input$PaginationInput? pagination,
    Enum$MemberStatus? status,
  }) => Variables$Query$Members._({
    if (pagination != null) r'pagination': pagination,
    if (status != null) r'status': status,
  });

  Variables$Query$Members._(this._$data);

  factory Variables$Query$Members.fromJson(Map<String, dynamic> data) {
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
          : fromJson$Enum$MemberStatus((l$status as String));
    }
    return Variables$Query$Members._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Enum$MemberStatus? get status => (_$data['status'] as Enum$MemberStatus?);

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
          : toJson$Enum$MemberStatus(l$status);
    }
    return result$data;
  }

  CopyWith$Variables$Query$Members<Variables$Query$Members> get copyWith =>
      CopyWith$Variables$Query$Members(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Members || runtimeType != other.runtimeType) {
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

abstract class CopyWith$Variables$Query$Members<TRes> {
  factory CopyWith$Variables$Query$Members(
    Variables$Query$Members instance,
    TRes Function(Variables$Query$Members) then,
  ) = _CopyWithImpl$Variables$Query$Members;

  factory CopyWith$Variables$Query$Members.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Members;

  TRes call({Input$PaginationInput? pagination, Enum$MemberStatus? status});
}

class _CopyWithImpl$Variables$Query$Members<TRes>
    implements CopyWith$Variables$Query$Members<TRes> {
  _CopyWithImpl$Variables$Query$Members(this._instance, this._then);

  final Variables$Query$Members _instance;

  final TRes Function(Variables$Query$Members) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? pagination = _undefined, Object? status = _undefined}) =>
      _then(
        Variables$Query$Members._({
          ..._instance._$data,
          if (pagination != _undefined)
            'pagination': (pagination as Input$PaginationInput?),
          if (status != _undefined) 'status': (status as Enum$MemberStatus?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$Members<TRes>
    implements CopyWith$Variables$Query$Members<TRes> {
  _CopyWithStubImpl$Variables$Query$Members(this._res);

  TRes _res;

  call({Input$PaginationInput? pagination, Enum$MemberStatus? status}) => _res;
}

class Query$Members {
  Query$Members({required this.members, this.$__typename = 'Query'});

  factory Query$Members.fromJson(Map<String, dynamic> json) {
    final l$members = json['members'];
    final l$$__typename = json['__typename'];
    return Query$Members(
      members: Query$Members$members.fromJson(
        (l$members as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Members$members members;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$members = members;
    _resultData['members'] = l$members.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$members = members;
    final l$$__typename = $__typename;
    return Object.hashAll([l$members, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Members || runtimeType != other.runtimeType) {
      return false;
    }
    final l$members = members;
    final lOther$members = other.members;
    if (l$members != lOther$members) {
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

extension UtilityExtension$Query$Members on Query$Members {
  CopyWith$Query$Members<Query$Members> get copyWith =>
      CopyWith$Query$Members(this, (i) => i);
}

abstract class CopyWith$Query$Members<TRes> {
  factory CopyWith$Query$Members(
    Query$Members instance,
    TRes Function(Query$Members) then,
  ) = _CopyWithImpl$Query$Members;

  factory CopyWith$Query$Members.stub(TRes res) =
      _CopyWithStubImpl$Query$Members;

  TRes call({Query$Members$members? members, String? $__typename});
  CopyWith$Query$Members$members<TRes> get members;
}

class _CopyWithImpl$Query$Members<TRes>
    implements CopyWith$Query$Members<TRes> {
  _CopyWithImpl$Query$Members(this._instance, this._then);

  final Query$Members _instance;

  final TRes Function(Query$Members) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? members = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$Members(
          members: members == _undefined || members == null
              ? _instance.members
              : (members as Query$Members$members),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$Members$members<TRes> get members {
    final local$members = _instance.members;
    return CopyWith$Query$Members$members(
      local$members,
      (e) => call(members: e),
    );
  }
}

class _CopyWithStubImpl$Query$Members<TRes>
    implements CopyWith$Query$Members<TRes> {
  _CopyWithStubImpl$Query$Members(this._res);

  TRes _res;

  call({Query$Members$members? members, String? $__typename}) => _res;

  CopyWith$Query$Members$members<TRes> get members =>
      CopyWith$Query$Members$members.stub(_res);
}

const documentNodeQueryMembers = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Members'),
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
            name: NameNode(value: 'MemberStatus'),
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
            name: NameNode(value: 'members'),
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
                        name: NameNode(value: 'userId'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'memberNumber'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'membershipType'),
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
                        name: NameNode(value: 'blockchainIdentity'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'profile'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'firstName'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'lastName'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'dateOfBirth'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'phoneNumber'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'address'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(
                                selections: [
                                  FieldNode(
                                    name: NameNode(value: 'street'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'city'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'state'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'postalCode'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'country'),
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
                              name: NameNode(value: 'emergencyContact'),
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
                                    name: NameNode(value: 'relationship'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'phoneNumber'),
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
                              name: NameNode(value: 'preferences'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(
                                selections: [
                                  FieldNode(
                                    name: NameNode(value: 'emailNotifications'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'smsNotifications'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'pushNotifications'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'marketingEmails'),
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
                        name: NameNode(value: 'joinedAt'),
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
Query$Members _parserFn$Query$Members(Map<String, dynamic> data) =>
    Query$Members.fromJson(data);
typedef OnQueryComplete$Query$Members =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Members?);

class Options$Query$Members extends graphql.QueryOptions<Query$Members> {
  Options$Query$Members({
    String? operationName,
    Variables$Query$Members? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Members? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Members? onComplete,
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
                 data == null ? null : _parserFn$Query$Members(data),
               ),
         onError: onError,
         document: documentNodeQueryMembers,
         parserFn: _parserFn$Query$Members,
       );

  final OnQueryComplete$Query$Members? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Members
    extends graphql.WatchQueryOptions<Query$Members> {
  WatchOptions$Query$Members({
    String? operationName,
    Variables$Query$Members? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Members? typedOptimisticResult,
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
         document: documentNodeQueryMembers,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Members,
       );
}

class FetchMoreOptions$Query$Members extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Members({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$Members? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryMembers,
       );
}

extension ClientExtension$Query$Members on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Members>> query$Members([
    Options$Query$Members? options,
  ]) async => await this.query(options ?? Options$Query$Members());

  graphql.ObservableQuery<Query$Members> watchQuery$Members([
    WatchOptions$Query$Members? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$Members());

  void writeQuery$Members({
    required Query$Members data,
    Variables$Query$Members? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryMembers),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$Members? readQuery$Members({
    Variables$Query$Members? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMembers),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Members.fromJson(result);
  }
}

class Query$Members$members {
  Query$Members$members({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'MemberConnection',
  });

  factory Query$Members$members.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$Members$members(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$Members$members$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$Members$members$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Members$members$nodes> nodes;

  final Query$Members$members$pageInfo pageInfo;

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
    if (other is! Query$Members$members || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Members$members on Query$Members$members {
  CopyWith$Query$Members$members<Query$Members$members> get copyWith =>
      CopyWith$Query$Members$members(this, (i) => i);
}

abstract class CopyWith$Query$Members$members<TRes> {
  factory CopyWith$Query$Members$members(
    Query$Members$members instance,
    TRes Function(Query$Members$members) then,
  ) = _CopyWithImpl$Query$Members$members;

  factory CopyWith$Query$Members$members.stub(TRes res) =
      _CopyWithStubImpl$Query$Members$members;

  TRes call({
    List<Query$Members$members$nodes>? nodes,
    Query$Members$members$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$Members$members$nodes> Function(
      Iterable<
        CopyWith$Query$Members$members$nodes<Query$Members$members$nodes>
      >,
    )
    _fn,
  );
  CopyWith$Query$Members$members$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$Members$members<TRes>
    implements CopyWith$Query$Members$members<TRes> {
  _CopyWithImpl$Query$Members$members(this._instance, this._then);

  final Query$Members$members _instance;

  final TRes Function(Query$Members$members) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Members$members(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$Members$members$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$Members$members$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$Members$members$nodes> Function(
      Iterable<
        CopyWith$Query$Members$members$nodes<Query$Members$members$nodes>
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$Members$members$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$Members$members$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$Members$members$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$Members$members<TRes>
    implements CopyWith$Query$Members$members<TRes> {
  _CopyWithStubImpl$Query$Members$members(this._res);

  TRes _res;

  call({
    List<Query$Members$members$nodes>? nodes,
    Query$Members$members$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$Members$members$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$Members$members$pageInfo.stub(_res);
}

class Query$Members$members$nodes {
  Query$Members$members$nodes({
    required this.id,
    required this.clubId,
    required this.userId,
    required this.memberNumber,
    required this.membershipType,
    required this.status,
    this.blockchainIdentity,
    this.profile,
    required this.joinedAt,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Member',
  });

  factory Query$Members$members$nodes.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$userId = json['userId'];
    final l$memberNumber = json['memberNumber'];
    final l$membershipType = json['membershipType'];
    final l$status = json['status'];
    final l$blockchainIdentity = json['blockchainIdentity'];
    final l$profile = json['profile'];
    final l$joinedAt = json['joinedAt'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$Members$members$nodes(
      id: (l$id as String),
      clubId: (l$clubId as String),
      userId: (l$userId as String),
      memberNumber: (l$memberNumber as String),
      membershipType: fromJson$Enum$MembershipType(
        (l$membershipType as String),
      ),
      status: fromJson$Enum$MemberStatus((l$status as String)),
      blockchainIdentity: (l$blockchainIdentity as String?),
      profile: l$profile == null
          ? null
          : Query$Members$members$nodes$profile.fromJson(
              (l$profile as Map<String, dynamic>),
            ),
      joinedAt: DateTime.parse((l$joinedAt as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String userId;

  final String memberNumber;

  final Enum$MembershipType membershipType;

  final Enum$MemberStatus status;

  final String? blockchainIdentity;

  final Query$Members$members$nodes$profile? profile;

  final DateTime joinedAt;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$memberNumber = memberNumber;
    _resultData['memberNumber'] = l$memberNumber;
    final l$membershipType = membershipType;
    _resultData['membershipType'] = toJson$Enum$MembershipType(
      l$membershipType,
    );
    final l$status = status;
    _resultData['status'] = toJson$Enum$MemberStatus(l$status);
    final l$blockchainIdentity = blockchainIdentity;
    _resultData['blockchainIdentity'] = l$blockchainIdentity;
    final l$profile = profile;
    _resultData['profile'] = l$profile?.toJson();
    final l$joinedAt = joinedAt;
    _resultData['joinedAt'] = l$joinedAt.toIso8601String();
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
    final l$userId = userId;
    final l$memberNumber = memberNumber;
    final l$membershipType = membershipType;
    final l$status = status;
    final l$blockchainIdentity = blockchainIdentity;
    final l$profile = profile;
    final l$joinedAt = joinedAt;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$userId,
      l$memberNumber,
      l$membershipType,
      l$status,
      l$blockchainIdentity,
      l$profile,
      l$joinedAt,
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
    if (other is! Query$Members$members$nodes ||
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
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$memberNumber = memberNumber;
    final lOther$memberNumber = other.memberNumber;
    if (l$memberNumber != lOther$memberNumber) {
      return false;
    }
    final l$membershipType = membershipType;
    final lOther$membershipType = other.membershipType;
    if (l$membershipType != lOther$membershipType) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$blockchainIdentity = blockchainIdentity;
    final lOther$blockchainIdentity = other.blockchainIdentity;
    if (l$blockchainIdentity != lOther$blockchainIdentity) {
      return false;
    }
    final l$profile = profile;
    final lOther$profile = other.profile;
    if (l$profile != lOther$profile) {
      return false;
    }
    final l$joinedAt = joinedAt;
    final lOther$joinedAt = other.joinedAt;
    if (l$joinedAt != lOther$joinedAt) {
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

extension UtilityExtension$Query$Members$members$nodes
    on Query$Members$members$nodes {
  CopyWith$Query$Members$members$nodes<Query$Members$members$nodes>
  get copyWith => CopyWith$Query$Members$members$nodes(this, (i) => i);
}

abstract class CopyWith$Query$Members$members$nodes<TRes> {
  factory CopyWith$Query$Members$members$nodes(
    Query$Members$members$nodes instance,
    TRes Function(Query$Members$members$nodes) then,
  ) = _CopyWithImpl$Query$Members$members$nodes;

  factory CopyWith$Query$Members$members$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$Members$members$nodes;

  TRes call({
    String? id,
    String? clubId,
    String? userId,
    String? memberNumber,
    Enum$MembershipType? membershipType,
    Enum$MemberStatus? status,
    String? blockchainIdentity,
    Query$Members$members$nodes$profile? profile,
    DateTime? joinedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
  CopyWith$Query$Members$members$nodes$profile<TRes> get profile;
}

class _CopyWithImpl$Query$Members$members$nodes<TRes>
    implements CopyWith$Query$Members$members$nodes<TRes> {
  _CopyWithImpl$Query$Members$members$nodes(this._instance, this._then);

  final Query$Members$members$nodes _instance;

  final TRes Function(Query$Members$members$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? userId = _undefined,
    Object? memberNumber = _undefined,
    Object? membershipType = _undefined,
    Object? status = _undefined,
    Object? blockchainIdentity = _undefined,
    Object? profile = _undefined,
    Object? joinedAt = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Members$members$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      memberNumber: memberNumber == _undefined || memberNumber == null
          ? _instance.memberNumber
          : (memberNumber as String),
      membershipType: membershipType == _undefined || membershipType == null
          ? _instance.membershipType
          : (membershipType as Enum$MembershipType),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$MemberStatus),
      blockchainIdentity: blockchainIdentity == _undefined
          ? _instance.blockchainIdentity
          : (blockchainIdentity as String?),
      profile: profile == _undefined
          ? _instance.profile
          : (profile as Query$Members$members$nodes$profile?),
      joinedAt: joinedAt == _undefined || joinedAt == null
          ? _instance.joinedAt
          : (joinedAt as DateTime),
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

  CopyWith$Query$Members$members$nodes$profile<TRes> get profile {
    final local$profile = _instance.profile;
    return local$profile == null
        ? CopyWith$Query$Members$members$nodes$profile.stub(_then(_instance))
        : CopyWith$Query$Members$members$nodes$profile(
            local$profile,
            (e) => call(profile: e),
          );
  }
}

class _CopyWithStubImpl$Query$Members$members$nodes<TRes>
    implements CopyWith$Query$Members$members$nodes<TRes> {
  _CopyWithStubImpl$Query$Members$members$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? userId,
    String? memberNumber,
    Enum$MembershipType? membershipType,
    Enum$MemberStatus? status,
    String? blockchainIdentity,
    Query$Members$members$nodes$profile? profile,
    DateTime? joinedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Members$members$nodes$profile<TRes> get profile =>
      CopyWith$Query$Members$members$nodes$profile.stub(_res);
}

class Query$Members$members$nodes$profile {
  Query$Members$members$nodes$profile({
    required this.firstName,
    required this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.address,
    this.emergencyContact,
    this.preferences,
    this.$__typename = 'MemberProfile',
  });

  factory Query$Members$members$nodes$profile.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$dateOfBirth = json['dateOfBirth'];
    final l$phoneNumber = json['phoneNumber'];
    final l$address = json['address'];
    final l$emergencyContact = json['emergencyContact'];
    final l$preferences = json['preferences'];
    final l$$__typename = json['__typename'];
    return Query$Members$members$nodes$profile(
      firstName: (l$firstName as String),
      lastName: (l$lastName as String),
      dateOfBirth: l$dateOfBirth == null
          ? null
          : DateTime.parse((l$dateOfBirth as String)),
      phoneNumber: (l$phoneNumber as String?),
      address: l$address == null
          ? null
          : Query$Members$members$nodes$profile$address.fromJson(
              (l$address as Map<String, dynamic>),
            ),
      emergencyContact: l$emergencyContact == null
          ? null
          : Query$Members$members$nodes$profile$emergencyContact.fromJson(
              (l$emergencyContact as Map<String, dynamic>),
            ),
      preferences: l$preferences == null
          ? null
          : Query$Members$members$nodes$profile$preferences.fromJson(
              (l$preferences as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String firstName;

  final String lastName;

  final DateTime? dateOfBirth;

  final String? phoneNumber;

  final Query$Members$members$nodes$profile$address? address;

  final Query$Members$members$nodes$profile$emergencyContact? emergencyContact;

  final Query$Members$members$nodes$profile$preferences? preferences;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$dateOfBirth = dateOfBirth;
    _resultData['dateOfBirth'] = l$dateOfBirth?.toIso8601String();
    final l$phoneNumber = phoneNumber;
    _resultData['phoneNumber'] = l$phoneNumber;
    final l$address = address;
    _resultData['address'] = l$address?.toJson();
    final l$emergencyContact = emergencyContact;
    _resultData['emergencyContact'] = l$emergencyContact?.toJson();
    final l$preferences = preferences;
    _resultData['preferences'] = l$preferences?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$dateOfBirth = dateOfBirth;
    final l$phoneNumber = phoneNumber;
    final l$address = address;
    final l$emergencyContact = emergencyContact;
    final l$preferences = preferences;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$firstName,
      l$lastName,
      l$dateOfBirth,
      l$phoneNumber,
      l$address,
      l$emergencyContact,
      l$preferences,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Members$members$nodes$profile ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$dateOfBirth = dateOfBirth;
    final lOther$dateOfBirth = other.dateOfBirth;
    if (l$dateOfBirth != lOther$dateOfBirth) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$emergencyContact = emergencyContact;
    final lOther$emergencyContact = other.emergencyContact;
    if (l$emergencyContact != lOther$emergencyContact) {
      return false;
    }
    final l$preferences = preferences;
    final lOther$preferences = other.preferences;
    if (l$preferences != lOther$preferences) {
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

extension UtilityExtension$Query$Members$members$nodes$profile
    on Query$Members$members$nodes$profile {
  CopyWith$Query$Members$members$nodes$profile<
    Query$Members$members$nodes$profile
  >
  get copyWith => CopyWith$Query$Members$members$nodes$profile(this, (i) => i);
}

abstract class CopyWith$Query$Members$members$nodes$profile<TRes> {
  factory CopyWith$Query$Members$members$nodes$profile(
    Query$Members$members$nodes$profile instance,
    TRes Function(Query$Members$members$nodes$profile) then,
  ) = _CopyWithImpl$Query$Members$members$nodes$profile;

  factory CopyWith$Query$Members$members$nodes$profile.stub(TRes res) =
      _CopyWithStubImpl$Query$Members$members$nodes$profile;

  TRes call({
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    Query$Members$members$nodes$profile$address? address,
    Query$Members$members$nodes$profile$emergencyContact? emergencyContact,
    Query$Members$members$nodes$profile$preferences? preferences,
    String? $__typename,
  });
  CopyWith$Query$Members$members$nodes$profile$address<TRes> get address;
  CopyWith$Query$Members$members$nodes$profile$emergencyContact<TRes>
  get emergencyContact;
  CopyWith$Query$Members$members$nodes$profile$preferences<TRes>
  get preferences;
}

class _CopyWithImpl$Query$Members$members$nodes$profile<TRes>
    implements CopyWith$Query$Members$members$nodes$profile<TRes> {
  _CopyWithImpl$Query$Members$members$nodes$profile(this._instance, this._then);

  final Query$Members$members$nodes$profile _instance;

  final TRes Function(Query$Members$members$nodes$profile) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? dateOfBirth = _undefined,
    Object? phoneNumber = _undefined,
    Object? address = _undefined,
    Object? emergencyContact = _undefined,
    Object? preferences = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Members$members$nodes$profile(
      firstName: firstName == _undefined || firstName == null
          ? _instance.firstName
          : (firstName as String),
      lastName: lastName == _undefined || lastName == null
          ? _instance.lastName
          : (lastName as String),
      dateOfBirth: dateOfBirth == _undefined
          ? _instance.dateOfBirth
          : (dateOfBirth as DateTime?),
      phoneNumber: phoneNumber == _undefined
          ? _instance.phoneNumber
          : (phoneNumber as String?),
      address: address == _undefined
          ? _instance.address
          : (address as Query$Members$members$nodes$profile$address?),
      emergencyContact: emergencyContact == _undefined
          ? _instance.emergencyContact
          : (emergencyContact
                as Query$Members$members$nodes$profile$emergencyContact?),
      preferences: preferences == _undefined
          ? _instance.preferences
          : (preferences as Query$Members$members$nodes$profile$preferences?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Members$members$nodes$profile$address<TRes> get address {
    final local$address = _instance.address;
    return local$address == null
        ? CopyWith$Query$Members$members$nodes$profile$address.stub(
            _then(_instance),
          )
        : CopyWith$Query$Members$members$nodes$profile$address(
            local$address,
            (e) => call(address: e),
          );
  }

  CopyWith$Query$Members$members$nodes$profile$emergencyContact<TRes>
  get emergencyContact {
    final local$emergencyContact = _instance.emergencyContact;
    return local$emergencyContact == null
        ? CopyWith$Query$Members$members$nodes$profile$emergencyContact.stub(
            _then(_instance),
          )
        : CopyWith$Query$Members$members$nodes$profile$emergencyContact(
            local$emergencyContact,
            (e) => call(emergencyContact: e),
          );
  }

  CopyWith$Query$Members$members$nodes$profile$preferences<TRes>
  get preferences {
    final local$preferences = _instance.preferences;
    return local$preferences == null
        ? CopyWith$Query$Members$members$nodes$profile$preferences.stub(
            _then(_instance),
          )
        : CopyWith$Query$Members$members$nodes$profile$preferences(
            local$preferences,
            (e) => call(preferences: e),
          );
  }
}

class _CopyWithStubImpl$Query$Members$members$nodes$profile<TRes>
    implements CopyWith$Query$Members$members$nodes$profile<TRes> {
  _CopyWithStubImpl$Query$Members$members$nodes$profile(this._res);

  TRes _res;

  call({
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    Query$Members$members$nodes$profile$address? address,
    Query$Members$members$nodes$profile$emergencyContact? emergencyContact,
    Query$Members$members$nodes$profile$preferences? preferences,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Members$members$nodes$profile$address<TRes> get address =>
      CopyWith$Query$Members$members$nodes$profile$address.stub(_res);

  CopyWith$Query$Members$members$nodes$profile$emergencyContact<TRes>
  get emergencyContact =>
      CopyWith$Query$Members$members$nodes$profile$emergencyContact.stub(_res);

  CopyWith$Query$Members$members$nodes$profile$preferences<TRes>
  get preferences =>
      CopyWith$Query$Members$members$nodes$profile$preferences.stub(_res);
}

class Query$Members$members$nodes$profile$address {
  Query$Members$members$nodes$profile$address({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.$__typename = 'Address',
  });

  factory Query$Members$members$nodes$profile$address.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$street = json['street'];
    final l$city = json['city'];
    final l$state = json['state'];
    final l$postalCode = json['postalCode'];
    final l$country = json['country'];
    final l$$__typename = json['__typename'];
    return Query$Members$members$nodes$profile$address(
      street: (l$street as String),
      city: (l$city as String),
      state: (l$state as String),
      postalCode: (l$postalCode as String),
      country: (l$country as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String street;

  final String city;

  final String state;

  final String postalCode;

  final String country;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$street = street;
    _resultData['street'] = l$street;
    final l$city = city;
    _resultData['city'] = l$city;
    final l$state = state;
    _resultData['state'] = l$state;
    final l$postalCode = postalCode;
    _resultData['postalCode'] = l$postalCode;
    final l$country = country;
    _resultData['country'] = l$country;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$street = street;
    final l$city = city;
    final l$state = state;
    final l$postalCode = postalCode;
    final l$country = country;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$street,
      l$city,
      l$state,
      l$postalCode,
      l$country,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Members$members$nodes$profile$address ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$street = street;
    final lOther$street = other.street;
    if (l$street != lOther$street) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (l$city != lOther$city) {
      return false;
    }
    final l$state = state;
    final lOther$state = other.state;
    if (l$state != lOther$state) {
      return false;
    }
    final l$postalCode = postalCode;
    final lOther$postalCode = other.postalCode;
    if (l$postalCode != lOther$postalCode) {
      return false;
    }
    final l$country = country;
    final lOther$country = other.country;
    if (l$country != lOther$country) {
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

extension UtilityExtension$Query$Members$members$nodes$profile$address
    on Query$Members$members$nodes$profile$address {
  CopyWith$Query$Members$members$nodes$profile$address<
    Query$Members$members$nodes$profile$address
  >
  get copyWith =>
      CopyWith$Query$Members$members$nodes$profile$address(this, (i) => i);
}

abstract class CopyWith$Query$Members$members$nodes$profile$address<TRes> {
  factory CopyWith$Query$Members$members$nodes$profile$address(
    Query$Members$members$nodes$profile$address instance,
    TRes Function(Query$Members$members$nodes$profile$address) then,
  ) = _CopyWithImpl$Query$Members$members$nodes$profile$address;

  factory CopyWith$Query$Members$members$nodes$profile$address.stub(TRes res) =
      _CopyWithStubImpl$Query$Members$members$nodes$profile$address;

  TRes call({
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Members$members$nodes$profile$address<TRes>
    implements CopyWith$Query$Members$members$nodes$profile$address<TRes> {
  _CopyWithImpl$Query$Members$members$nodes$profile$address(
    this._instance,
    this._then,
  );

  final Query$Members$members$nodes$profile$address _instance;

  final TRes Function(Query$Members$members$nodes$profile$address) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? street = _undefined,
    Object? city = _undefined,
    Object? state = _undefined,
    Object? postalCode = _undefined,
    Object? country = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Members$members$nodes$profile$address(
      street: street == _undefined || street == null
          ? _instance.street
          : (street as String),
      city: city == _undefined || city == null
          ? _instance.city
          : (city as String),
      state: state == _undefined || state == null
          ? _instance.state
          : (state as String),
      postalCode: postalCode == _undefined || postalCode == null
          ? _instance.postalCode
          : (postalCode as String),
      country: country == _undefined || country == null
          ? _instance.country
          : (country as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Members$members$nodes$profile$address<TRes>
    implements CopyWith$Query$Members$members$nodes$profile$address<TRes> {
  _CopyWithStubImpl$Query$Members$members$nodes$profile$address(this._res);

  TRes _res;

  call({
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    String? $__typename,
  }) => _res;
}

class Query$Members$members$nodes$profile$emergencyContact {
  Query$Members$members$nodes$profile$emergencyContact({
    required this.name,
    required this.relationship,
    required this.phoneNumber,
    this.$__typename = 'EmergencyContact',
  });

  factory Query$Members$members$nodes$profile$emergencyContact.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$relationship = json['relationship'];
    final l$phoneNumber = json['phoneNumber'];
    final l$$__typename = json['__typename'];
    return Query$Members$members$nodes$profile$emergencyContact(
      name: (l$name as String),
      relationship: (l$relationship as String),
      phoneNumber: (l$phoneNumber as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String relationship;

  final String phoneNumber;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$relationship = relationship;
    _resultData['relationship'] = l$relationship;
    final l$phoneNumber = phoneNumber;
    _resultData['phoneNumber'] = l$phoneNumber;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$relationship = relationship;
    final l$phoneNumber = phoneNumber;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$relationship,
      l$phoneNumber,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Members$members$nodes$profile$emergencyContact ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$relationship = relationship;
    final lOther$relationship = other.relationship;
    if (l$relationship != lOther$relationship) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) {
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

extension UtilityExtension$Query$Members$members$nodes$profile$emergencyContact
    on Query$Members$members$nodes$profile$emergencyContact {
  CopyWith$Query$Members$members$nodes$profile$emergencyContact<
    Query$Members$members$nodes$profile$emergencyContact
  >
  get copyWith => CopyWith$Query$Members$members$nodes$profile$emergencyContact(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$Members$members$nodes$profile$emergencyContact<
  TRes
> {
  factory CopyWith$Query$Members$members$nodes$profile$emergencyContact(
    Query$Members$members$nodes$profile$emergencyContact instance,
    TRes Function(Query$Members$members$nodes$profile$emergencyContact) then,
  ) = _CopyWithImpl$Query$Members$members$nodes$profile$emergencyContact;

  factory CopyWith$Query$Members$members$nodes$profile$emergencyContact.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Members$members$nodes$profile$emergencyContact;

  TRes call({
    String? name,
    String? relationship,
    String? phoneNumber,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Members$members$nodes$profile$emergencyContact<TRes>
    implements
        CopyWith$Query$Members$members$nodes$profile$emergencyContact<TRes> {
  _CopyWithImpl$Query$Members$members$nodes$profile$emergencyContact(
    this._instance,
    this._then,
  );

  final Query$Members$members$nodes$profile$emergencyContact _instance;

  final TRes Function(Query$Members$members$nodes$profile$emergencyContact)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? relationship = _undefined,
    Object? phoneNumber = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Members$members$nodes$profile$emergencyContact(
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      relationship: relationship == _undefined || relationship == null
          ? _instance.relationship
          : (relationship as String),
      phoneNumber: phoneNumber == _undefined || phoneNumber == null
          ? _instance.phoneNumber
          : (phoneNumber as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Members$members$nodes$profile$emergencyContact<
  TRes
>
    implements
        CopyWith$Query$Members$members$nodes$profile$emergencyContact<TRes> {
  _CopyWithStubImpl$Query$Members$members$nodes$profile$emergencyContact(
    this._res,
  );

  TRes _res;

  call({
    String? name,
    String? relationship,
    String? phoneNumber,
    String? $__typename,
  }) => _res;
}

class Query$Members$members$nodes$profile$preferences {
  Query$Members$members$nodes$profile$preferences({
    required this.emailNotifications,
    required this.smsNotifications,
    required this.pushNotifications,
    required this.marketingEmails,
    this.$__typename = 'MemberPreferences',
  });

  factory Query$Members$members$nodes$profile$preferences.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$emailNotifications = json['emailNotifications'];
    final l$smsNotifications = json['smsNotifications'];
    final l$pushNotifications = json['pushNotifications'];
    final l$marketingEmails = json['marketingEmails'];
    final l$$__typename = json['__typename'];
    return Query$Members$members$nodes$profile$preferences(
      emailNotifications: (l$emailNotifications as bool),
      smsNotifications: (l$smsNotifications as bool),
      pushNotifications: (l$pushNotifications as bool),
      marketingEmails: (l$marketingEmails as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool emailNotifications;

  final bool smsNotifications;

  final bool pushNotifications;

  final bool marketingEmails;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$emailNotifications = emailNotifications;
    _resultData['emailNotifications'] = l$emailNotifications;
    final l$smsNotifications = smsNotifications;
    _resultData['smsNotifications'] = l$smsNotifications;
    final l$pushNotifications = pushNotifications;
    _resultData['pushNotifications'] = l$pushNotifications;
    final l$marketingEmails = marketingEmails;
    _resultData['marketingEmails'] = l$marketingEmails;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$emailNotifications = emailNotifications;
    final l$smsNotifications = smsNotifications;
    final l$pushNotifications = pushNotifications;
    final l$marketingEmails = marketingEmails;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$emailNotifications,
      l$smsNotifications,
      l$pushNotifications,
      l$marketingEmails,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Members$members$nodes$profile$preferences ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$emailNotifications = emailNotifications;
    final lOther$emailNotifications = other.emailNotifications;
    if (l$emailNotifications != lOther$emailNotifications) {
      return false;
    }
    final l$smsNotifications = smsNotifications;
    final lOther$smsNotifications = other.smsNotifications;
    if (l$smsNotifications != lOther$smsNotifications) {
      return false;
    }
    final l$pushNotifications = pushNotifications;
    final lOther$pushNotifications = other.pushNotifications;
    if (l$pushNotifications != lOther$pushNotifications) {
      return false;
    }
    final l$marketingEmails = marketingEmails;
    final lOther$marketingEmails = other.marketingEmails;
    if (l$marketingEmails != lOther$marketingEmails) {
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

extension UtilityExtension$Query$Members$members$nodes$profile$preferences
    on Query$Members$members$nodes$profile$preferences {
  CopyWith$Query$Members$members$nodes$profile$preferences<
    Query$Members$members$nodes$profile$preferences
  >
  get copyWith =>
      CopyWith$Query$Members$members$nodes$profile$preferences(this, (i) => i);
}

abstract class CopyWith$Query$Members$members$nodes$profile$preferences<TRes> {
  factory CopyWith$Query$Members$members$nodes$profile$preferences(
    Query$Members$members$nodes$profile$preferences instance,
    TRes Function(Query$Members$members$nodes$profile$preferences) then,
  ) = _CopyWithImpl$Query$Members$members$nodes$profile$preferences;

  factory CopyWith$Query$Members$members$nodes$profile$preferences.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Members$members$nodes$profile$preferences;

  TRes call({
    bool? emailNotifications,
    bool? smsNotifications,
    bool? pushNotifications,
    bool? marketingEmails,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Members$members$nodes$profile$preferences<TRes>
    implements CopyWith$Query$Members$members$nodes$profile$preferences<TRes> {
  _CopyWithImpl$Query$Members$members$nodes$profile$preferences(
    this._instance,
    this._then,
  );

  final Query$Members$members$nodes$profile$preferences _instance;

  final TRes Function(Query$Members$members$nodes$profile$preferences) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? emailNotifications = _undefined,
    Object? smsNotifications = _undefined,
    Object? pushNotifications = _undefined,
    Object? marketingEmails = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Members$members$nodes$profile$preferences(
      emailNotifications:
          emailNotifications == _undefined || emailNotifications == null
          ? _instance.emailNotifications
          : (emailNotifications as bool),
      smsNotifications:
          smsNotifications == _undefined || smsNotifications == null
          ? _instance.smsNotifications
          : (smsNotifications as bool),
      pushNotifications:
          pushNotifications == _undefined || pushNotifications == null
          ? _instance.pushNotifications
          : (pushNotifications as bool),
      marketingEmails: marketingEmails == _undefined || marketingEmails == null
          ? _instance.marketingEmails
          : (marketingEmails as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Members$members$nodes$profile$preferences<TRes>
    implements CopyWith$Query$Members$members$nodes$profile$preferences<TRes> {
  _CopyWithStubImpl$Query$Members$members$nodes$profile$preferences(this._res);

  TRes _res;

  call({
    bool? emailNotifications,
    bool? smsNotifications,
    bool? pushNotifications,
    bool? marketingEmails,
    String? $__typename,
  }) => _res;
}

class Query$Members$members$pageInfo {
  Query$Members$members$pageInfo({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$Members$members$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$pageSize = json['pageSize'];
    final l$total = json['total'];
    final l$totalPages = json['totalPages'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPrevPage = json['hasPrevPage'];
    final l$$__typename = json['__typename'];
    return Query$Members$members$pageInfo(
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
    if (other is! Query$Members$members$pageInfo ||
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

extension UtilityExtension$Query$Members$members$pageInfo
    on Query$Members$members$pageInfo {
  CopyWith$Query$Members$members$pageInfo<Query$Members$members$pageInfo>
  get copyWith => CopyWith$Query$Members$members$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$Members$members$pageInfo<TRes> {
  factory CopyWith$Query$Members$members$pageInfo(
    Query$Members$members$pageInfo instance,
    TRes Function(Query$Members$members$pageInfo) then,
  ) = _CopyWithImpl$Query$Members$members$pageInfo;

  factory CopyWith$Query$Members$members$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$Members$members$pageInfo;

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

class _CopyWithImpl$Query$Members$members$pageInfo<TRes>
    implements CopyWith$Query$Members$members$pageInfo<TRes> {
  _CopyWithImpl$Query$Members$members$pageInfo(this._instance, this._then);

  final Query$Members$members$pageInfo _instance;

  final TRes Function(Query$Members$members$pageInfo) _then;

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
    Query$Members$members$pageInfo(
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

class _CopyWithStubImpl$Query$Members$members$pageInfo<TRes>
    implements CopyWith$Query$Members$members$pageInfo<TRes> {
  _CopyWithStubImpl$Query$Members$members$pageInfo(this._res);

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
