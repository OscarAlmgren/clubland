import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Mutation$MarkAllNotificationsRead {
  Mutation$MarkAllNotificationsRead({
    required this.markAllNotificationsRead,
    this.$__typename = 'Mutation',
  });

  factory Mutation$MarkAllNotificationsRead.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$markAllNotificationsRead = json['markAllNotificationsRead'];
    final l$$__typename = json['__typename'];
    return Mutation$MarkAllNotificationsRead(
      markAllNotificationsRead: (l$markAllNotificationsRead as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool markAllNotificationsRead;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$markAllNotificationsRead = markAllNotificationsRead;
    _resultData['markAllNotificationsRead'] = l$markAllNotificationsRead;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$markAllNotificationsRead = markAllNotificationsRead;
    final l$$__typename = $__typename;
    return Object.hashAll([l$markAllNotificationsRead, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$MarkAllNotificationsRead ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$markAllNotificationsRead = markAllNotificationsRead;
    final lOther$markAllNotificationsRead = other.markAllNotificationsRead;
    if (l$markAllNotificationsRead != lOther$markAllNotificationsRead) {
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

extension UtilityExtension$Mutation$MarkAllNotificationsRead
    on Mutation$MarkAllNotificationsRead {
  CopyWith$Mutation$MarkAllNotificationsRead<Mutation$MarkAllNotificationsRead>
  get copyWith => CopyWith$Mutation$MarkAllNotificationsRead(this, (i) => i);
}

abstract class CopyWith$Mutation$MarkAllNotificationsRead<TRes> {
  factory CopyWith$Mutation$MarkAllNotificationsRead(
    Mutation$MarkAllNotificationsRead instance,
    TRes Function(Mutation$MarkAllNotificationsRead) then,
  ) = _CopyWithImpl$Mutation$MarkAllNotificationsRead;

  factory CopyWith$Mutation$MarkAllNotificationsRead.stub(TRes res) =
      _CopyWithStubImpl$Mutation$MarkAllNotificationsRead;

  TRes call({bool? markAllNotificationsRead, String? $__typename});
}

class _CopyWithImpl$Mutation$MarkAllNotificationsRead<TRes>
    implements CopyWith$Mutation$MarkAllNotificationsRead<TRes> {
  _CopyWithImpl$Mutation$MarkAllNotificationsRead(this._instance, this._then);

  final Mutation$MarkAllNotificationsRead _instance;

  final TRes Function(Mutation$MarkAllNotificationsRead) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? markAllNotificationsRead = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$MarkAllNotificationsRead(
      markAllNotificationsRead:
          markAllNotificationsRead == _undefined ||
              markAllNotificationsRead == null
          ? _instance.markAllNotificationsRead
          : (markAllNotificationsRead as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$MarkAllNotificationsRead<TRes>
    implements CopyWith$Mutation$MarkAllNotificationsRead<TRes> {
  _CopyWithStubImpl$Mutation$MarkAllNotificationsRead(this._res);

  TRes _res;

  call({bool? markAllNotificationsRead, String? $__typename}) => _res;
}

const documentNodeMutationMarkAllNotificationsRead = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'MarkAllNotificationsRead'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'markAllNotificationsRead'),
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
Mutation$MarkAllNotificationsRead _parserFn$Mutation$MarkAllNotificationsRead(
  Map<String, dynamic> data,
) => Mutation$MarkAllNotificationsRead.fromJson(data);
typedef OnMutationCompleted$Mutation$MarkAllNotificationsRead =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$MarkAllNotificationsRead?,
    );

class Options$Mutation$MarkAllNotificationsRead
    extends graphql.MutationOptions<Mutation$MarkAllNotificationsRead> {
  Options$Mutation$MarkAllNotificationsRead({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$MarkAllNotificationsRead? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$MarkAllNotificationsRead? onCompleted,
    graphql.OnMutationUpdate<Mutation$MarkAllNotificationsRead>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null
                     ? null
                     : _parserFn$Mutation$MarkAllNotificationsRead(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationMarkAllNotificationsRead,
         parserFn: _parserFn$Mutation$MarkAllNotificationsRead,
       );

  final OnMutationCompleted$Mutation$MarkAllNotificationsRead?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$MarkAllNotificationsRead
    extends graphql.WatchQueryOptions<Mutation$MarkAllNotificationsRead> {
  WatchOptions$Mutation$MarkAllNotificationsRead({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$MarkAllNotificationsRead? typedOptimisticResult,
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
         document: documentNodeMutationMarkAllNotificationsRead,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$MarkAllNotificationsRead,
       );
}

extension ClientExtension$Mutation$MarkAllNotificationsRead
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$MarkAllNotificationsRead>>
  mutate$MarkAllNotificationsRead([
    Options$Mutation$MarkAllNotificationsRead? options,
  ]) async =>
      await this.mutate(options ?? Options$Mutation$MarkAllNotificationsRead());

  graphql.ObservableQuery<Mutation$MarkAllNotificationsRead>
  watchMutation$MarkAllNotificationsRead([
    WatchOptions$Mutation$MarkAllNotificationsRead? options,
  ]) => this.watchMutation(
    options ?? WatchOptions$Mutation$MarkAllNotificationsRead(),
  );
}
