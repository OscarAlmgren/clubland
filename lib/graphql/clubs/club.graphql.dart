import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Club {
  factory Variables$Query$Club({required String id}) =>
      Variables$Query$Club._({r'id': id});

  Variables$Query$Club._(this._$data);

  factory Variables$Query$Club.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$Club._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$Club<Variables$Query$Club> get copyWith =>
      CopyWith$Variables$Query$Club(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Club || runtimeType != other.runtimeType) {
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

abstract class CopyWith$Variables$Query$Club<TRes> {
  factory CopyWith$Variables$Query$Club(
    Variables$Query$Club instance,
    TRes Function(Variables$Query$Club) then,
  ) = _CopyWithImpl$Variables$Query$Club;

  factory CopyWith$Variables$Query$Club.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Club;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$Club<TRes>
    implements CopyWith$Variables$Query$Club<TRes> {
  _CopyWithImpl$Variables$Query$Club(this._instance, this._then);

  final Variables$Query$Club _instance;

  final TRes Function(Variables$Query$Club) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$Club._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$Club<TRes>
    implements CopyWith$Variables$Query$Club<TRes> {
  _CopyWithStubImpl$Variables$Query$Club(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$Club {
  Query$Club({this.club, this.$__typename = 'Query'});

  factory Query$Club.fromJson(Map<String, dynamic> json) {
    final l$club = json['club'];
    final l$$__typename = json['__typename'];
    return Query$Club(
      club: l$club == null
          ? null
          : Query$Club$club.fromJson((l$club as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Club$club? club;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$club = club;
    _resultData['club'] = l$club?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$club = club;
    final l$$__typename = $__typename;
    return Object.hashAll([l$club, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Club || runtimeType != other.runtimeType) {
      return false;
    }
    final l$club = club;
    final lOther$club = other.club;
    if (l$club != lOther$club) {
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

extension UtilityExtension$Query$Club on Query$Club {
  CopyWith$Query$Club<Query$Club> get copyWith =>
      CopyWith$Query$Club(this, (i) => i);
}

abstract class CopyWith$Query$Club<TRes> {
  factory CopyWith$Query$Club(
    Query$Club instance,
    TRes Function(Query$Club) then,
  ) = _CopyWithImpl$Query$Club;

  factory CopyWith$Query$Club.stub(TRes res) = _CopyWithStubImpl$Query$Club;

  TRes call({Query$Club$club? club, String? $__typename});
  CopyWith$Query$Club$club<TRes> get club;
}

class _CopyWithImpl$Query$Club<TRes> implements CopyWith$Query$Club<TRes> {
  _CopyWithImpl$Query$Club(this._instance, this._then);

  final Query$Club _instance;

  final TRes Function(Query$Club) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? club = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$Club(
          club: club == _undefined
              ? _instance.club
              : (club as Query$Club$club?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$Club$club<TRes> get club {
    final local$club = _instance.club;
    return local$club == null
        ? CopyWith$Query$Club$club.stub(_then(_instance))
        : CopyWith$Query$Club$club(local$club, (e) => call(club: e));
  }
}

class _CopyWithStubImpl$Query$Club<TRes> implements CopyWith$Query$Club<TRes> {
  _CopyWithStubImpl$Query$Club(this._res);

  TRes _res;

  call({Query$Club$club? club, String? $__typename}) => _res;

  CopyWith$Query$Club$club<TRes> get club =>
      CopyWith$Query$Club$club.stub(_res);
}

const documentNodeQueryClub = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Club'),
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
            name: NameNode(value: 'club'),
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
Query$Club _parserFn$Query$Club(Map<String, dynamic> data) =>
    Query$Club.fromJson(data);
typedef OnQueryComplete$Query$Club =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Club?);

class Options$Query$Club extends graphql.QueryOptions<Query$Club> {
  Options$Query$Club({
    String? operationName,
    required Variables$Query$Club variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Club? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Club? onComplete,
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
                 data == null ? null : _parserFn$Query$Club(data),
               ),
         onError: onError,
         document: documentNodeQueryClub,
         parserFn: _parserFn$Query$Club,
       );

  final OnQueryComplete$Query$Club? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Club extends graphql.WatchQueryOptions<Query$Club> {
  WatchOptions$Query$Club({
    String? operationName,
    required Variables$Query$Club variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Club? typedOptimisticResult,
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
         document: documentNodeQueryClub,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Club,
       );
}

class FetchMoreOptions$Query$Club extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Club({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$Club variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryClub,
       );
}

extension ClientExtension$Query$Club on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Club>> query$Club(
    Options$Query$Club options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$Club> watchQuery$Club(
    WatchOptions$Query$Club options,
  ) => this.watchQuery(options);

  void writeQuery$Club({
    required Query$Club data,
    required Variables$Query$Club variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryClub),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$Club? readQuery$Club({
    required Variables$Query$Club variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryClub),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Club.fromJson(result);
  }
}

class Query$Club$club {
  Query$Club$club({
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

  factory Query$Club$club.fromJson(Map<String, dynamic> json) {
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
    return Query$Club$club(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String?),
      location: (l$location as String),
      website: (l$website as String?),
      status: fromJson$Enum$ClubStatus((l$status as String)),
      settings: l$settings == null
          ? null
          : Query$Club$club$settings.fromJson(
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

  final Query$Club$club$settings? settings;

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
    if (other is! Query$Club$club || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Club$club on Query$Club$club {
  CopyWith$Query$Club$club<Query$Club$club> get copyWith =>
      CopyWith$Query$Club$club(this, (i) => i);
}

abstract class CopyWith$Query$Club$club<TRes> {
  factory CopyWith$Query$Club$club(
    Query$Club$club instance,
    TRes Function(Query$Club$club) then,
  ) = _CopyWithImpl$Query$Club$club;

  factory CopyWith$Query$Club$club.stub(TRes res) =
      _CopyWithStubImpl$Query$Club$club;

  TRes call({
    String? id,
    String? name,
    String? description,
    String? location,
    String? website,
    Enum$ClubStatus? status,
    Query$Club$club$settings? settings,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
  CopyWith$Query$Club$club$settings<TRes> get settings;
}

class _CopyWithImpl$Query$Club$club<TRes>
    implements CopyWith$Query$Club$club<TRes> {
  _CopyWithImpl$Query$Club$club(this._instance, this._then);

  final Query$Club$club _instance;

  final TRes Function(Query$Club$club) _then;

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
    Query$Club$club(
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
          : (settings as Query$Club$club$settings?),
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

  CopyWith$Query$Club$club$settings<TRes> get settings {
    final local$settings = _instance.settings;
    return local$settings == null
        ? CopyWith$Query$Club$club$settings.stub(_then(_instance))
        : CopyWith$Query$Club$club$settings(
            local$settings,
            (e) => call(settings: e),
          );
  }
}

class _CopyWithStubImpl$Query$Club$club<TRes>
    implements CopyWith$Query$Club$club<TRes> {
  _CopyWithStubImpl$Query$Club$club(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    String? location,
    String? website,
    Enum$ClubStatus? status,
    Query$Club$club$settings? settings,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Club$club$settings<TRes> get settings =>
      CopyWith$Query$Club$club$settings.stub(_res);
}

class Query$Club$club$settings {
  Query$Club$club$settings({
    required this.allowReciprocal,
    required this.requireApproval,
    required this.maxVisitsPerMonth,
    this.reciprocalFee,
    this.$__typename = 'ClubSettings',
  });

  factory Query$Club$club$settings.fromJson(Map<String, dynamic> json) {
    final l$allowReciprocal = json['allowReciprocal'];
    final l$requireApproval = json['requireApproval'];
    final l$maxVisitsPerMonth = json['maxVisitsPerMonth'];
    final l$reciprocalFee = json['reciprocalFee'];
    final l$$__typename = json['__typename'];
    return Query$Club$club$settings(
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
    if (other is! Query$Club$club$settings ||
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

extension UtilityExtension$Query$Club$club$settings
    on Query$Club$club$settings {
  CopyWith$Query$Club$club$settings<Query$Club$club$settings> get copyWith =>
      CopyWith$Query$Club$club$settings(this, (i) => i);
}

abstract class CopyWith$Query$Club$club$settings<TRes> {
  factory CopyWith$Query$Club$club$settings(
    Query$Club$club$settings instance,
    TRes Function(Query$Club$club$settings) then,
  ) = _CopyWithImpl$Query$Club$club$settings;

  factory CopyWith$Query$Club$club$settings.stub(TRes res) =
      _CopyWithStubImpl$Query$Club$club$settings;

  TRes call({
    bool? allowReciprocal,
    bool? requireApproval,
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Club$club$settings<TRes>
    implements CopyWith$Query$Club$club$settings<TRes> {
  _CopyWithImpl$Query$Club$club$settings(this._instance, this._then);

  final Query$Club$club$settings _instance;

  final TRes Function(Query$Club$club$settings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? allowReciprocal = _undefined,
    Object? requireApproval = _undefined,
    Object? maxVisitsPerMonth = _undefined,
    Object? reciprocalFee = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Club$club$settings(
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

class _CopyWithStubImpl$Query$Club$club$settings<TRes>
    implements CopyWith$Query$Club$club$settings<TRes> {
  _CopyWithStubImpl$Query$Club$club$settings(this._res);

  TRes _res;

  call({
    bool? allowReciprocal,
    bool? requireApproval,
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    String? $__typename,
  }) => _res;
}
