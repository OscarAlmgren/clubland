import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CreateMember {
  factory Variables$Mutation$CreateMember({
    required Input$CreateMemberInput input,
  }) => Variables$Mutation$CreateMember._({r'input': input});

  Variables$Mutation$CreateMember._(this._$data);

  factory Variables$Mutation$CreateMember.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$CreateMemberInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateMember._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreateMemberInput get input =>
      (_$data['input'] as Input$CreateMemberInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateMember<Variables$Mutation$CreateMember>
  get copyWith => CopyWith$Variables$Mutation$CreateMember(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateMember ||
        runtimeType != other.runtimeType) {
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
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateMember<TRes> {
  factory CopyWith$Variables$Mutation$CreateMember(
    Variables$Mutation$CreateMember instance,
    TRes Function(Variables$Mutation$CreateMember) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateMember;

  factory CopyWith$Variables$Mutation$CreateMember.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateMember;

  TRes call({Input$CreateMemberInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateMember<TRes>
    implements CopyWith$Variables$Mutation$CreateMember<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateMember(this._instance, this._then);

  final Variables$Mutation$CreateMember _instance;

  final TRes Function(Variables$Mutation$CreateMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateMember._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$CreateMemberInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateMember<TRes>
    implements CopyWith$Variables$Mutation$CreateMember<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateMember(this._res);

  TRes _res;

  call({Input$CreateMemberInput? input}) => _res;
}

class Mutation$CreateMember {
  Mutation$CreateMember({
    required this.createMember,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateMember.fromJson(Map<String, dynamic> json) {
    final l$createMember = json['createMember'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateMember(
      createMember: Mutation$CreateMember$createMember.fromJson(
        (l$createMember as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateMember$createMember createMember;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createMember = createMember;
    _resultData['createMember'] = l$createMember.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createMember = createMember;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createMember, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateMember || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createMember = createMember;
    final lOther$createMember = other.createMember;
    if (l$createMember != lOther$createMember) {
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

extension UtilityExtension$Mutation$CreateMember on Mutation$CreateMember {
  CopyWith$Mutation$CreateMember<Mutation$CreateMember> get copyWith =>
      CopyWith$Mutation$CreateMember(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateMember<TRes> {
  factory CopyWith$Mutation$CreateMember(
    Mutation$CreateMember instance,
    TRes Function(Mutation$CreateMember) then,
  ) = _CopyWithImpl$Mutation$CreateMember;

  factory CopyWith$Mutation$CreateMember.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateMember;

  TRes call({
    Mutation$CreateMember$createMember? createMember,
    String? $__typename,
  });
  CopyWith$Mutation$CreateMember$createMember<TRes> get createMember;
}

class _CopyWithImpl$Mutation$CreateMember<TRes>
    implements CopyWith$Mutation$CreateMember<TRes> {
  _CopyWithImpl$Mutation$CreateMember(this._instance, this._then);

  final Mutation$CreateMember _instance;

  final TRes Function(Mutation$CreateMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createMember = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateMember(
      createMember: createMember == _undefined || createMember == null
          ? _instance.createMember
          : (createMember as Mutation$CreateMember$createMember),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateMember$createMember<TRes> get createMember {
    final local$createMember = _instance.createMember;
    return CopyWith$Mutation$CreateMember$createMember(
      local$createMember,
      (e) => call(createMember: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CreateMember<TRes>
    implements CopyWith$Mutation$CreateMember<TRes> {
  _CopyWithStubImpl$Mutation$CreateMember(this._res);

  TRes _res;

  call({
    Mutation$CreateMember$createMember? createMember,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateMember$createMember<TRes> get createMember =>
      CopyWith$Mutation$CreateMember$createMember.stub(_res);
}

const documentNodeMutationCreateMember = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateMember'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'CreateMemberInput'),
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
            name: NameNode(value: 'createMember'),
            alias: null,
            arguments: [
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
                  name: NameNode(value: 'blockchainIdentity'),
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
                  name: NameNode(value: 'joinedAt'),
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
Mutation$CreateMember _parserFn$Mutation$CreateMember(
  Map<String, dynamic> data,
) => Mutation$CreateMember.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateMember =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CreateMember?);

class Options$Mutation$CreateMember
    extends graphql.MutationOptions<Mutation$CreateMember> {
  Options$Mutation$CreateMember({
    String? operationName,
    required Variables$Mutation$CreateMember variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateMember? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateMember? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateMember>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateMember(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateMember,
         parserFn: _parserFn$Mutation$CreateMember,
       );

  final OnMutationCompleted$Mutation$CreateMember? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateMember
    extends graphql.WatchQueryOptions<Mutation$CreateMember> {
  WatchOptions$Mutation$CreateMember({
    String? operationName,
    required Variables$Mutation$CreateMember variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateMember? typedOptimisticResult,
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
         document: documentNodeMutationCreateMember,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateMember,
       );
}

extension ClientExtension$Mutation$CreateMember on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateMember>> mutate$CreateMember(
    Options$Mutation$CreateMember options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateMember> watchMutation$CreateMember(
    WatchOptions$Mutation$CreateMember options,
  ) => this.watchMutation(options);
}

class Mutation$CreateMember$createMember {
  Mutation$CreateMember$createMember({
    required this.id,
    required this.clubId,
    required this.userId,
    required this.memberNumber,
    required this.membershipType,
    required this.status,
    this.blockchainIdentity,
    this.profile,
    required this.joinedAt,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Member',
  });

  factory Mutation$CreateMember$createMember.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$userId = json['userId'];
    final l$memberNumber = json['memberNumber'];
    final l$membershipType = json['membershipType'];
    final l$status = json['status'];
    final l$blockchainIdentity = json['blockchainIdentity'];
    final l$profile = json['profile'];
    final l$joinedAt = json['joinedAt'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateMember$createMember(
      id: (l$id as String),
      clubId: (l$clubId as String),
      userId: (l$userId as String),
      memberNumber: (l$memberNumber as String),
      membershipType: fromJson$Enum$MembershipType(
        (l$membershipType as String),
      ),
      status: fromJson$Enum$MemberStatus((l$status as String)),
      blockchainIdentity: (l$blockchainIdentity as String?),
      profile: l$profile == null
          ? null
          : Mutation$CreateMember$createMember$profile.fromJson(
              (l$profile as Map<String, dynamic>),
            ),
      joinedAt: DateTime.parse((l$joinedAt as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
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

  final String? blockchainIdentity;

  final Mutation$CreateMember$createMember$profile? profile;

  final DateTime joinedAt;

  final DateTime createdAt;

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
    final l$blockchainIdentity = blockchainIdentity;
    _resultData['blockchainIdentity'] = l$blockchainIdentity;
    final l$profile = profile;
    _resultData['profile'] = l$profile?.toJson();
    final l$joinedAt = joinedAt;
    _resultData['joinedAt'] = l$joinedAt.toIso8601String();
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
    final l$userId = userId;
    final l$memberNumber = memberNumber;
    final l$membershipType = membershipType;
    final l$status = status;
    final l$blockchainIdentity = blockchainIdentity;
    final l$profile = profile;
    final l$joinedAt = joinedAt;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$userId,
      l$memberNumber,
      l$membershipType,
      l$status,
      l$blockchainIdentity,
      l$profile,
      l$joinedAt,
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
    if (other is! Mutation$CreateMember$createMember ||
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
    final l$blockchainIdentity = blockchainIdentity;
    final lOther$blockchainIdentity = other.blockchainIdentity;
    if (l$blockchainIdentity != lOther$blockchainIdentity) {
      return false;
    }
    final l$profile = profile;
    final lOther$profile = other.profile;
    if (l$profile != lOther$profile) {
      return false;
    }
    final l$joinedAt = joinedAt;
    final lOther$joinedAt = other.joinedAt;
    if (l$joinedAt != lOther$joinedAt) {
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

extension UtilityExtension$Mutation$CreateMember$createMember
    on Mutation$CreateMember$createMember {
  CopyWith$Mutation$CreateMember$createMember<
    Mutation$CreateMember$createMember
  >
  get copyWith => CopyWith$Mutation$CreateMember$createMember(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateMember$createMember<TRes> {
  factory CopyWith$Mutation$CreateMember$createMember(
    Mutation$CreateMember$createMember instance,
    TRes Function(Mutation$CreateMember$createMember) then,
  ) = _CopyWithImpl$Mutation$CreateMember$createMember;

  factory CopyWith$Mutation$CreateMember$createMember.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateMember$createMember;

  TRes call({
    String? id,
    String? clubId,
    String? userId,
    String? memberNumber,
    Enum$MembershipType? membershipType,
    Enum$MemberStatus? status,
    String? blockchainIdentity,
    Mutation$CreateMember$createMember$profile? profile,
    DateTime? joinedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
  CopyWith$Mutation$CreateMember$createMember$profile<TRes> get profile;
}

class _CopyWithImpl$Mutation$CreateMember$createMember<TRes>
    implements CopyWith$Mutation$CreateMember$createMember<TRes> {
  _CopyWithImpl$Mutation$CreateMember$createMember(this._instance, this._then);

  final Mutation$CreateMember$createMember _instance;

  final TRes Function(Mutation$CreateMember$createMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? userId = _undefined,
    Object? memberNumber = _undefined,
    Object? membershipType = _undefined,
    Object? status = _undefined,
    Object? blockchainIdentity = _undefined,
    Object? profile = _undefined,
    Object? joinedAt = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateMember$createMember(
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
      blockchainIdentity: blockchainIdentity == _undefined
          ? _instance.blockchainIdentity
          : (blockchainIdentity as String?),
      profile: profile == _undefined
          ? _instance.profile
          : (profile as Mutation$CreateMember$createMember$profile?),
      joinedAt: joinedAt == _undefined || joinedAt == null
          ? _instance.joinedAt
          : (joinedAt as DateTime),
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

  CopyWith$Mutation$CreateMember$createMember$profile<TRes> get profile {
    final local$profile = _instance.profile;
    return local$profile == null
        ? CopyWith$Mutation$CreateMember$createMember$profile.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateMember$createMember$profile(
            local$profile,
            (e) => call(profile: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateMember$createMember<TRes>
    implements CopyWith$Mutation$CreateMember$createMember<TRes> {
  _CopyWithStubImpl$Mutation$CreateMember$createMember(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? userId,
    String? memberNumber,
    Enum$MembershipType? membershipType,
    Enum$MemberStatus? status,
    String? blockchainIdentity,
    Mutation$CreateMember$createMember$profile? profile,
    DateTime? joinedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateMember$createMember$profile<TRes> get profile =>
      CopyWith$Mutation$CreateMember$createMember$profile.stub(_res);
}

class Mutation$CreateMember$createMember$profile {
  Mutation$CreateMember$createMember$profile({
    required this.firstName,
    required this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.$__typename = 'MemberProfile',
  });

  factory Mutation$CreateMember$createMember$profile.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$dateOfBirth = json['dateOfBirth'];
    final l$phoneNumber = json['phoneNumber'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateMember$createMember$profile(
      firstName: (l$firstName as String),
      lastName: (l$lastName as String),
      dateOfBirth: l$dateOfBirth == null
          ? null
          : DateTime.parse((l$dateOfBirth as String)),
      phoneNumber: (l$phoneNumber as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String firstName;

  final String lastName;

  final DateTime? dateOfBirth;

  final String? phoneNumber;

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
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$firstName,
      l$lastName,
      l$dateOfBirth,
      l$phoneNumber,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateMember$createMember$profile ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateMember$createMember$profile
    on Mutation$CreateMember$createMember$profile {
  CopyWith$Mutation$CreateMember$createMember$profile<
    Mutation$CreateMember$createMember$profile
  >
  get copyWith =>
      CopyWith$Mutation$CreateMember$createMember$profile(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateMember$createMember$profile<TRes> {
  factory CopyWith$Mutation$CreateMember$createMember$profile(
    Mutation$CreateMember$createMember$profile instance,
    TRes Function(Mutation$CreateMember$createMember$profile) then,
  ) = _CopyWithImpl$Mutation$CreateMember$createMember$profile;

  factory CopyWith$Mutation$CreateMember$createMember$profile.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateMember$createMember$profile;

  TRes call({
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateMember$createMember$profile<TRes>
    implements CopyWith$Mutation$CreateMember$createMember$profile<TRes> {
  _CopyWithImpl$Mutation$CreateMember$createMember$profile(
    this._instance,
    this._then,
  );

  final Mutation$CreateMember$createMember$profile _instance;

  final TRes Function(Mutation$CreateMember$createMember$profile) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? dateOfBirth = _undefined,
    Object? phoneNumber = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateMember$createMember$profile(
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
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreateMember$createMember$profile<TRes>
    implements CopyWith$Mutation$CreateMember$createMember$profile<TRes> {
  _CopyWithStubImpl$Mutation$CreateMember$createMember$profile(this._res);

  TRes _res;

  call({
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? $__typename,
  }) => _res;
}
