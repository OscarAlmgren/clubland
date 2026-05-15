import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CancelRSVP {
  factory Variables$Mutation$CancelRSVP({
    required String id,
    required String reason,
  }) => Variables$Mutation$CancelRSVP._({r'id': id, r'reason': reason});

  Variables$Mutation$CancelRSVP._(this._$data);

  factory Variables$Mutation$CancelRSVP.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$reason = data['reason'];
    result$data['reason'] = (l$reason as String);
    return Variables$Mutation$CancelRSVP._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get reason => (_$data['reason'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$reason = reason;
    result$data['reason'] = l$reason;
    return result$data;
  }

  CopyWith$Variables$Mutation$CancelRSVP<Variables$Mutation$CancelRSVP>
  get copyWith => CopyWith$Variables$Mutation$CancelRSVP(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CancelRSVP ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$reason = reason;
    final lOther$reason = other.reason;
    if (l$reason != lOther$reason) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$reason = reason;
    return Object.hashAll([l$id, l$reason]);
  }
}

abstract class CopyWith$Variables$Mutation$CancelRSVP<TRes> {
  factory CopyWith$Variables$Mutation$CancelRSVP(
    Variables$Mutation$CancelRSVP instance,
    TRes Function(Variables$Mutation$CancelRSVP) then,
  ) = _CopyWithImpl$Variables$Mutation$CancelRSVP;

  factory CopyWith$Variables$Mutation$CancelRSVP.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CancelRSVP;

  TRes call({String? id, String? reason});
}

class _CopyWithImpl$Variables$Mutation$CancelRSVP<TRes>
    implements CopyWith$Variables$Mutation$CancelRSVP<TRes> {
  _CopyWithImpl$Variables$Mutation$CancelRSVP(this._instance, this._then);

  final Variables$Mutation$CancelRSVP _instance;

  final TRes Function(Variables$Mutation$CancelRSVP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? reason = _undefined}) => _then(
    Variables$Mutation$CancelRSVP._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (reason != _undefined && reason != null) 'reason': (reason as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CancelRSVP<TRes>
    implements CopyWith$Variables$Mutation$CancelRSVP<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CancelRSVP(this._res);

  TRes _res;

  call({String? id, String? reason}) => _res;
}

class Mutation$CancelRSVP {
  Mutation$CancelRSVP({
    required this.cancelEventRSVP,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CancelRSVP.fromJson(Map<String, dynamic> json) {
    final l$cancelEventRSVP = json['cancelEventRSVP'];
    final l$$__typename = json['__typename'];
    return Mutation$CancelRSVP(
      cancelEventRSVP: Mutation$CancelRSVP$cancelEventRSVP.fromJson(
        (l$cancelEventRSVP as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CancelRSVP$cancelEventRSVP cancelEventRSVP;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cancelEventRSVP = cancelEventRSVP;
    _resultData['cancelEventRSVP'] = l$cancelEventRSVP.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cancelEventRSVP = cancelEventRSVP;
    final l$$__typename = $__typename;
    return Object.hashAll([l$cancelEventRSVP, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CancelRSVP || runtimeType != other.runtimeType) {
      return false;
    }
    final l$cancelEventRSVP = cancelEventRSVP;
    final lOther$cancelEventRSVP = other.cancelEventRSVP;
    if (l$cancelEventRSVP != lOther$cancelEventRSVP) {
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

extension UtilityExtension$Mutation$CancelRSVP on Mutation$CancelRSVP {
  CopyWith$Mutation$CancelRSVP<Mutation$CancelRSVP> get copyWith =>
      CopyWith$Mutation$CancelRSVP(this, (i) => i);
}

abstract class CopyWith$Mutation$CancelRSVP<TRes> {
  factory CopyWith$Mutation$CancelRSVP(
    Mutation$CancelRSVP instance,
    TRes Function(Mutation$CancelRSVP) then,
  ) = _CopyWithImpl$Mutation$CancelRSVP;

  factory CopyWith$Mutation$CancelRSVP.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CancelRSVP;

  TRes call({
    Mutation$CancelRSVP$cancelEventRSVP? cancelEventRSVP,
    String? $__typename,
  });
  CopyWith$Mutation$CancelRSVP$cancelEventRSVP<TRes> get cancelEventRSVP;
}

class _CopyWithImpl$Mutation$CancelRSVP<TRes>
    implements CopyWith$Mutation$CancelRSVP<TRes> {
  _CopyWithImpl$Mutation$CancelRSVP(this._instance, this._then);

  final Mutation$CancelRSVP _instance;

  final TRes Function(Mutation$CancelRSVP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? cancelEventRSVP = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CancelRSVP(
      cancelEventRSVP: cancelEventRSVP == _undefined || cancelEventRSVP == null
          ? _instance.cancelEventRSVP
          : (cancelEventRSVP as Mutation$CancelRSVP$cancelEventRSVP),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CancelRSVP$cancelEventRSVP<TRes> get cancelEventRSVP {
    final local$cancelEventRSVP = _instance.cancelEventRSVP;
    return CopyWith$Mutation$CancelRSVP$cancelEventRSVP(
      local$cancelEventRSVP,
      (e) => call(cancelEventRSVP: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CancelRSVP<TRes>
    implements CopyWith$Mutation$CancelRSVP<TRes> {
  _CopyWithStubImpl$Mutation$CancelRSVP(this._res);

  TRes _res;

  call({
    Mutation$CancelRSVP$cancelEventRSVP? cancelEventRSVP,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CancelRSVP$cancelEventRSVP<TRes> get cancelEventRSVP =>
      CopyWith$Mutation$CancelRSVP$cancelEventRSVP.stub(_res);
}

const documentNodeMutationCancelRSVP = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CancelRSVP'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'reason')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'cancelEventRSVP'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'reason'),
                value: VariableNode(name: NameNode(value: 'reason')),
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
                  name: NameNode(value: 'status'),
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
                  name: NameNode(value: 'cancelledAt'),
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
Mutation$CancelRSVP _parserFn$Mutation$CancelRSVP(Map<String, dynamic> data) =>
    Mutation$CancelRSVP.fromJson(data);
typedef OnMutationCompleted$Mutation$CancelRSVP =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CancelRSVP?);

class Options$Mutation$CancelRSVP
    extends graphql.MutationOptions<Mutation$CancelRSVP> {
  Options$Mutation$CancelRSVP({
    String? operationName,
    required Variables$Mutation$CancelRSVP variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CancelRSVP? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CancelRSVP? onCompleted,
    graphql.OnMutationUpdate<Mutation$CancelRSVP>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
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
                 data == null ? null : _parserFn$Mutation$CancelRSVP(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCancelRSVP,
         parserFn: _parserFn$Mutation$CancelRSVP,
       );

  final OnMutationCompleted$Mutation$CancelRSVP? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CancelRSVP
    extends graphql.WatchQueryOptions<Mutation$CancelRSVP> {
  WatchOptions$Mutation$CancelRSVP({
    String? operationName,
    required Variables$Mutation$CancelRSVP variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CancelRSVP? typedOptimisticResult,
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
         document: documentNodeMutationCancelRSVP,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CancelRSVP,
       );
}

extension ClientExtension$Mutation$CancelRSVP on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CancelRSVP>> mutate$CancelRSVP(
    Options$Mutation$CancelRSVP options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CancelRSVP> watchMutation$CancelRSVP(
    WatchOptions$Mutation$CancelRSVP options,
  ) => this.watchMutation(options);
}

class Mutation$CancelRSVP$cancelEventRSVP {
  Mutation$CancelRSVP$cancelEventRSVP({
    required this.id,
    required this.status,
    this.cancellationReason,
    this.cancelledAt,
    this.cancellationFee,
    this.feeWaived,
    this.$__typename = 'EventRSVP',
  });

  factory Mutation$CancelRSVP$cancelEventRSVP.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$cancellationReason = json['cancellationReason'];
    final l$cancelledAt = json['cancelledAt'];
    final l$cancellationFee = json['cancellationFee'];
    final l$feeWaived = json['feeWaived'];
    final l$$__typename = json['__typename'];
    return Mutation$CancelRSVP$cancelEventRSVP(
      id: (l$id as String),
      status: fromJson$Enum$RSVPStatus((l$status as String)),
      cancellationReason: (l$cancellationReason as String?),
      cancelledAt: l$cancelledAt == null
          ? null
          : DateTime.parse((l$cancelledAt as String)),
      cancellationFee: (l$cancellationFee as num?)?.toDouble(),
      feeWaived: (l$feeWaived as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$RSVPStatus status;

  final String? cancellationReason;

  final DateTime? cancelledAt;

  final double? cancellationFee;

  final bool? feeWaived;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$RSVPStatus(l$status);
    final l$cancellationReason = cancellationReason;
    _resultData['cancellationReason'] = l$cancellationReason;
    final l$cancelledAt = cancelledAt;
    _resultData['cancelledAt'] = l$cancelledAt?.toIso8601String();
    final l$cancellationFee = cancellationFee;
    _resultData['cancellationFee'] = l$cancellationFee;
    final l$feeWaived = feeWaived;
    _resultData['feeWaived'] = l$feeWaived;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$cancellationReason = cancellationReason;
    final l$cancelledAt = cancelledAt;
    final l$cancellationFee = cancellationFee;
    final l$feeWaived = feeWaived;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$cancellationReason,
      l$cancelledAt,
      l$cancellationFee,
      l$feeWaived,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CancelRSVP$cancelEventRSVP ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$cancellationReason = cancellationReason;
    final lOther$cancellationReason = other.cancellationReason;
    if (l$cancellationReason != lOther$cancellationReason) {
      return false;
    }
    final l$cancelledAt = cancelledAt;
    final lOther$cancelledAt = other.cancelledAt;
    if (l$cancelledAt != lOther$cancelledAt) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CancelRSVP$cancelEventRSVP
    on Mutation$CancelRSVP$cancelEventRSVP {
  CopyWith$Mutation$CancelRSVP$cancelEventRSVP<
    Mutation$CancelRSVP$cancelEventRSVP
  >
  get copyWith => CopyWith$Mutation$CancelRSVP$cancelEventRSVP(this, (i) => i);
}

abstract class CopyWith$Mutation$CancelRSVP$cancelEventRSVP<TRes> {
  factory CopyWith$Mutation$CancelRSVP$cancelEventRSVP(
    Mutation$CancelRSVP$cancelEventRSVP instance,
    TRes Function(Mutation$CancelRSVP$cancelEventRSVP) then,
  ) = _CopyWithImpl$Mutation$CancelRSVP$cancelEventRSVP;

  factory CopyWith$Mutation$CancelRSVP$cancelEventRSVP.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CancelRSVP$cancelEventRSVP;

  TRes call({
    String? id,
    Enum$RSVPStatus? status,
    String? cancellationReason,
    DateTime? cancelledAt,
    double? cancellationFee,
    bool? feeWaived,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CancelRSVP$cancelEventRSVP<TRes>
    implements CopyWith$Mutation$CancelRSVP$cancelEventRSVP<TRes> {
  _CopyWithImpl$Mutation$CancelRSVP$cancelEventRSVP(this._instance, this._then);

  final Mutation$CancelRSVP$cancelEventRSVP _instance;

  final TRes Function(Mutation$CancelRSVP$cancelEventRSVP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? cancellationReason = _undefined,
    Object? cancelledAt = _undefined,
    Object? cancellationFee = _undefined,
    Object? feeWaived = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CancelRSVP$cancelEventRSVP(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$RSVPStatus),
      cancellationReason: cancellationReason == _undefined
          ? _instance.cancellationReason
          : (cancellationReason as String?),
      cancelledAt: cancelledAt == _undefined
          ? _instance.cancelledAt
          : (cancelledAt as DateTime?),
      cancellationFee: cancellationFee == _undefined
          ? _instance.cancellationFee
          : (cancellationFee as double?),
      feeWaived: feeWaived == _undefined
          ? _instance.feeWaived
          : (feeWaived as bool?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CancelRSVP$cancelEventRSVP<TRes>
    implements CopyWith$Mutation$CancelRSVP$cancelEventRSVP<TRes> {
  _CopyWithStubImpl$Mutation$CancelRSVP$cancelEventRSVP(this._res);

  TRes _res;

  call({
    String? id,
    Enum$RSVPStatus? status,
    String? cancellationReason,
    DateTime? cancelledAt,
    double? cancellationFee,
    bool? feeWaived,
    String? $__typename,
  }) => _res;
}
