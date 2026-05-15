import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$ToggleFavoriteClub {
  factory Variables$Mutation$ToggleFavoriteClub({required String clubId}) =>
      Variables$Mutation$ToggleFavoriteClub._({r'clubId': clubId});

  Variables$Mutation$ToggleFavoriteClub._(this._$data);

  factory Variables$Mutation$ToggleFavoriteClub.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$clubId = data['clubId'];
    result$data['clubId'] = (l$clubId as String);
    return Variables$Mutation$ToggleFavoriteClub._(result$data);
  }

  Map<String, dynamic> _$data;

  String get clubId => (_$data['clubId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$clubId = clubId;
    result$data['clubId'] = l$clubId;
    return result$data;
  }

  CopyWith$Variables$Mutation$ToggleFavoriteClub<
    Variables$Mutation$ToggleFavoriteClub
  >
  get copyWith =>
      CopyWith$Variables$Mutation$ToggleFavoriteClub(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ToggleFavoriteClub ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$clubId = clubId;
    final lOther$clubId = other.clubId;
    if (l$clubId != lOther$clubId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$clubId = clubId;
    return Object.hashAll([l$clubId]);
  }
}

abstract class CopyWith$Variables$Mutation$ToggleFavoriteClub<TRes> {
  factory CopyWith$Variables$Mutation$ToggleFavoriteClub(
    Variables$Mutation$ToggleFavoriteClub instance,
    TRes Function(Variables$Mutation$ToggleFavoriteClub) then,
  ) = _CopyWithImpl$Variables$Mutation$ToggleFavoriteClub;

  factory CopyWith$Variables$Mutation$ToggleFavoriteClub.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ToggleFavoriteClub;

  TRes call({String? clubId});
}

class _CopyWithImpl$Variables$Mutation$ToggleFavoriteClub<TRes>
    implements CopyWith$Variables$Mutation$ToggleFavoriteClub<TRes> {
  _CopyWithImpl$Variables$Mutation$ToggleFavoriteClub(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ToggleFavoriteClub _instance;

  final TRes Function(Variables$Mutation$ToggleFavoriteClub) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? clubId = _undefined}) => _then(
    Variables$Mutation$ToggleFavoriteClub._({
      ..._instance._$data,
      if (clubId != _undefined && clubId != null) 'clubId': (clubId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$ToggleFavoriteClub<TRes>
    implements CopyWith$Variables$Mutation$ToggleFavoriteClub<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ToggleFavoriteClub(this._res);

  TRes _res;

  call({String? clubId}) => _res;
}

class Mutation$ToggleFavoriteClub {
  Mutation$ToggleFavoriteClub({
    required this.toggleFavoriteClub,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ToggleFavoriteClub.fromJson(Map<String, dynamic> json) {
    final l$toggleFavoriteClub = json['toggleFavoriteClub'];
    final l$$__typename = json['__typename'];
    return Mutation$ToggleFavoriteClub(
      toggleFavoriteClub:
          Mutation$ToggleFavoriteClub$toggleFavoriteClub.fromJson(
            (l$toggleFavoriteClub as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ToggleFavoriteClub$toggleFavoriteClub toggleFavoriteClub;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$toggleFavoriteClub = toggleFavoriteClub;
    _resultData['toggleFavoriteClub'] = l$toggleFavoriteClub.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$toggleFavoriteClub = toggleFavoriteClub;
    final l$$__typename = $__typename;
    return Object.hashAll([l$toggleFavoriteClub, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ToggleFavoriteClub ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$toggleFavoriteClub = toggleFavoriteClub;
    final lOther$toggleFavoriteClub = other.toggleFavoriteClub;
    if (l$toggleFavoriteClub != lOther$toggleFavoriteClub) {
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

extension UtilityExtension$Mutation$ToggleFavoriteClub
    on Mutation$ToggleFavoriteClub {
  CopyWith$Mutation$ToggleFavoriteClub<Mutation$ToggleFavoriteClub>
  get copyWith => CopyWith$Mutation$ToggleFavoriteClub(this, (i) => i);
}

abstract class CopyWith$Mutation$ToggleFavoriteClub<TRes> {
  factory CopyWith$Mutation$ToggleFavoriteClub(
    Mutation$ToggleFavoriteClub instance,
    TRes Function(Mutation$ToggleFavoriteClub) then,
  ) = _CopyWithImpl$Mutation$ToggleFavoriteClub;

  factory CopyWith$Mutation$ToggleFavoriteClub.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ToggleFavoriteClub;

  TRes call({
    Mutation$ToggleFavoriteClub$toggleFavoriteClub? toggleFavoriteClub,
    String? $__typename,
  });
  CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub<TRes>
  get toggleFavoriteClub;
}

class _CopyWithImpl$Mutation$ToggleFavoriteClub<TRes>
    implements CopyWith$Mutation$ToggleFavoriteClub<TRes> {
  _CopyWithImpl$Mutation$ToggleFavoriteClub(this._instance, this._then);

  final Mutation$ToggleFavoriteClub _instance;

  final TRes Function(Mutation$ToggleFavoriteClub) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? toggleFavoriteClub = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ToggleFavoriteClub(
      toggleFavoriteClub:
          toggleFavoriteClub == _undefined || toggleFavoriteClub == null
          ? _instance.toggleFavoriteClub
          : (toggleFavoriteClub
                as Mutation$ToggleFavoriteClub$toggleFavoriteClub),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub<TRes>
  get toggleFavoriteClub {
    final local$toggleFavoriteClub = _instance.toggleFavoriteClub;
    return CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub(
      local$toggleFavoriteClub,
      (e) => call(toggleFavoriteClub: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$ToggleFavoriteClub<TRes>
    implements CopyWith$Mutation$ToggleFavoriteClub<TRes> {
  _CopyWithStubImpl$Mutation$ToggleFavoriteClub(this._res);

  TRes _res;

  call({
    Mutation$ToggleFavoriteClub$toggleFavoriteClub? toggleFavoriteClub,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub<TRes>
  get toggleFavoriteClub =>
      CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub.stub(_res);
}

const documentNodeMutationToggleFavoriteClub = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ToggleFavoriteClub'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'clubId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'toggleFavoriteClub'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'clubId'),
                value: VariableNode(name: NameNode(value: 'clubId')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'club'),
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
                        name: NameNode(value: 'slug'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'logo'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'userRelation'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'favorited'),
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
                FieldNode(
                  name: NameNode(value: 'success'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'message'),
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
Mutation$ToggleFavoriteClub _parserFn$Mutation$ToggleFavoriteClub(
  Map<String, dynamic> data,
) => Mutation$ToggleFavoriteClub.fromJson(data);
typedef OnMutationCompleted$Mutation$ToggleFavoriteClub =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$ToggleFavoriteClub?,
    );

class Options$Mutation$ToggleFavoriteClub
    extends graphql.MutationOptions<Mutation$ToggleFavoriteClub> {
  Options$Mutation$ToggleFavoriteClub({
    String? operationName,
    required Variables$Mutation$ToggleFavoriteClub variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ToggleFavoriteClub? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ToggleFavoriteClub? onCompleted,
    graphql.OnMutationUpdate<Mutation$ToggleFavoriteClub>? update,
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
                 data == null
                     ? null
                     : _parserFn$Mutation$ToggleFavoriteClub(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationToggleFavoriteClub,
         parserFn: _parserFn$Mutation$ToggleFavoriteClub,
       );

  final OnMutationCompleted$Mutation$ToggleFavoriteClub? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$ToggleFavoriteClub
    extends graphql.WatchQueryOptions<Mutation$ToggleFavoriteClub> {
  WatchOptions$Mutation$ToggleFavoriteClub({
    String? operationName,
    required Variables$Mutation$ToggleFavoriteClub variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ToggleFavoriteClub? typedOptimisticResult,
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
         document: documentNodeMutationToggleFavoriteClub,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$ToggleFavoriteClub,
       );
}

extension ClientExtension$Mutation$ToggleFavoriteClub on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ToggleFavoriteClub>>
  mutate$ToggleFavoriteClub(
    Options$Mutation$ToggleFavoriteClub options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$ToggleFavoriteClub>
  watchMutation$ToggleFavoriteClub(
    WatchOptions$Mutation$ToggleFavoriteClub options,
  ) => this.watchMutation(options);
}

class Mutation$ToggleFavoriteClub$toggleFavoriteClub {
  Mutation$ToggleFavoriteClub$toggleFavoriteClub({
    required this.club,
    required this.success,
    this.message,
    this.$__typename = 'ToggleFavoriteClubResult',
  });

  factory Mutation$ToggleFavoriteClub$toggleFavoriteClub.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$club = json['club'];
    final l$success = json['success'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$ToggleFavoriteClub$toggleFavoriteClub(
      club: Mutation$ToggleFavoriteClub$toggleFavoriteClub$club.fromJson(
        (l$club as Map<String, dynamic>),
      ),
      success: (l$success as bool),
      message: (l$message as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ToggleFavoriteClub$toggleFavoriteClub$club club;

  final bool success;

  final String? message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$club = club;
    _resultData['club'] = l$club.toJson();
    final l$success = success;
    _resultData['success'] = l$success;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$club = club;
    final l$success = success;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([l$club, l$success, l$message, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ToggleFavoriteClub$toggleFavoriteClub ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$club = club;
    final lOther$club = other.club;
    if (l$club != lOther$club) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
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

extension UtilityExtension$Mutation$ToggleFavoriteClub$toggleFavoriteClub
    on Mutation$ToggleFavoriteClub$toggleFavoriteClub {
  CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub<
    Mutation$ToggleFavoriteClub$toggleFavoriteClub
  >
  get copyWith =>
      CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub(this, (i) => i);
}

abstract class CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub<TRes> {
  factory CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub(
    Mutation$ToggleFavoriteClub$toggleFavoriteClub instance,
    TRes Function(Mutation$ToggleFavoriteClub$toggleFavoriteClub) then,
  ) = _CopyWithImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub;

  factory CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub;

  TRes call({
    Mutation$ToggleFavoriteClub$toggleFavoriteClub$club? club,
    bool? success,
    String? message,
    String? $__typename,
  });
  CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club<TRes> get club;
}

class _CopyWithImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub<TRes>
    implements CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub<TRes> {
  _CopyWithImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub(
    this._instance,
    this._then,
  );

  final Mutation$ToggleFavoriteClub$toggleFavoriteClub _instance;

  final TRes Function(Mutation$ToggleFavoriteClub$toggleFavoriteClub) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? club = _undefined,
    Object? success = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ToggleFavoriteClub$toggleFavoriteClub(
      club: club == _undefined || club == null
          ? _instance.club
          : (club as Mutation$ToggleFavoriteClub$toggleFavoriteClub$club),
      success: success == _undefined || success == null
          ? _instance.success
          : (success as bool),
      message: message == _undefined ? _instance.message : (message as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club<TRes> get club {
    final local$club = _instance.club;
    return CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club(
      local$club,
      (e) => call(club: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub<TRes>
    implements CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub<TRes> {
  _CopyWithStubImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub(this._res);

  TRes _res;

  call({
    Mutation$ToggleFavoriteClub$toggleFavoriteClub$club? club,
    bool? success,
    String? message,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club<TRes> get club =>
      CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club.stub(_res);
}

class Mutation$ToggleFavoriteClub$toggleFavoriteClub$club {
  Mutation$ToggleFavoriteClub$toggleFavoriteClub$club({
    required this.id,
    required this.name,
    required this.slug,
    this.logo,
    this.userRelation,
    this.$__typename = 'Club',
  });

  factory Mutation$ToggleFavoriteClub$toggleFavoriteClub$club.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$slug = json['slug'];
    final l$logo = json['logo'];
    final l$userRelation = json['userRelation'];
    final l$$__typename = json['__typename'];
    return Mutation$ToggleFavoriteClub$toggleFavoriteClub$club(
      id: (l$id as String),
      name: (l$name as String),
      slug: (l$slug as String),
      logo: (l$logo as String?),
      userRelation: l$userRelation == null
          ? null
          : Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation.fromJson(
              (l$userRelation as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String slug;

  final String? logo;

  final Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation?
  userRelation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$slug = slug;
    _resultData['slug'] = l$slug;
    final l$logo = logo;
    _resultData['logo'] = l$logo;
    final l$userRelation = userRelation;
    _resultData['userRelation'] = l$userRelation?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$slug = slug;
    final l$logo = logo;
    final l$userRelation = userRelation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$slug,
      l$logo,
      l$userRelation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ToggleFavoriteClub$toggleFavoriteClub$club ||
        runtimeType != other.runtimeType) {
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
    final l$slug = slug;
    final lOther$slug = other.slug;
    if (l$slug != lOther$slug) {
      return false;
    }
    final l$logo = logo;
    final lOther$logo = other.logo;
    if (l$logo != lOther$logo) {
      return false;
    }
    final l$userRelation = userRelation;
    final lOther$userRelation = other.userRelation;
    if (l$userRelation != lOther$userRelation) {
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

extension UtilityExtension$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club
    on Mutation$ToggleFavoriteClub$toggleFavoriteClub$club {
  CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club<
    Mutation$ToggleFavoriteClub$toggleFavoriteClub$club
  >
  get copyWith => CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club<
  TRes
> {
  factory CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club(
    Mutation$ToggleFavoriteClub$toggleFavoriteClub$club instance,
    TRes Function(Mutation$ToggleFavoriteClub$toggleFavoriteClub$club) then,
  ) = _CopyWithImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club;

  factory CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club;

  TRes call({
    String? id,
    String? name,
    String? slug,
    String? logo,
    Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation?
    userRelation,
    String? $__typename,
  });
  CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation<
    TRes
  >
  get userRelation;
}

class _CopyWithImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club<TRes>
    implements
        CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club<TRes> {
  _CopyWithImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club(
    this._instance,
    this._then,
  );

  final Mutation$ToggleFavoriteClub$toggleFavoriteClub$club _instance;

  final TRes Function(Mutation$ToggleFavoriteClub$toggleFavoriteClub$club)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? slug = _undefined,
    Object? logo = _undefined,
    Object? userRelation = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ToggleFavoriteClub$toggleFavoriteClub$club(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      slug: slug == _undefined || slug == null
          ? _instance.slug
          : (slug as String),
      logo: logo == _undefined ? _instance.logo : (logo as String?),
      userRelation: userRelation == _undefined
          ? _instance.userRelation
          : (userRelation
                as Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation<
    TRes
  >
  get userRelation {
    final local$userRelation = _instance.userRelation;
    return local$userRelation == null
        ? CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation(
            local$userRelation,
            (e) => call(userRelation: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club<
  TRes
>
    implements
        CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club<TRes> {
  _CopyWithStubImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? name,
    String? slug,
    String? logo,
    Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation?
    userRelation,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation<
    TRes
  >
  get userRelation =>
      CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation.stub(
        _res,
      );
}

class Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation {
  Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation({
    required this.favorited,
    this.$__typename = 'ClubUserRelation',
  });

  factory Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$favorited = json['favorited'];
    final l$$__typename = json['__typename'];
    return Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation(
      favorited: (l$favorited as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool favorited;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$favorited = favorited;
    _resultData['favorited'] = l$favorited;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$favorited = favorited;
    final l$$__typename = $__typename;
    return Object.hashAll([l$favorited, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$favorited = favorited;
    final lOther$favorited = other.favorited;
    if (l$favorited != lOther$favorited) {
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

extension UtilityExtension$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation
    on Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation {
  CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation<
    Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation
  >
  get copyWith =>
      CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation<
  TRes
> {
  factory CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation(
    Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation instance,
    TRes Function(
      Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation,
    )
    then,
  ) = _CopyWithImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation;

  factory CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation;

  TRes call({bool? favorited, String? $__typename});
}

class _CopyWithImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation<
  TRes
>
    implements
        CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation<
          TRes
        > {
  _CopyWithImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation(
    this._instance,
    this._then,
  );

  final Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation
  _instance;

  final TRes Function(
    Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? favorited = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation(
      favorited: favorited == _undefined || favorited == null
          ? _instance.favorited
          : (favorited as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation<
  TRes
>
    implements
        CopyWith$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation<
          TRes
        > {
  _CopyWithStubImpl$Mutation$ToggleFavoriteClub$toggleFavoriteClub$club$userRelation(
    this._res,
  );

  TRes _res;

  call({bool? favorited, String? $__typename}) => _res;
}
