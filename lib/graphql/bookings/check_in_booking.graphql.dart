import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CheckInBooking {
  factory Variables$Mutation$CheckInBooking({required String bookingId}) =>
      Variables$Mutation$CheckInBooking._({r'bookingId': bookingId});

  Variables$Mutation$CheckInBooking._(this._$data);

  factory Variables$Mutation$CheckInBooking.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$bookingId = data['bookingId'];
    result$data['bookingId'] = (l$bookingId as String);
    return Variables$Mutation$CheckInBooking._(result$data);
  }

  Map<String, dynamic> _$data;

  String get bookingId => (_$data['bookingId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$bookingId = bookingId;
    result$data['bookingId'] = l$bookingId;
    return result$data;
  }

  CopyWith$Variables$Mutation$CheckInBooking<Variables$Mutation$CheckInBooking>
  get copyWith => CopyWith$Variables$Mutation$CheckInBooking(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CheckInBooking ||
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

abstract class CopyWith$Variables$Mutation$CheckInBooking<TRes> {
  factory CopyWith$Variables$Mutation$CheckInBooking(
    Variables$Mutation$CheckInBooking instance,
    TRes Function(Variables$Mutation$CheckInBooking) then,
  ) = _CopyWithImpl$Variables$Mutation$CheckInBooking;

  factory CopyWith$Variables$Mutation$CheckInBooking.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CheckInBooking;

  TRes call({String? bookingId});
}

class _CopyWithImpl$Variables$Mutation$CheckInBooking<TRes>
    implements CopyWith$Variables$Mutation$CheckInBooking<TRes> {
  _CopyWithImpl$Variables$Mutation$CheckInBooking(this._instance, this._then);

  final Variables$Mutation$CheckInBooking _instance;

  final TRes Function(Variables$Mutation$CheckInBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? bookingId = _undefined}) => _then(
    Variables$Mutation$CheckInBooking._({
      ..._instance._$data,
      if (bookingId != _undefined && bookingId != null)
        'bookingId': (bookingId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CheckInBooking<TRes>
    implements CopyWith$Variables$Mutation$CheckInBooking<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CheckInBooking(this._res);

  TRes _res;

  call({String? bookingId}) => _res;
}

class Mutation$CheckInBooking {
  Mutation$CheckInBooking({
    required this.checkInBooking,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CheckInBooking.fromJson(Map<String, dynamic> json) {
    final l$checkInBooking = json['checkInBooking'];
    final l$$__typename = json['__typename'];
    return Mutation$CheckInBooking(
      checkInBooking: Mutation$CheckInBooking$checkInBooking.fromJson(
        (l$checkInBooking as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CheckInBooking$checkInBooking checkInBooking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$checkInBooking = checkInBooking;
    _resultData['checkInBooking'] = l$checkInBooking.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$checkInBooking = checkInBooking;
    final l$$__typename = $__typename;
    return Object.hashAll([l$checkInBooking, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CheckInBooking || runtimeType != other.runtimeType) {
      return false;
    }
    final l$checkInBooking = checkInBooking;
    final lOther$checkInBooking = other.checkInBooking;
    if (l$checkInBooking != lOther$checkInBooking) {
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

extension UtilityExtension$Mutation$CheckInBooking on Mutation$CheckInBooking {
  CopyWith$Mutation$CheckInBooking<Mutation$CheckInBooking> get copyWith =>
      CopyWith$Mutation$CheckInBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$CheckInBooking<TRes> {
  factory CopyWith$Mutation$CheckInBooking(
    Mutation$CheckInBooking instance,
    TRes Function(Mutation$CheckInBooking) then,
  ) = _CopyWithImpl$Mutation$CheckInBooking;

  factory CopyWith$Mutation$CheckInBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CheckInBooking;

  TRes call({
    Mutation$CheckInBooking$checkInBooking? checkInBooking,
    String? $__typename,
  });
  CopyWith$Mutation$CheckInBooking$checkInBooking<TRes> get checkInBooking;
}

class _CopyWithImpl$Mutation$CheckInBooking<TRes>
    implements CopyWith$Mutation$CheckInBooking<TRes> {
  _CopyWithImpl$Mutation$CheckInBooking(this._instance, this._then);

  final Mutation$CheckInBooking _instance;

  final TRes Function(Mutation$CheckInBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? checkInBooking = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CheckInBooking(
      checkInBooking: checkInBooking == _undefined || checkInBooking == null
          ? _instance.checkInBooking
          : (checkInBooking as Mutation$CheckInBooking$checkInBooking),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CheckInBooking$checkInBooking<TRes> get checkInBooking {
    final local$checkInBooking = _instance.checkInBooking;
    return CopyWith$Mutation$CheckInBooking$checkInBooking(
      local$checkInBooking,
      (e) => call(checkInBooking: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CheckInBooking<TRes>
    implements CopyWith$Mutation$CheckInBooking<TRes> {
  _CopyWithStubImpl$Mutation$CheckInBooking(this._res);

  TRes _res;

  call({
    Mutation$CheckInBooking$checkInBooking? checkInBooking,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CheckInBooking$checkInBooking<TRes> get checkInBooking =>
      CopyWith$Mutation$CheckInBooking$checkInBooking.stub(_res);
}

const documentNodeMutationCheckInBooking = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CheckInBooking'),
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
            name: NameNode(value: 'checkInBooking'),
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
                  name: NameNode(value: 'checkedInAt'),
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
Mutation$CheckInBooking _parserFn$Mutation$CheckInBooking(
  Map<String, dynamic> data,
) => Mutation$CheckInBooking.fromJson(data);
typedef OnMutationCompleted$Mutation$CheckInBooking =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CheckInBooking?);

class Options$Mutation$CheckInBooking
    extends graphql.MutationOptions<Mutation$CheckInBooking> {
  Options$Mutation$CheckInBooking({
    String? operationName,
    required Variables$Mutation$CheckInBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CheckInBooking? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CheckInBooking? onCompleted,
    graphql.OnMutationUpdate<Mutation$CheckInBooking>? update,
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
                 data == null ? null : _parserFn$Mutation$CheckInBooking(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCheckInBooking,
         parserFn: _parserFn$Mutation$CheckInBooking,
       );

  final OnMutationCompleted$Mutation$CheckInBooking? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CheckInBooking
    extends graphql.WatchQueryOptions<Mutation$CheckInBooking> {
  WatchOptions$Mutation$CheckInBooking({
    String? operationName,
    required Variables$Mutation$CheckInBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CheckInBooking? typedOptimisticResult,
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
         document: documentNodeMutationCheckInBooking,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CheckInBooking,
       );
}

extension ClientExtension$Mutation$CheckInBooking on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CheckInBooking>> mutate$CheckInBooking(
    Options$Mutation$CheckInBooking options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CheckInBooking> watchMutation$CheckInBooking(
    WatchOptions$Mutation$CheckInBooking options,
  ) => this.watchMutation(options);
}

class Mutation$CheckInBooking$checkInBooking {
  Mutation$CheckInBooking$checkInBooking({
    required this.id,
    required this.status,
    this.checkedInAt,
    this.$__typename = 'Booking',
  });

  factory Mutation$CheckInBooking$checkInBooking.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$checkedInAt = json['checkedInAt'];
    final l$$__typename = json['__typename'];
    return Mutation$CheckInBooking$checkInBooking(
      id: (l$id as String),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      checkedInAt: l$checkedInAt == null
          ? null
          : DateTime.parse((l$checkedInAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$BookingStatus status;

  final DateTime? checkedInAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$checkedInAt = checkedInAt;
    _resultData['checkedInAt'] = l$checkedInAt?.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$checkedInAt = checkedInAt;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$status, l$checkedInAt, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CheckInBooking$checkInBooking ||
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
    final l$checkedInAt = checkedInAt;
    final lOther$checkedInAt = other.checkedInAt;
    if (l$checkedInAt != lOther$checkedInAt) {
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

extension UtilityExtension$Mutation$CheckInBooking$checkInBooking
    on Mutation$CheckInBooking$checkInBooking {
  CopyWith$Mutation$CheckInBooking$checkInBooking<
    Mutation$CheckInBooking$checkInBooking
  >
  get copyWith =>
      CopyWith$Mutation$CheckInBooking$checkInBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$CheckInBooking$checkInBooking<TRes> {
  factory CopyWith$Mutation$CheckInBooking$checkInBooking(
    Mutation$CheckInBooking$checkInBooking instance,
    TRes Function(Mutation$CheckInBooking$checkInBooking) then,
  ) = _CopyWithImpl$Mutation$CheckInBooking$checkInBooking;

  factory CopyWith$Mutation$CheckInBooking$checkInBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CheckInBooking$checkInBooking;

  TRes call({
    String? id,
    Enum$BookingStatus? status,
    DateTime? checkedInAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CheckInBooking$checkInBooking<TRes>
    implements CopyWith$Mutation$CheckInBooking$checkInBooking<TRes> {
  _CopyWithImpl$Mutation$CheckInBooking$checkInBooking(
    this._instance,
    this._then,
  );

  final Mutation$CheckInBooking$checkInBooking _instance;

  final TRes Function(Mutation$CheckInBooking$checkInBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? checkedInAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CheckInBooking$checkInBooking(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$BookingStatus),
      checkedInAt: checkedInAt == _undefined
          ? _instance.checkedInAt
          : (checkedInAt as DateTime?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CheckInBooking$checkInBooking<TRes>
    implements CopyWith$Mutation$CheckInBooking$checkInBooking<TRes> {
  _CopyWithStubImpl$Mutation$CheckInBooking$checkInBooking(this._res);

  TRes _res;

  call({
    String? id,
    Enum$BookingStatus? status,
    DateTime? checkedInAt,
    String? $__typename,
  }) => _res;
}
