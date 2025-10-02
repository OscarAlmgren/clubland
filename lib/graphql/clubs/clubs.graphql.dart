import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Query$Clubs {
  Query$Clubs({required this.clubs, this.$__typename = 'Query'});

  factory Query$Clubs.fromJson(Map<String, dynamic> json) {
    final l$clubs = json['clubs'];
    final l$$__typename = json['__typename'];
    return Query$Clubs(
      clubs: (l$clubs as List<dynamic>)
          .map((e) => Query$Clubs$clubs.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Clubs$clubs> clubs;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$clubs = clubs;
    _resultData['clubs'] = l$clubs.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$clubs = clubs;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$clubs.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Clubs || runtimeType != other.runtimeType) {
      return false;
    }
    final l$clubs = clubs;
    final lOther$clubs = other.clubs;
    if (l$clubs.length != lOther$clubs.length) {
      return false;
    }
    for (int i = 0; i < l$clubs.length; i++) {
      final l$clubs$entry = l$clubs[i];
      final lOther$clubs$entry = lOther$clubs[i];
      if (l$clubs$entry != lOther$clubs$entry) {
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

extension UtilityExtension$Query$Clubs on Query$Clubs {
  CopyWith$Query$Clubs<Query$Clubs> get copyWith =>
      CopyWith$Query$Clubs(this, (i) => i);
}

abstract class CopyWith$Query$Clubs<TRes> {
  factory CopyWith$Query$Clubs(
    Query$Clubs instance,
    TRes Function(Query$Clubs) then,
  ) = _CopyWithImpl$Query$Clubs;

  factory CopyWith$Query$Clubs.stub(TRes res) = _CopyWithStubImpl$Query$Clubs;

  TRes call({List<Query$Clubs$clubs>? clubs, String? $__typename});
  TRes clubs(
    Iterable<Query$Clubs$clubs> Function(
      Iterable<CopyWith$Query$Clubs$clubs<Query$Clubs$clubs>>,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$Clubs<TRes> implements CopyWith$Query$Clubs<TRes> {
  _CopyWithImpl$Query$Clubs(this._instance, this._then);

  final Query$Clubs _instance;

  final TRes Function(Query$Clubs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? clubs = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$Clubs(
          clubs: clubs == _undefined || clubs == null
              ? _instance.clubs
              : (clubs as List<Query$Clubs$clubs>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes clubs(
    Iterable<Query$Clubs$clubs> Function(
      Iterable<CopyWith$Query$Clubs$clubs<Query$Clubs$clubs>>,
    )
    _fn,
  ) => call(
    clubs: _fn(
      _instance.clubs.map((e) => CopyWith$Query$Clubs$clubs(e, (i) => i)),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$Clubs<TRes>
    implements CopyWith$Query$Clubs<TRes> {
  _CopyWithStubImpl$Query$Clubs(this._res);

  TRes _res;

  call({List<Query$Clubs$clubs>? clubs, String? $__typename}) => _res;

  clubs(_fn) => _res;
}

const documentNodeQueryClubs = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Clubs'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'clubs'),
            alias: null,
            arguments: [],
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
                  name: NameNode(value: 'location'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'website'),
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
                  name: NameNode(value: 'settings'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'allowReciprocal'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'requireApproval'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'maxVisitsPerMonth'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'reciprocalFee'),
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
Query$Clubs _parserFn$Query$Clubs(Map<String, dynamic> data) =>
    Query$Clubs.fromJson(data);
typedef OnQueryComplete$Query$Clubs =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Clubs?);

class Options$Query$Clubs extends graphql.QueryOptions<Query$Clubs> {
  Options$Query$Clubs({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Clubs? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Clubs? onComplete,
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
                 data == null ? null : _parserFn$Query$Clubs(data),
               ),
         onError: onError,
         document: documentNodeQueryClubs,
         parserFn: _parserFn$Query$Clubs,
       );

  final OnQueryComplete$Query$Clubs? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Clubs extends graphql.WatchQueryOptions<Query$Clubs> {
  WatchOptions$Query$Clubs({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Clubs? typedOptimisticResult,
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
         document: documentNodeQueryClubs,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Clubs,
       );
}

class FetchMoreOptions$Query$Clubs extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Clubs({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryClubs);
}

extension ClientExtension$Query$Clubs on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Clubs>> query$Clubs([
    Options$Query$Clubs? options,
  ]) async => await this.query(options ?? Options$Query$Clubs());

  graphql.ObservableQuery<Query$Clubs> watchQuery$Clubs([
    WatchOptions$Query$Clubs? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$Clubs());

  void writeQuery$Clubs({required Query$Clubs data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryClubs),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );

  Query$Clubs? readQuery$Clubs({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryClubs),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Clubs.fromJson(result);
  }
}

class Query$Clubs$clubs {
  Query$Clubs$clubs({
    required this.id,
    required this.name,
    this.description,
    required this.location,
    this.website,
    required this.status,
    this.settings,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Club',
  });

  factory Query$Clubs$clubs.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$location = json['location'];
    final l$website = json['website'];
    final l$status = json['status'];
    final l$settings = json['settings'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$Clubs$clubs(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String?),
      location: (l$location as String),
      website: (l$website as String?),
      status: fromJson$Enum$ClubStatus((l$status as String)),
      settings: l$settings == null
          ? null
          : Query$Clubs$clubs$settings.fromJson(
              (l$settings as Map<String, dynamic>),
            ),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? description;

  final String location;

  final String? website;

  final Enum$ClubStatus status;

  final Query$Clubs$clubs$settings? settings;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$location = location;
    _resultData['location'] = l$location;
    final l$website = website;
    _resultData['website'] = l$website;
    final l$status = status;
    _resultData['status'] = toJson$Enum$ClubStatus(l$status);
    final l$settings = settings;
    _resultData['settings'] = l$settings?.toJson();
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
    final l$name = name;
    final l$description = description;
    final l$location = location;
    final l$website = website;
    final l$status = status;
    final l$settings = settings;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$location,
      l$website,
      l$status,
      l$settings,
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
    if (other is! Query$Clubs$clubs || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$website = website;
    final lOther$website = other.website;
    if (l$website != lOther$website) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$settings = settings;
    final lOther$settings = other.settings;
    if (l$settings != lOther$settings) {
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

extension UtilityExtension$Query$Clubs$clubs on Query$Clubs$clubs {
  CopyWith$Query$Clubs$clubs<Query$Clubs$clubs> get copyWith =>
      CopyWith$Query$Clubs$clubs(this, (i) => i);
}

abstract class CopyWith$Query$Clubs$clubs<TRes> {
  factory CopyWith$Query$Clubs$clubs(
    Query$Clubs$clubs instance,
    TRes Function(Query$Clubs$clubs) then,
  ) = _CopyWithImpl$Query$Clubs$clubs;

  factory CopyWith$Query$Clubs$clubs.stub(TRes res) =
      _CopyWithStubImpl$Query$Clubs$clubs;

  TRes call({
    String? id,
    String? name,
    String? description,
    String? location,
    String? website,
    Enum$ClubStatus? status,
    Query$Clubs$clubs$settings? settings,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
  CopyWith$Query$Clubs$clubs$settings<TRes> get settings;
}

class _CopyWithImpl$Query$Clubs$clubs<TRes>
    implements CopyWith$Query$Clubs$clubs<TRes> {
  _CopyWithImpl$Query$Clubs$clubs(this._instance, this._then);

  final Query$Clubs$clubs _instance;

  final TRes Function(Query$Clubs$clubs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? location = _undefined,
    Object? website = _undefined,
    Object? status = _undefined,
    Object? settings = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Clubs$clubs(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      location: location == _undefined || location == null
          ? _instance.location
          : (location as String),
      website: website == _undefined ? _instance.website : (website as String?),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$ClubStatus),
      settings: settings == _undefined
          ? _instance.settings
          : (settings as Query$Clubs$clubs$settings?),
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

  CopyWith$Query$Clubs$clubs$settings<TRes> get settings {
    final local$settings = _instance.settings;
    return local$settings == null
        ? CopyWith$Query$Clubs$clubs$settings.stub(_then(_instance))
        : CopyWith$Query$Clubs$clubs$settings(
            local$settings,
            (e) => call(settings: e),
          );
  }
}

class _CopyWithStubImpl$Query$Clubs$clubs<TRes>
    implements CopyWith$Query$Clubs$clubs<TRes> {
  _CopyWithStubImpl$Query$Clubs$clubs(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    String? location,
    String? website,
    Enum$ClubStatus? status,
    Query$Clubs$clubs$settings? settings,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Clubs$clubs$settings<TRes> get settings =>
      CopyWith$Query$Clubs$clubs$settings.stub(_res);
}

class Query$Clubs$clubs$settings {
  Query$Clubs$clubs$settings({
    required this.allowReciprocal,
    required this.requireApproval,
    required this.maxVisitsPerMonth,
    this.reciprocalFee,
    this.$__typename = 'ClubSettings',
  });

  factory Query$Clubs$clubs$settings.fromJson(Map<String, dynamic> json) {
    final l$allowReciprocal = json['allowReciprocal'];
    final l$requireApproval = json['requireApproval'];
    final l$maxVisitsPerMonth = json['maxVisitsPerMonth'];
    final l$reciprocalFee = json['reciprocalFee'];
    final l$$__typename = json['__typename'];
    return Query$Clubs$clubs$settings(
      allowReciprocal: (l$allowReciprocal as bool),
      requireApproval: (l$requireApproval as bool),
      maxVisitsPerMonth: (l$maxVisitsPerMonth as int),
      reciprocalFee: (l$reciprocalFee as num?)?.toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final bool allowReciprocal;

  final bool requireApproval;

  final int maxVisitsPerMonth;

  final double? reciprocalFee;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$allowReciprocal = allowReciprocal;
    _resultData['allowReciprocal'] = l$allowReciprocal;
    final l$requireApproval = requireApproval;
    _resultData['requireApproval'] = l$requireApproval;
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    _resultData['maxVisitsPerMonth'] = l$maxVisitsPerMonth;
    final l$reciprocalFee = reciprocalFee;
    _resultData['reciprocalFee'] = l$reciprocalFee;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$allowReciprocal = allowReciprocal;
    final l$requireApproval = requireApproval;
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    final l$reciprocalFee = reciprocalFee;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$allowReciprocal,
      l$requireApproval,
      l$maxVisitsPerMonth,
      l$reciprocalFee,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Clubs$clubs$settings ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$allowReciprocal = allowReciprocal;
    final lOther$allowReciprocal = other.allowReciprocal;
    if (l$allowReciprocal != lOther$allowReciprocal) {
      return false;
    }
    final l$requireApproval = requireApproval;
    final lOther$requireApproval = other.requireApproval;
    if (l$requireApproval != lOther$requireApproval) {
      return false;
    }
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    final lOther$maxVisitsPerMonth = other.maxVisitsPerMonth;
    if (l$maxVisitsPerMonth != lOther$maxVisitsPerMonth) {
      return false;
    }
    final l$reciprocalFee = reciprocalFee;
    final lOther$reciprocalFee = other.reciprocalFee;
    if (l$reciprocalFee != lOther$reciprocalFee) {
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

extension UtilityExtension$Query$Clubs$clubs$settings
    on Query$Clubs$clubs$settings {
  CopyWith$Query$Clubs$clubs$settings<Query$Clubs$clubs$settings>
  get copyWith => CopyWith$Query$Clubs$clubs$settings(this, (i) => i);
}

abstract class CopyWith$Query$Clubs$clubs$settings<TRes> {
  factory CopyWith$Query$Clubs$clubs$settings(
    Query$Clubs$clubs$settings instance,
    TRes Function(Query$Clubs$clubs$settings) then,
  ) = _CopyWithImpl$Query$Clubs$clubs$settings;

  factory CopyWith$Query$Clubs$clubs$settings.stub(TRes res) =
      _CopyWithStubImpl$Query$Clubs$clubs$settings;

  TRes call({
    bool? allowReciprocal,
    bool? requireApproval,
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Clubs$clubs$settings<TRes>
    implements CopyWith$Query$Clubs$clubs$settings<TRes> {
  _CopyWithImpl$Query$Clubs$clubs$settings(this._instance, this._then);

  final Query$Clubs$clubs$settings _instance;

  final TRes Function(Query$Clubs$clubs$settings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? allowReciprocal = _undefined,
    Object? requireApproval = _undefined,
    Object? maxVisitsPerMonth = _undefined,
    Object? reciprocalFee = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Clubs$clubs$settings(
      allowReciprocal: allowReciprocal == _undefined || allowReciprocal == null
          ? _instance.allowReciprocal
          : (allowReciprocal as bool),
      requireApproval: requireApproval == _undefined || requireApproval == null
          ? _instance.requireApproval
          : (requireApproval as bool),
      maxVisitsPerMonth:
          maxVisitsPerMonth == _undefined || maxVisitsPerMonth == null
          ? _instance.maxVisitsPerMonth
          : (maxVisitsPerMonth as int),
      reciprocalFee: reciprocalFee == _undefined
          ? _instance.reciprocalFee
          : (reciprocalFee as double?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Clubs$clubs$settings<TRes>
    implements CopyWith$Query$Clubs$clubs$settings<TRes> {
  _CopyWithStubImpl$Query$Clubs$clubs$settings(this._res);

  TRes _res;

  call({
    bool? allowReciprocal,
    bool? requireApproval,
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    String? $__typename,
  }) => _res;
}
