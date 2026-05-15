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
    required this.checkInFacilityBooking,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CheckInBooking.fromJson(Map<String, dynamic> json) {
    final l$checkInFacilityBooking = json['checkInFacilityBooking'];
    final l$$__typename = json['__typename'];
    return Mutation$CheckInBooking(
      checkInFacilityBooking:
          Mutation$CheckInBooking$checkInFacilityBooking.fromJson(
            (l$checkInFacilityBooking as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CheckInBooking$checkInFacilityBooking checkInFacilityBooking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$checkInFacilityBooking = checkInFacilityBooking;
    _resultData['checkInFacilityBooking'] = l$checkInFacilityBooking.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$checkInFacilityBooking = checkInFacilityBooking;
    final l$$__typename = $__typename;
    return Object.hashAll([l$checkInFacilityBooking, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CheckInBooking || runtimeType != other.runtimeType) {
      return false;
    }
    final l$checkInFacilityBooking = checkInFacilityBooking;
    final lOther$checkInFacilityBooking = other.checkInFacilityBooking;
    if (l$checkInFacilityBooking != lOther$checkInFacilityBooking) {
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
    Mutation$CheckInBooking$checkInFacilityBooking? checkInFacilityBooking,
    String? $__typename,
  });
  CopyWith$Mutation$CheckInBooking$checkInFacilityBooking<TRes>
  get checkInFacilityBooking;
}

class _CopyWithImpl$Mutation$CheckInBooking<TRes>
    implements CopyWith$Mutation$CheckInBooking<TRes> {
  _CopyWithImpl$Mutation$CheckInBooking(this._instance, this._then);

  final Mutation$CheckInBooking _instance;

  final TRes Function(Mutation$CheckInBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? checkInFacilityBooking = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CheckInBooking(
      checkInFacilityBooking:
          checkInFacilityBooking == _undefined || checkInFacilityBooking == null
          ? _instance.checkInFacilityBooking
          : (checkInFacilityBooking
                as Mutation$CheckInBooking$checkInFacilityBooking),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CheckInBooking$checkInFacilityBooking<TRes>
  get checkInFacilityBooking {
    final local$checkInFacilityBooking = _instance.checkInFacilityBooking;
    return CopyWith$Mutation$CheckInBooking$checkInFacilityBooking(
      local$checkInFacilityBooking,
      (e) => call(checkInFacilityBooking: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CheckInBooking<TRes>
    implements CopyWith$Mutation$CheckInBooking<TRes> {
  _CopyWithStubImpl$Mutation$CheckInBooking(this._res);

  TRes _res;

  call({
    Mutation$CheckInBooking$checkInFacilityBooking? checkInFacilityBooking,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CheckInBooking$checkInFacilityBooking<TRes>
  get checkInFacilityBooking =>
      CopyWith$Mutation$CheckInBooking$checkInFacilityBooking.stub(_res);
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
            name: NameNode(value: 'checkInFacilityBooking'),
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
                  name: NameNode(value: 'checkInTime'),
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

class Mutation$CheckInBooking$checkInFacilityBooking {
  Mutation$CheckInBooking$checkInFacilityBooking({
    required this.id,
    required this.status,
    this.checkInTime,
    this.$__typename = 'FacilityBooking',
  });

  factory Mutation$CheckInBooking$checkInFacilityBooking.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$checkInTime = json['checkInTime'];
    final l$$__typename = json['__typename'];
    return Mutation$CheckInBooking$checkInFacilityBooking(
      id: (l$id as String),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      checkInTime: l$checkInTime == null
          ? null
          : DateTime.parse((l$checkInTime as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$BookingStatus status;

  final DateTime? checkInTime;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$checkInTime = checkInTime;
    _resultData['checkInTime'] = l$checkInTime?.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$checkInTime = checkInTime;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$status, l$checkInTime, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CheckInBooking$checkInFacilityBooking ||
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
    final l$checkInTime = checkInTime;
    final lOther$checkInTime = other.checkInTime;
    if (l$checkInTime != lOther$checkInTime) {
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

extension UtilityExtension$Mutation$CheckInBooking$checkInFacilityBooking
    on Mutation$CheckInBooking$checkInFacilityBooking {
  CopyWith$Mutation$CheckInBooking$checkInFacilityBooking<
    Mutation$CheckInBooking$checkInFacilityBooking
  >
  get copyWith =>
      CopyWith$Mutation$CheckInBooking$checkInFacilityBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$CheckInBooking$checkInFacilityBooking<TRes> {
  factory CopyWith$Mutation$CheckInBooking$checkInFacilityBooking(
    Mutation$CheckInBooking$checkInFacilityBooking instance,
    TRes Function(Mutation$CheckInBooking$checkInFacilityBooking) then,
  ) = _CopyWithImpl$Mutation$CheckInBooking$checkInFacilityBooking;

  factory CopyWith$Mutation$CheckInBooking$checkInFacilityBooking.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CheckInBooking$checkInFacilityBooking;

  TRes call({
    String? id,
    Enum$BookingStatus? status,
    DateTime? checkInTime,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CheckInBooking$checkInFacilityBooking<TRes>
    implements CopyWith$Mutation$CheckInBooking$checkInFacilityBooking<TRes> {
  _CopyWithImpl$Mutation$CheckInBooking$checkInFacilityBooking(
    this._instance,
    this._then,
  );

  final Mutation$CheckInBooking$checkInFacilityBooking _instance;

  final TRes Function(Mutation$CheckInBooking$checkInFacilityBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? checkInTime = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CheckInBooking$checkInFacilityBooking(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$BookingStatus),
      checkInTime: checkInTime == _undefined
          ? _instance.checkInTime
          : (checkInTime as DateTime?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CheckInBooking$checkInFacilityBooking<TRes>
    implements CopyWith$Mutation$CheckInBooking$checkInFacilityBooking<TRes> {
  _CopyWithStubImpl$Mutation$CheckInBooking$checkInFacilityBooking(this._res);

  TRes _res;

  call({
    String? id,
    Enum$BookingStatus? status,
    DateTime? checkInTime,
    String? $__typename,
  }) => _res;
}
