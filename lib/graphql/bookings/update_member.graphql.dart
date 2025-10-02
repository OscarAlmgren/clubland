import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$UpdateMember {
  factory Variables$Mutation$UpdateMember({
    required String id,
    required Input$MemberProfileInput input,
  }) => Variables$Mutation$UpdateMember._({r'id': id, r'input': input});

  Variables$Mutation$UpdateMember._(this._$data);

  factory Variables$Mutation$UpdateMember.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$input = data['input'];
    result$data['input'] = Input$MemberProfileInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateMember._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Input$MemberProfileInput get input =>
      (_$data['input'] as Input$MemberProfileInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateMember<Variables$Mutation$UpdateMember>
  get copyWith => CopyWith$Variables$Mutation$UpdateMember(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateMember ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$input = input;
    return Object.hashAll([l$id, l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateMember<TRes> {
  factory CopyWith$Variables$Mutation$UpdateMember(
    Variables$Mutation$UpdateMember instance,
    TRes Function(Variables$Mutation$UpdateMember) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateMember;

  factory CopyWith$Variables$Mutation$UpdateMember.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateMember;

  TRes call({String? id, Input$MemberProfileInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateMember<TRes>
    implements CopyWith$Variables$Mutation$UpdateMember<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateMember(this._instance, this._then);

  final Variables$Mutation$UpdateMember _instance;

  final TRes Function(Variables$Mutation$UpdateMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateMember._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (input != _undefined && input != null)
        'input': (input as Input$MemberProfileInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateMember<TRes>
    implements CopyWith$Variables$Mutation$UpdateMember<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateMember(this._res);

  TRes _res;

  call({String? id, Input$MemberProfileInput? input}) => _res;
}

class Mutation$UpdateMember {
  Mutation$UpdateMember({
    required this.updateMember,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateMember.fromJson(Map<String, dynamic> json) {
    final l$updateMember = json['updateMember'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMember(
      updateMember: Mutation$UpdateMember$updateMember.fromJson(
        (l$updateMember as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateMember$updateMember updateMember;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateMember = updateMember;
    _resultData['updateMember'] = l$updateMember.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateMember = updateMember;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateMember, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateMember || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateMember = updateMember;
    final lOther$updateMember = other.updateMember;
    if (l$updateMember != lOther$updateMember) {
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

extension UtilityExtension$Mutation$UpdateMember on Mutation$UpdateMember {
  CopyWith$Mutation$UpdateMember<Mutation$UpdateMember> get copyWith =>
      CopyWith$Mutation$UpdateMember(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateMember<TRes> {
  factory CopyWith$Mutation$UpdateMember(
    Mutation$UpdateMember instance,
    TRes Function(Mutation$UpdateMember) then,
  ) = _CopyWithImpl$Mutation$UpdateMember;

  factory CopyWith$Mutation$UpdateMember.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMember;

  TRes call({
    Mutation$UpdateMember$updateMember? updateMember,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateMember$updateMember<TRes> get updateMember;
}

class _CopyWithImpl$Mutation$UpdateMember<TRes>
    implements CopyWith$Mutation$UpdateMember<TRes> {
  _CopyWithImpl$Mutation$UpdateMember(this._instance, this._then);

  final Mutation$UpdateMember _instance;

  final TRes Function(Mutation$UpdateMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateMember = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateMember(
      updateMember: updateMember == _undefined || updateMember == null
          ? _instance.updateMember
          : (updateMember as Mutation$UpdateMember$updateMember),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateMember$updateMember<TRes> get updateMember {
    final local$updateMember = _instance.updateMember;
    return CopyWith$Mutation$UpdateMember$updateMember(
      local$updateMember,
      (e) => call(updateMember: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$UpdateMember<TRes>
    implements CopyWith$Mutation$UpdateMember<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMember(this._res);

  TRes _res;

  call({
    Mutation$UpdateMember$updateMember? updateMember,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateMember$updateMember<TRes> get updateMember =>
      CopyWith$Mutation$UpdateMember$updateMember.stub(_res);
}

const documentNodeMutationUpdateMember = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateMember'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'MemberProfileInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateMember'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
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
                  name: NameNode(value: 'userId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'memberNumber'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'membershipType'),
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
                  name: NameNode(value: 'profile'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'firstName'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'lastName'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'dateOfBirth'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'phoneNumber'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'street'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'city'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'state'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'postalCode'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'country'),
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
Mutation$UpdateMember _parserFn$Mutation$UpdateMember(
  Map<String, dynamic> data,
) => Mutation$UpdateMember.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateMember =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdateMember?);

class Options$Mutation$UpdateMember
    extends graphql.MutationOptions<Mutation$UpdateMember> {
  Options$Mutation$UpdateMember({
    String? operationName,
    required Variables$Mutation$UpdateMember variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMember? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateMember? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateMember>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateMember(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateMember,
         parserFn: _parserFn$Mutation$UpdateMember,
       );

  final OnMutationCompleted$Mutation$UpdateMember? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateMember
    extends graphql.WatchQueryOptions<Mutation$UpdateMember> {
  WatchOptions$Mutation$UpdateMember({
    String? operationName,
    required Variables$Mutation$UpdateMember variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMember? typedOptimisticResult,
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
         document: documentNodeMutationUpdateMember,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateMember,
       );
}

extension ClientExtension$Mutation$UpdateMember on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateMember>> mutate$UpdateMember(
    Options$Mutation$UpdateMember options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateMember> watchMutation$UpdateMember(
    WatchOptions$Mutation$UpdateMember options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateMember$updateMember {
  Mutation$UpdateMember$updateMember({
    required this.id,
    required this.clubId,
    required this.userId,
    required this.memberNumber,
    required this.membershipType,
    required this.status,
    this.profile,
    required this.updatedAt,
    this.$__typename = 'Member',
  });

  factory Mutation$UpdateMember$updateMember.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$userId = json['userId'];
    final l$memberNumber = json['memberNumber'];
    final l$membershipType = json['membershipType'];
    final l$status = json['status'];
    final l$profile = json['profile'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMember$updateMember(
      id: (l$id as String),
      clubId: (l$clubId as String),
      userId: (l$userId as String),
      memberNumber: (l$memberNumber as String),
      membershipType: fromJson$Enum$MembershipType(
        (l$membershipType as String),
      ),
      status: fromJson$Enum$MemberStatus((l$status as String)),
      profile: l$profile == null
          ? null
          : Mutation$UpdateMember$updateMember$profile.fromJson(
              (l$profile as Map<String, dynamic>),
            ),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String userId;

  final String memberNumber;

  final Enum$MembershipType membershipType;

  final Enum$MemberStatus status;

  final Mutation$UpdateMember$updateMember$profile? profile;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$memberNumber = memberNumber;
    _resultData['memberNumber'] = l$memberNumber;
    final l$membershipType = membershipType;
    _resultData['membershipType'] = toJson$Enum$MembershipType(
      l$membershipType,
    );
    final l$status = status;
    _resultData['status'] = toJson$Enum$MemberStatus(l$status);
    final l$profile = profile;
    _resultData['profile'] = l$profile?.toJson();
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
    final l$userId = userId;
    final l$memberNumber = memberNumber;
    final l$membershipType = membershipType;
    final l$status = status;
    final l$profile = profile;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$userId,
      l$memberNumber,
      l$membershipType,
      l$status,
      l$profile,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateMember$updateMember ||
        runtimeType != other.runtimeType) {
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
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$memberNumber = memberNumber;
    final lOther$memberNumber = other.memberNumber;
    if (l$memberNumber != lOther$memberNumber) {
      return false;
    }
    final l$membershipType = membershipType;
    final lOther$membershipType = other.membershipType;
    if (l$membershipType != lOther$membershipType) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$profile = profile;
    final lOther$profile = other.profile;
    if (l$profile != lOther$profile) {
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

extension UtilityExtension$Mutation$UpdateMember$updateMember
    on Mutation$UpdateMember$updateMember {
  CopyWith$Mutation$UpdateMember$updateMember<
    Mutation$UpdateMember$updateMember
  >
  get copyWith => CopyWith$Mutation$UpdateMember$updateMember(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateMember$updateMember<TRes> {
  factory CopyWith$Mutation$UpdateMember$updateMember(
    Mutation$UpdateMember$updateMember instance,
    TRes Function(Mutation$UpdateMember$updateMember) then,
  ) = _CopyWithImpl$Mutation$UpdateMember$updateMember;

  factory CopyWith$Mutation$UpdateMember$updateMember.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMember$updateMember;

  TRes call({
    String? id,
    String? clubId,
    String? userId,
    String? memberNumber,
    Enum$MembershipType? membershipType,
    Enum$MemberStatus? status,
    Mutation$UpdateMember$updateMember$profile? profile,
    DateTime? updatedAt,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateMember$updateMember$profile<TRes> get profile;
}

class _CopyWithImpl$Mutation$UpdateMember$updateMember<TRes>
    implements CopyWith$Mutation$UpdateMember$updateMember<TRes> {
  _CopyWithImpl$Mutation$UpdateMember$updateMember(this._instance, this._then);

  final Mutation$UpdateMember$updateMember _instance;

  final TRes Function(Mutation$UpdateMember$updateMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? userId = _undefined,
    Object? memberNumber = _undefined,
    Object? membershipType = _undefined,
    Object? status = _undefined,
    Object? profile = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateMember$updateMember(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      memberNumber: memberNumber == _undefined || memberNumber == null
          ? _instance.memberNumber
          : (memberNumber as String),
      membershipType: membershipType == _undefined || membershipType == null
          ? _instance.membershipType
          : (membershipType as Enum$MembershipType),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$MemberStatus),
      profile: profile == _undefined
          ? _instance.profile
          : (profile as Mutation$UpdateMember$updateMember$profile?),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateMember$updateMember$profile<TRes> get profile {
    final local$profile = _instance.profile;
    return local$profile == null
        ? CopyWith$Mutation$UpdateMember$updateMember$profile.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateMember$updateMember$profile(
            local$profile,
            (e) => call(profile: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateMember$updateMember<TRes>
    implements CopyWith$Mutation$UpdateMember$updateMember<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMember$updateMember(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? userId,
    String? memberNumber,
    Enum$MembershipType? membershipType,
    Enum$MemberStatus? status,
    Mutation$UpdateMember$updateMember$profile? profile,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateMember$updateMember$profile<TRes> get profile =>
      CopyWith$Mutation$UpdateMember$updateMember$profile.stub(_res);
}

class Mutation$UpdateMember$updateMember$profile {
  Mutation$UpdateMember$updateMember$profile({
    required this.firstName,
    required this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.address,
    this.$__typename = 'MemberProfile',
  });

  factory Mutation$UpdateMember$updateMember$profile.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$dateOfBirth = json['dateOfBirth'];
    final l$phoneNumber = json['phoneNumber'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMember$updateMember$profile(
      firstName: (l$firstName as String),
      lastName: (l$lastName as String),
      dateOfBirth: l$dateOfBirth == null
          ? null
          : DateTime.parse((l$dateOfBirth as String)),
      phoneNumber: (l$phoneNumber as String?),
      address: l$address == null
          ? null
          : Mutation$UpdateMember$updateMember$profile$address.fromJson(
              (l$address as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String firstName;

  final String lastName;

  final DateTime? dateOfBirth;

  final String? phoneNumber;

  final Mutation$UpdateMember$updateMember$profile$address? address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$dateOfBirth = dateOfBirth;
    _resultData['dateOfBirth'] = l$dateOfBirth?.toIso8601String();
    final l$phoneNumber = phoneNumber;
    _resultData['phoneNumber'] = l$phoneNumber;
    final l$address = address;
    _resultData['address'] = l$address?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$dateOfBirth = dateOfBirth;
    final l$phoneNumber = phoneNumber;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$firstName,
      l$lastName,
      l$dateOfBirth,
      l$phoneNumber,
      l$address,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateMember$updateMember$profile ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$dateOfBirth = dateOfBirth;
    final lOther$dateOfBirth = other.dateOfBirth;
    if (l$dateOfBirth != lOther$dateOfBirth) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Mutation$UpdateMember$updateMember$profile
    on Mutation$UpdateMember$updateMember$profile {
  CopyWith$Mutation$UpdateMember$updateMember$profile<
    Mutation$UpdateMember$updateMember$profile
  >
  get copyWith =>
      CopyWith$Mutation$UpdateMember$updateMember$profile(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateMember$updateMember$profile<TRes> {
  factory CopyWith$Mutation$UpdateMember$updateMember$profile(
    Mutation$UpdateMember$updateMember$profile instance,
    TRes Function(Mutation$UpdateMember$updateMember$profile) then,
  ) = _CopyWithImpl$Mutation$UpdateMember$updateMember$profile;

  factory CopyWith$Mutation$UpdateMember$updateMember$profile.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMember$updateMember$profile;

  TRes call({
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    Mutation$UpdateMember$updateMember$profile$address? address,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateMember$updateMember$profile$address<TRes> get address;
}

class _CopyWithImpl$Mutation$UpdateMember$updateMember$profile<TRes>
    implements CopyWith$Mutation$UpdateMember$updateMember$profile<TRes> {
  _CopyWithImpl$Mutation$UpdateMember$updateMember$profile(
    this._instance,
    this._then,
  );

  final Mutation$UpdateMember$updateMember$profile _instance;

  final TRes Function(Mutation$UpdateMember$updateMember$profile) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? dateOfBirth = _undefined,
    Object? phoneNumber = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateMember$updateMember$profile(
      firstName: firstName == _undefined || firstName == null
          ? _instance.firstName
          : (firstName as String),
      lastName: lastName == _undefined || lastName == null
          ? _instance.lastName
          : (lastName as String),
      dateOfBirth: dateOfBirth == _undefined
          ? _instance.dateOfBirth
          : (dateOfBirth as DateTime?),
      phoneNumber: phoneNumber == _undefined
          ? _instance.phoneNumber
          : (phoneNumber as String?),
      address: address == _undefined
          ? _instance.address
          : (address as Mutation$UpdateMember$updateMember$profile$address?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateMember$updateMember$profile$address<TRes>
  get address {
    final local$address = _instance.address;
    return local$address == null
        ? CopyWith$Mutation$UpdateMember$updateMember$profile$address.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateMember$updateMember$profile$address(
            local$address,
            (e) => call(address: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateMember$updateMember$profile<TRes>
    implements CopyWith$Mutation$UpdateMember$updateMember$profile<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMember$updateMember$profile(this._res);

  TRes _res;

  call({
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    Mutation$UpdateMember$updateMember$profile$address? address,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateMember$updateMember$profile$address<TRes>
  get address =>
      CopyWith$Mutation$UpdateMember$updateMember$profile$address.stub(_res);
}

class Mutation$UpdateMember$updateMember$profile$address {
  Mutation$UpdateMember$updateMember$profile$address({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.$__typename = 'Address',
  });

  factory Mutation$UpdateMember$updateMember$profile$address.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$street = json['street'];
    final l$city = json['city'];
    final l$state = json['state'];
    final l$postalCode = json['postalCode'];
    final l$country = json['country'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMember$updateMember$profile$address(
      street: (l$street as String),
      city: (l$city as String),
      state: (l$state as String),
      postalCode: (l$postalCode as String),
      country: (l$country as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String street;

  final String city;

  final String state;

  final String postalCode;

  final String country;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$street = street;
    _resultData['street'] = l$street;
    final l$city = city;
    _resultData['city'] = l$city;
    final l$state = state;
    _resultData['state'] = l$state;
    final l$postalCode = postalCode;
    _resultData['postalCode'] = l$postalCode;
    final l$country = country;
    _resultData['country'] = l$country;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$street = street;
    final l$city = city;
    final l$state = state;
    final l$postalCode = postalCode;
    final l$country = country;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$street,
      l$city,
      l$state,
      l$postalCode,
      l$country,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateMember$updateMember$profile$address ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$street = street;
    final lOther$street = other.street;
    if (l$street != lOther$street) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (l$city != lOther$city) {
      return false;
    }
    final l$state = state;
    final lOther$state = other.state;
    if (l$state != lOther$state) {
      return false;
    }
    final l$postalCode = postalCode;
    final lOther$postalCode = other.postalCode;
    if (l$postalCode != lOther$postalCode) {
      return false;
    }
    final l$country = country;
    final lOther$country = other.country;
    if (l$country != lOther$country) {
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

extension UtilityExtension$Mutation$UpdateMember$updateMember$profile$address
    on Mutation$UpdateMember$updateMember$profile$address {
  CopyWith$Mutation$UpdateMember$updateMember$profile$address<
    Mutation$UpdateMember$updateMember$profile$address
  >
  get copyWith => CopyWith$Mutation$UpdateMember$updateMember$profile$address(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$UpdateMember$updateMember$profile$address<
  TRes
> {
  factory CopyWith$Mutation$UpdateMember$updateMember$profile$address(
    Mutation$UpdateMember$updateMember$profile$address instance,
    TRes Function(Mutation$UpdateMember$updateMember$profile$address) then,
  ) = _CopyWithImpl$Mutation$UpdateMember$updateMember$profile$address;

  factory CopyWith$Mutation$UpdateMember$updateMember$profile$address.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateMember$updateMember$profile$address;

  TRes call({
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateMember$updateMember$profile$address<TRes>
    implements
        CopyWith$Mutation$UpdateMember$updateMember$profile$address<TRes> {
  _CopyWithImpl$Mutation$UpdateMember$updateMember$profile$address(
    this._instance,
    this._then,
  );

  final Mutation$UpdateMember$updateMember$profile$address _instance;

  final TRes Function(Mutation$UpdateMember$updateMember$profile$address) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? street = _undefined,
    Object? city = _undefined,
    Object? state = _undefined,
    Object? postalCode = _undefined,
    Object? country = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateMember$updateMember$profile$address(
      street: street == _undefined || street == null
          ? _instance.street
          : (street as String),
      city: city == _undefined || city == null
          ? _instance.city
          : (city as String),
      state: state == _undefined || state == null
          ? _instance.state
          : (state as String),
      postalCode: postalCode == _undefined || postalCode == null
          ? _instance.postalCode
          : (postalCode as String),
      country: country == _undefined || country == null
          ? _instance.country
          : (country as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$UpdateMember$updateMember$profile$address<TRes>
    implements
        CopyWith$Mutation$UpdateMember$updateMember$profile$address<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMember$updateMember$profile$address(
    this._res,
  );

  TRes _res;

  call({
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    String? $__typename,
  }) => _res;
}
