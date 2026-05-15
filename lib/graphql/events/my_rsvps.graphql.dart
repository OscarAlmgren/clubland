import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$MyRSVPs {
  factory Variables$Query$MyRSVPs({
    Input$PaginationInput? pagination,
    Enum$RSVPStatus? status,
  }) => Variables$Query$MyRSVPs._({
    if (pagination != null) r'pagination': pagination,
    if (status != null) r'status': status,
  });

  Variables$Query$MyRSVPs._(this._$data);

  factory Variables$Query$MyRSVPs.fromJson(Map<String, dynamic> data) {
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
          : fromJson$Enum$RSVPStatus((l$status as String));
    }
    return Variables$Query$MyRSVPs._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Enum$RSVPStatus? get status => (_$data['status'] as Enum$RSVPStatus?);

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
          : toJson$Enum$RSVPStatus(l$status);
    }
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

abstract class CopyWith$Variables$Query$MyRSVPs<TRes> {
  factory CopyWith$Variables$Query$MyRSVPs(
    Variables$Query$MyRSVPs instance,
    TRes Function(Variables$Query$MyRSVPs) then,
  ) = _CopyWithImpl$Variables$Query$MyRSVPs;

  factory CopyWith$Variables$Query$MyRSVPs.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$MyRSVPs;

  TRes call({Input$PaginationInput? pagination, Enum$RSVPStatus? status});
}

class _CopyWithImpl$Variables$Query$MyRSVPs<TRes>
    implements CopyWith$Variables$Query$MyRSVPs<TRes> {
  _CopyWithImpl$Variables$Query$MyRSVPs(this._instance, this._then);

  final Variables$Query$MyRSVPs _instance;

  final TRes Function(Variables$Query$MyRSVPs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? pagination = _undefined, Object? status = _undefined}) =>
      _then(
        Variables$Query$MyRSVPs._({
          ..._instance._$data,
          if (pagination != _undefined)
            'pagination': (pagination as Input$PaginationInput?),
          if (status != _undefined) 'status': (status as Enum$RSVPStatus?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$MyRSVPs<TRes>
    implements CopyWith$Variables$Query$MyRSVPs<TRes> {
  _CopyWithStubImpl$Variables$Query$MyRSVPs(this._res);

  TRes _res;

  call({Input$PaginationInput? pagination, Enum$RSVPStatus? status}) => _res;
}

class Query$MyRSVPs {
  Query$MyRSVPs({required this.myEventRSVPs, this.$__typename = 'Query'});

  factory Query$MyRSVPs.fromJson(Map<String, dynamic> json) {
    final l$myEventRSVPs = json['myEventRSVPs'];
    final l$$__typename = json['__typename'];
    return Query$MyRSVPs(
      myEventRSVPs: Query$MyRSVPs$myEventRSVPs.fromJson(
        (l$myEventRSVPs as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MyRSVPs$myEventRSVPs myEventRSVPs;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myEventRSVPs = myEventRSVPs;
    _resultData['myEventRSVPs'] = l$myEventRSVPs.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myEventRSVPs = myEventRSVPs;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myEventRSVPs, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyRSVPs || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myEventRSVPs = myEventRSVPs;
    final lOther$myEventRSVPs = other.myEventRSVPs;
    if (l$myEventRSVPs != lOther$myEventRSVPs) {
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

  TRes call({Query$MyRSVPs$myEventRSVPs? myEventRSVPs, String? $__typename});
  CopyWith$Query$MyRSVPs$myEventRSVPs<TRes> get myEventRSVPs;
}

class _CopyWithImpl$Query$MyRSVPs<TRes>
    implements CopyWith$Query$MyRSVPs<TRes> {
  _CopyWithImpl$Query$MyRSVPs(this._instance, this._then);

  final Query$MyRSVPs _instance;

  final TRes Function(Query$MyRSVPs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? myEventRSVPs = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyRSVPs(
      myEventRSVPs: myEventRSVPs == _undefined || myEventRSVPs == null
          ? _instance.myEventRSVPs
          : (myEventRSVPs as Query$MyRSVPs$myEventRSVPs),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$MyRSVPs$myEventRSVPs<TRes> get myEventRSVPs {
    final local$myEventRSVPs = _instance.myEventRSVPs;
    return CopyWith$Query$MyRSVPs$myEventRSVPs(
      local$myEventRSVPs,
      (e) => call(myEventRSVPs: e),
    );
  }
}

class _CopyWithStubImpl$Query$MyRSVPs<TRes>
    implements CopyWith$Query$MyRSVPs<TRes> {
  _CopyWithStubImpl$Query$MyRSVPs(this._res);

  TRes _res;

  call({Query$MyRSVPs$myEventRSVPs? myEventRSVPs, String? $__typename}) => _res;

  CopyWith$Query$MyRSVPs$myEventRSVPs<TRes> get myEventRSVPs =>
      CopyWith$Query$MyRSVPs$myEventRSVPs.stub(_res);
}

const documentNodeQueryMyRSVPs = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyRSVPs'),
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
            name: NameNode(value: 'RSVPStatus'),
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
            name: NameNode(value: 'myEventRSVPs'),
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
                        name: NameNode(value: 'status'),
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
                        name: NameNode(value: 'dietaryRestrictions'),
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
                        name: NameNode(value: 'paymentStatus'),
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
                        name: NameNode(value: 'attendanceCount'),
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
Query$MyRSVPs _parserFn$Query$MyRSVPs(Map<String, dynamic> data) =>
    Query$MyRSVPs.fromJson(data);
typedef OnQueryComplete$Query$MyRSVPs =
    FutureOr<void> Function(Map<String, dynamic>?, Query$MyRSVPs?);

class Options$Query$MyRSVPs extends graphql.QueryOptions<Query$MyRSVPs> {
  Options$Query$MyRSVPs({
    String? operationName,
    Variables$Query$MyRSVPs? variables,
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
    Variables$Query$MyRSVPs? variables,
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
         variables: variables?.toJson() ?? {},
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
    Variables$Query$MyRSVPs? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryMyRSVPs,
       );
}

extension ClientExtension$Query$MyRSVPs on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$MyRSVPs>> query$MyRSVPs([
    Options$Query$MyRSVPs? options,
  ]) async => await this.query(options ?? Options$Query$MyRSVPs());

  graphql.ObservableQuery<Query$MyRSVPs> watchQuery$MyRSVPs([
    WatchOptions$Query$MyRSVPs? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$MyRSVPs());

  void writeQuery$MyRSVPs({
    required Query$MyRSVPs data,
    Variables$Query$MyRSVPs? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryMyRSVPs),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$MyRSVPs? readQuery$MyRSVPs({
    Variables$Query$MyRSVPs? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMyRSVPs),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$MyRSVPs.fromJson(result);
  }
}

class Query$MyRSVPs$myEventRSVPs {
  Query$MyRSVPs$myEventRSVPs({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'RSVPConnection',
  });

  factory Query$MyRSVPs$myEventRSVPs.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$MyRSVPs$myEventRSVPs(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$MyRSVPs$myEventRSVPs$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$MyRSVPs$myEventRSVPs$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MyRSVPs$myEventRSVPs$nodes> nodes;

  final Query$MyRSVPs$myEventRSVPs$pageInfo pageInfo;

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
    if (other is! Query$MyRSVPs$myEventRSVPs ||
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

extension UtilityExtension$Query$MyRSVPs$myEventRSVPs
    on Query$MyRSVPs$myEventRSVPs {
  CopyWith$Query$MyRSVPs$myEventRSVPs<Query$MyRSVPs$myEventRSVPs>
  get copyWith => CopyWith$Query$MyRSVPs$myEventRSVPs(this, (i) => i);
}

abstract class CopyWith$Query$MyRSVPs$myEventRSVPs<TRes> {
  factory CopyWith$Query$MyRSVPs$myEventRSVPs(
    Query$MyRSVPs$myEventRSVPs instance,
    TRes Function(Query$MyRSVPs$myEventRSVPs) then,
  ) = _CopyWithImpl$Query$MyRSVPs$myEventRSVPs;

  factory CopyWith$Query$MyRSVPs$myEventRSVPs.stub(TRes res) =
      _CopyWithStubImpl$Query$MyRSVPs$myEventRSVPs;

  TRes call({
    List<Query$MyRSVPs$myEventRSVPs$nodes>? nodes,
    Query$MyRSVPs$myEventRSVPs$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$MyRSVPs$myEventRSVPs$nodes> Function(
      Iterable<
        CopyWith$Query$MyRSVPs$myEventRSVPs$nodes<
          Query$MyRSVPs$myEventRSVPs$nodes
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$MyRSVPs$myEventRSVPs$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$MyRSVPs$myEventRSVPs<TRes>
    implements CopyWith$Query$MyRSVPs$myEventRSVPs<TRes> {
  _CopyWithImpl$Query$MyRSVPs$myEventRSVPs(this._instance, this._then);

  final Query$MyRSVPs$myEventRSVPs _instance;

  final TRes Function(Query$MyRSVPs$myEventRSVPs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyRSVPs$myEventRSVPs(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$MyRSVPs$myEventRSVPs$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$MyRSVPs$myEventRSVPs$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$MyRSVPs$myEventRSVPs$nodes> Function(
      Iterable<
        CopyWith$Query$MyRSVPs$myEventRSVPs$nodes<
          Query$MyRSVPs$myEventRSVPs$nodes
        >
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$MyRSVPs$myEventRSVPs$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$MyRSVPs$myEventRSVPs$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$MyRSVPs$myEventRSVPs$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$MyRSVPs$myEventRSVPs<TRes>
    implements CopyWith$Query$MyRSVPs$myEventRSVPs<TRes> {
  _CopyWithStubImpl$Query$MyRSVPs$myEventRSVPs(this._res);

  TRes _res;

  call({
    List<Query$MyRSVPs$myEventRSVPs$nodes>? nodes,
    Query$MyRSVPs$myEventRSVPs$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$MyRSVPs$myEventRSVPs$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$MyRSVPs$myEventRSVPs$pageInfo.stub(_res);
}

class Query$MyRSVPs$myEventRSVPs$nodes {
  Query$MyRSVPs$myEventRSVPs$nodes({
    required this.id,
    required this.eventId,
    required this.memberId,
    required this.clubId,
    required this.status,
    required this.guestCount,
    this.dietaryRestrictions,
    this.specialRequests,
    required this.paymentStatus,
    this.response,
    this.attendanceCount,
    this.cancellationFee,
    this.feeWaived,
    this.rsvpedAt,
    required this.updatedAt,
    this.cancelledAt,
    this.cancellationReason,
    this.$__typename = 'EventRSVP',
  });

  factory Query$MyRSVPs$myEventRSVPs$nodes.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$eventId = json['eventId'];
    final l$memberId = json['memberId'];
    final l$clubId = json['clubId'];
    final l$status = json['status'];
    final l$guestCount = json['guestCount'];
    final l$dietaryRestrictions = json['dietaryRestrictions'];
    final l$specialRequests = json['specialRequests'];
    final l$paymentStatus = json['paymentStatus'];
    final l$response = json['response'];
    final l$attendanceCount = json['attendanceCount'];
    final l$cancellationFee = json['cancellationFee'];
    final l$feeWaived = json['feeWaived'];
    final l$rsvpedAt = json['rsvpedAt'];
    final l$updatedAt = json['updatedAt'];
    final l$cancelledAt = json['cancelledAt'];
    final l$cancellationReason = json['cancellationReason'];
    final l$$__typename = json['__typename'];
    return Query$MyRSVPs$myEventRSVPs$nodes(
      id: (l$id as String),
      eventId: (l$eventId as String),
      memberId: (l$memberId as String),
      clubId: (l$clubId as String),
      status: fromJson$Enum$RSVPStatus((l$status as String)),
      guestCount: (l$guestCount as int),
      dietaryRestrictions: (l$dietaryRestrictions as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList(),
      specialRequests: (l$specialRequests as String?),
      paymentStatus: fromJson$Enum$PaymentStatus((l$paymentStatus as String)),
      response: (l$response as String?),
      attendanceCount: (l$attendanceCount as int?),
      cancellationFee: (l$cancellationFee as num?)?.toDouble(),
      feeWaived: (l$feeWaived as bool?),
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

  final Enum$RSVPStatus status;

  final int guestCount;

  final List<String>? dietaryRestrictions;

  final String? specialRequests;

  final Enum$PaymentStatus paymentStatus;

  final String? response;

  final int? attendanceCount;

  final double? cancellationFee;

  final bool? feeWaived;

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
    final l$status = status;
    _resultData['status'] = toJson$Enum$RSVPStatus(l$status);
    final l$guestCount = guestCount;
    _resultData['guestCount'] = l$guestCount;
    final l$dietaryRestrictions = dietaryRestrictions;
    _resultData['dietaryRestrictions'] = l$dietaryRestrictions
        ?.map((e) => e)
        .toList();
    final l$specialRequests = specialRequests;
    _resultData['specialRequests'] = l$specialRequests;
    final l$paymentStatus = paymentStatus;
    _resultData['paymentStatus'] = toJson$Enum$PaymentStatus(l$paymentStatus);
    final l$response = response;
    _resultData['response'] = l$response;
    final l$attendanceCount = attendanceCount;
    _resultData['attendanceCount'] = l$attendanceCount;
    final l$cancellationFee = cancellationFee;
    _resultData['cancellationFee'] = l$cancellationFee;
    final l$feeWaived = feeWaived;
    _resultData['feeWaived'] = l$feeWaived;
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
    final l$status = status;
    final l$guestCount = guestCount;
    final l$dietaryRestrictions = dietaryRestrictions;
    final l$specialRequests = specialRequests;
    final l$paymentStatus = paymentStatus;
    final l$response = response;
    final l$attendanceCount = attendanceCount;
    final l$cancellationFee = cancellationFee;
    final l$feeWaived = feeWaived;
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
      l$status,
      l$guestCount,
      l$dietaryRestrictions == null
          ? null
          : Object.hashAll(l$dietaryRestrictions.map((v) => v)),
      l$specialRequests,
      l$paymentStatus,
      l$response,
      l$attendanceCount,
      l$cancellationFee,
      l$feeWaived,
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
    if (other is! Query$MyRSVPs$myEventRSVPs$nodes ||
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
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$guestCount = guestCount;
    final lOther$guestCount = other.guestCount;
    if (l$guestCount != lOther$guestCount) {
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
    final l$specialRequests = specialRequests;
    final lOther$specialRequests = other.specialRequests;
    if (l$specialRequests != lOther$specialRequests) {
      return false;
    }
    final l$paymentStatus = paymentStatus;
    final lOther$paymentStatus = other.paymentStatus;
    if (l$paymentStatus != lOther$paymentStatus) {
      return false;
    }
    final l$response = response;
    final lOther$response = other.response;
    if (l$response != lOther$response) {
      return false;
    }
    final l$attendanceCount = attendanceCount;
    final lOther$attendanceCount = other.attendanceCount;
    if (l$attendanceCount != lOther$attendanceCount) {
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

extension UtilityExtension$Query$MyRSVPs$myEventRSVPs$nodes
    on Query$MyRSVPs$myEventRSVPs$nodes {
  CopyWith$Query$MyRSVPs$myEventRSVPs$nodes<Query$MyRSVPs$myEventRSVPs$nodes>
  get copyWith => CopyWith$Query$MyRSVPs$myEventRSVPs$nodes(this, (i) => i);
}

abstract class CopyWith$Query$MyRSVPs$myEventRSVPs$nodes<TRes> {
  factory CopyWith$Query$MyRSVPs$myEventRSVPs$nodes(
    Query$MyRSVPs$myEventRSVPs$nodes instance,
    TRes Function(Query$MyRSVPs$myEventRSVPs$nodes) then,
  ) = _CopyWithImpl$Query$MyRSVPs$myEventRSVPs$nodes;

  factory CopyWith$Query$MyRSVPs$myEventRSVPs$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$MyRSVPs$myEventRSVPs$nodes;

  TRes call({
    String? id,
    String? eventId,
    String? memberId,
    String? clubId,
    Enum$RSVPStatus? status,
    int? guestCount,
    List<String>? dietaryRestrictions,
    String? specialRequests,
    Enum$PaymentStatus? paymentStatus,
    String? response,
    int? attendanceCount,
    double? cancellationFee,
    bool? feeWaived,
    DateTime? rsvpedAt,
    DateTime? updatedAt,
    DateTime? cancelledAt,
    String? cancellationReason,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MyRSVPs$myEventRSVPs$nodes<TRes>
    implements CopyWith$Query$MyRSVPs$myEventRSVPs$nodes<TRes> {
  _CopyWithImpl$Query$MyRSVPs$myEventRSVPs$nodes(this._instance, this._then);

  final Query$MyRSVPs$myEventRSVPs$nodes _instance;

  final TRes Function(Query$MyRSVPs$myEventRSVPs$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? eventId = _undefined,
    Object? memberId = _undefined,
    Object? clubId = _undefined,
    Object? status = _undefined,
    Object? guestCount = _undefined,
    Object? dietaryRestrictions = _undefined,
    Object? specialRequests = _undefined,
    Object? paymentStatus = _undefined,
    Object? response = _undefined,
    Object? attendanceCount = _undefined,
    Object? cancellationFee = _undefined,
    Object? feeWaived = _undefined,
    Object? rsvpedAt = _undefined,
    Object? updatedAt = _undefined,
    Object? cancelledAt = _undefined,
    Object? cancellationReason = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyRSVPs$myEventRSVPs$nodes(
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
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$RSVPStatus),
      guestCount: guestCount == _undefined || guestCount == null
          ? _instance.guestCount
          : (guestCount as int),
      dietaryRestrictions: dietaryRestrictions == _undefined
          ? _instance.dietaryRestrictions
          : (dietaryRestrictions as List<String>?),
      specialRequests: specialRequests == _undefined
          ? _instance.specialRequests
          : (specialRequests as String?),
      paymentStatus: paymentStatus == _undefined || paymentStatus == null
          ? _instance.paymentStatus
          : (paymentStatus as Enum$PaymentStatus),
      response: response == _undefined
          ? _instance.response
          : (response as String?),
      attendanceCount: attendanceCount == _undefined
          ? _instance.attendanceCount
          : (attendanceCount as int?),
      cancellationFee: cancellationFee == _undefined
          ? _instance.cancellationFee
          : (cancellationFee as double?),
      feeWaived: feeWaived == _undefined
          ? _instance.feeWaived
          : (feeWaived as bool?),
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

class _CopyWithStubImpl$Query$MyRSVPs$myEventRSVPs$nodes<TRes>
    implements CopyWith$Query$MyRSVPs$myEventRSVPs$nodes<TRes> {
  _CopyWithStubImpl$Query$MyRSVPs$myEventRSVPs$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? eventId,
    String? memberId,
    String? clubId,
    Enum$RSVPStatus? status,
    int? guestCount,
    List<String>? dietaryRestrictions,
    String? specialRequests,
    Enum$PaymentStatus? paymentStatus,
    String? response,
    int? attendanceCount,
    double? cancellationFee,
    bool? feeWaived,
    DateTime? rsvpedAt,
    DateTime? updatedAt,
    DateTime? cancelledAt,
    String? cancellationReason,
    String? $__typename,
  }) => _res;
}

class Query$MyRSVPs$myEventRSVPs$pageInfo {
  Query$MyRSVPs$myEventRSVPs$pageInfo({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$MyRSVPs$myEventRSVPs$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$page = json['page'];
    final l$pageSize = json['pageSize'];
    final l$total = json['total'];
    final l$totalPages = json['totalPages'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPrevPage = json['hasPrevPage'];
    final l$$__typename = json['__typename'];
    return Query$MyRSVPs$myEventRSVPs$pageInfo(
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
    if (other is! Query$MyRSVPs$myEventRSVPs$pageInfo ||
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

extension UtilityExtension$Query$MyRSVPs$myEventRSVPs$pageInfo
    on Query$MyRSVPs$myEventRSVPs$pageInfo {
  CopyWith$Query$MyRSVPs$myEventRSVPs$pageInfo<
    Query$MyRSVPs$myEventRSVPs$pageInfo
  >
  get copyWith => CopyWith$Query$MyRSVPs$myEventRSVPs$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$MyRSVPs$myEventRSVPs$pageInfo<TRes> {
  factory CopyWith$Query$MyRSVPs$myEventRSVPs$pageInfo(
    Query$MyRSVPs$myEventRSVPs$pageInfo instance,
    TRes Function(Query$MyRSVPs$myEventRSVPs$pageInfo) then,
  ) = _CopyWithImpl$Query$MyRSVPs$myEventRSVPs$pageInfo;

  factory CopyWith$Query$MyRSVPs$myEventRSVPs$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$MyRSVPs$myEventRSVPs$pageInfo;

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

class _CopyWithImpl$Query$MyRSVPs$myEventRSVPs$pageInfo<TRes>
    implements CopyWith$Query$MyRSVPs$myEventRSVPs$pageInfo<TRes> {
  _CopyWithImpl$Query$MyRSVPs$myEventRSVPs$pageInfo(this._instance, this._then);

  final Query$MyRSVPs$myEventRSVPs$pageInfo _instance;

  final TRes Function(Query$MyRSVPs$myEventRSVPs$pageInfo) _then;

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
    Query$MyRSVPs$myEventRSVPs$pageInfo(
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

class _CopyWithStubImpl$Query$MyRSVPs$myEventRSVPs$pageInfo<TRes>
    implements CopyWith$Query$MyRSVPs$myEventRSVPs$pageInfo<TRes> {
  _CopyWithStubImpl$Query$MyRSVPs$myEventRSVPs$pageInfo(this._res);

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
