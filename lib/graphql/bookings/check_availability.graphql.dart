import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$CheckAvailability {
  factory Variables$Query$CheckAvailability({
    required String facilityId,
    required DateTime startTime,
    required DateTime endTime,
    String? excludeBookingId,
  }) => Variables$Query$CheckAvailability._({
    r'facilityId': facilityId,
    r'startTime': startTime,
    r'endTime': endTime,
    if (excludeBookingId != null) r'excludeBookingId': excludeBookingId,
  });

  Variables$Query$CheckAvailability._(this._$data);

  factory Variables$Query$CheckAvailability.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$facilityId = data['facilityId'];
    result$data['facilityId'] = (l$facilityId as String);
    final l$startTime = data['startTime'];
    result$data['startTime'] = DateTime.parse((l$startTime as String));
    final l$endTime = data['endTime'];
    result$data['endTime'] = DateTime.parse((l$endTime as String));
    if (data.containsKey('excludeBookingId')) {
      final l$excludeBookingId = data['excludeBookingId'];
      result$data['excludeBookingId'] = (l$excludeBookingId as String?);
    }
    return Variables$Query$CheckAvailability._(result$data);
  }

  Map<String, dynamic> _$data;

  String get facilityId => (_$data['facilityId'] as String);

  DateTime get startTime => (_$data['startTime'] as DateTime);

  DateTime get endTime => (_$data['endTime'] as DateTime);

  String? get excludeBookingId => (_$data['excludeBookingId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$facilityId = facilityId;
    result$data['facilityId'] = l$facilityId;
    final l$startTime = startTime;
    result$data['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    result$data['endTime'] = l$endTime.toIso8601String();
    if (_$data.containsKey('excludeBookingId')) {
      final l$excludeBookingId = excludeBookingId;
      result$data['excludeBookingId'] = l$excludeBookingId;
    }
    return result$data;
  }

  CopyWith$Variables$Query$CheckAvailability<Variables$Query$CheckAvailability>
  get copyWith => CopyWith$Variables$Query$CheckAvailability(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$CheckAvailability ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$facilityId = facilityId;
    final lOther$facilityId = other.facilityId;
    if (l$facilityId != lOther$facilityId) {
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
    final l$excludeBookingId = excludeBookingId;
    final lOther$excludeBookingId = other.excludeBookingId;
    if (_$data.containsKey('excludeBookingId') !=
        other._$data.containsKey('excludeBookingId')) {
      return false;
    }
    if (l$excludeBookingId != lOther$excludeBookingId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$facilityId = facilityId;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$excludeBookingId = excludeBookingId;
    return Object.hashAll([
      l$facilityId,
      l$startTime,
      l$endTime,
      _$data.containsKey('excludeBookingId') ? l$excludeBookingId : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$CheckAvailability<TRes> {
  factory CopyWith$Variables$Query$CheckAvailability(
    Variables$Query$CheckAvailability instance,
    TRes Function(Variables$Query$CheckAvailability) then,
  ) = _CopyWithImpl$Variables$Query$CheckAvailability;

  factory CopyWith$Variables$Query$CheckAvailability.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$CheckAvailability;

  TRes call({
    String? facilityId,
    DateTime? startTime,
    DateTime? endTime,
    String? excludeBookingId,
  });
}

class _CopyWithImpl$Variables$Query$CheckAvailability<TRes>
    implements CopyWith$Variables$Query$CheckAvailability<TRes> {
  _CopyWithImpl$Variables$Query$CheckAvailability(this._instance, this._then);

  final Variables$Query$CheckAvailability _instance;

  final TRes Function(Variables$Query$CheckAvailability) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? facilityId = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? excludeBookingId = _undefined,
  }) => _then(
    Variables$Query$CheckAvailability._({
      ..._instance._$data,
      if (facilityId != _undefined && facilityId != null)
        'facilityId': (facilityId as String),
      if (startTime != _undefined && startTime != null)
        'startTime': (startTime as DateTime),
      if (endTime != _undefined && endTime != null)
        'endTime': (endTime as DateTime),
      if (excludeBookingId != _undefined)
        'excludeBookingId': (excludeBookingId as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$CheckAvailability<TRes>
    implements CopyWith$Variables$Query$CheckAvailability<TRes> {
  _CopyWithStubImpl$Variables$Query$CheckAvailability(this._res);

  TRes _res;

  call({
    String? facilityId,
    DateTime? startTime,
    DateTime? endTime,
    String? excludeBookingId,
  }) => _res;
}

class Query$CheckAvailability {
  Query$CheckAvailability({
    required this.checkAvailability,
    this.$__typename = 'Query',
  });

  factory Query$CheckAvailability.fromJson(Map<String, dynamic> json) {
    final l$checkAvailability = json['checkAvailability'];
    final l$$__typename = json['__typename'];
    return Query$CheckAvailability(
      checkAvailability: (l$checkAvailability as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool checkAvailability;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$checkAvailability = checkAvailability;
    _resultData['checkAvailability'] = l$checkAvailability;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$checkAvailability = checkAvailability;
    final l$$__typename = $__typename;
    return Object.hashAll([l$checkAvailability, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$CheckAvailability || runtimeType != other.runtimeType) {
      return false;
    }
    final l$checkAvailability = checkAvailability;
    final lOther$checkAvailability = other.checkAvailability;
    if (l$checkAvailability != lOther$checkAvailability) {
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

extension UtilityExtension$Query$CheckAvailability on Query$CheckAvailability {
  CopyWith$Query$CheckAvailability<Query$CheckAvailability> get copyWith =>
      CopyWith$Query$CheckAvailability(this, (i) => i);
}

abstract class CopyWith$Query$CheckAvailability<TRes> {
  factory CopyWith$Query$CheckAvailability(
    Query$CheckAvailability instance,
    TRes Function(Query$CheckAvailability) then,
  ) = _CopyWithImpl$Query$CheckAvailability;

  factory CopyWith$Query$CheckAvailability.stub(TRes res) =
      _CopyWithStubImpl$Query$CheckAvailability;

  TRes call({bool? checkAvailability, String? $__typename});
}

class _CopyWithImpl$Query$CheckAvailability<TRes>
    implements CopyWith$Query$CheckAvailability<TRes> {
  _CopyWithImpl$Query$CheckAvailability(this._instance, this._then);

  final Query$CheckAvailability _instance;

  final TRes Function(Query$CheckAvailability) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? checkAvailability = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$CheckAvailability(
      checkAvailability:
          checkAvailability == _undefined || checkAvailability == null
          ? _instance.checkAvailability
          : (checkAvailability as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$CheckAvailability<TRes>
    implements CopyWith$Query$CheckAvailability<TRes> {
  _CopyWithStubImpl$Query$CheckAvailability(this._res);

  TRes _res;

  call({bool? checkAvailability, String? $__typename}) => _res;
}

const documentNodeQueryCheckAvailability = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'CheckAvailability'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'facilityId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'startTime')),
          type: NamedTypeNode(name: NameNode(value: 'Time'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'endTime')),
          type: NamedTypeNode(name: NameNode(value: 'Time'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'excludeBookingId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'checkAvailability'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'facilityId'),
                value: VariableNode(name: NameNode(value: 'facilityId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'startTime'),
                value: VariableNode(name: NameNode(value: 'startTime')),
              ),
              ArgumentNode(
                name: NameNode(value: 'endTime'),
                value: VariableNode(name: NameNode(value: 'endTime')),
              ),
              ArgumentNode(
                name: NameNode(value: 'excludeBookingId'),
                value: VariableNode(name: NameNode(value: 'excludeBookingId')),
              ),
            ],
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
  ],
);
Query$CheckAvailability _parserFn$Query$CheckAvailability(
  Map<String, dynamic> data,
) => Query$CheckAvailability.fromJson(data);
typedef OnQueryComplete$Query$CheckAvailability =
    FutureOr<void> Function(Map<String, dynamic>?, Query$CheckAvailability?);

class Options$Query$CheckAvailability
    extends graphql.QueryOptions<Query$CheckAvailability> {
  Options$Query$CheckAvailability({
    String? operationName,
    required Variables$Query$CheckAvailability variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$CheckAvailability? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$CheckAvailability? onComplete,
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
                 data == null ? null : _parserFn$Query$CheckAvailability(data),
               ),
         onError: onError,
         document: documentNodeQueryCheckAvailability,
         parserFn: _parserFn$Query$CheckAvailability,
       );

  final OnQueryComplete$Query$CheckAvailability? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$CheckAvailability
    extends graphql.WatchQueryOptions<Query$CheckAvailability> {
  WatchOptions$Query$CheckAvailability({
    String? operationName,
    required Variables$Query$CheckAvailability variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$CheckAvailability? typedOptimisticResult,
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
         document: documentNodeQueryCheckAvailability,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$CheckAvailability,
       );
}

class FetchMoreOptions$Query$CheckAvailability
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$CheckAvailability({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$CheckAvailability variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryCheckAvailability,
       );
}

extension ClientExtension$Query$CheckAvailability on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$CheckAvailability>> query$CheckAvailability(
    Options$Query$CheckAvailability options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$CheckAvailability> watchQuery$CheckAvailability(
    WatchOptions$Query$CheckAvailability options,
  ) => this.watchQuery(options);

  void writeQuery$CheckAvailability({
    required Query$CheckAvailability data,
    required Variables$Query$CheckAvailability variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryCheckAvailability,
      ),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$CheckAvailability? readQuery$CheckAvailability({
    required Variables$Query$CheckAvailability variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryCheckAvailability,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$CheckAvailability.fromJson(result);
  }
}
