import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CancelBooking {
  factory Variables$Mutation$CancelBooking({
    required String bookingId,
    String? reason,
  }) => Variables$Mutation$CancelBooking._({
    r'bookingId': bookingId,
    if (reason != null) r'reason': reason,
  });

  Variables$Mutation$CancelBooking._(this._$data);

  factory Variables$Mutation$CancelBooking.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$bookingId = data['bookingId'];
    result$data['bookingId'] = (l$bookingId as String);
    if (data.containsKey('reason')) {
      final l$reason = data['reason'];
      result$data['reason'] = (l$reason as String?);
    }
    return Variables$Mutation$CancelBooking._(result$data);
  }

  Map<String, dynamic> _$data;

  String get bookingId => (_$data['bookingId'] as String);

  String? get reason => (_$data['reason'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$bookingId = bookingId;
    result$data['bookingId'] = l$bookingId;
    if (_$data.containsKey('reason')) {
      final l$reason = reason;
      result$data['reason'] = l$reason;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$CancelBooking<Variables$Mutation$CancelBooking>
  get copyWith => CopyWith$Variables$Mutation$CancelBooking(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CancelBooking ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bookingId = bookingId;
    final lOther$bookingId = other.bookingId;
    if (l$bookingId != lOther$bookingId) {
      return false;
    }
    final l$reason = reason;
    final lOther$reason = other.reason;
    if (_$data.containsKey('reason') != other._$data.containsKey('reason')) {
      return false;
    }
    if (l$reason != lOther$reason) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$bookingId = bookingId;
    final l$reason = reason;
    return Object.hashAll([
      l$bookingId,
      _$data.containsKey('reason') ? l$reason : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CancelBooking<TRes> {
  factory CopyWith$Variables$Mutation$CancelBooking(
    Variables$Mutation$CancelBooking instance,
    TRes Function(Variables$Mutation$CancelBooking) then,
  ) = _CopyWithImpl$Variables$Mutation$CancelBooking;

  factory CopyWith$Variables$Mutation$CancelBooking.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CancelBooking;

  TRes call({String? bookingId, String? reason});
}

class _CopyWithImpl$Variables$Mutation$CancelBooking<TRes>
    implements CopyWith$Variables$Mutation$CancelBooking<TRes> {
  _CopyWithImpl$Variables$Mutation$CancelBooking(this._instance, this._then);

  final Variables$Mutation$CancelBooking _instance;

  final TRes Function(Variables$Mutation$CancelBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? bookingId = _undefined, Object? reason = _undefined}) =>
      _then(
        Variables$Mutation$CancelBooking._({
          ..._instance._$data,
          if (bookingId != _undefined && bookingId != null)
            'bookingId': (bookingId as String),
          if (reason != _undefined) 'reason': (reason as String?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Mutation$CancelBooking<TRes>
    implements CopyWith$Variables$Mutation$CancelBooking<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CancelBooking(this._res);

  TRes _res;

  call({String? bookingId, String? reason}) => _res;
}

class Mutation$CancelBooking {
  Mutation$CancelBooking({
    required this.cancelBooking,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CancelBooking.fromJson(Map<String, dynamic> json) {
    final l$cancelBooking = json['cancelBooking'];
    final l$$__typename = json['__typename'];
    return Mutation$CancelBooking(
      cancelBooking: Mutation$CancelBooking$cancelBooking.fromJson(
        (l$cancelBooking as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CancelBooking$cancelBooking cancelBooking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cancelBooking = cancelBooking;
    _resultData['cancelBooking'] = l$cancelBooking.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cancelBooking = cancelBooking;
    final l$$__typename = $__typename;
    return Object.hashAll([l$cancelBooking, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CancelBooking || runtimeType != other.runtimeType) {
      return false;
    }
    final l$cancelBooking = cancelBooking;
    final lOther$cancelBooking = other.cancelBooking;
    if (l$cancelBooking != lOther$cancelBooking) {
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

extension UtilityExtension$Mutation$CancelBooking on Mutation$CancelBooking {
  CopyWith$Mutation$CancelBooking<Mutation$CancelBooking> get copyWith =>
      CopyWith$Mutation$CancelBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$CancelBooking<TRes> {
  factory CopyWith$Mutation$CancelBooking(
    Mutation$CancelBooking instance,
    TRes Function(Mutation$CancelBooking) then,
  ) = _CopyWithImpl$Mutation$CancelBooking;

  factory CopyWith$Mutation$CancelBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CancelBooking;

  TRes call({
    Mutation$CancelBooking$cancelBooking? cancelBooking,
    String? $__typename,
  });
  CopyWith$Mutation$CancelBooking$cancelBooking<TRes> get cancelBooking;
}

class _CopyWithImpl$Mutation$CancelBooking<TRes>
    implements CopyWith$Mutation$CancelBooking<TRes> {
  _CopyWithImpl$Mutation$CancelBooking(this._instance, this._then);

  final Mutation$CancelBooking _instance;

  final TRes Function(Mutation$CancelBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? cancelBooking = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CancelBooking(
      cancelBooking: cancelBooking == _undefined || cancelBooking == null
          ? _instance.cancelBooking
          : (cancelBooking as Mutation$CancelBooking$cancelBooking),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CancelBooking$cancelBooking<TRes> get cancelBooking {
    final local$cancelBooking = _instance.cancelBooking;
    return CopyWith$Mutation$CancelBooking$cancelBooking(
      local$cancelBooking,
      (e) => call(cancelBooking: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CancelBooking<TRes>
    implements CopyWith$Mutation$CancelBooking<TRes> {
  _CopyWithStubImpl$Mutation$CancelBooking(this._res);

  TRes _res;

  call({
    Mutation$CancelBooking$cancelBooking? cancelBooking,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CancelBooking$cancelBooking<TRes> get cancelBooking =>
      CopyWith$Mutation$CancelBooking$cancelBooking.stub(_res);
}

const documentNodeMutationCancelBooking = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CancelBooking'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'bookingId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'reason')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
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
            name: NameNode(value: 'cancelBooking'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'bookingId'),
                value: VariableNode(name: NameNode(value: 'bookingId')),
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
Mutation$CancelBooking _parserFn$Mutation$CancelBooking(
  Map<String, dynamic> data,
) => Mutation$CancelBooking.fromJson(data);
typedef OnMutationCompleted$Mutation$CancelBooking =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CancelBooking?);

class Options$Mutation$CancelBooking
    extends graphql.MutationOptions<Mutation$CancelBooking> {
  Options$Mutation$CancelBooking({
    String? operationName,
    required Variables$Mutation$CancelBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CancelBooking? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CancelBooking? onCompleted,
    graphql.OnMutationUpdate<Mutation$CancelBooking>? update,
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
                 data == null ? null : _parserFn$Mutation$CancelBooking(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCancelBooking,
         parserFn: _parserFn$Mutation$CancelBooking,
       );

  final OnMutationCompleted$Mutation$CancelBooking? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CancelBooking
    extends graphql.WatchQueryOptions<Mutation$CancelBooking> {
  WatchOptions$Mutation$CancelBooking({
    String? operationName,
    required Variables$Mutation$CancelBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CancelBooking? typedOptimisticResult,
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
         document: documentNodeMutationCancelBooking,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CancelBooking,
       );
}

extension ClientExtension$Mutation$CancelBooking on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CancelBooking>> mutate$CancelBooking(
    Options$Mutation$CancelBooking options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CancelBooking> watchMutation$CancelBooking(
    WatchOptions$Mutation$CancelBooking options,
  ) => this.watchMutation(options);
}

class Mutation$CancelBooking$cancelBooking {
  Mutation$CancelBooking$cancelBooking({
    required this.id,
    required this.status,
    this.cancellationReason,
    this.cancelledAt,
    this.$__typename = 'Booking',
  });

  factory Mutation$CancelBooking$cancelBooking.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$cancellationReason = json['cancellationReason'];
    final l$cancelledAt = json['cancelledAt'];
    final l$$__typename = json['__typename'];
    return Mutation$CancelBooking$cancelBooking(
      id: (l$id as String),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      cancellationReason: (l$cancellationReason as String?),
      cancelledAt: l$cancelledAt == null
          ? null
          : DateTime.parse((l$cancelledAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$BookingStatus status;

  final String? cancellationReason;

  final DateTime? cancelledAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$cancellationReason = cancellationReason;
    _resultData['cancellationReason'] = l$cancellationReason;
    final l$cancelledAt = cancelledAt;
    _resultData['cancelledAt'] = l$cancelledAt?.toIso8601String();
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
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$cancellationReason,
      l$cancelledAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CancelBooking$cancelBooking ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CancelBooking$cancelBooking
    on Mutation$CancelBooking$cancelBooking {
  CopyWith$Mutation$CancelBooking$cancelBooking<
    Mutation$CancelBooking$cancelBooking
  >
  get copyWith => CopyWith$Mutation$CancelBooking$cancelBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$CancelBooking$cancelBooking<TRes> {
  factory CopyWith$Mutation$CancelBooking$cancelBooking(
    Mutation$CancelBooking$cancelBooking instance,
    TRes Function(Mutation$CancelBooking$cancelBooking) then,
  ) = _CopyWithImpl$Mutation$CancelBooking$cancelBooking;

  factory CopyWith$Mutation$CancelBooking$cancelBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CancelBooking$cancelBooking;

  TRes call({
    String? id,
    Enum$BookingStatus? status,
    String? cancellationReason,
    DateTime? cancelledAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CancelBooking$cancelBooking<TRes>
    implements CopyWith$Mutation$CancelBooking$cancelBooking<TRes> {
  _CopyWithImpl$Mutation$CancelBooking$cancelBooking(
    this._instance,
    this._then,
  );

  final Mutation$CancelBooking$cancelBooking _instance;

  final TRes Function(Mutation$CancelBooking$cancelBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? cancellationReason = _undefined,
    Object? cancelledAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CancelBooking$cancelBooking(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$BookingStatus),
      cancellationReason: cancellationReason == _undefined
          ? _instance.cancellationReason
          : (cancellationReason as String?),
      cancelledAt: cancelledAt == _undefined
          ? _instance.cancelledAt
          : (cancelledAt as DateTime?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CancelBooking$cancelBooking<TRes>
    implements CopyWith$Mutation$CancelBooking$cancelBooking<TRes> {
  _CopyWithStubImpl$Mutation$CancelBooking$cancelBooking(this._res);

  TRes _res;

  call({
    String? id,
    Enum$BookingStatus? status,
    String? cancellationReason,
    DateTime? cancelledAt,
    String? $__typename,
  }) => _res;
}
