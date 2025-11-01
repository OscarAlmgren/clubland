import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$AvailableSlots {
  factory Variables$Query$AvailableSlots({
    required String facilityId,
    required DateTime date,
    required int slotDuration,
  }) => Variables$Query$AvailableSlots._({
    r'facilityId': facilityId,
    r'date': date,
    r'slotDuration': slotDuration,
  });

  Variables$Query$AvailableSlots._(this._$data);

  factory Variables$Query$AvailableSlots.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$facilityId = data['facilityId'];
    result$data['facilityId'] = (l$facilityId as String);
    final l$date = data['date'];
    result$data['date'] = DateTime.parse((l$date as String));
    final l$slotDuration = data['slotDuration'];
    result$data['slotDuration'] = (l$slotDuration as int);
    return Variables$Query$AvailableSlots._(result$data);
  }

  Map<String, dynamic> _$data;

  String get facilityId => (_$data['facilityId'] as String);

  DateTime get date => (_$data['date'] as DateTime);

  int get slotDuration => (_$data['slotDuration'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$facilityId = facilityId;
    result$data['facilityId'] = l$facilityId;
    final l$date = date;
    result$data['date'] = l$date.toIso8601String();
    final l$slotDuration = slotDuration;
    result$data['slotDuration'] = l$slotDuration;
    return result$data;
  }

  CopyWith$Variables$Query$AvailableSlots<Variables$Query$AvailableSlots>
  get copyWith => CopyWith$Variables$Query$AvailableSlots(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$AvailableSlots ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$facilityId = facilityId;
    final lOther$facilityId = other.facilityId;
    if (l$facilityId != lOther$facilityId) {
      return false;
    }
    final l$date = date;
    final lOther$date = other.date;
    if (l$date != lOther$date) {
      return false;
    }
    final l$slotDuration = slotDuration;
    final lOther$slotDuration = other.slotDuration;
    if (l$slotDuration != lOther$slotDuration) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$facilityId = facilityId;
    final l$date = date;
    final l$slotDuration = slotDuration;
    return Object.hashAll([l$facilityId, l$date, l$slotDuration]);
  }
}

abstract class CopyWith$Variables$Query$AvailableSlots<TRes> {
  factory CopyWith$Variables$Query$AvailableSlots(
    Variables$Query$AvailableSlots instance,
    TRes Function(Variables$Query$AvailableSlots) then,
  ) = _CopyWithImpl$Variables$Query$AvailableSlots;

  factory CopyWith$Variables$Query$AvailableSlots.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$AvailableSlots;

  TRes call({String? facilityId, DateTime? date, int? slotDuration});
}

class _CopyWithImpl$Variables$Query$AvailableSlots<TRes>
    implements CopyWith$Variables$Query$AvailableSlots<TRes> {
  _CopyWithImpl$Variables$Query$AvailableSlots(this._instance, this._then);

  final Variables$Query$AvailableSlots _instance;

  final TRes Function(Variables$Query$AvailableSlots) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? facilityId = _undefined,
    Object? date = _undefined,
    Object? slotDuration = _undefined,
  }) => _then(
    Variables$Query$AvailableSlots._({
      ..._instance._$data,
      if (facilityId != _undefined && facilityId != null)
        'facilityId': (facilityId as String),
      if (date != _undefined && date != null) 'date': (date as DateTime),
      if (slotDuration != _undefined && slotDuration != null)
        'slotDuration': (slotDuration as int),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$AvailableSlots<TRes>
    implements CopyWith$Variables$Query$AvailableSlots<TRes> {
  _CopyWithStubImpl$Variables$Query$AvailableSlots(this._res);

  TRes _res;

  call({String? facilityId, DateTime? date, int? slotDuration}) => _res;
}

class Query$AvailableSlots {
  Query$AvailableSlots({
    required this.availableSlots,
    this.$__typename = 'Query',
  });

  factory Query$AvailableSlots.fromJson(Map<String, dynamic> json) {
    final l$availableSlots = json['availableSlots'];
    final l$$__typename = json['__typename'];
    return Query$AvailableSlots(
      availableSlots: (l$availableSlots as List<dynamic>)
          .map(
            (e) => Query$AvailableSlots$availableSlots.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$AvailableSlots$availableSlots> availableSlots;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$availableSlots = availableSlots;
    _resultData['availableSlots'] = l$availableSlots
        .map((e) => e.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$availableSlots = availableSlots;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$availableSlots.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$AvailableSlots || runtimeType != other.runtimeType) {
      return false;
    }
    final l$availableSlots = availableSlots;
    final lOther$availableSlots = other.availableSlots;
    if (l$availableSlots.length != lOther$availableSlots.length) {
      return false;
    }
    for (int i = 0; i < l$availableSlots.length; i++) {
      final l$availableSlots$entry = l$availableSlots[i];
      final lOther$availableSlots$entry = lOther$availableSlots[i];
      if (l$availableSlots$entry != lOther$availableSlots$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$AvailableSlots on Query$AvailableSlots {
  CopyWith$Query$AvailableSlots<Query$AvailableSlots> get copyWith =>
      CopyWith$Query$AvailableSlots(this, (i) => i);
}

abstract class CopyWith$Query$AvailableSlots<TRes> {
  factory CopyWith$Query$AvailableSlots(
    Query$AvailableSlots instance,
    TRes Function(Query$AvailableSlots) then,
  ) = _CopyWithImpl$Query$AvailableSlots;

  factory CopyWith$Query$AvailableSlots.stub(TRes res) =
      _CopyWithStubImpl$Query$AvailableSlots;

  TRes call({
    List<Query$AvailableSlots$availableSlots>? availableSlots,
    String? $__typename,
  });
  TRes availableSlots(
    Iterable<Query$AvailableSlots$availableSlots> Function(
      Iterable<
        CopyWith$Query$AvailableSlots$availableSlots<
          Query$AvailableSlots$availableSlots
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$AvailableSlots<TRes>
    implements CopyWith$Query$AvailableSlots<TRes> {
  _CopyWithImpl$Query$AvailableSlots(this._instance, this._then);

  final Query$AvailableSlots _instance;

  final TRes Function(Query$AvailableSlots) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? availableSlots = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$AvailableSlots(
      availableSlots: availableSlots == _undefined || availableSlots == null
          ? _instance.availableSlots
          : (availableSlots as List<Query$AvailableSlots$availableSlots>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes availableSlots(
    Iterable<Query$AvailableSlots$availableSlots> Function(
      Iterable<
        CopyWith$Query$AvailableSlots$availableSlots<
          Query$AvailableSlots$availableSlots
        >
      >,
    )
    _fn,
  ) => call(
    availableSlots: _fn(
      _instance.availableSlots.map(
        (e) => CopyWith$Query$AvailableSlots$availableSlots(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$AvailableSlots<TRes>
    implements CopyWith$Query$AvailableSlots<TRes> {
  _CopyWithStubImpl$Query$AvailableSlots(this._res);

  TRes _res;

  call({
    List<Query$AvailableSlots$availableSlots>? availableSlots,
    String? $__typename,
  }) => _res;

  availableSlots(_fn) => _res;
}

const documentNodeQueryAvailableSlots = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'AvailableSlots'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'facilityId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'date')),
          type: NamedTypeNode(name: NameNode(value: 'Time'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'slotDuration')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'availableSlots'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'facilityId'),
                value: VariableNode(name: NameNode(value: 'facilityId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'date'),
                value: VariableNode(name: NameNode(value: 'date')),
              ),
              ArgumentNode(
                name: NameNode(value: 'slotDuration'),
                value: VariableNode(name: NameNode(value: 'slotDuration')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
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
                  name: NameNode(value: 'available'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'reason'),
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
Query$AvailableSlots _parserFn$Query$AvailableSlots(
  Map<String, dynamic> data,
) => Query$AvailableSlots.fromJson(data);
typedef OnQueryComplete$Query$AvailableSlots =
    FutureOr<void> Function(Map<String, dynamic>?, Query$AvailableSlots?);

class Options$Query$AvailableSlots
    extends graphql.QueryOptions<Query$AvailableSlots> {
  Options$Query$AvailableSlots({
    String? operationName,
    required Variables$Query$AvailableSlots variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$AvailableSlots? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$AvailableSlots? onComplete,
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
                 data == null ? null : _parserFn$Query$AvailableSlots(data),
               ),
         onError: onError,
         document: documentNodeQueryAvailableSlots,
         parserFn: _parserFn$Query$AvailableSlots,
       );

  final OnQueryComplete$Query$AvailableSlots? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$AvailableSlots
    extends graphql.WatchQueryOptions<Query$AvailableSlots> {
  WatchOptions$Query$AvailableSlots({
    String? operationName,
    required Variables$Query$AvailableSlots variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$AvailableSlots? typedOptimisticResult,
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
         document: documentNodeQueryAvailableSlots,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$AvailableSlots,
       );
}

class FetchMoreOptions$Query$AvailableSlots extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$AvailableSlots({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$AvailableSlots variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryAvailableSlots,
       );
}

extension ClientExtension$Query$AvailableSlots on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$AvailableSlots>> query$AvailableSlots(
    Options$Query$AvailableSlots options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$AvailableSlots> watchQuery$AvailableSlots(
    WatchOptions$Query$AvailableSlots options,
  ) => this.watchQuery(options);

  void writeQuery$AvailableSlots({
    required Query$AvailableSlots data,
    required Variables$Query$AvailableSlots variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryAvailableSlots),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$AvailableSlots? readQuery$AvailableSlots({
    required Variables$Query$AvailableSlots variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryAvailableSlots),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$AvailableSlots.fromJson(result);
  }
}

class Query$AvailableSlots$availableSlots {
  Query$AvailableSlots$availableSlots({
    required this.startTime,
    required this.endTime,
    required this.available,
    this.reason,
    this.$__typename = 'TimeSlot',
  });

  factory Query$AvailableSlots$availableSlots.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$available = json['available'];
    final l$reason = json['reason'];
    final l$$__typename = json['__typename'];
    return Query$AvailableSlots$availableSlots(
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      available: (l$available as bool),
      reason: (l$reason as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final DateTime startTime;

  final DateTime endTime;

  final bool available;

  final String? reason;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime.toIso8601String();
    final l$available = available;
    _resultData['available'] = l$available;
    final l$reason = reason;
    _resultData['reason'] = l$reason;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$available = available;
    final l$reason = reason;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$startTime,
      l$endTime,
      l$available,
      l$reason,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$AvailableSlots$availableSlots ||
        runtimeType != other.runtimeType) {
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
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
      return false;
    }
    final l$reason = reason;
    final lOther$reason = other.reason;
    if (l$reason != lOther$reason) {
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

extension UtilityExtension$Query$AvailableSlots$availableSlots
    on Query$AvailableSlots$availableSlots {
  CopyWith$Query$AvailableSlots$availableSlots<
    Query$AvailableSlots$availableSlots
  >
  get copyWith => CopyWith$Query$AvailableSlots$availableSlots(this, (i) => i);
}

abstract class CopyWith$Query$AvailableSlots$availableSlots<TRes> {
  factory CopyWith$Query$AvailableSlots$availableSlots(
    Query$AvailableSlots$availableSlots instance,
    TRes Function(Query$AvailableSlots$availableSlots) then,
  ) = _CopyWithImpl$Query$AvailableSlots$availableSlots;

  factory CopyWith$Query$AvailableSlots$availableSlots.stub(TRes res) =
      _CopyWithStubImpl$Query$AvailableSlots$availableSlots;

  TRes call({
    DateTime? startTime,
    DateTime? endTime,
    bool? available,
    String? reason,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$AvailableSlots$availableSlots<TRes>
    implements CopyWith$Query$AvailableSlots$availableSlots<TRes> {
  _CopyWithImpl$Query$AvailableSlots$availableSlots(this._instance, this._then);

  final Query$AvailableSlots$availableSlots _instance;

  final TRes Function(Query$AvailableSlots$availableSlots) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? available = _undefined,
    Object? reason = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$AvailableSlots$availableSlots(
      startTime: startTime == _undefined || startTime == null
          ? _instance.startTime
          : (startTime as DateTime),
      endTime: endTime == _undefined || endTime == null
          ? _instance.endTime
          : (endTime as DateTime),
      available: available == _undefined || available == null
          ? _instance.available
          : (available as bool),
      reason: reason == _undefined ? _instance.reason : (reason as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$AvailableSlots$availableSlots<TRes>
    implements CopyWith$Query$AvailableSlots$availableSlots<TRes> {
  _CopyWithStubImpl$Query$AvailableSlots$availableSlots(this._res);

  TRes _res;

  call({
    DateTime? startTime,
    DateTime? endTime,
    bool? available,
    String? reason,
    String? $__typename,
  }) => _res;
}
