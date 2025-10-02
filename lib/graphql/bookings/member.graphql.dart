import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Member {
  factory Variables$Query$Member({required String id}) =>
      Variables$Query$Member._({r'id': id});

  Variables$Query$Member._(this._$data);

  factory Variables$Query$Member.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$Member._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$Member<Variables$Query$Member> get copyWith =>
      CopyWith$Variables$Query$Member(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Member || runtimeType != other.runtimeType) {
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

abstract class CopyWith$Variables$Query$Member<TRes> {
  factory CopyWith$Variables$Query$Member(
    Variables$Query$Member instance,
    TRes Function(Variables$Query$Member) then,
  ) = _CopyWithImpl$Variables$Query$Member;

  factory CopyWith$Variables$Query$Member.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Member;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$Member<TRes>
    implements CopyWith$Variables$Query$Member<TRes> {
  _CopyWithImpl$Variables$Query$Member(this._instance, this._then);

  final Variables$Query$Member _instance;

  final TRes Function(Variables$Query$Member) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$Member._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$Member<TRes>
    implements CopyWith$Variables$Query$Member<TRes> {
  _CopyWithStubImpl$Variables$Query$Member(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$Member {
  Query$Member({this.member, this.$__typename = 'Query'});

  factory Query$Member.fromJson(Map<String, dynamic> json) {
    final l$member = json['member'];
    final l$$__typename = json['__typename'];
    return Query$Member(
      member: l$member == null
          ? null
          : Query$Member$member.fromJson((l$member as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Member$member? member;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$member = member;
    _resultData['member'] = l$member?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$member = member;
    final l$$__typename = $__typename;
    return Object.hashAll([l$member, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Member || runtimeType != other.runtimeType) {
      return false;
    }
    final l$member = member;
    final lOther$member = other.member;
    if (l$member != lOther$member) {
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

extension UtilityExtension$Query$Member on Query$Member {
  CopyWith$Query$Member<Query$Member> get copyWith =>
      CopyWith$Query$Member(this, (i) => i);
}

abstract class CopyWith$Query$Member<TRes> {
  factory CopyWith$Query$Member(
    Query$Member instance,
    TRes Function(Query$Member) then,
  ) = _CopyWithImpl$Query$Member;

  factory CopyWith$Query$Member.stub(TRes res) = _CopyWithStubImpl$Query$Member;

  TRes call({Query$Member$member? member, String? $__typename});
  CopyWith$Query$Member$member<TRes> get member;
}

class _CopyWithImpl$Query$Member<TRes> implements CopyWith$Query$Member<TRes> {
  _CopyWithImpl$Query$Member(this._instance, this._then);

  final Query$Member _instance;

  final TRes Function(Query$Member) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? member = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$Member(
          member: member == _undefined
              ? _instance.member
              : (member as Query$Member$member?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$Member$member<TRes> get member {
    final local$member = _instance.member;
    return local$member == null
        ? CopyWith$Query$Member$member.stub(_then(_instance))
        : CopyWith$Query$Member$member(local$member, (e) => call(member: e));
  }
}

class _CopyWithStubImpl$Query$Member<TRes>
    implements CopyWith$Query$Member<TRes> {
  _CopyWithStubImpl$Query$Member(this._res);

  TRes _res;

  call({Query$Member$member? member, String? $__typename}) => _res;

  CopyWith$Query$Member$member<TRes> get member =>
      CopyWith$Query$Member$member.stub(_res);
}

const documentNodeQueryMember = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Member'),
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
            name: NameNode(value: 'member'),
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
                        name: NameNode(value: 'emergencyContact'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'name'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'relationship'),
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
                        name: NameNode(value: 'preferences'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'emailNotifications'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'smsNotifications'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'pushNotifications'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'marketingEmails'),
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
Query$Member _parserFn$Query$Member(Map<String, dynamic> data) =>
    Query$Member.fromJson(data);
typedef OnQueryComplete$Query$Member =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Member?);

class Options$Query$Member extends graphql.QueryOptions<Query$Member> {
  Options$Query$Member({
    String? operationName,
    required Variables$Query$Member variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Member? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Member? onComplete,
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
                 data == null ? null : _parserFn$Query$Member(data),
               ),
         onError: onError,
         document: documentNodeQueryMember,
         parserFn: _parserFn$Query$Member,
       );

  final OnQueryComplete$Query$Member? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Member
    extends graphql.WatchQueryOptions<Query$Member> {
  WatchOptions$Query$Member({
    String? operationName,
    required Variables$Query$Member variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Member? typedOptimisticResult,
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
         document: documentNodeQueryMember,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Member,
       );
}

class FetchMoreOptions$Query$Member extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Member({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$Member variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryMember,
       );
}

extension ClientExtension$Query$Member on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Member>> query$Member(
    Options$Query$Member options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$Member> watchQuery$Member(
    WatchOptions$Query$Member options,
  ) => this.watchQuery(options);

  void writeQuery$Member({
    required Query$Member data,
    required Variables$Query$Member variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryMember),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$Member? readQuery$Member({
    required Variables$Query$Member variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMember),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Member.fromJson(result);
  }
}

class Query$Member$member {
  Query$Member$member({
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

  factory Query$Member$member.fromJson(Map<String, dynamic> json) {
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
    return Query$Member$member(
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
          : Query$Member$member$profile.fromJson(
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

  final Query$Member$member$profile? profile;

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
    if (other is! Query$Member$member || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Member$member on Query$Member$member {
  CopyWith$Query$Member$member<Query$Member$member> get copyWith =>
      CopyWith$Query$Member$member(this, (i) => i);
}

abstract class CopyWith$Query$Member$member<TRes> {
  factory CopyWith$Query$Member$member(
    Query$Member$member instance,
    TRes Function(Query$Member$member) then,
  ) = _CopyWithImpl$Query$Member$member;

  factory CopyWith$Query$Member$member.stub(TRes res) =
      _CopyWithStubImpl$Query$Member$member;

  TRes call({
    String? id,
    String? clubId,
    String? userId,
    String? memberNumber,
    Enum$MembershipType? membershipType,
    Enum$MemberStatus? status,
    String? blockchainIdentity,
    Query$Member$member$profile? profile,
    DateTime? joinedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
  CopyWith$Query$Member$member$profile<TRes> get profile;
}

class _CopyWithImpl$Query$Member$member<TRes>
    implements CopyWith$Query$Member$member<TRes> {
  _CopyWithImpl$Query$Member$member(this._instance, this._then);

  final Query$Member$member _instance;

  final TRes Function(Query$Member$member) _then;

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
    Query$Member$member(
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
          : (profile as Query$Member$member$profile?),
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

  CopyWith$Query$Member$member$profile<TRes> get profile {
    final local$profile = _instance.profile;
    return local$profile == null
        ? CopyWith$Query$Member$member$profile.stub(_then(_instance))
        : CopyWith$Query$Member$member$profile(
            local$profile,
            (e) => call(profile: e),
          );
  }
}

class _CopyWithStubImpl$Query$Member$member<TRes>
    implements CopyWith$Query$Member$member<TRes> {
  _CopyWithStubImpl$Query$Member$member(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? userId,
    String? memberNumber,
    Enum$MembershipType? membershipType,
    Enum$MemberStatus? status,
    String? blockchainIdentity,
    Query$Member$member$profile? profile,
    DateTime? joinedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Member$member$profile<TRes> get profile =>
      CopyWith$Query$Member$member$profile.stub(_res);
}

class Query$Member$member$profile {
  Query$Member$member$profile({
    required this.firstName,
    required this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.address,
    this.emergencyContact,
    this.preferences,
    this.$__typename = 'MemberProfile',
  });

  factory Query$Member$member$profile.fromJson(Map<String, dynamic> json) {
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$dateOfBirth = json['dateOfBirth'];
    final l$phoneNumber = json['phoneNumber'];
    final l$address = json['address'];
    final l$emergencyContact = json['emergencyContact'];
    final l$preferences = json['preferences'];
    final l$$__typename = json['__typename'];
    return Query$Member$member$profile(
      firstName: (l$firstName as String),
      lastName: (l$lastName as String),
      dateOfBirth: l$dateOfBirth == null
          ? null
          : DateTime.parse((l$dateOfBirth as String)),
      phoneNumber: (l$phoneNumber as String?),
      address: l$address == null
          ? null
          : Query$Member$member$profile$address.fromJson(
              (l$address as Map<String, dynamic>),
            ),
      emergencyContact: l$emergencyContact == null
          ? null
          : Query$Member$member$profile$emergencyContact.fromJson(
              (l$emergencyContact as Map<String, dynamic>),
            ),
      preferences: l$preferences == null
          ? null
          : Query$Member$member$profile$preferences.fromJson(
              (l$preferences as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String firstName;

  final String lastName;

  final DateTime? dateOfBirth;

  final String? phoneNumber;

  final Query$Member$member$profile$address? address;

  final Query$Member$member$profile$emergencyContact? emergencyContact;

  final Query$Member$member$profile$preferences? preferences;

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
    final l$emergencyContact = emergencyContact;
    _resultData['emergencyContact'] = l$emergencyContact?.toJson();
    final l$preferences = preferences;
    _resultData['preferences'] = l$preferences?.toJson();
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
    final l$emergencyContact = emergencyContact;
    final l$preferences = preferences;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$firstName,
      l$lastName,
      l$dateOfBirth,
      l$phoneNumber,
      l$address,
      l$emergencyContact,
      l$preferences,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Member$member$profile ||
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
    final l$emergencyContact = emergencyContact;
    final lOther$emergencyContact = other.emergencyContact;
    if (l$emergencyContact != lOther$emergencyContact) {
      return false;
    }
    final l$preferences = preferences;
    final lOther$preferences = other.preferences;
    if (l$preferences != lOther$preferences) {
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

extension UtilityExtension$Query$Member$member$profile
    on Query$Member$member$profile {
  CopyWith$Query$Member$member$profile<Query$Member$member$profile>
  get copyWith => CopyWith$Query$Member$member$profile(this, (i) => i);
}

abstract class CopyWith$Query$Member$member$profile<TRes> {
  factory CopyWith$Query$Member$member$profile(
    Query$Member$member$profile instance,
    TRes Function(Query$Member$member$profile) then,
  ) = _CopyWithImpl$Query$Member$member$profile;

  factory CopyWith$Query$Member$member$profile.stub(TRes res) =
      _CopyWithStubImpl$Query$Member$member$profile;

  TRes call({
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    Query$Member$member$profile$address? address,
    Query$Member$member$profile$emergencyContact? emergencyContact,
    Query$Member$member$profile$preferences? preferences,
    String? $__typename,
  });
  CopyWith$Query$Member$member$profile$address<TRes> get address;
  CopyWith$Query$Member$member$profile$emergencyContact<TRes>
  get emergencyContact;
  CopyWith$Query$Member$member$profile$preferences<TRes> get preferences;
}

class _CopyWithImpl$Query$Member$member$profile<TRes>
    implements CopyWith$Query$Member$member$profile<TRes> {
  _CopyWithImpl$Query$Member$member$profile(this._instance, this._then);

  final Query$Member$member$profile _instance;

  final TRes Function(Query$Member$member$profile) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? dateOfBirth = _undefined,
    Object? phoneNumber = _undefined,
    Object? address = _undefined,
    Object? emergencyContact = _undefined,
    Object? preferences = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Member$member$profile(
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
          : (address as Query$Member$member$profile$address?),
      emergencyContact: emergencyContact == _undefined
          ? _instance.emergencyContact
          : (emergencyContact as Query$Member$member$profile$emergencyContact?),
      preferences: preferences == _undefined
          ? _instance.preferences
          : (preferences as Query$Member$member$profile$preferences?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Member$member$profile$address<TRes> get address {
    final local$address = _instance.address;
    return local$address == null
        ? CopyWith$Query$Member$member$profile$address.stub(_then(_instance))
        : CopyWith$Query$Member$member$profile$address(
            local$address,
            (e) => call(address: e),
          );
  }

  CopyWith$Query$Member$member$profile$emergencyContact<TRes>
  get emergencyContact {
    final local$emergencyContact = _instance.emergencyContact;
    return local$emergencyContact == null
        ? CopyWith$Query$Member$member$profile$emergencyContact.stub(
            _then(_instance),
          )
        : CopyWith$Query$Member$member$profile$emergencyContact(
            local$emergencyContact,
            (e) => call(emergencyContact: e),
          );
  }

  CopyWith$Query$Member$member$profile$preferences<TRes> get preferences {
    final local$preferences = _instance.preferences;
    return local$preferences == null
        ? CopyWith$Query$Member$member$profile$preferences.stub(
            _then(_instance),
          )
        : CopyWith$Query$Member$member$profile$preferences(
            local$preferences,
            (e) => call(preferences: e),
          );
  }
}

class _CopyWithStubImpl$Query$Member$member$profile<TRes>
    implements CopyWith$Query$Member$member$profile<TRes> {
  _CopyWithStubImpl$Query$Member$member$profile(this._res);

  TRes _res;

  call({
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    Query$Member$member$profile$address? address,
    Query$Member$member$profile$emergencyContact? emergencyContact,
    Query$Member$member$profile$preferences? preferences,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Member$member$profile$address<TRes> get address =>
      CopyWith$Query$Member$member$profile$address.stub(_res);

  CopyWith$Query$Member$member$profile$emergencyContact<TRes>
  get emergencyContact =>
      CopyWith$Query$Member$member$profile$emergencyContact.stub(_res);

  CopyWith$Query$Member$member$profile$preferences<TRes> get preferences =>
      CopyWith$Query$Member$member$profile$preferences.stub(_res);
}

class Query$Member$member$profile$address {
  Query$Member$member$profile$address({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.$__typename = 'Address',
  });

  factory Query$Member$member$profile$address.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$street = json['street'];
    final l$city = json['city'];
    final l$state = json['state'];
    final l$postalCode = json['postalCode'];
    final l$country = json['country'];
    final l$$__typename = json['__typename'];
    return Query$Member$member$profile$address(
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
    if (other is! Query$Member$member$profile$address ||
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

extension UtilityExtension$Query$Member$member$profile$address
    on Query$Member$member$profile$address {
  CopyWith$Query$Member$member$profile$address<
    Query$Member$member$profile$address
  >
  get copyWith => CopyWith$Query$Member$member$profile$address(this, (i) => i);
}

abstract class CopyWith$Query$Member$member$profile$address<TRes> {
  factory CopyWith$Query$Member$member$profile$address(
    Query$Member$member$profile$address instance,
    TRes Function(Query$Member$member$profile$address) then,
  ) = _CopyWithImpl$Query$Member$member$profile$address;

  factory CopyWith$Query$Member$member$profile$address.stub(TRes res) =
      _CopyWithStubImpl$Query$Member$member$profile$address;

  TRes call({
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Member$member$profile$address<TRes>
    implements CopyWith$Query$Member$member$profile$address<TRes> {
  _CopyWithImpl$Query$Member$member$profile$address(this._instance, this._then);

  final Query$Member$member$profile$address _instance;

  final TRes Function(Query$Member$member$profile$address) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? street = _undefined,
    Object? city = _undefined,
    Object? state = _undefined,
    Object? postalCode = _undefined,
    Object? country = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Member$member$profile$address(
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

class _CopyWithStubImpl$Query$Member$member$profile$address<TRes>
    implements CopyWith$Query$Member$member$profile$address<TRes> {
  _CopyWithStubImpl$Query$Member$member$profile$address(this._res);

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

class Query$Member$member$profile$emergencyContact {
  Query$Member$member$profile$emergencyContact({
    required this.name,
    required this.relationship,
    required this.phoneNumber,
    this.$__typename = 'EmergencyContact',
  });

  factory Query$Member$member$profile$emergencyContact.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$relationship = json['relationship'];
    final l$phoneNumber = json['phoneNumber'];
    final l$$__typename = json['__typename'];
    return Query$Member$member$profile$emergencyContact(
      name: (l$name as String),
      relationship: (l$relationship as String),
      phoneNumber: (l$phoneNumber as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String relationship;

  final String phoneNumber;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$relationship = relationship;
    _resultData['relationship'] = l$relationship;
    final l$phoneNumber = phoneNumber;
    _resultData['phoneNumber'] = l$phoneNumber;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$relationship = relationship;
    final l$phoneNumber = phoneNumber;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$relationship,
      l$phoneNumber,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Member$member$profile$emergencyContact ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$relationship = relationship;
    final lOther$relationship = other.relationship;
    if (l$relationship != lOther$relationship) {
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

extension UtilityExtension$Query$Member$member$profile$emergencyContact
    on Query$Member$member$profile$emergencyContact {
  CopyWith$Query$Member$member$profile$emergencyContact<
    Query$Member$member$profile$emergencyContact
  >
  get copyWith =>
      CopyWith$Query$Member$member$profile$emergencyContact(this, (i) => i);
}

abstract class CopyWith$Query$Member$member$profile$emergencyContact<TRes> {
  factory CopyWith$Query$Member$member$profile$emergencyContact(
    Query$Member$member$profile$emergencyContact instance,
    TRes Function(Query$Member$member$profile$emergencyContact) then,
  ) = _CopyWithImpl$Query$Member$member$profile$emergencyContact;

  factory CopyWith$Query$Member$member$profile$emergencyContact.stub(TRes res) =
      _CopyWithStubImpl$Query$Member$member$profile$emergencyContact;

  TRes call({
    String? name,
    String? relationship,
    String? phoneNumber,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Member$member$profile$emergencyContact<TRes>
    implements CopyWith$Query$Member$member$profile$emergencyContact<TRes> {
  _CopyWithImpl$Query$Member$member$profile$emergencyContact(
    this._instance,
    this._then,
  );

  final Query$Member$member$profile$emergencyContact _instance;

  final TRes Function(Query$Member$member$profile$emergencyContact) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? relationship = _undefined,
    Object? phoneNumber = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Member$member$profile$emergencyContact(
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      relationship: relationship == _undefined || relationship == null
          ? _instance.relationship
          : (relationship as String),
      phoneNumber: phoneNumber == _undefined || phoneNumber == null
          ? _instance.phoneNumber
          : (phoneNumber as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Member$member$profile$emergencyContact<TRes>
    implements CopyWith$Query$Member$member$profile$emergencyContact<TRes> {
  _CopyWithStubImpl$Query$Member$member$profile$emergencyContact(this._res);

  TRes _res;

  call({
    String? name,
    String? relationship,
    String? phoneNumber,
    String? $__typename,
  }) => _res;
}

class Query$Member$member$profile$preferences {
  Query$Member$member$profile$preferences({
    required this.emailNotifications,
    required this.smsNotifications,
    required this.pushNotifications,
    required this.marketingEmails,
    this.$__typename = 'MemberPreferences',
  });

  factory Query$Member$member$profile$preferences.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$emailNotifications = json['emailNotifications'];
    final l$smsNotifications = json['smsNotifications'];
    final l$pushNotifications = json['pushNotifications'];
    final l$marketingEmails = json['marketingEmails'];
    final l$$__typename = json['__typename'];
    return Query$Member$member$profile$preferences(
      emailNotifications: (l$emailNotifications as bool),
      smsNotifications: (l$smsNotifications as bool),
      pushNotifications: (l$pushNotifications as bool),
      marketingEmails: (l$marketingEmails as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool emailNotifications;

  final bool smsNotifications;

  final bool pushNotifications;

  final bool marketingEmails;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$emailNotifications = emailNotifications;
    _resultData['emailNotifications'] = l$emailNotifications;
    final l$smsNotifications = smsNotifications;
    _resultData['smsNotifications'] = l$smsNotifications;
    final l$pushNotifications = pushNotifications;
    _resultData['pushNotifications'] = l$pushNotifications;
    final l$marketingEmails = marketingEmails;
    _resultData['marketingEmails'] = l$marketingEmails;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$emailNotifications = emailNotifications;
    final l$smsNotifications = smsNotifications;
    final l$pushNotifications = pushNotifications;
    final l$marketingEmails = marketingEmails;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$emailNotifications,
      l$smsNotifications,
      l$pushNotifications,
      l$marketingEmails,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Member$member$profile$preferences ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$emailNotifications = emailNotifications;
    final lOther$emailNotifications = other.emailNotifications;
    if (l$emailNotifications != lOther$emailNotifications) {
      return false;
    }
    final l$smsNotifications = smsNotifications;
    final lOther$smsNotifications = other.smsNotifications;
    if (l$smsNotifications != lOther$smsNotifications) {
      return false;
    }
    final l$pushNotifications = pushNotifications;
    final lOther$pushNotifications = other.pushNotifications;
    if (l$pushNotifications != lOther$pushNotifications) {
      return false;
    }
    final l$marketingEmails = marketingEmails;
    final lOther$marketingEmails = other.marketingEmails;
    if (l$marketingEmails != lOther$marketingEmails) {
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

extension UtilityExtension$Query$Member$member$profile$preferences
    on Query$Member$member$profile$preferences {
  CopyWith$Query$Member$member$profile$preferences<
    Query$Member$member$profile$preferences
  >
  get copyWith =>
      CopyWith$Query$Member$member$profile$preferences(this, (i) => i);
}

abstract class CopyWith$Query$Member$member$profile$preferences<TRes> {
  factory CopyWith$Query$Member$member$profile$preferences(
    Query$Member$member$profile$preferences instance,
    TRes Function(Query$Member$member$profile$preferences) then,
  ) = _CopyWithImpl$Query$Member$member$profile$preferences;

  factory CopyWith$Query$Member$member$profile$preferences.stub(TRes res) =
      _CopyWithStubImpl$Query$Member$member$profile$preferences;

  TRes call({
    bool? emailNotifications,
    bool? smsNotifications,
    bool? pushNotifications,
    bool? marketingEmails,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Member$member$profile$preferences<TRes>
    implements CopyWith$Query$Member$member$profile$preferences<TRes> {
  _CopyWithImpl$Query$Member$member$profile$preferences(
    this._instance,
    this._then,
  );

  final Query$Member$member$profile$preferences _instance;

  final TRes Function(Query$Member$member$profile$preferences) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? emailNotifications = _undefined,
    Object? smsNotifications = _undefined,
    Object? pushNotifications = _undefined,
    Object? marketingEmails = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Member$member$profile$preferences(
      emailNotifications:
          emailNotifications == _undefined || emailNotifications == null
          ? _instance.emailNotifications
          : (emailNotifications as bool),
      smsNotifications:
          smsNotifications == _undefined || smsNotifications == null
          ? _instance.smsNotifications
          : (smsNotifications as bool),
      pushNotifications:
          pushNotifications == _undefined || pushNotifications == null
          ? _instance.pushNotifications
          : (pushNotifications as bool),
      marketingEmails: marketingEmails == _undefined || marketingEmails == null
          ? _instance.marketingEmails
          : (marketingEmails as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Member$member$profile$preferences<TRes>
    implements CopyWith$Query$Member$member$profile$preferences<TRes> {
  _CopyWithStubImpl$Query$Member$member$profile$preferences(this._res);

  TRes _res;

  call({
    bool? emailNotifications,
    bool? smsNotifications,
    bool? pushNotifications,
    bool? marketingEmails,
    String? $__typename,
  }) => _res;
}
