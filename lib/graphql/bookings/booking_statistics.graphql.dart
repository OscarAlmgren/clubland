import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$BookingStatistics {
  factory Variables$Query$BookingStatistics({
    required DateTime startDate,
    required DateTime endDate,
  }) => Variables$Query$BookingStatistics._({
    r'startDate': startDate,
    r'endDate': endDate,
  });

  Variables$Query$BookingStatistics._(this._$data);

  factory Variables$Query$BookingStatistics.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$startDate = data['startDate'];
    result$data['startDate'] = DateTime.parse((l$startDate as String));
    final l$endDate = data['endDate'];
    result$data['endDate'] = DateTime.parse((l$endDate as String));
    return Variables$Query$BookingStatistics._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime get startDate => (_$data['startDate'] as DateTime);

  DateTime get endDate => (_$data['endDate'] as DateTime);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$startDate = startDate;
    result$data['startDate'] = l$startDate.toIso8601String();
    final l$endDate = endDate;
    result$data['endDate'] = l$endDate.toIso8601String();
    return result$data;
  }

  CopyWith$Variables$Query$BookingStatistics<Variables$Query$BookingStatistics>
  get copyWith => CopyWith$Variables$Query$BookingStatistics(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$BookingStatistics ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (l$endDate != lOther$endDate) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$startDate = startDate;
    final l$endDate = endDate;
    return Object.hashAll([l$startDate, l$endDate]);
  }
}

abstract class CopyWith$Variables$Query$BookingStatistics<TRes> {
  factory CopyWith$Variables$Query$BookingStatistics(
    Variables$Query$BookingStatistics instance,
    TRes Function(Variables$Query$BookingStatistics) then,
  ) = _CopyWithImpl$Variables$Query$BookingStatistics;

  factory CopyWith$Variables$Query$BookingStatistics.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$BookingStatistics;

  TRes call({DateTime? startDate, DateTime? endDate});
}

class _CopyWithImpl$Variables$Query$BookingStatistics<TRes>
    implements CopyWith$Variables$Query$BookingStatistics<TRes> {
  _CopyWithImpl$Variables$Query$BookingStatistics(this._instance, this._then);

  final Variables$Query$BookingStatistics _instance;

  final TRes Function(Variables$Query$BookingStatistics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? startDate = _undefined, Object? endDate = _undefined}) =>
      _then(
        Variables$Query$BookingStatistics._({
          ..._instance._$data,
          if (startDate != _undefined && startDate != null)
            'startDate': (startDate as DateTime),
          if (endDate != _undefined && endDate != null)
            'endDate': (endDate as DateTime),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$BookingStatistics<TRes>
    implements CopyWith$Variables$Query$BookingStatistics<TRes> {
  _CopyWithStubImpl$Variables$Query$BookingStatistics(this._res);

  TRes _res;

  call({DateTime? startDate, DateTime? endDate}) => _res;
}

class Query$BookingStatistics {
  Query$BookingStatistics({
    required this.bookingStatistics,
    this.$__typename = 'Query',
  });

  factory Query$BookingStatistics.fromJson(Map<String, dynamic> json) {
    final l$bookingStatistics = json['bookingStatistics'];
    final l$$__typename = json['__typename'];
    return Query$BookingStatistics(
      bookingStatistics: Query$BookingStatistics$bookingStatistics.fromJson(
        (l$bookingStatistics as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$BookingStatistics$bookingStatistics bookingStatistics;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$bookingStatistics = bookingStatistics;
    _resultData['bookingStatistics'] = l$bookingStatistics.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$bookingStatistics = bookingStatistics;
    final l$$__typename = $__typename;
    return Object.hashAll([l$bookingStatistics, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$BookingStatistics || runtimeType != other.runtimeType) {
      return false;
    }
    final l$bookingStatistics = bookingStatistics;
    final lOther$bookingStatistics = other.bookingStatistics;
    if (l$bookingStatistics != lOther$bookingStatistics) {
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

extension UtilityExtension$Query$BookingStatistics on Query$BookingStatistics {
  CopyWith$Query$BookingStatistics<Query$BookingStatistics> get copyWith =>
      CopyWith$Query$BookingStatistics(this, (i) => i);
}

abstract class CopyWith$Query$BookingStatistics<TRes> {
  factory CopyWith$Query$BookingStatistics(
    Query$BookingStatistics instance,
    TRes Function(Query$BookingStatistics) then,
  ) = _CopyWithImpl$Query$BookingStatistics;

  factory CopyWith$Query$BookingStatistics.stub(TRes res) =
      _CopyWithStubImpl$Query$BookingStatistics;

  TRes call({
    Query$BookingStatistics$bookingStatistics? bookingStatistics,
    String? $__typename,
  });
  CopyWith$Query$BookingStatistics$bookingStatistics<TRes>
  get bookingStatistics;
}

class _CopyWithImpl$Query$BookingStatistics<TRes>
    implements CopyWith$Query$BookingStatistics<TRes> {
  _CopyWithImpl$Query$BookingStatistics(this._instance, this._then);

  final Query$BookingStatistics _instance;

  final TRes Function(Query$BookingStatistics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? bookingStatistics = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$BookingStatistics(
      bookingStatistics:
          bookingStatistics == _undefined || bookingStatistics == null
          ? _instance.bookingStatistics
          : (bookingStatistics as Query$BookingStatistics$bookingStatistics),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$BookingStatistics$bookingStatistics<TRes>
  get bookingStatistics {
    final local$bookingStatistics = _instance.bookingStatistics;
    return CopyWith$Query$BookingStatistics$bookingStatistics(
      local$bookingStatistics,
      (e) => call(bookingStatistics: e),
    );
  }
}

class _CopyWithStubImpl$Query$BookingStatistics<TRes>
    implements CopyWith$Query$BookingStatistics<TRes> {
  _CopyWithStubImpl$Query$BookingStatistics(this._res);

  TRes _res;

  call({
    Query$BookingStatistics$bookingStatistics? bookingStatistics,
    String? $__typename,
  }) => _res;

  CopyWith$Query$BookingStatistics$bookingStatistics<TRes>
  get bookingStatistics =>
      CopyWith$Query$BookingStatistics$bookingStatistics.stub(_res);
}

const documentNodeQueryBookingStatistics = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'BookingStatistics'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'startDate')),
          type: NamedTypeNode(name: NameNode(value: 'Time'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'endDate')),
          type: NamedTypeNode(name: NameNode(value: 'Time'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'bookingStatistics'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'startDate'),
                value: VariableNode(name: NameNode(value: 'startDate')),
              ),
              ArgumentNode(
                name: NameNode(value: 'endDate'),
                value: VariableNode(name: NameNode(value: 'endDate')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'totalBookings'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'confirmedBookings'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cancelledBookings'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'completedBookings'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'noShowBookings'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'averageBookingDuration'),
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
Query$BookingStatistics _parserFn$Query$BookingStatistics(
  Map<String, dynamic> data,
) => Query$BookingStatistics.fromJson(data);
typedef OnQueryComplete$Query$BookingStatistics =
    FutureOr<void> Function(Map<String, dynamic>?, Query$BookingStatistics?);

class Options$Query$BookingStatistics
    extends graphql.QueryOptions<Query$BookingStatistics> {
  Options$Query$BookingStatistics({
    String? operationName,
    required Variables$Query$BookingStatistics variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$BookingStatistics? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$BookingStatistics? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$BookingStatistics(data),
               ),
         onError: onError,
         document: documentNodeQueryBookingStatistics,
         parserFn: _parserFn$Query$BookingStatistics,
       );

  final OnQueryComplete$Query$BookingStatistics? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$BookingStatistics
    extends graphql.WatchQueryOptions<Query$BookingStatistics> {
  WatchOptions$Query$BookingStatistics({
    String? operationName,
    required Variables$Query$BookingStatistics variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$BookingStatistics? typedOptimisticResult,
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
         document: documentNodeQueryBookingStatistics,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$BookingStatistics,
       );
}

class FetchMoreOptions$Query$BookingStatistics
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$BookingStatistics({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$BookingStatistics variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryBookingStatistics,
       );
}

extension ClientExtension$Query$BookingStatistics on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$BookingStatistics>> query$BookingStatistics(
    Options$Query$BookingStatistics options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$BookingStatistics> watchQuery$BookingStatistics(
    WatchOptions$Query$BookingStatistics options,
  ) => this.watchQuery(options);

  void writeQuery$BookingStatistics({
    required Query$BookingStatistics data,
    required Variables$Query$BookingStatistics variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryBookingStatistics,
      ),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$BookingStatistics? readQuery$BookingStatistics({
    required Variables$Query$BookingStatistics variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryBookingStatistics,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$BookingStatistics.fromJson(result);
  }
}

class Query$BookingStatistics$bookingStatistics {
  Query$BookingStatistics$bookingStatistics({
    required this.totalBookings,
    required this.confirmedBookings,
    required this.cancelledBookings,
    required this.completedBookings,
    required this.noShowBookings,
    this.averageBookingDuration,
    this.$__typename = 'BookingStatistics',
  });

  factory Query$BookingStatistics$bookingStatistics.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$totalBookings = json['totalBookings'];
    final l$confirmedBookings = json['confirmedBookings'];
    final l$cancelledBookings = json['cancelledBookings'];
    final l$completedBookings = json['completedBookings'];
    final l$noShowBookings = json['noShowBookings'];
    final l$averageBookingDuration = json['averageBookingDuration'];
    final l$$__typename = json['__typename'];
    return Query$BookingStatistics$bookingStatistics(
      totalBookings: (l$totalBookings as int),
      confirmedBookings: (l$confirmedBookings as int),
      cancelledBookings: (l$cancelledBookings as int),
      completedBookings: (l$completedBookings as int),
      noShowBookings: (l$noShowBookings as int),
      averageBookingDuration: (l$averageBookingDuration as num?)?.toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final int totalBookings;

  final int confirmedBookings;

  final int cancelledBookings;

  final int completedBookings;

  final int noShowBookings;

  final double? averageBookingDuration;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$totalBookings = totalBookings;
    _resultData['totalBookings'] = l$totalBookings;
    final l$confirmedBookings = confirmedBookings;
    _resultData['confirmedBookings'] = l$confirmedBookings;
    final l$cancelledBookings = cancelledBookings;
    _resultData['cancelledBookings'] = l$cancelledBookings;
    final l$completedBookings = completedBookings;
    _resultData['completedBookings'] = l$completedBookings;
    final l$noShowBookings = noShowBookings;
    _resultData['noShowBookings'] = l$noShowBookings;
    final l$averageBookingDuration = averageBookingDuration;
    _resultData['averageBookingDuration'] = l$averageBookingDuration;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$totalBookings = totalBookings;
    final l$confirmedBookings = confirmedBookings;
    final l$cancelledBookings = cancelledBookings;
    final l$completedBookings = completedBookings;
    final l$noShowBookings = noShowBookings;
    final l$averageBookingDuration = averageBookingDuration;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$totalBookings,
      l$confirmedBookings,
      l$cancelledBookings,
      l$completedBookings,
      l$noShowBookings,
      l$averageBookingDuration,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$BookingStatistics$bookingStatistics ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$totalBookings = totalBookings;
    final lOther$totalBookings = other.totalBookings;
    if (l$totalBookings != lOther$totalBookings) {
      return false;
    }
    final l$confirmedBookings = confirmedBookings;
    final lOther$confirmedBookings = other.confirmedBookings;
    if (l$confirmedBookings != lOther$confirmedBookings) {
      return false;
    }
    final l$cancelledBookings = cancelledBookings;
    final lOther$cancelledBookings = other.cancelledBookings;
    if (l$cancelledBookings != lOther$cancelledBookings) {
      return false;
    }
    final l$completedBookings = completedBookings;
    final lOther$completedBookings = other.completedBookings;
    if (l$completedBookings != lOther$completedBookings) {
      return false;
    }
    final l$noShowBookings = noShowBookings;
    final lOther$noShowBookings = other.noShowBookings;
    if (l$noShowBookings != lOther$noShowBookings) {
      return false;
    }
    final l$averageBookingDuration = averageBookingDuration;
    final lOther$averageBookingDuration = other.averageBookingDuration;
    if (l$averageBookingDuration != lOther$averageBookingDuration) {
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

extension UtilityExtension$Query$BookingStatistics$bookingStatistics
    on Query$BookingStatistics$bookingStatistics {
  CopyWith$Query$BookingStatistics$bookingStatistics<
    Query$BookingStatistics$bookingStatistics
  >
  get copyWith =>
      CopyWith$Query$BookingStatistics$bookingStatistics(this, (i) => i);
}

abstract class CopyWith$Query$BookingStatistics$bookingStatistics<TRes> {
  factory CopyWith$Query$BookingStatistics$bookingStatistics(
    Query$BookingStatistics$bookingStatistics instance,
    TRes Function(Query$BookingStatistics$bookingStatistics) then,
  ) = _CopyWithImpl$Query$BookingStatistics$bookingStatistics;

  factory CopyWith$Query$BookingStatistics$bookingStatistics.stub(TRes res) =
      _CopyWithStubImpl$Query$BookingStatistics$bookingStatistics;

  TRes call({
    int? totalBookings,
    int? confirmedBookings,
    int? cancelledBookings,
    int? completedBookings,
    int? noShowBookings,
    double? averageBookingDuration,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$BookingStatistics$bookingStatistics<TRes>
    implements CopyWith$Query$BookingStatistics$bookingStatistics<TRes> {
  _CopyWithImpl$Query$BookingStatistics$bookingStatistics(
    this._instance,
    this._then,
  );

  final Query$BookingStatistics$bookingStatistics _instance;

  final TRes Function(Query$BookingStatistics$bookingStatistics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? totalBookings = _undefined,
    Object? confirmedBookings = _undefined,
    Object? cancelledBookings = _undefined,
    Object? completedBookings = _undefined,
    Object? noShowBookings = _undefined,
    Object? averageBookingDuration = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$BookingStatistics$bookingStatistics(
      totalBookings: totalBookings == _undefined || totalBookings == null
          ? _instance.totalBookings
          : (totalBookings as int),
      confirmedBookings:
          confirmedBookings == _undefined || confirmedBookings == null
          ? _instance.confirmedBookings
          : (confirmedBookings as int),
      cancelledBookings:
          cancelledBookings == _undefined || cancelledBookings == null
          ? _instance.cancelledBookings
          : (cancelledBookings as int),
      completedBookings:
          completedBookings == _undefined || completedBookings == null
          ? _instance.completedBookings
          : (completedBookings as int),
      noShowBookings: noShowBookings == _undefined || noShowBookings == null
          ? _instance.noShowBookings
          : (noShowBookings as int),
      averageBookingDuration: averageBookingDuration == _undefined
          ? _instance.averageBookingDuration
          : (averageBookingDuration as double?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$BookingStatistics$bookingStatistics<TRes>
    implements CopyWith$Query$BookingStatistics$bookingStatistics<TRes> {
  _CopyWithStubImpl$Query$BookingStatistics$bookingStatistics(this._res);

  TRes _res;

  call({
    int? totalBookings,
    int? confirmedBookings,
    int? cancelledBookings,
    int? completedBookings,
    int? noShowBookings,
    double? averageBookingDuration,
    String? $__typename,
  }) => _res;
}
