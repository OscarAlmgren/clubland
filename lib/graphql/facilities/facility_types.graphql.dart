import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Query$FacilityTypes {
  Query$FacilityTypes({
    required this.facilityTypes,
    this.$__typename = 'Query',
  });

  factory Query$FacilityTypes.fromJson(Map<String, dynamic> json) {
    final l$facilityTypes = json['facilityTypes'];
    final l$$__typename = json['__typename'];
    return Query$FacilityTypes(
      facilityTypes: (l$facilityTypes as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<String> facilityTypes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$facilityTypes = facilityTypes;
    _resultData['facilityTypes'] = l$facilityTypes.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$facilityTypes = facilityTypes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$facilityTypes.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FacilityTypes || runtimeType != other.runtimeType) {
      return false;
    }
    final l$facilityTypes = facilityTypes;
    final lOther$facilityTypes = other.facilityTypes;
    if (l$facilityTypes.length != lOther$facilityTypes.length) {
      return false;
    }
    for (int i = 0; i < l$facilityTypes.length; i++) {
      final l$facilityTypes$entry = l$facilityTypes[i];
      final lOther$facilityTypes$entry = lOther$facilityTypes[i];
      if (l$facilityTypes$entry != lOther$facilityTypes$entry) {
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

extension UtilityExtension$Query$FacilityTypes on Query$FacilityTypes {
  CopyWith$Query$FacilityTypes<Query$FacilityTypes> get copyWith =>
      CopyWith$Query$FacilityTypes(this, (i) => i);
}

abstract class CopyWith$Query$FacilityTypes<TRes> {
  factory CopyWith$Query$FacilityTypes(
    Query$FacilityTypes instance,
    TRes Function(Query$FacilityTypes) then,
  ) = _CopyWithImpl$Query$FacilityTypes;

  factory CopyWith$Query$FacilityTypes.stub(TRes res) =
      _CopyWithStubImpl$Query$FacilityTypes;

  TRes call({List<String>? facilityTypes, String? $__typename});
}

class _CopyWithImpl$Query$FacilityTypes<TRes>
    implements CopyWith$Query$FacilityTypes<TRes> {
  _CopyWithImpl$Query$FacilityTypes(this._instance, this._then);

  final Query$FacilityTypes _instance;

  final TRes Function(Query$FacilityTypes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? facilityTypes = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FacilityTypes(
      facilityTypes: facilityTypes == _undefined || facilityTypes == null
          ? _instance.facilityTypes
          : (facilityTypes as List<String>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$FacilityTypes<TRes>
    implements CopyWith$Query$FacilityTypes<TRes> {
  _CopyWithStubImpl$Query$FacilityTypes(this._res);

  TRes _res;

  call({List<String>? facilityTypes, String? $__typename}) => _res;
}

const documentNodeQueryFacilityTypes = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'FacilityTypes'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'facilityTypes'),
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
  ],
);
Query$FacilityTypes _parserFn$Query$FacilityTypes(Map<String, dynamic> data) =>
    Query$FacilityTypes.fromJson(data);
typedef OnQueryComplete$Query$FacilityTypes =
    FutureOr<void> Function(Map<String, dynamic>?, Query$FacilityTypes?);

class Options$Query$FacilityTypes
    extends graphql.QueryOptions<Query$FacilityTypes> {
  Options$Query$FacilityTypes({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FacilityTypes? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$FacilityTypes? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
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
                 data == null ? null : _parserFn$Query$FacilityTypes(data),
               ),
         onError: onError,
         document: documentNodeQueryFacilityTypes,
         parserFn: _parserFn$Query$FacilityTypes,
       );

  final OnQueryComplete$Query$FacilityTypes? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$FacilityTypes
    extends graphql.WatchQueryOptions<Query$FacilityTypes> {
  WatchOptions$Query$FacilityTypes({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FacilityTypes? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryFacilityTypes,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$FacilityTypes,
       );
}

class FetchMoreOptions$Query$FacilityTypes extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$FacilityTypes({
    required graphql.UpdateQuery updateQuery,
  }) : super(
         updateQuery: updateQuery,
         document: documentNodeQueryFacilityTypes,
       );
}

extension ClientExtension$Query$FacilityTypes on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$FacilityTypes>> query$FacilityTypes([
    Options$Query$FacilityTypes? options,
  ]) async => await this.query(options ?? Options$Query$FacilityTypes());

  graphql.ObservableQuery<Query$FacilityTypes> watchQuery$FacilityTypes([
    WatchOptions$Query$FacilityTypes? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$FacilityTypes());

  void writeQuery$FacilityTypes({
    required Query$FacilityTypes data,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryFacilityTypes),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$FacilityTypes? readQuery$FacilityTypes({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryFacilityTypes),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$FacilityTypes.fromJson(result);
  }
}
