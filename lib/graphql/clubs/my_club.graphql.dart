import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Query$MyClub {
  Query$MyClub({this.myClub, this.$__typename = 'Query'});

  factory Query$MyClub.fromJson(Map<String, dynamic> json) {
    final l$myClub = json['myClub'];
    final l$$__typename = json['__typename'];
    return Query$MyClub(
      myClub: l$myClub == null
          ? null
          : Query$MyClub$myClub.fromJson((l$myClub as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MyClub$myClub? myClub;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myClub = myClub;
    _resultData['myClub'] = l$myClub?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myClub = myClub;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myClub, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyClub || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myClub = myClub;
    final lOther$myClub = other.myClub;
    if (l$myClub != lOther$myClub) {
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

extension UtilityExtension$Query$MyClub on Query$MyClub {
  CopyWith$Query$MyClub<Query$MyClub> get copyWith =>
      CopyWith$Query$MyClub(this, (i) => i);
}

abstract class CopyWith$Query$MyClub<TRes> {
  factory CopyWith$Query$MyClub(
    Query$MyClub instance,
    TRes Function(Query$MyClub) then,
  ) = _CopyWithImpl$Query$MyClub;

  factory CopyWith$Query$MyClub.stub(TRes res) = _CopyWithStubImpl$Query$MyClub;

  TRes call({Query$MyClub$myClub? myClub, String? $__typename});
  CopyWith$Query$MyClub$myClub<TRes> get myClub;
}

class _CopyWithImpl$Query$MyClub<TRes> implements CopyWith$Query$MyClub<TRes> {
  _CopyWithImpl$Query$MyClub(this._instance, this._then);

  final Query$MyClub _instance;

  final TRes Function(Query$MyClub) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? myClub = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$MyClub(
          myClub: myClub == _undefined
              ? _instance.myClub
              : (myClub as Query$MyClub$myClub?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$MyClub$myClub<TRes> get myClub {
    final local$myClub = _instance.myClub;
    return local$myClub == null
        ? CopyWith$Query$MyClub$myClub.stub(_then(_instance))
        : CopyWith$Query$MyClub$myClub(local$myClub, (e) => call(myClub: e));
  }
}

class _CopyWithStubImpl$Query$MyClub<TRes>
    implements CopyWith$Query$MyClub<TRes> {
  _CopyWithStubImpl$Query$MyClub(this._res);

  TRes _res;

  call({Query$MyClub$myClub? myClub, String? $__typename}) => _res;

  CopyWith$Query$MyClub$myClub<TRes> get myClub =>
      CopyWith$Query$MyClub$myClub.stub(_res);
}

const documentNodeQueryMyClub = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyClub'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'myClub'),
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
Query$MyClub _parserFn$Query$MyClub(Map<String, dynamic> data) =>
    Query$MyClub.fromJson(data);
typedef OnQueryComplete$Query$MyClub =
    FutureOr<void> Function(Map<String, dynamic>?, Query$MyClub?);

class Options$Query$MyClub extends graphql.QueryOptions<Query$MyClub> {
  Options$Query$MyClub({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MyClub? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$MyClub? onComplete,
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
                 data == null ? null : _parserFn$Query$MyClub(data),
               ),
         onError: onError,
         document: documentNodeQueryMyClub,
         parserFn: _parserFn$Query$MyClub,
       );

  final OnQueryComplete$Query$MyClub? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$MyClub
    extends graphql.WatchQueryOptions<Query$MyClub> {
  WatchOptions$Query$MyClub({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MyClub? typedOptimisticResult,
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
         document: documentNodeQueryMyClub,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$MyClub,
       );
}

class FetchMoreOptions$Query$MyClub extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$MyClub({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryMyClub);
}

extension ClientExtension$Query$MyClub on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$MyClub>> query$MyClub([
    Options$Query$MyClub? options,
  ]) async => await this.query(options ?? Options$Query$MyClub());

  graphql.ObservableQuery<Query$MyClub> watchQuery$MyClub([
    WatchOptions$Query$MyClub? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$MyClub());

  void writeQuery$MyClub({required Query$MyClub data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryMyClub),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );

  Query$MyClub? readQuery$MyClub({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMyClub),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$MyClub.fromJson(result);
  }
}

class Query$MyClub$myClub {
  Query$MyClub$myClub({
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

  factory Query$MyClub$myClub.fromJson(Map<String, dynamic> json) {
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
    return Query$MyClub$myClub(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String?),
      location: (l$location as String),
      website: (l$website as String?),
      status: fromJson$Enum$ClubStatus((l$status as String)),
      settings: l$settings == null
          ? null
          : Query$MyClub$myClub$settings.fromJson(
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

  final Query$MyClub$myClub$settings? settings;

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
    if (other is! Query$MyClub$myClub || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$MyClub$myClub on Query$MyClub$myClub {
  CopyWith$Query$MyClub$myClub<Query$MyClub$myClub> get copyWith =>
      CopyWith$Query$MyClub$myClub(this, (i) => i);
}

abstract class CopyWith$Query$MyClub$myClub<TRes> {
  factory CopyWith$Query$MyClub$myClub(
    Query$MyClub$myClub instance,
    TRes Function(Query$MyClub$myClub) then,
  ) = _CopyWithImpl$Query$MyClub$myClub;

  factory CopyWith$Query$MyClub$myClub.stub(TRes res) =
      _CopyWithStubImpl$Query$MyClub$myClub;

  TRes call({
    String? id,
    String? name,
    String? description,
    String? location,
    String? website,
    Enum$ClubStatus? status,
    Query$MyClub$myClub$settings? settings,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
  CopyWith$Query$MyClub$myClub$settings<TRes> get settings;
}

class _CopyWithImpl$Query$MyClub$myClub<TRes>
    implements CopyWith$Query$MyClub$myClub<TRes> {
  _CopyWithImpl$Query$MyClub$myClub(this._instance, this._then);

  final Query$MyClub$myClub _instance;

  final TRes Function(Query$MyClub$myClub) _then;

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
    Query$MyClub$myClub(
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
          : (settings as Query$MyClub$myClub$settings?),
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

  CopyWith$Query$MyClub$myClub$settings<TRes> get settings {
    final local$settings = _instance.settings;
    return local$settings == null
        ? CopyWith$Query$MyClub$myClub$settings.stub(_then(_instance))
        : CopyWith$Query$MyClub$myClub$settings(
            local$settings,
            (e) => call(settings: e),
          );
  }
}

class _CopyWithStubImpl$Query$MyClub$myClub<TRes>
    implements CopyWith$Query$MyClub$myClub<TRes> {
  _CopyWithStubImpl$Query$MyClub$myClub(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    String? location,
    String? website,
    Enum$ClubStatus? status,
    Query$MyClub$myClub$settings? settings,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$MyClub$myClub$settings<TRes> get settings =>
      CopyWith$Query$MyClub$myClub$settings.stub(_res);
}

class Query$MyClub$myClub$settings {
  Query$MyClub$myClub$settings({
    required this.allowReciprocal,
    required this.requireApproval,
    required this.maxVisitsPerMonth,
    this.reciprocalFee,
    this.$__typename = 'ClubSettings',
  });

  factory Query$MyClub$myClub$settings.fromJson(Map<String, dynamic> json) {
    final l$allowReciprocal = json['allowReciprocal'];
    final l$requireApproval = json['requireApproval'];
    final l$maxVisitsPerMonth = json['maxVisitsPerMonth'];
    final l$reciprocalFee = json['reciprocalFee'];
    final l$$__typename = json['__typename'];
    return Query$MyClub$myClub$settings(
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
    if (other is! Query$MyClub$myClub$settings ||
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

extension UtilityExtension$Query$MyClub$myClub$settings
    on Query$MyClub$myClub$settings {
  CopyWith$Query$MyClub$myClub$settings<Query$MyClub$myClub$settings>
  get copyWith => CopyWith$Query$MyClub$myClub$settings(this, (i) => i);
}

abstract class CopyWith$Query$MyClub$myClub$settings<TRes> {
  factory CopyWith$Query$MyClub$myClub$settings(
    Query$MyClub$myClub$settings instance,
    TRes Function(Query$MyClub$myClub$settings) then,
  ) = _CopyWithImpl$Query$MyClub$myClub$settings;

  factory CopyWith$Query$MyClub$myClub$settings.stub(TRes res) =
      _CopyWithStubImpl$Query$MyClub$myClub$settings;

  TRes call({
    bool? allowReciprocal,
    bool? requireApproval,
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MyClub$myClub$settings<TRes>
    implements CopyWith$Query$MyClub$myClub$settings<TRes> {
  _CopyWithImpl$Query$MyClub$myClub$settings(this._instance, this._then);

  final Query$MyClub$myClub$settings _instance;

  final TRes Function(Query$MyClub$myClub$settings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? allowReciprocal = _undefined,
    Object? requireApproval = _undefined,
    Object? maxVisitsPerMonth = _undefined,
    Object? reciprocalFee = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyClub$myClub$settings(
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

class _CopyWithStubImpl$Query$MyClub$myClub$settings<TRes>
    implements CopyWith$Query$MyClub$myClub$settings<TRes> {
  _CopyWithStubImpl$Query$MyClub$myClub$settings(this._res);

  TRes _res;

  call({
    bool? allowReciprocal,
    bool? requireApproval,
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    String? $__typename,
  }) => _res;
}
