import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$ConfirmBooking {
  factory Variables$Mutation$ConfirmBooking({required String bookingId}) =>
      Variables$Mutation$ConfirmBooking._({r'bookingId': bookingId});

  Variables$Mutation$ConfirmBooking._(this._$data);

  factory Variables$Mutation$ConfirmBooking.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$bookingId = data['bookingId'];
    result$data['bookingId'] = (l$bookingId as String);
    return Variables$Mutation$ConfirmBooking._(result$data);
  }

  Map<String, dynamic> _$data;

  String get bookingId => (_$data['bookingId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$bookingId = bookingId;
    result$data['bookingId'] = l$bookingId;
    return result$data;
  }

  CopyWith$Variables$Mutation$ConfirmBooking<Variables$Mutation$ConfirmBooking>
  get copyWith => CopyWith$Variables$Mutation$ConfirmBooking(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ConfirmBooking ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bookingId = bookingId;
    final lOther$bookingId = other.bookingId;
    if (l$bookingId != lOther$bookingId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$bookingId = bookingId;
    return Object.hashAll([l$bookingId]);
  }
}

abstract class CopyWith$Variables$Mutation$ConfirmBooking<TRes> {
  factory CopyWith$Variables$Mutation$ConfirmBooking(
    Variables$Mutation$ConfirmBooking instance,
    TRes Function(Variables$Mutation$ConfirmBooking) then,
  ) = _CopyWithImpl$Variables$Mutation$ConfirmBooking;

  factory CopyWith$Variables$Mutation$ConfirmBooking.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ConfirmBooking;

  TRes call({String? bookingId});
}

class _CopyWithImpl$Variables$Mutation$ConfirmBooking<TRes>
    implements CopyWith$Variables$Mutation$ConfirmBooking<TRes> {
  _CopyWithImpl$Variables$Mutation$ConfirmBooking(this._instance, this._then);

  final Variables$Mutation$ConfirmBooking _instance;

  final TRes Function(Variables$Mutation$ConfirmBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? bookingId = _undefined}) => _then(
    Variables$Mutation$ConfirmBooking._({
      ..._instance._$data,
      if (bookingId != _undefined && bookingId != null)
        'bookingId': (bookingId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$ConfirmBooking<TRes>
    implements CopyWith$Variables$Mutation$ConfirmBooking<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ConfirmBooking(this._res);

  TRes _res;

  call({String? bookingId}) => _res;
}

class Mutation$ConfirmBooking {
  Mutation$ConfirmBooking({
    required this.confirmBooking,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ConfirmBooking.fromJson(Map<String, dynamic> json) {
    final l$confirmBooking = json['confirmBooking'];
    final l$$__typename = json['__typename'];
    return Mutation$ConfirmBooking(
      confirmBooking: Mutation$ConfirmBooking$confirmBooking.fromJson(
        (l$confirmBooking as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ConfirmBooking$confirmBooking confirmBooking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$confirmBooking = confirmBooking;
    _resultData['confirmBooking'] = l$confirmBooking.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$confirmBooking = confirmBooking;
    final l$$__typename = $__typename;
    return Object.hashAll([l$confirmBooking, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ConfirmBooking || runtimeType != other.runtimeType) {
      return false;
    }
    final l$confirmBooking = confirmBooking;
    final lOther$confirmBooking = other.confirmBooking;
    if (l$confirmBooking != lOther$confirmBooking) {
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

extension UtilityExtension$Mutation$ConfirmBooking on Mutation$ConfirmBooking {
  CopyWith$Mutation$ConfirmBooking<Mutation$ConfirmBooking> get copyWith =>
      CopyWith$Mutation$ConfirmBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$ConfirmBooking<TRes> {
  factory CopyWith$Mutation$ConfirmBooking(
    Mutation$ConfirmBooking instance,
    TRes Function(Mutation$ConfirmBooking) then,
  ) = _CopyWithImpl$Mutation$ConfirmBooking;

  factory CopyWith$Mutation$ConfirmBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ConfirmBooking;

  TRes call({
    Mutation$ConfirmBooking$confirmBooking? confirmBooking,
    String? $__typename,
  });
  CopyWith$Mutation$ConfirmBooking$confirmBooking<TRes> get confirmBooking;
}

class _CopyWithImpl$Mutation$ConfirmBooking<TRes>
    implements CopyWith$Mutation$ConfirmBooking<TRes> {
  _CopyWithImpl$Mutation$ConfirmBooking(this._instance, this._then);

  final Mutation$ConfirmBooking _instance;

  final TRes Function(Mutation$ConfirmBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? confirmBooking = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ConfirmBooking(
      confirmBooking: confirmBooking == _undefined || confirmBooking == null
          ? _instance.confirmBooking
          : (confirmBooking as Mutation$ConfirmBooking$confirmBooking),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$ConfirmBooking$confirmBooking<TRes> get confirmBooking {
    final local$confirmBooking = _instance.confirmBooking;
    return CopyWith$Mutation$ConfirmBooking$confirmBooking(
      local$confirmBooking,
      (e) => call(confirmBooking: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$ConfirmBooking<TRes>
    implements CopyWith$Mutation$ConfirmBooking<TRes> {
  _CopyWithStubImpl$Mutation$ConfirmBooking(this._res);

  TRes _res;

  call({
    Mutation$ConfirmBooking$confirmBooking? confirmBooking,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$ConfirmBooking$confirmBooking<TRes> get confirmBooking =>
      CopyWith$Mutation$ConfirmBooking$confirmBooking.stub(_res);
}

const documentNodeMutationConfirmBooking = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ConfirmBooking'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'bookingId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'confirmBooking'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'bookingId'),
                value: VariableNode(name: NameNode(value: 'bookingId')),
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
                  name: NameNode(value: 'confirmedAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'confirmedBy'),
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
Mutation$ConfirmBooking _parserFn$Mutation$ConfirmBooking(
  Map<String, dynamic> data,
) => Mutation$ConfirmBooking.fromJson(data);
typedef OnMutationCompleted$Mutation$ConfirmBooking =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$ConfirmBooking?);

class Options$Mutation$ConfirmBooking
    extends graphql.MutationOptions<Mutation$ConfirmBooking> {
  Options$Mutation$ConfirmBooking({
    String? operationName,
    required Variables$Mutation$ConfirmBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ConfirmBooking? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ConfirmBooking? onCompleted,
    graphql.OnMutationUpdate<Mutation$ConfirmBooking>? update,
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
                 data == null ? null : _parserFn$Mutation$ConfirmBooking(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationConfirmBooking,
         parserFn: _parserFn$Mutation$ConfirmBooking,
       );

  final OnMutationCompleted$Mutation$ConfirmBooking? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$ConfirmBooking
    extends graphql.WatchQueryOptions<Mutation$ConfirmBooking> {
  WatchOptions$Mutation$ConfirmBooking({
    String? operationName,
    required Variables$Mutation$ConfirmBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ConfirmBooking? typedOptimisticResult,
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
         document: documentNodeMutationConfirmBooking,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$ConfirmBooking,
       );
}

extension ClientExtension$Mutation$ConfirmBooking on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ConfirmBooking>> mutate$ConfirmBooking(
    Options$Mutation$ConfirmBooking options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$ConfirmBooking> watchMutation$ConfirmBooking(
    WatchOptions$Mutation$ConfirmBooking options,
  ) => this.watchMutation(options);
}

class Mutation$ConfirmBooking$confirmBooking {
  Mutation$ConfirmBooking$confirmBooking({
    required this.id,
    required this.status,
    this.confirmedAt,
    this.confirmedBy,
    this.$__typename = 'Booking',
  });

  factory Mutation$ConfirmBooking$confirmBooking.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$confirmedAt = json['confirmedAt'];
    final l$confirmedBy = json['confirmedBy'];
    final l$$__typename = json['__typename'];
    return Mutation$ConfirmBooking$confirmBooking(
      id: (l$id as String),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      confirmedAt: l$confirmedAt == null
          ? null
          : DateTime.parse((l$confirmedAt as String)),
      confirmedBy: (l$confirmedBy as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$BookingStatus status;

  final DateTime? confirmedAt;

  final String? confirmedBy;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$confirmedAt = confirmedAt;
    _resultData['confirmedAt'] = l$confirmedAt?.toIso8601String();
    final l$confirmedBy = confirmedBy;
    _resultData['confirmedBy'] = l$confirmedBy;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$confirmedAt = confirmedAt;
    final l$confirmedBy = confirmedBy;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$confirmedAt,
      l$confirmedBy,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ConfirmBooking$confirmBooking ||
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
    final l$confirmedAt = confirmedAt;
    final lOther$confirmedAt = other.confirmedAt;
    if (l$confirmedAt != lOther$confirmedAt) {
      return false;
    }
    final l$confirmedBy = confirmedBy;
    final lOther$confirmedBy = other.confirmedBy;
    if (l$confirmedBy != lOther$confirmedBy) {
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

extension UtilityExtension$Mutation$ConfirmBooking$confirmBooking
    on Mutation$ConfirmBooking$confirmBooking {
  CopyWith$Mutation$ConfirmBooking$confirmBooking<
    Mutation$ConfirmBooking$confirmBooking
  >
  get copyWith =>
      CopyWith$Mutation$ConfirmBooking$confirmBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$ConfirmBooking$confirmBooking<TRes> {
  factory CopyWith$Mutation$ConfirmBooking$confirmBooking(
    Mutation$ConfirmBooking$confirmBooking instance,
    TRes Function(Mutation$ConfirmBooking$confirmBooking) then,
  ) = _CopyWithImpl$Mutation$ConfirmBooking$confirmBooking;

  factory CopyWith$Mutation$ConfirmBooking$confirmBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ConfirmBooking$confirmBooking;

  TRes call({
    String? id,
    Enum$BookingStatus? status,
    DateTime? confirmedAt,
    String? confirmedBy,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$ConfirmBooking$confirmBooking<TRes>
    implements CopyWith$Mutation$ConfirmBooking$confirmBooking<TRes> {
  _CopyWithImpl$Mutation$ConfirmBooking$confirmBooking(
    this._instance,
    this._then,
  );

  final Mutation$ConfirmBooking$confirmBooking _instance;

  final TRes Function(Mutation$ConfirmBooking$confirmBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? confirmedAt = _undefined,
    Object? confirmedBy = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ConfirmBooking$confirmBooking(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$BookingStatus),
      confirmedAt: confirmedAt == _undefined
          ? _instance.confirmedAt
          : (confirmedAt as DateTime?),
      confirmedBy: confirmedBy == _undefined
          ? _instance.confirmedBy
          : (confirmedBy as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$ConfirmBooking$confirmBooking<TRes>
    implements CopyWith$Mutation$ConfirmBooking$confirmBooking<TRes> {
  _CopyWithStubImpl$Mutation$ConfirmBooking$confirmBooking(this._res);

  TRes _res;

  call({
    String? id,
    Enum$BookingStatus? status,
    DateTime? confirmedAt,
    String? confirmedBy,
    String? $__typename,
  }) => _res;
}
