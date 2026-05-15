import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CheckOutBooking {
  factory Variables$Mutation$CheckOutBooking({required String bookingId}) =>
      Variables$Mutation$CheckOutBooking._({r'bookingId': bookingId});

  Variables$Mutation$CheckOutBooking._(this._$data);

  factory Variables$Mutation$CheckOutBooking.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$bookingId = data['bookingId'];
    result$data['bookingId'] = (l$bookingId as String);
    return Variables$Mutation$CheckOutBooking._(result$data);
  }

  Map<String, dynamic> _$data;

  String get bookingId => (_$data['bookingId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$bookingId = bookingId;
    result$data['bookingId'] = l$bookingId;
    return result$data;
  }

  CopyWith$Variables$Mutation$CheckOutBooking<
    Variables$Mutation$CheckOutBooking
  >
  get copyWith => CopyWith$Variables$Mutation$CheckOutBooking(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CheckOutBooking ||
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

abstract class CopyWith$Variables$Mutation$CheckOutBooking<TRes> {
  factory CopyWith$Variables$Mutation$CheckOutBooking(
    Variables$Mutation$CheckOutBooking instance,
    TRes Function(Variables$Mutation$CheckOutBooking) then,
  ) = _CopyWithImpl$Variables$Mutation$CheckOutBooking;

  factory CopyWith$Variables$Mutation$CheckOutBooking.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CheckOutBooking;

  TRes call({String? bookingId});
}

class _CopyWithImpl$Variables$Mutation$CheckOutBooking<TRes>
    implements CopyWith$Variables$Mutation$CheckOutBooking<TRes> {
  _CopyWithImpl$Variables$Mutation$CheckOutBooking(this._instance, this._then);

  final Variables$Mutation$CheckOutBooking _instance;

  final TRes Function(Variables$Mutation$CheckOutBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? bookingId = _undefined}) => _then(
    Variables$Mutation$CheckOutBooking._({
      ..._instance._$data,
      if (bookingId != _undefined && bookingId != null)
        'bookingId': (bookingId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CheckOutBooking<TRes>
    implements CopyWith$Variables$Mutation$CheckOutBooking<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CheckOutBooking(this._res);

  TRes _res;

  call({String? bookingId}) => _res;
}

class Mutation$CheckOutBooking {
  Mutation$CheckOutBooking({
    required this.checkOutFacilityBooking,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CheckOutBooking.fromJson(Map<String, dynamic> json) {
    final l$checkOutFacilityBooking = json['checkOutFacilityBooking'];
    final l$$__typename = json['__typename'];
    return Mutation$CheckOutBooking(
      checkOutFacilityBooking:
          Mutation$CheckOutBooking$checkOutFacilityBooking.fromJson(
            (l$checkOutFacilityBooking as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CheckOutBooking$checkOutFacilityBooking
  checkOutFacilityBooking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$checkOutFacilityBooking = checkOutFacilityBooking;
    _resultData['checkOutFacilityBooking'] = l$checkOutFacilityBooking.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$checkOutFacilityBooking = checkOutFacilityBooking;
    final l$$__typename = $__typename;
    return Object.hashAll([l$checkOutFacilityBooking, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CheckOutBooking ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$checkOutFacilityBooking = checkOutFacilityBooking;
    final lOther$checkOutFacilityBooking = other.checkOutFacilityBooking;
    if (l$checkOutFacilityBooking != lOther$checkOutFacilityBooking) {
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

extension UtilityExtension$Mutation$CheckOutBooking
    on Mutation$CheckOutBooking {
  CopyWith$Mutation$CheckOutBooking<Mutation$CheckOutBooking> get copyWith =>
      CopyWith$Mutation$CheckOutBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$CheckOutBooking<TRes> {
  factory CopyWith$Mutation$CheckOutBooking(
    Mutation$CheckOutBooking instance,
    TRes Function(Mutation$CheckOutBooking) then,
  ) = _CopyWithImpl$Mutation$CheckOutBooking;

  factory CopyWith$Mutation$CheckOutBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CheckOutBooking;

  TRes call({
    Mutation$CheckOutBooking$checkOutFacilityBooking? checkOutFacilityBooking,
    String? $__typename,
  });
  CopyWith$Mutation$CheckOutBooking$checkOutFacilityBooking<TRes>
  get checkOutFacilityBooking;
}

class _CopyWithImpl$Mutation$CheckOutBooking<TRes>
    implements CopyWith$Mutation$CheckOutBooking<TRes> {
  _CopyWithImpl$Mutation$CheckOutBooking(this._instance, this._then);

  final Mutation$CheckOutBooking _instance;

  final TRes Function(Mutation$CheckOutBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? checkOutFacilityBooking = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CheckOutBooking(
      checkOutFacilityBooking:
          checkOutFacilityBooking == _undefined ||
              checkOutFacilityBooking == null
          ? _instance.checkOutFacilityBooking
          : (checkOutFacilityBooking
                as Mutation$CheckOutBooking$checkOutFacilityBooking),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CheckOutBooking$checkOutFacilityBooking<TRes>
  get checkOutFacilityBooking {
    final local$checkOutFacilityBooking = _instance.checkOutFacilityBooking;
    return CopyWith$Mutation$CheckOutBooking$checkOutFacilityBooking(
      local$checkOutFacilityBooking,
      (e) => call(checkOutFacilityBooking: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CheckOutBooking<TRes>
    implements CopyWith$Mutation$CheckOutBooking<TRes> {
  _CopyWithStubImpl$Mutation$CheckOutBooking(this._res);

  TRes _res;

  call({
    Mutation$CheckOutBooking$checkOutFacilityBooking? checkOutFacilityBooking,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CheckOutBooking$checkOutFacilityBooking<TRes>
  get checkOutFacilityBooking =>
      CopyWith$Mutation$CheckOutBooking$checkOutFacilityBooking.stub(_res);
}

const documentNodeMutationCheckOutBooking = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CheckOutBooking'),
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
            name: NameNode(value: 'checkOutFacilityBooking'),
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
                  name: NameNode(value: 'checkOutTime'),
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
Mutation$CheckOutBooking _parserFn$Mutation$CheckOutBooking(
  Map<String, dynamic> data,
) => Mutation$CheckOutBooking.fromJson(data);
typedef OnMutationCompleted$Mutation$CheckOutBooking =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CheckOutBooking?);

class Options$Mutation$CheckOutBooking
    extends graphql.MutationOptions<Mutation$CheckOutBooking> {
  Options$Mutation$CheckOutBooking({
    String? operationName,
    required Variables$Mutation$CheckOutBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CheckOutBooking? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CheckOutBooking? onCompleted,
    graphql.OnMutationUpdate<Mutation$CheckOutBooking>? update,
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
                 data == null ? null : _parserFn$Mutation$CheckOutBooking(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCheckOutBooking,
         parserFn: _parserFn$Mutation$CheckOutBooking,
       );

  final OnMutationCompleted$Mutation$CheckOutBooking? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CheckOutBooking
    extends graphql.WatchQueryOptions<Mutation$CheckOutBooking> {
  WatchOptions$Mutation$CheckOutBooking({
    String? operationName,
    required Variables$Mutation$CheckOutBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CheckOutBooking? typedOptimisticResult,
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
         document: documentNodeMutationCheckOutBooking,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CheckOutBooking,
       );
}

extension ClientExtension$Mutation$CheckOutBooking on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CheckOutBooking>> mutate$CheckOutBooking(
    Options$Mutation$CheckOutBooking options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CheckOutBooking>
  watchMutation$CheckOutBooking(
    WatchOptions$Mutation$CheckOutBooking options,
  ) => this.watchMutation(options);
}

class Mutation$CheckOutBooking$checkOutFacilityBooking {
  Mutation$CheckOutBooking$checkOutFacilityBooking({
    required this.id,
    required this.status,
    this.checkOutTime,
    this.$__typename = 'FacilityBooking',
  });

  factory Mutation$CheckOutBooking$checkOutFacilityBooking.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$checkOutTime = json['checkOutTime'];
    final l$$__typename = json['__typename'];
    return Mutation$CheckOutBooking$checkOutFacilityBooking(
      id: (l$id as String),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      checkOutTime: l$checkOutTime == null
          ? null
          : DateTime.parse((l$checkOutTime as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$BookingStatus status;

  final DateTime? checkOutTime;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$checkOutTime = checkOutTime;
    _resultData['checkOutTime'] = l$checkOutTime?.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$checkOutTime = checkOutTime;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$status, l$checkOutTime, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CheckOutBooking$checkOutFacilityBooking ||
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
    final l$checkOutTime = checkOutTime;
    final lOther$checkOutTime = other.checkOutTime;
    if (l$checkOutTime != lOther$checkOutTime) {
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

extension UtilityExtension$Mutation$CheckOutBooking$checkOutFacilityBooking
    on Mutation$CheckOutBooking$checkOutFacilityBooking {
  CopyWith$Mutation$CheckOutBooking$checkOutFacilityBooking<
    Mutation$CheckOutBooking$checkOutFacilityBooking
  >
  get copyWith =>
      CopyWith$Mutation$CheckOutBooking$checkOutFacilityBooking(this, (i) => i);
}

abstract class CopyWith$Mutation$CheckOutBooking$checkOutFacilityBooking<TRes> {
  factory CopyWith$Mutation$CheckOutBooking$checkOutFacilityBooking(
    Mutation$CheckOutBooking$checkOutFacilityBooking instance,
    TRes Function(Mutation$CheckOutBooking$checkOutFacilityBooking) then,
  ) = _CopyWithImpl$Mutation$CheckOutBooking$checkOutFacilityBooking;

  factory CopyWith$Mutation$CheckOutBooking$checkOutFacilityBooking.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CheckOutBooking$checkOutFacilityBooking;

  TRes call({
    String? id,
    Enum$BookingStatus? status,
    DateTime? checkOutTime,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CheckOutBooking$checkOutFacilityBooking<TRes>
    implements CopyWith$Mutation$CheckOutBooking$checkOutFacilityBooking<TRes> {
  _CopyWithImpl$Mutation$CheckOutBooking$checkOutFacilityBooking(
    this._instance,
    this._then,
  );

  final Mutation$CheckOutBooking$checkOutFacilityBooking _instance;

  final TRes Function(Mutation$CheckOutBooking$checkOutFacilityBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? checkOutTime = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CheckOutBooking$checkOutFacilityBooking(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$BookingStatus),
      checkOutTime: checkOutTime == _undefined
          ? _instance.checkOutTime
          : (checkOutTime as DateTime?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CheckOutBooking$checkOutFacilityBooking<TRes>
    implements CopyWith$Mutation$CheckOutBooking$checkOutFacilityBooking<TRes> {
  _CopyWithStubImpl$Mutation$CheckOutBooking$checkOutFacilityBooking(this._res);

  TRes _res;

  call({
    String? id,
    Enum$BookingStatus? status,
    DateTime? checkOutTime,
    String? $__typename,
  }) => _res;
}
