import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Query$UnreadNotificationCount {
  Query$UnreadNotificationCount({
    required this.unreadNotificationCount,
    this.$__typename = 'Query',
  });

  factory Query$UnreadNotificationCount.fromJson(Map<String, dynamic> json) {
    final l$unreadNotificationCount = json['unreadNotificationCount'];
    final l$$__typename = json['__typename'];
    return Query$UnreadNotificationCount(
      unreadNotificationCount: (l$unreadNotificationCount as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int unreadNotificationCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$unreadNotificationCount = unreadNotificationCount;
    _resultData['unreadNotificationCount'] = l$unreadNotificationCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$unreadNotificationCount = unreadNotificationCount;
    final l$$__typename = $__typename;
    return Object.hashAll([l$unreadNotificationCount, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$UnreadNotificationCount ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$unreadNotificationCount = unreadNotificationCount;
    final lOther$unreadNotificationCount = other.unreadNotificationCount;
    if (l$unreadNotificationCount != lOther$unreadNotificationCount) {
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

extension UtilityExtension$Query$UnreadNotificationCount
    on Query$UnreadNotificationCount {
  CopyWith$Query$UnreadNotificationCount<Query$UnreadNotificationCount>
  get copyWith => CopyWith$Query$UnreadNotificationCount(this, (i) => i);
}

abstract class CopyWith$Query$UnreadNotificationCount<TRes> {
  factory CopyWith$Query$UnreadNotificationCount(
    Query$UnreadNotificationCount instance,
    TRes Function(Query$UnreadNotificationCount) then,
  ) = _CopyWithImpl$Query$UnreadNotificationCount;

  factory CopyWith$Query$UnreadNotificationCount.stub(TRes res) =
      _CopyWithStubImpl$Query$UnreadNotificationCount;

  TRes call({int? unreadNotificationCount, String? $__typename});
}

class _CopyWithImpl$Query$UnreadNotificationCount<TRes>
    implements CopyWith$Query$UnreadNotificationCount<TRes> {
  _CopyWithImpl$Query$UnreadNotificationCount(this._instance, this._then);

  final Query$UnreadNotificationCount _instance;

  final TRes Function(Query$UnreadNotificationCount) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? unreadNotificationCount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$UnreadNotificationCount(
      unreadNotificationCount:
          unreadNotificationCount == _undefined ||
              unreadNotificationCount == null
          ? _instance.unreadNotificationCount
          : (unreadNotificationCount as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$UnreadNotificationCount<TRes>
    implements CopyWith$Query$UnreadNotificationCount<TRes> {
  _CopyWithStubImpl$Query$UnreadNotificationCount(this._res);

  TRes _res;

  call({int? unreadNotificationCount, String? $__typename}) => _res;
}

const documentNodeQueryUnreadNotificationCount = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'UnreadNotificationCount'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'unreadNotificationCount'),
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
  ],
);
Query$UnreadNotificationCount _parserFn$Query$UnreadNotificationCount(
  Map<String, dynamic> data,
) => Query$UnreadNotificationCount.fromJson(data);
typedef OnQueryComplete$Query$UnreadNotificationCount =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Query$UnreadNotificationCount?,
    );

class Options$Query$UnreadNotificationCount
    extends graphql.QueryOptions<Query$UnreadNotificationCount> {
  Options$Query$UnreadNotificationCount({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$UnreadNotificationCount? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$UnreadNotificationCount? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
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
                     : _parserFn$Query$UnreadNotificationCount(data),
               ),
         onError: onError,
         document: documentNodeQueryUnreadNotificationCount,
         parserFn: _parserFn$Query$UnreadNotificationCount,
       );

  final OnQueryComplete$Query$UnreadNotificationCount? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$UnreadNotificationCount
    extends graphql.WatchQueryOptions<Query$UnreadNotificationCount> {
  WatchOptions$Query$UnreadNotificationCount({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$UnreadNotificationCount? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryUnreadNotificationCount,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$UnreadNotificationCount,
       );
}

class FetchMoreOptions$Query$UnreadNotificationCount
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$UnreadNotificationCount({
    required graphql.UpdateQuery updateQuery,
  }) : super(
         updateQuery: updateQuery,
         document: documentNodeQueryUnreadNotificationCount,
       );
}

extension ClientExtension$Query$UnreadNotificationCount
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$UnreadNotificationCount>>
  query$UnreadNotificationCount([
    Options$Query$UnreadNotificationCount? options,
  ]) async =>
      await this.query(options ?? Options$Query$UnreadNotificationCount());

  graphql.ObservableQuery<Query$UnreadNotificationCount>
  watchQuery$UnreadNotificationCount([
    WatchOptions$Query$UnreadNotificationCount? options,
  ]) =>
      this.watchQuery(options ?? WatchOptions$Query$UnreadNotificationCount());

  void writeQuery$UnreadNotificationCount({
    required Query$UnreadNotificationCount data,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryUnreadNotificationCount,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$UnreadNotificationCount? readQuery$UnreadNotificationCount({
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryUnreadNotificationCount,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$UnreadNotificationCount.fromJson(result);
  }
}
