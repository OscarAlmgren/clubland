import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Subscription$BookingUpdates {
  factory Variables$Subscription$BookingUpdates({String? userId}) =>
      Variables$Subscription$BookingUpdates._({
        if (userId != null) r'userId': userId,
      });

  Variables$Subscription$BookingUpdates._(this._$data);

  factory Variables$Subscription$BookingUpdates.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('userId')) {
      final l$userId = data['userId'];
      result$data['userId'] = (l$userId as String?);
    }
    return Variables$Subscription$BookingUpdates._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get userId => (_$data['userId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('userId')) {
      final l$userId = userId;
      result$data['userId'] = l$userId;
    }
    return result$data;
  }

  CopyWith$Variables$Subscription$BookingUpdates<
    Variables$Subscription$BookingUpdates
  >
  get copyWith =>
      CopyWith$Variables$Subscription$BookingUpdates(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$BookingUpdates ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (_$data.containsKey('userId') != other._$data.containsKey('userId')) {
      return false;
    }
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    return Object.hashAll([_$data.containsKey('userId') ? l$userId : const {}]);
  }
}

abstract class CopyWith$Variables$Subscription$BookingUpdates<TRes> {
  factory CopyWith$Variables$Subscription$BookingUpdates(
    Variables$Subscription$BookingUpdates instance,
    TRes Function(Variables$Subscription$BookingUpdates) then,
  ) = _CopyWithImpl$Variables$Subscription$BookingUpdates;

  factory CopyWith$Variables$Subscription$BookingUpdates.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$BookingUpdates;

  TRes call({String? userId});
}

class _CopyWithImpl$Variables$Subscription$BookingUpdates<TRes>
    implements CopyWith$Variables$Subscription$BookingUpdates<TRes> {
  _CopyWithImpl$Variables$Subscription$BookingUpdates(
    this._instance,
    this._then,
  );

  final Variables$Subscription$BookingUpdates _instance;

  final TRes Function(Variables$Subscription$BookingUpdates) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? userId = _undefined}) => _then(
    Variables$Subscription$BookingUpdates._({
      ..._instance._$data,
      if (userId != _undefined) 'userId': (userId as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Subscription$BookingUpdates<TRes>
    implements CopyWith$Variables$Subscription$BookingUpdates<TRes> {
  _CopyWithStubImpl$Variables$Subscription$BookingUpdates(this._res);

  TRes _res;

  call({String? userId}) => _res;
}

class Subscription$BookingUpdates {
  Subscription$BookingUpdates({
    required this.bookingUpdates,
    this.$__typename = 'Subscription',
  });

  factory Subscription$BookingUpdates.fromJson(Map<String, dynamic> json) {
    final l$bookingUpdates = json['bookingUpdates'];
    final l$$__typename = json['__typename'];
    return Subscription$BookingUpdates(
      bookingUpdates: Subscription$BookingUpdates$bookingUpdates.fromJson(
        (l$bookingUpdates as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Subscription$BookingUpdates$bookingUpdates bookingUpdates;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$bookingUpdates = bookingUpdates;
    _resultData['bookingUpdates'] = l$bookingUpdates.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$bookingUpdates = bookingUpdates;
    final l$$__typename = $__typename;
    return Object.hashAll([l$bookingUpdates, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$BookingUpdates ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bookingUpdates = bookingUpdates;
    final lOther$bookingUpdates = other.bookingUpdates;
    if (l$bookingUpdates != lOther$bookingUpdates) {
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

extension UtilityExtension$Subscription$BookingUpdates
    on Subscription$BookingUpdates {
  CopyWith$Subscription$BookingUpdates<Subscription$BookingUpdates>
  get copyWith => CopyWith$Subscription$BookingUpdates(this, (i) => i);
}

abstract class CopyWith$Subscription$BookingUpdates<TRes> {
  factory CopyWith$Subscription$BookingUpdates(
    Subscription$BookingUpdates instance,
    TRes Function(Subscription$BookingUpdates) then,
  ) = _CopyWithImpl$Subscription$BookingUpdates;

  factory CopyWith$Subscription$BookingUpdates.stub(TRes res) =
      _CopyWithStubImpl$Subscription$BookingUpdates;

  TRes call({
    Subscription$BookingUpdates$bookingUpdates? bookingUpdates,
    String? $__typename,
  });
  CopyWith$Subscription$BookingUpdates$bookingUpdates<TRes> get bookingUpdates;
}

class _CopyWithImpl$Subscription$BookingUpdates<TRes>
    implements CopyWith$Subscription$BookingUpdates<TRes> {
  _CopyWithImpl$Subscription$BookingUpdates(this._instance, this._then);

  final Subscription$BookingUpdates _instance;

  final TRes Function(Subscription$BookingUpdates) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? bookingUpdates = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Subscription$BookingUpdates(
      bookingUpdates: bookingUpdates == _undefined || bookingUpdates == null
          ? _instance.bookingUpdates
          : (bookingUpdates as Subscription$BookingUpdates$bookingUpdates),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Subscription$BookingUpdates$bookingUpdates<TRes> get bookingUpdates {
    final local$bookingUpdates = _instance.bookingUpdates;
    return CopyWith$Subscription$BookingUpdates$bookingUpdates(
      local$bookingUpdates,
      (e) => call(bookingUpdates: e),
    );
  }
}

class _CopyWithStubImpl$Subscription$BookingUpdates<TRes>
    implements CopyWith$Subscription$BookingUpdates<TRes> {
  _CopyWithStubImpl$Subscription$BookingUpdates(this._res);

  TRes _res;

  call({
    Subscription$BookingUpdates$bookingUpdates? bookingUpdates,
    String? $__typename,
  }) => _res;

  CopyWith$Subscription$BookingUpdates$bookingUpdates<TRes>
  get bookingUpdates =>
      CopyWith$Subscription$BookingUpdates$bookingUpdates.stub(_res);
}

const documentNodeSubscriptionBookingUpdates = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'BookingUpdates'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'userId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'bookingUpdates'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'userId'),
                value: VariableNode(name: NameNode(value: 'userId')),
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
                  name: NameNode(value: 'facility'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'name'),
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
                  name: NameNode(value: 'startTime'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'endTime'),
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
Subscription$BookingUpdates _parserFn$Subscription$BookingUpdates(
  Map<String, dynamic> data,
) => Subscription$BookingUpdates.fromJson(data);

class Options$Subscription$BookingUpdates
    extends graphql.SubscriptionOptions<Subscription$BookingUpdates> {
  Options$Subscription$BookingUpdates({
    String? operationName,
    Variables$Subscription$BookingUpdates? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$BookingUpdates? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeSubscriptionBookingUpdates,
         parserFn: _parserFn$Subscription$BookingUpdates,
       );
}

class WatchOptions$Subscription$BookingUpdates
    extends graphql.WatchQueryOptions<Subscription$BookingUpdates> {
  WatchOptions$Subscription$BookingUpdates({
    String? operationName,
    Variables$Subscription$BookingUpdates? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$BookingUpdates? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeSubscriptionBookingUpdates,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Subscription$BookingUpdates,
       );
}

class FetchMoreOptions$Subscription$BookingUpdates
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$BookingUpdates({
    required graphql.UpdateQuery updateQuery,
    Variables$Subscription$BookingUpdates? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeSubscriptionBookingUpdates,
       );
}

extension ClientExtension$Subscription$BookingUpdates on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$BookingUpdates>>
  subscribe$BookingUpdates([Options$Subscription$BookingUpdates? options]) =>
      this.subscribe(options ?? Options$Subscription$BookingUpdates());

  graphql.ObservableQuery<Subscription$BookingUpdates>
  watchSubscription$BookingUpdates([
    WatchOptions$Subscription$BookingUpdates? options,
  ]) => this.watchQuery(options ?? WatchOptions$Subscription$BookingUpdates());
}

class Subscription$BookingUpdates$bookingUpdates {
  Subscription$BookingUpdates$bookingUpdates({
    required this.id,
    required this.status,
    this.facility,
    required this.startTime,
    required this.endTime,
    this.$__typename = 'Booking',
  });

  factory Subscription$BookingUpdates$bookingUpdates.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$facility = json['facility'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$$__typename = json['__typename'];
    return Subscription$BookingUpdates$bookingUpdates(
      id: (l$id as String),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      facility: l$facility == null
          ? null
          : Subscription$BookingUpdates$bookingUpdates$facility.fromJson(
              (l$facility as Map<String, dynamic>),
            ),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$BookingStatus status;

  final Subscription$BookingUpdates$bookingUpdates$facility? facility;

  final DateTime startTime;

  final DateTime endTime;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$facility = facility;
    _resultData['facility'] = l$facility?.toJson();
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$facility = facility;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$facility,
      l$startTime,
      l$endTime,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$BookingUpdates$bookingUpdates ||
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
    final l$facility = facility;
    final lOther$facility = other.facility;
    if (l$facility != lOther$facility) {
      return false;
    }
    final l$startTime = startTime;
    final lOther$startTime = other.startTime;
    if (l$startTime != lOther$startTime) {
      return false;
    }
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (l$endTime != lOther$endTime) {
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

extension UtilityExtension$Subscription$BookingUpdates$bookingUpdates
    on Subscription$BookingUpdates$bookingUpdates {
  CopyWith$Subscription$BookingUpdates$bookingUpdates<
    Subscription$BookingUpdates$bookingUpdates
  >
  get copyWith =>
      CopyWith$Subscription$BookingUpdates$bookingUpdates(this, (i) => i);
}

abstract class CopyWith$Subscription$BookingUpdates$bookingUpdates<TRes> {
  factory CopyWith$Subscription$BookingUpdates$bookingUpdates(
    Subscription$BookingUpdates$bookingUpdates instance,
    TRes Function(Subscription$BookingUpdates$bookingUpdates) then,
  ) = _CopyWithImpl$Subscription$BookingUpdates$bookingUpdates;

  factory CopyWith$Subscription$BookingUpdates$bookingUpdates.stub(TRes res) =
      _CopyWithStubImpl$Subscription$BookingUpdates$bookingUpdates;

  TRes call({
    String? id,
    Enum$BookingStatus? status,
    Subscription$BookingUpdates$bookingUpdates$facility? facility,
    DateTime? startTime,
    DateTime? endTime,
    String? $__typename,
  });
  CopyWith$Subscription$BookingUpdates$bookingUpdates$facility<TRes>
  get facility;
}

class _CopyWithImpl$Subscription$BookingUpdates$bookingUpdates<TRes>
    implements CopyWith$Subscription$BookingUpdates$bookingUpdates<TRes> {
  _CopyWithImpl$Subscription$BookingUpdates$bookingUpdates(
    this._instance,
    this._then,
  );

  final Subscription$BookingUpdates$bookingUpdates _instance;

  final TRes Function(Subscription$BookingUpdates$bookingUpdates) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? facility = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Subscription$BookingUpdates$bookingUpdates(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$BookingStatus),
      facility: facility == _undefined
          ? _instance.facility
          : (facility as Subscription$BookingUpdates$bookingUpdates$facility?),
      startTime: startTime == _undefined || startTime == null
          ? _instance.startTime
          : (startTime as DateTime),
      endTime: endTime == _undefined || endTime == null
          ? _instance.endTime
          : (endTime as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Subscription$BookingUpdates$bookingUpdates$facility<TRes>
  get facility {
    final local$facility = _instance.facility;
    return local$facility == null
        ? CopyWith$Subscription$BookingUpdates$bookingUpdates$facility.stub(
            _then(_instance),
          )
        : CopyWith$Subscription$BookingUpdates$bookingUpdates$facility(
            local$facility,
            (e) => call(facility: e),
          );
  }
}

class _CopyWithStubImpl$Subscription$BookingUpdates$bookingUpdates<TRes>
    implements CopyWith$Subscription$BookingUpdates$bookingUpdates<TRes> {
  _CopyWithStubImpl$Subscription$BookingUpdates$bookingUpdates(this._res);

  TRes _res;

  call({
    String? id,
    Enum$BookingStatus? status,
    Subscription$BookingUpdates$bookingUpdates$facility? facility,
    DateTime? startTime,
    DateTime? endTime,
    String? $__typename,
  }) => _res;

  CopyWith$Subscription$BookingUpdates$bookingUpdates$facility<TRes>
  get facility =>
      CopyWith$Subscription$BookingUpdates$bookingUpdates$facility.stub(_res);
}

class Subscription$BookingUpdates$bookingUpdates$facility {
  Subscription$BookingUpdates$bookingUpdates$facility({
    required this.name,
    this.$__typename = 'Facility',
  });

  factory Subscription$BookingUpdates$bookingUpdates$facility.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Subscription$BookingUpdates$bookingUpdates$facility(
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$BookingUpdates$bookingUpdates$facility ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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

extension UtilityExtension$Subscription$BookingUpdates$bookingUpdates$facility
    on Subscription$BookingUpdates$bookingUpdates$facility {
  CopyWith$Subscription$BookingUpdates$bookingUpdates$facility<
    Subscription$BookingUpdates$bookingUpdates$facility
  >
  get copyWith => CopyWith$Subscription$BookingUpdates$bookingUpdates$facility(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Subscription$BookingUpdates$bookingUpdates$facility<
  TRes
> {
  factory CopyWith$Subscription$BookingUpdates$bookingUpdates$facility(
    Subscription$BookingUpdates$bookingUpdates$facility instance,
    TRes Function(Subscription$BookingUpdates$bookingUpdates$facility) then,
  ) = _CopyWithImpl$Subscription$BookingUpdates$bookingUpdates$facility;

  factory CopyWith$Subscription$BookingUpdates$bookingUpdates$facility.stub(
    TRes res,
  ) = _CopyWithStubImpl$Subscription$BookingUpdates$bookingUpdates$facility;

  TRes call({String? name, String? $__typename});
}

class _CopyWithImpl$Subscription$BookingUpdates$bookingUpdates$facility<TRes>
    implements
        CopyWith$Subscription$BookingUpdates$bookingUpdates$facility<TRes> {
  _CopyWithImpl$Subscription$BookingUpdates$bookingUpdates$facility(
    this._instance,
    this._then,
  );

  final Subscription$BookingUpdates$bookingUpdates$facility _instance;

  final TRes Function(Subscription$BookingUpdates$bookingUpdates$facility)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? name = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Subscription$BookingUpdates$bookingUpdates$facility(
          name: name == _undefined || name == null
              ? _instance.name
              : (name as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Subscription$BookingUpdates$bookingUpdates$facility<
  TRes
>
    implements
        CopyWith$Subscription$BookingUpdates$bookingUpdates$facility<TRes> {
  _CopyWithStubImpl$Subscription$BookingUpdates$bookingUpdates$facility(
    this._res,
  );

  TRes _res;

  call({String? name, String? $__typename}) => _res;
}
