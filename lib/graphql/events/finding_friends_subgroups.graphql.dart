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
          .map((e) => (e as String))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<String> findingFriendsSubgroups;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$findingFriendsSubgroups = findingFriendsSubgroups;
    _resultData['findingFriendsSubgroups'] = l$findingFriendsSubgroups
        .map((e) => e)
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

  TRes call({List<String>? findingFriendsSubgroups, String? $__typename});
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
          : (findingFriendsSubgroups as List<String>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$FindingFriendsSubgroups<TRes>
    implements CopyWith$Query$FindingFriendsSubgroups<TRes> {
  _CopyWithStubImpl$Query$FindingFriendsSubgroups(this._res);

  TRes _res;

  call({List<String>? findingFriendsSubgroups, String? $__typename}) => _res;
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
