import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$FindingFriendsSubgroups {
  factory Variables$Query$FindingFriendsSubgroups({required String clubId}) =>
      Variables$Query$FindingFriendsSubgroups._({r'clubId': clubId});

  Variables$Query$FindingFriendsSubgroups._(this._$data);

  factory Variables$Query$FindingFriendsSubgroups.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$clubId = data['clubId'];
    result$data['clubId'] = (l$clubId as String);
    return Variables$Query$FindingFriendsSubgroups._(result$data);
  }

  Map<String, dynamic> _$data;

  String get clubId => (_$data['clubId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$clubId = clubId;
    result$data['clubId'] = l$clubId;
    return result$data;
  }

  CopyWith$Variables$Query$FindingFriendsSubgroups<
    Variables$Query$FindingFriendsSubgroups
  >
  get copyWith =>
      CopyWith$Variables$Query$FindingFriendsSubgroups(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$FindingFriendsSubgroups ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$clubId = clubId;
    final lOther$clubId = other.clubId;
    if (l$clubId != lOther$clubId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$clubId = clubId;
    return Object.hashAll([l$clubId]);
  }
}

abstract class CopyWith$Variables$Query$FindingFriendsSubgroups<TRes> {
  factory CopyWith$Variables$Query$FindingFriendsSubgroups(
    Variables$Query$FindingFriendsSubgroups instance,
    TRes Function(Variables$Query$FindingFriendsSubgroups) then,
  ) = _CopyWithImpl$Variables$Query$FindingFriendsSubgroups;

  factory CopyWith$Variables$Query$FindingFriendsSubgroups.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$FindingFriendsSubgroups;

  TRes call({String? clubId});
}

class _CopyWithImpl$Variables$Query$FindingFriendsSubgroups<TRes>
    implements CopyWith$Variables$Query$FindingFriendsSubgroups<TRes> {
  _CopyWithImpl$Variables$Query$FindingFriendsSubgroups(
    this._instance,
    this._then,
  );

  final Variables$Query$FindingFriendsSubgroups _instance;

  final TRes Function(Variables$Query$FindingFriendsSubgroups) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? clubId = _undefined}) => _then(
    Variables$Query$FindingFriendsSubgroups._({
      ..._instance._$data,
      if (clubId != _undefined && clubId != null) 'clubId': (clubId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$FindingFriendsSubgroups<TRes>
    implements CopyWith$Variables$Query$FindingFriendsSubgroups<TRes> {
  _CopyWithStubImpl$Variables$Query$FindingFriendsSubgroups(this._res);

  TRes _res;

  call({String? clubId}) => _res;
}

class Query$FindingFriendsSubgroups {
  Query$FindingFriendsSubgroups({
    required this.findingFriendsSubgroups,
    this.$__typename = 'Query',
  });

  factory Query$FindingFriendsSubgroups.fromJson(Map<String, dynamic> json) {
    final l$findingFriendsSubgroups = json['findingFriendsSubgroups'];
    final l$$__typename = json['__typename'];
    return Query$FindingFriendsSubgroups(
      findingFriendsSubgroups: (l$findingFriendsSubgroups as List<dynamic>)
          .map(
            (e) =>
                Query$FindingFriendsSubgroups$findingFriendsSubgroups.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$FindingFriendsSubgroups$findingFriendsSubgroups>
  findingFriendsSubgroups;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$findingFriendsSubgroups = findingFriendsSubgroups;
    _resultData['findingFriendsSubgroups'] = l$findingFriendsSubgroups
        .map((e) => e.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$findingFriendsSubgroups = findingFriendsSubgroups;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$findingFriendsSubgroups.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FindingFriendsSubgroups ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$findingFriendsSubgroups = findingFriendsSubgroups;
    final lOther$findingFriendsSubgroups = other.findingFriendsSubgroups;
    if (l$findingFriendsSubgroups.length !=
        lOther$findingFriendsSubgroups.length) {
      return false;
    }
    for (int i = 0; i < l$findingFriendsSubgroups.length; i++) {
      final l$findingFriendsSubgroups$entry = l$findingFriendsSubgroups[i];
      final lOther$findingFriendsSubgroups$entry =
          lOther$findingFriendsSubgroups[i];
      if (l$findingFriendsSubgroups$entry !=
          lOther$findingFriendsSubgroups$entry) {
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

extension UtilityExtension$Query$FindingFriendsSubgroups
    on Query$FindingFriendsSubgroups {
  CopyWith$Query$FindingFriendsSubgroups<Query$FindingFriendsSubgroups>
  get copyWith => CopyWith$Query$FindingFriendsSubgroups(this, (i) => i);
}

abstract class CopyWith$Query$FindingFriendsSubgroups<TRes> {
  factory CopyWith$Query$FindingFriendsSubgroups(
    Query$FindingFriendsSubgroups instance,
    TRes Function(Query$FindingFriendsSubgroups) then,
  ) = _CopyWithImpl$Query$FindingFriendsSubgroups;

  factory CopyWith$Query$FindingFriendsSubgroups.stub(TRes res) =
      _CopyWithStubImpl$Query$FindingFriendsSubgroups;

  TRes call({
    List<Query$FindingFriendsSubgroups$findingFriendsSubgroups>?
    findingFriendsSubgroups,
    String? $__typename,
  });
  TRes findingFriendsSubgroups(
    Iterable<Query$FindingFriendsSubgroups$findingFriendsSubgroups> Function(
      Iterable<
        CopyWith$Query$FindingFriendsSubgroups$findingFriendsSubgroups<
          Query$FindingFriendsSubgroups$findingFriendsSubgroups
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$FindingFriendsSubgroups<TRes>
    implements CopyWith$Query$FindingFriendsSubgroups<TRes> {
  _CopyWithImpl$Query$FindingFriendsSubgroups(this._instance, this._then);

  final Query$FindingFriendsSubgroups _instance;

  final TRes Function(Query$FindingFriendsSubgroups) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? findingFriendsSubgroups = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FindingFriendsSubgroups(
      findingFriendsSubgroups:
          findingFriendsSubgroups == _undefined ||
              findingFriendsSubgroups == null
          ? _instance.findingFriendsSubgroups
          : (findingFriendsSubgroups
                as List<Query$FindingFriendsSubgroups$findingFriendsSubgroups>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes findingFriendsSubgroups(
    Iterable<Query$FindingFriendsSubgroups$findingFriendsSubgroups> Function(
      Iterable<
        CopyWith$Query$FindingFriendsSubgroups$findingFriendsSubgroups<
          Query$FindingFriendsSubgroups$findingFriendsSubgroups
        >
      >,
    )
    _fn,
  ) => call(
    findingFriendsSubgroups: _fn(
      _instance.findingFriendsSubgroups.map(
        (e) => CopyWith$Query$FindingFriendsSubgroups$findingFriendsSubgroups(
          e,
          (i) => i,
        ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$FindingFriendsSubgroups<TRes>
    implements CopyWith$Query$FindingFriendsSubgroups<TRes> {
  _CopyWithStubImpl$Query$FindingFriendsSubgroups(this._res);

  TRes _res;

  call({
    List<Query$FindingFriendsSubgroups$findingFriendsSubgroups>?
    findingFriendsSubgroups,
    String? $__typename,
  }) => _res;

  findingFriendsSubgroups(_fn) => _res;
}

const documentNodeQueryFindingFriendsSubgroups = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'FindingFriendsSubgroups'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'clubId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'findingFriendsSubgroups'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'clubId'),
                value: VariableNode(name: NameNode(value: 'clubId')),
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
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'description'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'memberCount'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'isActive'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'organizerId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'organizerName'),
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
Query$FindingFriendsSubgroups _parserFn$Query$FindingFriendsSubgroups(
  Map<String, dynamic> data,
) => Query$FindingFriendsSubgroups.fromJson(data);
typedef OnQueryComplete$Query$FindingFriendsSubgroups =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Query$FindingFriendsSubgroups?,
    );

class Options$Query$FindingFriendsSubgroups
    extends graphql.QueryOptions<Query$FindingFriendsSubgroups> {
  Options$Query$FindingFriendsSubgroups({
    String? operationName,
    required Variables$Query$FindingFriendsSubgroups variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FindingFriendsSubgroups? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$FindingFriendsSubgroups? onComplete,
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
                     : _parserFn$Query$FindingFriendsSubgroups(data),
               ),
         onError: onError,
         document: documentNodeQueryFindingFriendsSubgroups,
         parserFn: _parserFn$Query$FindingFriendsSubgroups,
       );

  final OnQueryComplete$Query$FindingFriendsSubgroups? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$FindingFriendsSubgroups
    extends graphql.WatchQueryOptions<Query$FindingFriendsSubgroups> {
  WatchOptions$Query$FindingFriendsSubgroups({
    String? operationName,
    required Variables$Query$FindingFriendsSubgroups variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FindingFriendsSubgroups? typedOptimisticResult,
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
         document: documentNodeQueryFindingFriendsSubgroups,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$FindingFriendsSubgroups,
       );
}

class FetchMoreOptions$Query$FindingFriendsSubgroups
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$FindingFriendsSubgroups({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$FindingFriendsSubgroups variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryFindingFriendsSubgroups,
       );
}

extension ClientExtension$Query$FindingFriendsSubgroups
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$FindingFriendsSubgroups>>
  query$FindingFriendsSubgroups(
    Options$Query$FindingFriendsSubgroups options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$FindingFriendsSubgroups>
  watchQuery$FindingFriendsSubgroups(
    WatchOptions$Query$FindingFriendsSubgroups options,
  ) => this.watchQuery(options);

  void writeQuery$FindingFriendsSubgroups({
    required Query$FindingFriendsSubgroups data,
    required Variables$Query$FindingFriendsSubgroups variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryFindingFriendsSubgroups,
      ),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$FindingFriendsSubgroups? readQuery$FindingFriendsSubgroups({
    required Variables$Query$FindingFriendsSubgroups variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryFindingFriendsSubgroups,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$FindingFriendsSubgroups.fromJson(result);
  }
}

class Query$FindingFriendsSubgroups$findingFriendsSubgroups {
  Query$FindingFriendsSubgroups$findingFriendsSubgroups({
    required this.id,
    required this.clubId,
    required this.name,
    this.description,
    required this.memberCount,
    this.isActive,
    this.organizerId,
    this.organizerName,
    this.$__typename = 'Subgroup',
  });

  factory Query$FindingFriendsSubgroups$findingFriendsSubgroups.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$memberCount = json['memberCount'];
    final l$isActive = json['isActive'];
    final l$organizerId = json['organizerId'];
    final l$organizerName = json['organizerName'];
    final l$$__typename = json['__typename'];
    return Query$FindingFriendsSubgroups$findingFriendsSubgroups(
      id: (l$id as String),
      clubId: (l$clubId as String),
      name: (l$name as String),
      description: (l$description as String?),
      memberCount: (l$memberCount as int),
      isActive: (l$isActive as bool?),
      organizerId: (l$organizerId as String?),
      organizerName: (l$organizerName as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String name;

  final String? description;

  final int memberCount;

  final bool? isActive;

  final String? organizerId;

  final String? organizerName;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$memberCount = memberCount;
    _resultData['memberCount'] = l$memberCount;
    final l$isActive = isActive;
    _resultData['isActive'] = l$isActive;
    final l$organizerId = organizerId;
    _resultData['organizerId'] = l$organizerId;
    final l$organizerName = organizerName;
    _resultData['organizerName'] = l$organizerName;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clubId = clubId;
    final l$name = name;
    final l$description = description;
    final l$memberCount = memberCount;
    final l$isActive = isActive;
    final l$organizerId = organizerId;
    final l$organizerName = organizerName;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$name,
      l$description,
      l$memberCount,
      l$isActive,
      l$organizerId,
      l$organizerName,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FindingFriendsSubgroups$findingFriendsSubgroups ||
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
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$memberCount = memberCount;
    final lOther$memberCount = other.memberCount;
    if (l$memberCount != lOther$memberCount) {
      return false;
    }
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (l$isActive != lOther$isActive) {
      return false;
    }
    final l$organizerId = organizerId;
    final lOther$organizerId = other.organizerId;
    if (l$organizerId != lOther$organizerId) {
      return false;
    }
    final l$organizerName = organizerName;
    final lOther$organizerName = other.organizerName;
    if (l$organizerName != lOther$organizerName) {
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

extension UtilityExtension$Query$FindingFriendsSubgroups$findingFriendsSubgroups
    on Query$FindingFriendsSubgroups$findingFriendsSubgroups {
  CopyWith$Query$FindingFriendsSubgroups$findingFriendsSubgroups<
    Query$FindingFriendsSubgroups$findingFriendsSubgroups
  >
  get copyWith =>
      CopyWith$Query$FindingFriendsSubgroups$findingFriendsSubgroups(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$FindingFriendsSubgroups$findingFriendsSubgroups<
  TRes
> {
  factory CopyWith$Query$FindingFriendsSubgroups$findingFriendsSubgroups(
    Query$FindingFriendsSubgroups$findingFriendsSubgroups instance,
    TRes Function(Query$FindingFriendsSubgroups$findingFriendsSubgroups) then,
  ) = _CopyWithImpl$Query$FindingFriendsSubgroups$findingFriendsSubgroups;

  factory CopyWith$Query$FindingFriendsSubgroups$findingFriendsSubgroups.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$FindingFriendsSubgroups$findingFriendsSubgroups;

  TRes call({
    String? id,
    String? clubId,
    String? name,
    String? description,
    int? memberCount,
    bool? isActive,
    String? organizerId,
    String? organizerName,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FindingFriendsSubgroups$findingFriendsSubgroups<TRes>
    implements
        CopyWith$Query$FindingFriendsSubgroups$findingFriendsSubgroups<TRes> {
  _CopyWithImpl$Query$FindingFriendsSubgroups$findingFriendsSubgroups(
    this._instance,
    this._then,
  );

  final Query$FindingFriendsSubgroups$findingFriendsSubgroups _instance;

  final TRes Function(Query$FindingFriendsSubgroups$findingFriendsSubgroups)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? memberCount = _undefined,
    Object? isActive = _undefined,
    Object? organizerId = _undefined,
    Object? organizerName = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FindingFriendsSubgroups$findingFriendsSubgroups(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      memberCount: memberCount == _undefined || memberCount == null
          ? _instance.memberCount
          : (memberCount as int),
      isActive: isActive == _undefined
          ? _instance.isActive
          : (isActive as bool?),
      organizerId: organizerId == _undefined
          ? _instance.organizerId
          : (organizerId as String?),
      organizerName: organizerName == _undefined
          ? _instance.organizerName
          : (organizerName as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$FindingFriendsSubgroups$findingFriendsSubgroups<
  TRes
>
    implements
        CopyWith$Query$FindingFriendsSubgroups$findingFriendsSubgroups<TRes> {
  _CopyWithStubImpl$Query$FindingFriendsSubgroups$findingFriendsSubgroups(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? name,
    String? description,
    int? memberCount,
    bool? isActive,
    String? organizerId,
    String? organizerName,
    String? $__typename,
  }) => _res;
}
