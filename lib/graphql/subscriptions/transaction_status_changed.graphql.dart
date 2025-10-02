import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Subscription$TransactionStatusChanged {
  Subscription$TransactionStatusChanged({
    required this.transactionStatusChanged,
    this.$__typename = 'Subscription',
  });

  factory Subscription$TransactionStatusChanged.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$transactionStatusChanged = json['transactionStatusChanged'];
    final l$$__typename = json['__typename'];
    return Subscription$TransactionStatusChanged(
      transactionStatusChanged:
          Subscription$TransactionStatusChanged$transactionStatusChanged.fromJson(
            (l$transactionStatusChanged as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Subscription$TransactionStatusChanged$transactionStatusChanged
  transactionStatusChanged;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$transactionStatusChanged = transactionStatusChanged;
    _resultData['transactionStatusChanged'] = l$transactionStatusChanged
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$transactionStatusChanged = transactionStatusChanged;
    final l$$__typename = $__typename;
    return Object.hashAll([l$transactionStatusChanged, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$TransactionStatusChanged ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$transactionStatusChanged = transactionStatusChanged;
    final lOther$transactionStatusChanged = other.transactionStatusChanged;
    if (l$transactionStatusChanged != lOther$transactionStatusChanged) {
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

extension UtilityExtension$Subscription$TransactionStatusChanged
    on Subscription$TransactionStatusChanged {
  CopyWith$Subscription$TransactionStatusChanged<
    Subscription$TransactionStatusChanged
  >
  get copyWith =>
      CopyWith$Subscription$TransactionStatusChanged(this, (i) => i);
}

abstract class CopyWith$Subscription$TransactionStatusChanged<TRes> {
  factory CopyWith$Subscription$TransactionStatusChanged(
    Subscription$TransactionStatusChanged instance,
    TRes Function(Subscription$TransactionStatusChanged) then,
  ) = _CopyWithImpl$Subscription$TransactionStatusChanged;

  factory CopyWith$Subscription$TransactionStatusChanged.stub(TRes res) =
      _CopyWithStubImpl$Subscription$TransactionStatusChanged;

  TRes call({
    Subscription$TransactionStatusChanged$transactionStatusChanged?
    transactionStatusChanged,
    String? $__typename,
  });
  CopyWith$Subscription$TransactionStatusChanged$transactionStatusChanged<TRes>
  get transactionStatusChanged;
}

class _CopyWithImpl$Subscription$TransactionStatusChanged<TRes>
    implements CopyWith$Subscription$TransactionStatusChanged<TRes> {
  _CopyWithImpl$Subscription$TransactionStatusChanged(
    this._instance,
    this._then,
  );

  final Subscription$TransactionStatusChanged _instance;

  final TRes Function(Subscription$TransactionStatusChanged) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? transactionStatusChanged = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Subscription$TransactionStatusChanged(
      transactionStatusChanged:
          transactionStatusChanged == _undefined ||
              transactionStatusChanged == null
          ? _instance.transactionStatusChanged
          : (transactionStatusChanged
                as Subscription$TransactionStatusChanged$transactionStatusChanged),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Subscription$TransactionStatusChanged$transactionStatusChanged<TRes>
  get transactionStatusChanged {
    final local$transactionStatusChanged = _instance.transactionStatusChanged;
    return CopyWith$Subscription$TransactionStatusChanged$transactionStatusChanged(
      local$transactionStatusChanged,
      (e) => call(transactionStatusChanged: e),
    );
  }
}

class _CopyWithStubImpl$Subscription$TransactionStatusChanged<TRes>
    implements CopyWith$Subscription$TransactionStatusChanged<TRes> {
  _CopyWithStubImpl$Subscription$TransactionStatusChanged(this._res);

  TRes _res;

  call({
    Subscription$TransactionStatusChanged$transactionStatusChanged?
    transactionStatusChanged,
    String? $__typename,
  }) => _res;

  CopyWith$Subscription$TransactionStatusChanged$transactionStatusChanged<TRes>
  get transactionStatusChanged =>
      CopyWith$Subscription$TransactionStatusChanged$transactionStatusChanged.stub(
        _res,
      );
}

const documentNodeSubscriptionTransactionStatusChanged = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'TransactionStatusChanged'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'transactionStatusChanged'),
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
                  name: NameNode(value: 'type'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'chaincode'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'function'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'args'),
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
                  name: NameNode(value: 'txId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'blockNumber'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'timestamp'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'error'),
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
Subscription$TransactionStatusChanged
_parserFn$Subscription$TransactionStatusChanged(Map<String, dynamic> data) =>
    Subscription$TransactionStatusChanged.fromJson(data);

class Options$Subscription$TransactionStatusChanged
    extends graphql.SubscriptionOptions<Subscription$TransactionStatusChanged> {
  Options$Subscription$TransactionStatusChanged({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$TransactionStatusChanged? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeSubscriptionTransactionStatusChanged,
         parserFn: _parserFn$Subscription$TransactionStatusChanged,
       );
}

class WatchOptions$Subscription$TransactionStatusChanged
    extends graphql.WatchQueryOptions<Subscription$TransactionStatusChanged> {
  WatchOptions$Subscription$TransactionStatusChanged({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$TransactionStatusChanged? typedOptimisticResult,
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
         document: documentNodeSubscriptionTransactionStatusChanged,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Subscription$TransactionStatusChanged,
       );
}

class FetchMoreOptions$Subscription$TransactionStatusChanged
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$TransactionStatusChanged({
    required graphql.UpdateQuery updateQuery,
  }) : super(
         updateQuery: updateQuery,
         document: documentNodeSubscriptionTransactionStatusChanged,
       );
}

extension ClientExtension$Subscription$TransactionStatusChanged
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$TransactionStatusChanged>>
  subscribe$TransactionStatusChanged([
    Options$Subscription$TransactionStatusChanged? options,
  ]) => this.subscribe(
    options ?? Options$Subscription$TransactionStatusChanged(),
  );

  graphql.ObservableQuery<Subscription$TransactionStatusChanged>
  watchSubscription$TransactionStatusChanged([
    WatchOptions$Subscription$TransactionStatusChanged? options,
  ]) => this.watchQuery(
    options ?? WatchOptions$Subscription$TransactionStatusChanged(),
  );
}

class Subscription$TransactionStatusChanged$transactionStatusChanged {
  Subscription$TransactionStatusChanged$transactionStatusChanged({
    required this.id,
    required this.type,
    required this.chaincode,
    required this.function,
    required this.args,
    required this.status,
    this.txId,
    this.blockNumber,
    this.timestamp,
    this.error,
    required this.createdAt,
    this.$__typename = 'Transaction',
  });

  factory Subscription$TransactionStatusChanged$transactionStatusChanged.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$chaincode = json['chaincode'];
    final l$function = json['function'];
    final l$args = json['args'];
    final l$status = json['status'];
    final l$txId = json['txId'];
    final l$blockNumber = json['blockNumber'];
    final l$timestamp = json['timestamp'];
    final l$error = json['error'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Subscription$TransactionStatusChanged$transactionStatusChanged(
      id: (l$id as String),
      type: fromJson$Enum$TransactionType((l$type as String)),
      chaincode: (l$chaincode as String),
      function: (l$function as String),
      args: (l$args as List<dynamic>).map((e) => (e as String)).toList(),
      status: fromJson$Enum$TransactionStatus((l$status as String)),
      txId: (l$txId as String?),
      blockNumber: (l$blockNumber as int?),
      timestamp: l$timestamp == null
          ? null
          : DateTime.parse((l$timestamp as String)),
      error: (l$error as String?),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$TransactionType type;

  final String chaincode;

  final String function;

  final List<String> args;

  final Enum$TransactionStatus status;

  final String? txId;

  final int? blockNumber;

  final DateTime? timestamp;

  final String? error;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$type = type;
    _resultData['type'] = toJson$Enum$TransactionType(l$type);
    final l$chaincode = chaincode;
    _resultData['chaincode'] = l$chaincode;
    final l$function = function;
    _resultData['function'] = l$function;
    final l$args = args;
    _resultData['args'] = l$args.map((e) => e).toList();
    final l$status = status;
    _resultData['status'] = toJson$Enum$TransactionStatus(l$status);
    final l$txId = txId;
    _resultData['txId'] = l$txId;
    final l$blockNumber = blockNumber;
    _resultData['blockNumber'] = l$blockNumber;
    final l$timestamp = timestamp;
    _resultData['timestamp'] = l$timestamp?.toIso8601String();
    final l$error = error;
    _resultData['error'] = l$error;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$type = type;
    final l$chaincode = chaincode;
    final l$function = function;
    final l$args = args;
    final l$status = status;
    final l$txId = txId;
    final l$blockNumber = blockNumber;
    final l$timestamp = timestamp;
    final l$error = error;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$type,
      l$chaincode,
      l$function,
      Object.hashAll(l$args.map((v) => v)),
      l$status,
      l$txId,
      l$blockNumber,
      l$timestamp,
      l$error,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Subscription$TransactionStatusChanged$transactionStatusChanged ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$chaincode = chaincode;
    final lOther$chaincode = other.chaincode;
    if (l$chaincode != lOther$chaincode) {
      return false;
    }
    final l$function = function;
    final lOther$function = other.function;
    if (l$function != lOther$function) {
      return false;
    }
    final l$args = args;
    final lOther$args = other.args;
    if (l$args.length != lOther$args.length) {
      return false;
    }
    for (int i = 0; i < l$args.length; i++) {
      final l$args$entry = l$args[i];
      final lOther$args$entry = lOther$args[i];
      if (l$args$entry != lOther$args$entry) {
        return false;
      }
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$txId = txId;
    final lOther$txId = other.txId;
    if (l$txId != lOther$txId) {
      return false;
    }
    final l$blockNumber = blockNumber;
    final lOther$blockNumber = other.blockNumber;
    if (l$blockNumber != lOther$blockNumber) {
      return false;
    }
    final l$timestamp = timestamp;
    final lOther$timestamp = other.timestamp;
    if (l$timestamp != lOther$timestamp) {
      return false;
    }
    final l$error = error;
    final lOther$error = other.error;
    if (l$error != lOther$error) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

extension UtilityExtension$Subscription$TransactionStatusChanged$transactionStatusChanged
    on Subscription$TransactionStatusChanged$transactionStatusChanged {
  CopyWith$Subscription$TransactionStatusChanged$transactionStatusChanged<
    Subscription$TransactionStatusChanged$transactionStatusChanged
  >
  get copyWith =>
      CopyWith$Subscription$TransactionStatusChanged$transactionStatusChanged(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Subscription$TransactionStatusChanged$transactionStatusChanged<
  TRes
> {
  factory CopyWith$Subscription$TransactionStatusChanged$transactionStatusChanged(
    Subscription$TransactionStatusChanged$transactionStatusChanged instance,
    TRes Function(
      Subscription$TransactionStatusChanged$transactionStatusChanged,
    )
    then,
  ) = _CopyWithImpl$Subscription$TransactionStatusChanged$transactionStatusChanged;

  factory CopyWith$Subscription$TransactionStatusChanged$transactionStatusChanged.stub(
    TRes res,
  ) = _CopyWithStubImpl$Subscription$TransactionStatusChanged$transactionStatusChanged;

  TRes call({
    String? id,
    Enum$TransactionType? type,
    String? chaincode,
    String? function,
    List<String>? args,
    Enum$TransactionStatus? status,
    String? txId,
    int? blockNumber,
    DateTime? timestamp,
    String? error,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$TransactionStatusChanged$transactionStatusChanged<
  TRes
>
    implements
        CopyWith$Subscription$TransactionStatusChanged$transactionStatusChanged<
          TRes
        > {
  _CopyWithImpl$Subscription$TransactionStatusChanged$transactionStatusChanged(
    this._instance,
    this._then,
  );

  final Subscription$TransactionStatusChanged$transactionStatusChanged
  _instance;

  final TRes Function(
    Subscription$TransactionStatusChanged$transactionStatusChanged,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? type = _undefined,
    Object? chaincode = _undefined,
    Object? function = _undefined,
    Object? args = _undefined,
    Object? status = _undefined,
    Object? txId = _undefined,
    Object? blockNumber = _undefined,
    Object? timestamp = _undefined,
    Object? error = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Subscription$TransactionStatusChanged$transactionStatusChanged(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$TransactionType),
      chaincode: chaincode == _undefined || chaincode == null
          ? _instance.chaincode
          : (chaincode as String),
      function: function == _undefined || function == null
          ? _instance.function
          : (function as String),
      args: args == _undefined || args == null
          ? _instance.args
          : (args as List<String>),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$TransactionStatus),
      txId: txId == _undefined ? _instance.txId : (txId as String?),
      blockNumber: blockNumber == _undefined
          ? _instance.blockNumber
          : (blockNumber as int?),
      timestamp: timestamp == _undefined
          ? _instance.timestamp
          : (timestamp as DateTime?),
      error: error == _undefined ? _instance.error : (error as String?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Subscription$TransactionStatusChanged$transactionStatusChanged<
  TRes
>
    implements
        CopyWith$Subscription$TransactionStatusChanged$transactionStatusChanged<
          TRes
        > {
  _CopyWithStubImpl$Subscription$TransactionStatusChanged$transactionStatusChanged(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    Enum$TransactionType? type,
    String? chaincode,
    String? function,
    List<String>? args,
    Enum$TransactionStatus? status,
    String? txId,
    int? blockNumber,
    DateTime? timestamp,
    String? error,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}
