import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CancelRSVP {
  factory Variables$Mutation$CancelRSVP({required String id}) =>
      Variables$Mutation$CancelRSVP._({r'id': id});

  Variables$Mutation$CancelRSVP._(this._$data);

  factory Variables$Mutation$CancelRSVP.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$CancelRSVP._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
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
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$CancelRSVP<TRes> {
  factory CopyWith$Variables$Mutation$CancelRSVP(
    Variables$Mutation$CancelRSVP instance,
    TRes Function(Variables$Mutation$CancelRSVP) then,
  ) = _CopyWithImpl$Variables$Mutation$CancelRSVP;

  factory CopyWith$Variables$Mutation$CancelRSVP.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CancelRSVP;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$CancelRSVP<TRes>
    implements CopyWith$Variables$Mutation$CancelRSVP<TRes> {
  _CopyWithImpl$Variables$Mutation$CancelRSVP(this._instance, this._then);

  final Variables$Mutation$CancelRSVP _instance;

  final TRes Function(Variables$Mutation$CancelRSVP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$CancelRSVP._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CancelRSVP<TRes>
    implements CopyWith$Variables$Mutation$CancelRSVP<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CancelRSVP(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$CancelRSVP {
  Mutation$CancelRSVP({
    required this.cancelRSVP,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CancelRSVP.fromJson(Map<String, dynamic> json) {
    final l$cancelRSVP = json['cancelRSVP'];
    final l$$__typename = json['__typename'];
    return Mutation$CancelRSVP(
      cancelRSVP: Mutation$CancelRSVP$cancelRSVP.fromJson(
        (l$cancelRSVP as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CancelRSVP$cancelRSVP cancelRSVP;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cancelRSVP = cancelRSVP;
    _resultData['cancelRSVP'] = l$cancelRSVP.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cancelRSVP = cancelRSVP;
    final l$$__typename = $__typename;
    return Object.hashAll([l$cancelRSVP, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CancelRSVP || runtimeType != other.runtimeType) {
      return false;
    }
    final l$cancelRSVP = cancelRSVP;
    final lOther$cancelRSVP = other.cancelRSVP;
    if (l$cancelRSVP != lOther$cancelRSVP) {
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

  TRes call({Mutation$CancelRSVP$cancelRSVP? cancelRSVP, String? $__typename});
  CopyWith$Mutation$CancelRSVP$cancelRSVP<TRes> get cancelRSVP;
}

class _CopyWithImpl$Mutation$CancelRSVP<TRes>
    implements CopyWith$Mutation$CancelRSVP<TRes> {
  _CopyWithImpl$Mutation$CancelRSVP(this._instance, this._then);

  final Mutation$CancelRSVP _instance;

  final TRes Function(Mutation$CancelRSVP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? cancelRSVP = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CancelRSVP(
      cancelRSVP: cancelRSVP == _undefined || cancelRSVP == null
          ? _instance.cancelRSVP
          : (cancelRSVP as Mutation$CancelRSVP$cancelRSVP),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CancelRSVP$cancelRSVP<TRes> get cancelRSVP {
    final local$cancelRSVP = _instance.cancelRSVP;
    return CopyWith$Mutation$CancelRSVP$cancelRSVP(
      local$cancelRSVP,
      (e) => call(cancelRSVP: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CancelRSVP<TRes>
    implements CopyWith$Mutation$CancelRSVP<TRes> {
  _CopyWithStubImpl$Mutation$CancelRSVP(this._res);

  TRes _res;

  call({Mutation$CancelRSVP$cancelRSVP? cancelRSVP, String? $__typename}) =>
      _res;

  CopyWith$Mutation$CancelRSVP$cancelRSVP<TRes> get cancelRSVP =>
      CopyWith$Mutation$CancelRSVP$cancelRSVP.stub(_res);
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
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'cancelRSVP'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'success'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'message'),
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
                  name: NameNode(value: 'refundAmount'),
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

class Mutation$CancelRSVP$cancelRSVP {
  Mutation$CancelRSVP$cancelRSVP({
    required this.success,
    this.message,
    this.cancellationFee,
    this.refundAmount,
    this.feeWaived,
    this.$__typename = 'CancelRSVPResponse',
  });

  factory Mutation$CancelRSVP$cancelRSVP.fromJson(Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$message = json['message'];
    final l$cancellationFee = json['cancellationFee'];
    final l$refundAmount = json['refundAmount'];
    final l$feeWaived = json['feeWaived'];
    final l$$__typename = json['__typename'];
    return Mutation$CancelRSVP$cancelRSVP(
      success: (l$success as bool),
      message: (l$message as String?),
      cancellationFee: (l$cancellationFee as num?)?.toDouble(),
      refundAmount: (l$refundAmount as num?)?.toDouble(),
      feeWaived: (l$feeWaived as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool success;

  final String? message;

  final double? cancellationFee;

  final double? refundAmount;

  final bool? feeWaived;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$cancellationFee = cancellationFee;
    _resultData['cancellationFee'] = l$cancellationFee;
    final l$refundAmount = refundAmount;
    _resultData['refundAmount'] = l$refundAmount;
    final l$feeWaived = feeWaived;
    _resultData['feeWaived'] = l$feeWaived;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$message = message;
    final l$cancellationFee = cancellationFee;
    final l$refundAmount = refundAmount;
    final l$feeWaived = feeWaived;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$message,
      l$cancellationFee,
      l$refundAmount,
      l$feeWaived,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CancelRSVP$cancelRSVP ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$cancellationFee = cancellationFee;
    final lOther$cancellationFee = other.cancellationFee;
    if (l$cancellationFee != lOther$cancellationFee) {
      return false;
    }
    final l$refundAmount = refundAmount;
    final lOther$refundAmount = other.refundAmount;
    if (l$refundAmount != lOther$refundAmount) {
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

extension UtilityExtension$Mutation$CancelRSVP$cancelRSVP
    on Mutation$CancelRSVP$cancelRSVP {
  CopyWith$Mutation$CancelRSVP$cancelRSVP<Mutation$CancelRSVP$cancelRSVP>
  get copyWith => CopyWith$Mutation$CancelRSVP$cancelRSVP(this, (i) => i);
}

abstract class CopyWith$Mutation$CancelRSVP$cancelRSVP<TRes> {
  factory CopyWith$Mutation$CancelRSVP$cancelRSVP(
    Mutation$CancelRSVP$cancelRSVP instance,
    TRes Function(Mutation$CancelRSVP$cancelRSVP) then,
  ) = _CopyWithImpl$Mutation$CancelRSVP$cancelRSVP;

  factory CopyWith$Mutation$CancelRSVP$cancelRSVP.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CancelRSVP$cancelRSVP;

  TRes call({
    bool? success,
    String? message,
    double? cancellationFee,
    double? refundAmount,
    bool? feeWaived,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CancelRSVP$cancelRSVP<TRes>
    implements CopyWith$Mutation$CancelRSVP$cancelRSVP<TRes> {
  _CopyWithImpl$Mutation$CancelRSVP$cancelRSVP(this._instance, this._then);

  final Mutation$CancelRSVP$cancelRSVP _instance;

  final TRes Function(Mutation$CancelRSVP$cancelRSVP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? message = _undefined,
    Object? cancellationFee = _undefined,
    Object? refundAmount = _undefined,
    Object? feeWaived = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CancelRSVP$cancelRSVP(
      success: success == _undefined || success == null
          ? _instance.success
          : (success as bool),
      message: message == _undefined ? _instance.message : (message as String?),
      cancellationFee: cancellationFee == _undefined
          ? _instance.cancellationFee
          : (cancellationFee as double?),
      refundAmount: refundAmount == _undefined
          ? _instance.refundAmount
          : (refundAmount as double?),
      feeWaived: feeWaived == _undefined
          ? _instance.feeWaived
          : (feeWaived as bool?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CancelRSVP$cancelRSVP<TRes>
    implements CopyWith$Mutation$CancelRSVP$cancelRSVP<TRes> {
  _CopyWithStubImpl$Mutation$CancelRSVP$cancelRSVP(this._res);

  TRes _res;

  call({
    bool? success,
    String? message,
    double? cancellationFee,
    double? refundAmount,
    bool? feeWaived,
    String? $__typename,
  }) => _res;
}
