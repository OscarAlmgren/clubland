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
    required this.confirmFacilityBooking,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ConfirmBooking.fromJson(Map<String, dynamic> json) {
    final l$confirmFacilityBooking = json['confirmFacilityBooking'];
    final l$$__typename = json['__typename'];
    return Mutation$ConfirmBooking(
      confirmFacilityBooking:
          Mutation$ConfirmBooking$confirmFacilityBooking.fromJson(
            (l$confirmFacilityBooking as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ConfirmBooking$confirmFacilityBooking confirmFacilityBooking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$confirmFacilityBooking = confirmFacilityBooking;
    _resultData['confirmFacilityBooking'] = l$confirmFacilityBooking.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$confirmFacilityBooking = confirmFacilityBooking;
    final l$$__typename = $__typename;
    return Object.hashAll([l$confirmFacilityBooking, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ConfirmBooking || runtimeType != other.runtimeType) {
      return false;
    }
    final l$confirmFacilityBooking = confirmFacilityBooking;
    final lOther$confirmFacilityBooking = other.confirmFacilityBooking;
    if (l$confirmFacilityBooking != lOther$confirmFacilityBooking) {
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
    Mutation$ConfirmBooking$confirmFacilityBooking? confirmFacilityBooking,
    String? $__typename,
  });
  CopyWith$Mutation$ConfirmBooking$confirmFacilityBooking<TRes>
  get confirmFacilityBooking;
}

class _CopyWithImpl$Mutation$ConfirmBooking<TRes>
    implements CopyWith$Mutation$ConfirmBooking<TRes> {
  _CopyWithImpl$Mutation$ConfirmBooking(this._instance, this._then);

  final Mutation$ConfirmBooking _instance;

  final TRes Function(Mutation$ConfirmBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? confirmFacilityBooking = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ConfirmBooking(
      confirmFacilityBooking:
          confirmFacilityBooking == _undefined || confirmFacilityBooking == null
          ? _instance.confirmFacilityBooking
          : (confirmFacilityBooking
                as Mutation$ConfirmBooking$confirmFacilityBooking),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$ConfirmBooking$confirmFacilityBooking<TRes>
  get confirmFacilityBooking {
    final local$confirmFacilityBooking = _instance.confirmFacilityBooking;
    return CopyWith$Mutation$ConfirmBooking$confirmFacilityBooking(
      local$confirmFacilityBooking,
      (e) => call(confirmFacilityBooking: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$ConfirmBooking<TRes>
    implements CopyWith$Mutation$ConfirmBooking<TRes> {
  _CopyWithStubImpl$Mutation$ConfirmBooking(this._res);

  TRes _res;

  call({
    Mutation$ConfirmBooking$confirmFacilityBooking? confirmFacilityBooking,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$ConfirmBooking$confirmFacilityBooking<TRes>
  get confirmFacilityBooking =>
      CopyWith$Mutation$ConfirmBooking$confirmFacilityBooking.stub(_res);
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
            name: NameNode(value: 'confirmFacilityBooking'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
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
                  name: NameNode(value: 'updatedAt'),
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

class Mutation$ConfirmBooking$confirmFacilityBooking {
  Mutation$ConfirmBooking$confirmFacilityBooking({
    required this.id,
    required this.status,
    required this.updatedAt,
    this.$__typename = 'FacilityBooking',
  });

  factory Mutation$ConfirmBooking$confirmFacilityBooking.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$ConfirmBooking$confirmFacilityBooking(
      id: (l$id as String),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$BookingStatus status;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$status, l$updatedAt, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ConfirmBooking$confirmFacilityBooking ||
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
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
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

extension UtilityExtension$Mutation$ConfirmBooking$confirmFacilityBooking
    on Mutation$ConfirmBooking$confirmFacilityBooking {
  CopyWith$Mutation$ConfirmBooking$confirmFacilityBooking<
    Mutation$ConfirmBooking$confirmFacilityBooking
  >
  get copyWith =>
      CopyWith$Mutation$ConfirmBooking$confirmFacilityBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$ConfirmBooking$confirmFacilityBooking<TRes> {
  factory CopyWith$Mutation$ConfirmBooking$confirmFacilityBooking(
    Mutation$ConfirmBooking$confirmFacilityBooking instance,
    TRes Function(Mutation$ConfirmBooking$confirmFacilityBooking) then,
  ) = _CopyWithImpl$Mutation$ConfirmBooking$confirmFacilityBooking;

  factory CopyWith$Mutation$ConfirmBooking$confirmFacilityBooking.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$ConfirmBooking$confirmFacilityBooking;

  TRes call({
    String? id,
    Enum$BookingStatus? status,
    DateTime? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$ConfirmBooking$confirmFacilityBooking<TRes>
    implements CopyWith$Mutation$ConfirmBooking$confirmFacilityBooking<TRes> {
  _CopyWithImpl$Mutation$ConfirmBooking$confirmFacilityBooking(
    this._instance,
    this._then,
  );

  final Mutation$ConfirmBooking$confirmFacilityBooking _instance;

  final TRes Function(Mutation$ConfirmBooking$confirmFacilityBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ConfirmBooking$confirmFacilityBooking(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$BookingStatus),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$ConfirmBooking$confirmFacilityBooking<TRes>
    implements CopyWith$Mutation$ConfirmBooking$confirmFacilityBooking<TRes> {
  _CopyWithStubImpl$Mutation$ConfirmBooking$confirmFacilityBooking(this._res);

  TRes _res;

  call({
    String? id,
    Enum$BookingStatus? status,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;
}
