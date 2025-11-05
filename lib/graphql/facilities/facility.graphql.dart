import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Facility {
  factory Variables$Query$Facility({required String id}) =>
      Variables$Query$Facility._({r'id': id});

  Variables$Query$Facility._(this._$data);

  factory Variables$Query$Facility.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$Facility._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$Facility<Variables$Query$Facility> get copyWith =>
      CopyWith$Variables$Query$Facility(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Facility ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$Facility<TRes> {
  factory CopyWith$Variables$Query$Facility(
    Variables$Query$Facility instance,
    TRes Function(Variables$Query$Facility) then,
  ) = _CopyWithImpl$Variables$Query$Facility;

  factory CopyWith$Variables$Query$Facility.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Facility;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$Facility<TRes>
    implements CopyWith$Variables$Query$Facility<TRes> {
  _CopyWithImpl$Variables$Query$Facility(this._instance, this._then);

  final Variables$Query$Facility _instance;

  final TRes Function(Variables$Query$Facility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$Facility._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$Facility<TRes>
    implements CopyWith$Variables$Query$Facility<TRes> {
  _CopyWithStubImpl$Variables$Query$Facility(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$Facility {
  Query$Facility({this.facility, this.$__typename = 'Query'});

  factory Query$Facility.fromJson(Map<String, dynamic> json) {
    final l$facility = json['facility'];
    final l$$__typename = json['__typename'];
    return Query$Facility(
      facility: l$facility == null
          ? null
          : Query$Facility$facility.fromJson(
              (l$facility as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Facility$facility? facility;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$facility = facility;
    _resultData['facility'] = l$facility?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$facility = facility;
    final l$$__typename = $__typename;
    return Object.hashAll([l$facility, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Facility || runtimeType != other.runtimeType) {
      return false;
    }
    final l$facility = facility;
    final lOther$facility = other.facility;
    if (l$facility != lOther$facility) {
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

extension UtilityExtension$Query$Facility on Query$Facility {
  CopyWith$Query$Facility<Query$Facility> get copyWith =>
      CopyWith$Query$Facility(this, (i) => i);
}

abstract class CopyWith$Query$Facility<TRes> {
  factory CopyWith$Query$Facility(
    Query$Facility instance,
    TRes Function(Query$Facility) then,
  ) = _CopyWithImpl$Query$Facility;

  factory CopyWith$Query$Facility.stub(TRes res) =
      _CopyWithStubImpl$Query$Facility;

  TRes call({Query$Facility$facility? facility, String? $__typename});
  CopyWith$Query$Facility$facility<TRes> get facility;
}

class _CopyWithImpl$Query$Facility<TRes>
    implements CopyWith$Query$Facility<TRes> {
  _CopyWithImpl$Query$Facility(this._instance, this._then);

  final Query$Facility _instance;

  final TRes Function(Query$Facility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? facility = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Facility(
      facility: facility == _undefined
          ? _instance.facility
          : (facility as Query$Facility$facility?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Facility$facility<TRes> get facility {
    final local$facility = _instance.facility;
    return local$facility == null
        ? CopyWith$Query$Facility$facility.stub(_then(_instance))
        : CopyWith$Query$Facility$facility(
            local$facility,
            (e) => call(facility: e),
          );
  }
}

class _CopyWithStubImpl$Query$Facility<TRes>
    implements CopyWith$Query$Facility<TRes> {
  _CopyWithStubImpl$Query$Facility(this._res);

  TRes _res;

  call({Query$Facility$facility? facility, String? $__typename}) => _res;

  CopyWith$Query$Facility$facility<TRes> get facility =>
      CopyWith$Query$Facility$facility.stub(_res);
}

const documentNodeQueryFacility = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Facility'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'facility'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
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
                  name: NameNode(value: 'clubId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'description'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'type'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'capacity'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'amenities'),
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
                  name: NameNode(value: 'minBookingDuration'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'maxBookingDuration'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'advanceBookingDays'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cancellationDeadline'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'operatingHours'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'createdAt'),
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
Query$Facility _parserFn$Query$Facility(Map<String, dynamic> data) =>
    Query$Facility.fromJson(data);
typedef OnQueryComplete$Query$Facility =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Facility?);

class Options$Query$Facility extends graphql.QueryOptions<Query$Facility> {
  Options$Query$Facility({
    String? operationName,
    required Variables$Query$Facility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Facility? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Facility? onComplete,
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
                 data == null ? null : _parserFn$Query$Facility(data),
               ),
         onError: onError,
         document: documentNodeQueryFacility,
         parserFn: _parserFn$Query$Facility,
       );

  final OnQueryComplete$Query$Facility? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Facility
    extends graphql.WatchQueryOptions<Query$Facility> {
  WatchOptions$Query$Facility({
    String? operationName,
    required Variables$Query$Facility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Facility? typedOptimisticResult,
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
         document: documentNodeQueryFacility,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Facility,
       );
}

class FetchMoreOptions$Query$Facility extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Facility({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$Facility variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryFacility,
       );
}

extension ClientExtension$Query$Facility on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Facility>> query$Facility(
    Options$Query$Facility options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$Facility> watchQuery$Facility(
    WatchOptions$Query$Facility options,
  ) => this.watchQuery(options);

  void writeQuery$Facility({
    required Query$Facility data,
    required Variables$Query$Facility variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryFacility),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$Facility? readQuery$Facility({
    required Variables$Query$Facility variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryFacility),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Facility.fromJson(result);
  }
}

class Query$Facility$facility {
  Query$Facility$facility({
    required this.id,
    required this.clubId,
    required this.name,
    this.description,
    required this.type,
    required this.capacity,
    required this.amenities,
    required this.status,
    required this.minBookingDuration,
    required this.maxBookingDuration,
    required this.advanceBookingDays,
    required this.cancellationDeadline,
    this.operatingHours,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Facility',
  });

  factory Query$Facility$facility.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$type = json['type'];
    final l$capacity = json['capacity'];
    final l$amenities = json['amenities'];
    final l$status = json['status'];
    final l$minBookingDuration = json['minBookingDuration'];
    final l$maxBookingDuration = json['maxBookingDuration'];
    final l$advanceBookingDays = json['advanceBookingDays'];
    final l$cancellationDeadline = json['cancellationDeadline'];
    final l$operatingHours = json['operatingHours'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$Facility$facility(
      id: (l$id as String),
      clubId: (l$clubId as String),
      name: (l$name as String),
      description: (l$description as String?),
      type: (l$type as String),
      capacity: (l$capacity as int),
      amenities: (l$amenities as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      status: fromJson$Enum$FacilityStatus((l$status as String)),
      minBookingDuration: (l$minBookingDuration as int),
      maxBookingDuration: (l$maxBookingDuration as int),
      advanceBookingDays: (l$advanceBookingDays as int),
      cancellationDeadline: (l$cancellationDeadline as int),
      operatingHours: (l$operatingHours as String?),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String name;

  final String? description;

  final String type;

  final int capacity;

  final List<String> amenities;

  final Enum$FacilityStatus status;

  final int minBookingDuration;

  final int maxBookingDuration;

  final int advanceBookingDays;

  final int cancellationDeadline;

  final String? operatingHours;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$type = type;
    _resultData['type'] = l$type;
    final l$capacity = capacity;
    _resultData['capacity'] = l$capacity;
    final l$amenities = amenities;
    _resultData['amenities'] = l$amenities.map((e) => e).toList();
    final l$status = status;
    _resultData['status'] = toJson$Enum$FacilityStatus(l$status);
    final l$minBookingDuration = minBookingDuration;
    _resultData['minBookingDuration'] = l$minBookingDuration;
    final l$maxBookingDuration = maxBookingDuration;
    _resultData['maxBookingDuration'] = l$maxBookingDuration;
    final l$advanceBookingDays = advanceBookingDays;
    _resultData['advanceBookingDays'] = l$advanceBookingDays;
    final l$cancellationDeadline = cancellationDeadline;
    _resultData['cancellationDeadline'] = l$cancellationDeadline;
    final l$operatingHours = operatingHours;
    _resultData['operatingHours'] = l$operatingHours;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clubId = clubId;
    final l$name = name;
    final l$description = description;
    final l$type = type;
    final l$capacity = capacity;
    final l$amenities = amenities;
    final l$status = status;
    final l$minBookingDuration = minBookingDuration;
    final l$maxBookingDuration = maxBookingDuration;
    final l$advanceBookingDays = advanceBookingDays;
    final l$cancellationDeadline = cancellationDeadline;
    final l$operatingHours = operatingHours;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$name,
      l$description,
      l$type,
      l$capacity,
      Object.hashAll(l$amenities.map((v) => v)),
      l$status,
      l$minBookingDuration,
      l$maxBookingDuration,
      l$advanceBookingDays,
      l$cancellationDeadline,
      l$operatingHours,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Facility$facility || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clubId = clubId;
    final lOther$clubId = other.clubId;
    if (l$clubId != lOther$clubId) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$capacity = capacity;
    final lOther$capacity = other.capacity;
    if (l$capacity != lOther$capacity) {
      return false;
    }
    final l$amenities = amenities;
    final lOther$amenities = other.amenities;
    if (l$amenities.length != lOther$amenities.length) {
      return false;
    }
    for (int i = 0; i < l$amenities.length; i++) {
      final l$amenities$entry = l$amenities[i];
      final lOther$amenities$entry = lOther$amenities[i];
      if (l$amenities$entry != lOther$amenities$entry) {
        return false;
      }
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$minBookingDuration = minBookingDuration;
    final lOther$minBookingDuration = other.minBookingDuration;
    if (l$minBookingDuration != lOther$minBookingDuration) {
      return false;
    }
    final l$maxBookingDuration = maxBookingDuration;
    final lOther$maxBookingDuration = other.maxBookingDuration;
    if (l$maxBookingDuration != lOther$maxBookingDuration) {
      return false;
    }
    final l$advanceBookingDays = advanceBookingDays;
    final lOther$advanceBookingDays = other.advanceBookingDays;
    if (l$advanceBookingDays != lOther$advanceBookingDays) {
      return false;
    }
    final l$cancellationDeadline = cancellationDeadline;
    final lOther$cancellationDeadline = other.cancellationDeadline;
    if (l$cancellationDeadline != lOther$cancellationDeadline) {
      return false;
    }
    final l$operatingHours = operatingHours;
    final lOther$operatingHours = other.operatingHours;
    if (l$operatingHours != lOther$operatingHours) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

extension UtilityExtension$Query$Facility$facility on Query$Facility$facility {
  CopyWith$Query$Facility$facility<Query$Facility$facility> get copyWith =>
      CopyWith$Query$Facility$facility(this, (i) => i);
}

abstract class CopyWith$Query$Facility$facility<TRes> {
  factory CopyWith$Query$Facility$facility(
    Query$Facility$facility instance,
    TRes Function(Query$Facility$facility) then,
  ) = _CopyWithImpl$Query$Facility$facility;

  factory CopyWith$Query$Facility$facility.stub(TRes res) =
      _CopyWithStubImpl$Query$Facility$facility;

  TRes call({
    String? id,
    String? clubId,
    String? name,
    String? description,
    String? type,
    int? capacity,
    List<String>? amenities,
    Enum$FacilityStatus? status,
    int? minBookingDuration,
    int? maxBookingDuration,
    int? advanceBookingDays,
    int? cancellationDeadline,
    String? operatingHours,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Facility$facility<TRes>
    implements CopyWith$Query$Facility$facility<TRes> {
  _CopyWithImpl$Query$Facility$facility(this._instance, this._then);

  final Query$Facility$facility _instance;

  final TRes Function(Query$Facility$facility) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? type = _undefined,
    Object? capacity = _undefined,
    Object? amenities = _undefined,
    Object? status = _undefined,
    Object? minBookingDuration = _undefined,
    Object? maxBookingDuration = _undefined,
    Object? advanceBookingDays = _undefined,
    Object? cancellationDeadline = _undefined,
    Object? operatingHours = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Facility$facility(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as String),
      capacity: capacity == _undefined || capacity == null
          ? _instance.capacity
          : (capacity as int),
      amenities: amenities == _undefined || amenities == null
          ? _instance.amenities
          : (amenities as List<String>),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$FacilityStatus),
      minBookingDuration:
          minBookingDuration == _undefined || minBookingDuration == null
          ? _instance.minBookingDuration
          : (minBookingDuration as int),
      maxBookingDuration:
          maxBookingDuration == _undefined || maxBookingDuration == null
          ? _instance.maxBookingDuration
          : (maxBookingDuration as int),
      advanceBookingDays:
          advanceBookingDays == _undefined || advanceBookingDays == null
          ? _instance.advanceBookingDays
          : (advanceBookingDays as int),
      cancellationDeadline:
          cancellationDeadline == _undefined || cancellationDeadline == null
          ? _instance.cancellationDeadline
          : (cancellationDeadline as int),
      operatingHours: operatingHours == _undefined
          ? _instance.operatingHours
          : (operatingHours as String?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Facility$facility<TRes>
    implements CopyWith$Query$Facility$facility<TRes> {
  _CopyWithStubImpl$Query$Facility$facility(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? name,
    String? description,
    String? type,
    int? capacity,
    List<String>? amenities,
    Enum$FacilityStatus? status,
    int? minBookingDuration,
    int? maxBookingDuration,
    int? advanceBookingDays,
    int? cancellationDeadline,
    String? operatingHours,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;
}
