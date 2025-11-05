import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CheckInToClub {
  factory Variables$Mutation$CheckInToClub({required String clubId}) =>
      Variables$Mutation$CheckInToClub._({r'clubId': clubId});

  Variables$Mutation$CheckInToClub._(this._$data);

  factory Variables$Mutation$CheckInToClub.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$clubId = data['clubId'];
    result$data['clubId'] = (l$clubId as String);
    return Variables$Mutation$CheckInToClub._(result$data);
  }

  Map<String, dynamic> _$data;

  String get clubId => (_$data['clubId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$clubId = clubId;
    result$data['clubId'] = l$clubId;
    return result$data;
  }

  CopyWith$Variables$Mutation$CheckInToClub<Variables$Mutation$CheckInToClub>
  get copyWith => CopyWith$Variables$Mutation$CheckInToClub(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CheckInToClub ||
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

abstract class CopyWith$Variables$Mutation$CheckInToClub<TRes> {
  factory CopyWith$Variables$Mutation$CheckInToClub(
    Variables$Mutation$CheckInToClub instance,
    TRes Function(Variables$Mutation$CheckInToClub) then,
  ) = _CopyWithImpl$Variables$Mutation$CheckInToClub;

  factory CopyWith$Variables$Mutation$CheckInToClub.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CheckInToClub;

  TRes call({String? clubId});
}

class _CopyWithImpl$Variables$Mutation$CheckInToClub<TRes>
    implements CopyWith$Variables$Mutation$CheckInToClub<TRes> {
  _CopyWithImpl$Variables$Mutation$CheckInToClub(this._instance, this._then);

  final Variables$Mutation$CheckInToClub _instance;

  final TRes Function(Variables$Mutation$CheckInToClub) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? clubId = _undefined}) => _then(
    Variables$Mutation$CheckInToClub._({
      ..._instance._$data,
      if (clubId != _undefined && clubId != null) 'clubId': (clubId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CheckInToClub<TRes>
    implements CopyWith$Variables$Mutation$CheckInToClub<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CheckInToClub(this._res);

  TRes _res;

  call({String? clubId}) => _res;
}

class Mutation$CheckInToClub {
  Mutation$CheckInToClub({
    required this.checkInToClub,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CheckInToClub.fromJson(Map<String, dynamic> json) {
    final l$checkInToClub = json['checkInToClub'];
    final l$$__typename = json['__typename'];
    return Mutation$CheckInToClub(
      checkInToClub: Mutation$CheckInToClub$checkInToClub.fromJson(
        (l$checkInToClub as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CheckInToClub$checkInToClub checkInToClub;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$checkInToClub = checkInToClub;
    _resultData['checkInToClub'] = l$checkInToClub.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$checkInToClub = checkInToClub;
    final l$$__typename = $__typename;
    return Object.hashAll([l$checkInToClub, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CheckInToClub || runtimeType != other.runtimeType) {
      return false;
    }
    final l$checkInToClub = checkInToClub;
    final lOther$checkInToClub = other.checkInToClub;
    if (l$checkInToClub != lOther$checkInToClub) {
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

extension UtilityExtension$Mutation$CheckInToClub on Mutation$CheckInToClub {
  CopyWith$Mutation$CheckInToClub<Mutation$CheckInToClub> get copyWith =>
      CopyWith$Mutation$CheckInToClub(this, (i) => i);
}

abstract class CopyWith$Mutation$CheckInToClub<TRes> {
  factory CopyWith$Mutation$CheckInToClub(
    Mutation$CheckInToClub instance,
    TRes Function(Mutation$CheckInToClub) then,
  ) = _CopyWithImpl$Mutation$CheckInToClub;

  factory CopyWith$Mutation$CheckInToClub.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CheckInToClub;

  TRes call({
    Mutation$CheckInToClub$checkInToClub? checkInToClub,
    String? $__typename,
  });
  CopyWith$Mutation$CheckInToClub$checkInToClub<TRes> get checkInToClub;
}

class _CopyWithImpl$Mutation$CheckInToClub<TRes>
    implements CopyWith$Mutation$CheckInToClub<TRes> {
  _CopyWithImpl$Mutation$CheckInToClub(this._instance, this._then);

  final Mutation$CheckInToClub _instance;

  final TRes Function(Mutation$CheckInToClub) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? checkInToClub = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CheckInToClub(
      checkInToClub: checkInToClub == _undefined || checkInToClub == null
          ? _instance.checkInToClub
          : (checkInToClub as Mutation$CheckInToClub$checkInToClub),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CheckInToClub$checkInToClub<TRes> get checkInToClub {
    final local$checkInToClub = _instance.checkInToClub;
    return CopyWith$Mutation$CheckInToClub$checkInToClub(
      local$checkInToClub,
      (e) => call(checkInToClub: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CheckInToClub<TRes>
    implements CopyWith$Mutation$CheckInToClub<TRes> {
  _CopyWithStubImpl$Mutation$CheckInToClub(this._res);

  TRes _res;

  call({
    Mutation$CheckInToClub$checkInToClub? checkInToClub,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CheckInToClub$checkInToClub<TRes> get checkInToClub =>
      CopyWith$Mutation$CheckInToClub$checkInToClub.stub(_res);
}

const documentNodeMutationCheckInToClub = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CheckInToClub'),
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
            name: NameNode(value: 'checkInToClub'),
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
                  name: NameNode(value: 'visit'),
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
                        name: NameNode(value: 'checkedInAt'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
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
Mutation$CheckInToClub _parserFn$Mutation$CheckInToClub(
  Map<String, dynamic> data,
) => Mutation$CheckInToClub.fromJson(data);
typedef OnMutationCompleted$Mutation$CheckInToClub =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CheckInToClub?);

class Options$Mutation$CheckInToClub
    extends graphql.MutationOptions<Mutation$CheckInToClub> {
  Options$Mutation$CheckInToClub({
    String? operationName,
    required Variables$Mutation$CheckInToClub variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CheckInToClub? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CheckInToClub? onCompleted,
    graphql.OnMutationUpdate<Mutation$CheckInToClub>? update,
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
                 data == null ? null : _parserFn$Mutation$CheckInToClub(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCheckInToClub,
         parserFn: _parserFn$Mutation$CheckInToClub,
       );

  final OnMutationCompleted$Mutation$CheckInToClub? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CheckInToClub
    extends graphql.WatchQueryOptions<Mutation$CheckInToClub> {
  WatchOptions$Mutation$CheckInToClub({
    String? operationName,
    required Variables$Mutation$CheckInToClub variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CheckInToClub? typedOptimisticResult,
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
         document: documentNodeMutationCheckInToClub,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CheckInToClub,
       );
}

extension ClientExtension$Mutation$CheckInToClub on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CheckInToClub>> mutate$CheckInToClub(
    Options$Mutation$CheckInToClub options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CheckInToClub> watchMutation$CheckInToClub(
    WatchOptions$Mutation$CheckInToClub options,
  ) => this.watchMutation(options);
}

class Mutation$CheckInToClub$checkInToClub {
  Mutation$CheckInToClub$checkInToClub({
    required this.success,
    this.message,
    this.visit,
    this.$__typename = 'CheckInResponse',
  });

  factory Mutation$CheckInToClub$checkInToClub.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$success = json['success'];
    final l$message = json['message'];
    final l$visit = json['visit'];
    final l$$__typename = json['__typename'];
    return Mutation$CheckInToClub$checkInToClub(
      success: (l$success as bool),
      message: (l$message as String?),
      visit: l$visit == null
          ? null
          : Mutation$CheckInToClub$checkInToClub$visit.fromJson(
              (l$visit as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final bool success;

  final String? message;

  final Mutation$CheckInToClub$checkInToClub$visit? visit;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$visit = visit;
    _resultData['visit'] = l$visit?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$message = message;
    final l$visit = visit;
    final l$$__typename = $__typename;
    return Object.hashAll([l$success, l$message, l$visit, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CheckInToClub$checkInToClub ||
        runtimeType != other.runtimeType) {
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
    final l$visit = visit;
    final lOther$visit = other.visit;
    if (l$visit != lOther$visit) {
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

extension UtilityExtension$Mutation$CheckInToClub$checkInToClub
    on Mutation$CheckInToClub$checkInToClub {
  CopyWith$Mutation$CheckInToClub$checkInToClub<
    Mutation$CheckInToClub$checkInToClub
  >
  get copyWith => CopyWith$Mutation$CheckInToClub$checkInToClub(this, (i) => i);
}

abstract class CopyWith$Mutation$CheckInToClub$checkInToClub<TRes> {
  factory CopyWith$Mutation$CheckInToClub$checkInToClub(
    Mutation$CheckInToClub$checkInToClub instance,
    TRes Function(Mutation$CheckInToClub$checkInToClub) then,
  ) = _CopyWithImpl$Mutation$CheckInToClub$checkInToClub;

  factory CopyWith$Mutation$CheckInToClub$checkInToClub.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CheckInToClub$checkInToClub;

  TRes call({
    bool? success,
    String? message,
    Mutation$CheckInToClub$checkInToClub$visit? visit,
    String? $__typename,
  });
  CopyWith$Mutation$CheckInToClub$checkInToClub$visit<TRes> get visit;
}

class _CopyWithImpl$Mutation$CheckInToClub$checkInToClub<TRes>
    implements CopyWith$Mutation$CheckInToClub$checkInToClub<TRes> {
  _CopyWithImpl$Mutation$CheckInToClub$checkInToClub(
    this._instance,
    this._then,
  );

  final Mutation$CheckInToClub$checkInToClub _instance;

  final TRes Function(Mutation$CheckInToClub$checkInToClub) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? message = _undefined,
    Object? visit = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CheckInToClub$checkInToClub(
      success: success == _undefined || success == null
          ? _instance.success
          : (success as bool),
      message: message == _undefined ? _instance.message : (message as String?),
      visit: visit == _undefined
          ? _instance.visit
          : (visit as Mutation$CheckInToClub$checkInToClub$visit?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CheckInToClub$checkInToClub$visit<TRes> get visit {
    final local$visit = _instance.visit;
    return local$visit == null
        ? CopyWith$Mutation$CheckInToClub$checkInToClub$visit.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CheckInToClub$checkInToClub$visit(
            local$visit,
            (e) => call(visit: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CheckInToClub$checkInToClub<TRes>
    implements CopyWith$Mutation$CheckInToClub$checkInToClub<TRes> {
  _CopyWithStubImpl$Mutation$CheckInToClub$checkInToClub(this._res);

  TRes _res;

  call({
    bool? success,
    String? message,
    Mutation$CheckInToClub$checkInToClub$visit? visit,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CheckInToClub$checkInToClub$visit<TRes> get visit =>
      CopyWith$Mutation$CheckInToClub$checkInToClub$visit.stub(_res);
}

class Mutation$CheckInToClub$checkInToClub$visit {
  Mutation$CheckInToClub$checkInToClub$visit({
    required this.id,
    required this.checkedInAt,
    this.club,
    this.$__typename = 'Visit',
  });

  factory Mutation$CheckInToClub$checkInToClub$visit.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$checkedInAt = json['checkedInAt'];
    final l$club = json['club'];
    final l$$__typename = json['__typename'];
    return Mutation$CheckInToClub$checkInToClub$visit(
      id: (l$id as String),
      checkedInAt: DateTime.parse((l$checkedInAt as String)),
      club: l$club == null
          ? null
          : Mutation$CheckInToClub$checkInToClub$visit$club.fromJson(
              (l$club as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime checkedInAt;

  final Mutation$CheckInToClub$checkInToClub$visit$club? club;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$checkedInAt = checkedInAt;
    _resultData['checkedInAt'] = l$checkedInAt.toIso8601String();
    final l$club = club;
    _resultData['club'] = l$club?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$checkedInAt = checkedInAt;
    final l$club = club;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$checkedInAt, l$club, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CheckInToClub$checkInToClub$visit ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$checkedInAt = checkedInAt;
    final lOther$checkedInAt = other.checkedInAt;
    if (l$checkedInAt != lOther$checkedInAt) {
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

extension UtilityExtension$Mutation$CheckInToClub$checkInToClub$visit
    on Mutation$CheckInToClub$checkInToClub$visit {
  CopyWith$Mutation$CheckInToClub$checkInToClub$visit<
    Mutation$CheckInToClub$checkInToClub$visit
  >
  get copyWith =>
      CopyWith$Mutation$CheckInToClub$checkInToClub$visit(this, (i) => i);
}

abstract class CopyWith$Mutation$CheckInToClub$checkInToClub$visit<TRes> {
  factory CopyWith$Mutation$CheckInToClub$checkInToClub$visit(
    Mutation$CheckInToClub$checkInToClub$visit instance,
    TRes Function(Mutation$CheckInToClub$checkInToClub$visit) then,
  ) = _CopyWithImpl$Mutation$CheckInToClub$checkInToClub$visit;

  factory CopyWith$Mutation$CheckInToClub$checkInToClub$visit.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CheckInToClub$checkInToClub$visit;

  TRes call({
    String? id,
    DateTime? checkedInAt,
    Mutation$CheckInToClub$checkInToClub$visit$club? club,
    String? $__typename,
  });
  CopyWith$Mutation$CheckInToClub$checkInToClub$visit$club<TRes> get club;
}

class _CopyWithImpl$Mutation$CheckInToClub$checkInToClub$visit<TRes>
    implements CopyWith$Mutation$CheckInToClub$checkInToClub$visit<TRes> {
  _CopyWithImpl$Mutation$CheckInToClub$checkInToClub$visit(
    this._instance,
    this._then,
  );

  final Mutation$CheckInToClub$checkInToClub$visit _instance;

  final TRes Function(Mutation$CheckInToClub$checkInToClub$visit) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? checkedInAt = _undefined,
    Object? club = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CheckInToClub$checkInToClub$visit(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      checkedInAt: checkedInAt == _undefined || checkedInAt == null
          ? _instance.checkedInAt
          : (checkedInAt as DateTime),
      club: club == _undefined
          ? _instance.club
          : (club as Mutation$CheckInToClub$checkInToClub$visit$club?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CheckInToClub$checkInToClub$visit$club<TRes> get club {
    final local$club = _instance.club;
    return local$club == null
        ? CopyWith$Mutation$CheckInToClub$checkInToClub$visit$club.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CheckInToClub$checkInToClub$visit$club(
            local$club,
            (e) => call(club: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CheckInToClub$checkInToClub$visit<TRes>
    implements CopyWith$Mutation$CheckInToClub$checkInToClub$visit<TRes> {
  _CopyWithStubImpl$Mutation$CheckInToClub$checkInToClub$visit(this._res);

  TRes _res;

  call({
    String? id,
    DateTime? checkedInAt,
    Mutation$CheckInToClub$checkInToClub$visit$club? club,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CheckInToClub$checkInToClub$visit$club<TRes> get club =>
      CopyWith$Mutation$CheckInToClub$checkInToClub$visit$club.stub(_res);
}

class Mutation$CheckInToClub$checkInToClub$visit$club {
  Mutation$CheckInToClub$checkInToClub$visit$club({
    required this.id,
    required this.name,
    this.$__typename = 'Club',
  });

  factory Mutation$CheckInToClub$checkInToClub$visit$club.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$CheckInToClub$checkInToClub$visit$club(
      id: (l$id as String),
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CheckInToClub$checkInToClub$visit$club ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CheckInToClub$checkInToClub$visit$club
    on Mutation$CheckInToClub$checkInToClub$visit$club {
  CopyWith$Mutation$CheckInToClub$checkInToClub$visit$club<
    Mutation$CheckInToClub$checkInToClub$visit$club
  >
  get copyWith =>
      CopyWith$Mutation$CheckInToClub$checkInToClub$visit$club(this, (i) => i);
}

abstract class CopyWith$Mutation$CheckInToClub$checkInToClub$visit$club<TRes> {
  factory CopyWith$Mutation$CheckInToClub$checkInToClub$visit$club(
    Mutation$CheckInToClub$checkInToClub$visit$club instance,
    TRes Function(Mutation$CheckInToClub$checkInToClub$visit$club) then,
  ) = _CopyWithImpl$Mutation$CheckInToClub$checkInToClub$visit$club;

  factory CopyWith$Mutation$CheckInToClub$checkInToClub$visit$club.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CheckInToClub$checkInToClub$visit$club;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Mutation$CheckInToClub$checkInToClub$visit$club<TRes>
    implements CopyWith$Mutation$CheckInToClub$checkInToClub$visit$club<TRes> {
  _CopyWithImpl$Mutation$CheckInToClub$checkInToClub$visit$club(
    this._instance,
    this._then,
  );

  final Mutation$CheckInToClub$checkInToClub$visit$club _instance;

  final TRes Function(Mutation$CheckInToClub$checkInToClub$visit$club) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CheckInToClub$checkInToClub$visit$club(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CheckInToClub$checkInToClub$visit$club<TRes>
    implements CopyWith$Mutation$CheckInToClub$checkInToClub$visit$club<TRes> {
  _CopyWithStubImpl$Mutation$CheckInToClub$checkInToClub$visit$club(this._res);

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}
