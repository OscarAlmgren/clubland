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
                  name: NameNode(value: 'email'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'phone'),
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
                        name: NameNode(value: 'phone'),
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
                        name: NameNode(value: 'receiveNewsletter'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'receivePromotions'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'allowDataSharing'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'preferredLanguage'),
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
                  name: NameNode(value: 'joinedDate'),
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
    this.userId,
    required this.memberNumber,
    required this.membershipType,
    required this.status,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    this.dateOfBirth,
    this.address,
    this.emergencyContact,
    this.preferences,
    required this.joinedDate,
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
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$email = json['email'];
    final l$phone = json['phone'];
    final l$dateOfBirth = json['dateOfBirth'];
    final l$address = json['address'];
    final l$emergencyContact = json['emergencyContact'];
    final l$preferences = json['preferences'];
    final l$joinedDate = json['joinedDate'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$Member$member(
      id: (l$id as String),
      clubId: (l$clubId as String),
      userId: (l$userId as String?),
      memberNumber: (l$memberNumber as String),
      membershipType: (l$membershipType as String),
      status: fromJson$Enum$MemberStatus((l$status as String)),
      firstName: (l$firstName as String),
      lastName: (l$lastName as String),
      email: (l$email as String),
      phone: (l$phone as String?),
      dateOfBirth: l$dateOfBirth == null
          ? null
          : DateTime.parse((l$dateOfBirth as String)),
      address: l$address == null
          ? null
          : Query$Member$member$address.fromJson(
              (l$address as Map<String, dynamic>),
            ),
      emergencyContact: l$emergencyContact == null
          ? null
          : Query$Member$member$emergencyContact.fromJson(
              (l$emergencyContact as Map<String, dynamic>),
            ),
      preferences: l$preferences == null
          ? null
          : Query$Member$member$preferences.fromJson(
              (l$preferences as Map<String, dynamic>),
            ),
      joinedDate: DateTime.parse((l$joinedDate as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String? userId;

  final String memberNumber;

  final String membershipType;

  final Enum$MemberStatus status;

  final String firstName;

  final String lastName;

  final String email;

  final String? phone;

  final DateTime? dateOfBirth;

  final Query$Member$member$address? address;

  final Query$Member$member$emergencyContact? emergencyContact;

  final Query$Member$member$preferences? preferences;

  final DateTime joinedDate;

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
    _resultData['membershipType'] = l$membershipType;
    final l$status = status;
    _resultData['status'] = toJson$Enum$MemberStatus(l$status);
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$dateOfBirth = dateOfBirth;
    _resultData['dateOfBirth'] = l$dateOfBirth?.toIso8601String();
    final l$address = address;
    _resultData['address'] = l$address?.toJson();
    final l$emergencyContact = emergencyContact;
    _resultData['emergencyContact'] = l$emergencyContact?.toJson();
    final l$preferences = preferences;
    _resultData['preferences'] = l$preferences?.toJson();
    final l$joinedDate = joinedDate;
    _resultData['joinedDate'] = l$joinedDate.toIso8601String();
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
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$email = email;
    final l$phone = phone;
    final l$dateOfBirth = dateOfBirth;
    final l$address = address;
    final l$emergencyContact = emergencyContact;
    final l$preferences = preferences;
    final l$joinedDate = joinedDate;
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
      l$firstName,
      l$lastName,
      l$email,
      l$phone,
      l$dateOfBirth,
      l$address,
      l$emergencyContact,
      l$preferences,
      l$joinedDate,
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
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$dateOfBirth = dateOfBirth;
    final lOther$dateOfBirth = other.dateOfBirth;
    if (l$dateOfBirth != lOther$dateOfBirth) {
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
    final l$joinedDate = joinedDate;
    final lOther$joinedDate = other.joinedDate;
    if (l$joinedDate != lOther$joinedDate) {
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
    String? membershipType,
    Enum$MemberStatus? status,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    DateTime? dateOfBirth,
    Query$Member$member$address? address,
    Query$Member$member$emergencyContact? emergencyContact,
    Query$Member$member$preferences? preferences,
    DateTime? joinedDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
  CopyWith$Query$Member$member$address<TRes> get address;
  CopyWith$Query$Member$member$emergencyContact<TRes> get emergencyContact;
  CopyWith$Query$Member$member$preferences<TRes> get preferences;
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
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? phone = _undefined,
    Object? dateOfBirth = _undefined,
    Object? address = _undefined,
    Object? emergencyContact = _undefined,
    Object? preferences = _undefined,
    Object? joinedDate = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Member$member(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      userId: userId == _undefined ? _instance.userId : (userId as String?),
      memberNumber: memberNumber == _undefined || memberNumber == null
          ? _instance.memberNumber
          : (memberNumber as String),
      membershipType: membershipType == _undefined || membershipType == null
          ? _instance.membershipType
          : (membershipType as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$MemberStatus),
      firstName: firstName == _undefined || firstName == null
          ? _instance.firstName
          : (firstName as String),
      lastName: lastName == _undefined || lastName == null
          ? _instance.lastName
          : (lastName as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      phone: phone == _undefined ? _instance.phone : (phone as String?),
      dateOfBirth: dateOfBirth == _undefined
          ? _instance.dateOfBirth
          : (dateOfBirth as DateTime?),
      address: address == _undefined
          ? _instance.address
          : (address as Query$Member$member$address?),
      emergencyContact: emergencyContact == _undefined
          ? _instance.emergencyContact
          : (emergencyContact as Query$Member$member$emergencyContact?),
      preferences: preferences == _undefined
          ? _instance.preferences
          : (preferences as Query$Member$member$preferences?),
      joinedDate: joinedDate == _undefined || joinedDate == null
          ? _instance.joinedDate
          : (joinedDate as DateTime),
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

  CopyWith$Query$Member$member$address<TRes> get address {
    final local$address = _instance.address;
    return local$address == null
        ? CopyWith$Query$Member$member$address.stub(_then(_instance))
        : CopyWith$Query$Member$member$address(
            local$address,
            (e) => call(address: e),
          );
  }

  CopyWith$Query$Member$member$emergencyContact<TRes> get emergencyContact {
    final local$emergencyContact = _instance.emergencyContact;
    return local$emergencyContact == null
        ? CopyWith$Query$Member$member$emergencyContact.stub(_then(_instance))
        : CopyWith$Query$Member$member$emergencyContact(
            local$emergencyContact,
            (e) => call(emergencyContact: e),
          );
  }

  CopyWith$Query$Member$member$preferences<TRes> get preferences {
    final local$preferences = _instance.preferences;
    return local$preferences == null
        ? CopyWith$Query$Member$member$preferences.stub(_then(_instance))
        : CopyWith$Query$Member$member$preferences(
            local$preferences,
            (e) => call(preferences: e),
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
    String? membershipType,
    Enum$MemberStatus? status,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    DateTime? dateOfBirth,
    Query$Member$member$address? address,
    Query$Member$member$emergencyContact? emergencyContact,
    Query$Member$member$preferences? preferences,
    DateTime? joinedDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Member$member$address<TRes> get address =>
      CopyWith$Query$Member$member$address.stub(_res);

  CopyWith$Query$Member$member$emergencyContact<TRes> get emergencyContact =>
      CopyWith$Query$Member$member$emergencyContact.stub(_res);

  CopyWith$Query$Member$member$preferences<TRes> get preferences =>
      CopyWith$Query$Member$member$preferences.stub(_res);
}

class Query$Member$member$address {
  Query$Member$member$address({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.$__typename = 'Address',
  });

  factory Query$Member$member$address.fromJson(Map<String, dynamic> json) {
    final l$street = json['street'];
    final l$city = json['city'];
    final l$state = json['state'];
    final l$postalCode = json['postalCode'];
    final l$country = json['country'];
    final l$$__typename = json['__typename'];
    return Query$Member$member$address(
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
    if (other is! Query$Member$member$address ||
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

extension UtilityExtension$Query$Member$member$address
    on Query$Member$member$address {
  CopyWith$Query$Member$member$address<Query$Member$member$address>
  get copyWith => CopyWith$Query$Member$member$address(this, (i) => i);
}

abstract class CopyWith$Query$Member$member$address<TRes> {
  factory CopyWith$Query$Member$member$address(
    Query$Member$member$address instance,
    TRes Function(Query$Member$member$address) then,
  ) = _CopyWithImpl$Query$Member$member$address;

  factory CopyWith$Query$Member$member$address.stub(TRes res) =
      _CopyWithStubImpl$Query$Member$member$address;

  TRes call({
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Member$member$address<TRes>
    implements CopyWith$Query$Member$member$address<TRes> {
  _CopyWithImpl$Query$Member$member$address(this._instance, this._then);

  final Query$Member$member$address _instance;

  final TRes Function(Query$Member$member$address) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? street = _undefined,
    Object? city = _undefined,
    Object? state = _undefined,
    Object? postalCode = _undefined,
    Object? country = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Member$member$address(
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

class _CopyWithStubImpl$Query$Member$member$address<TRes>
    implements CopyWith$Query$Member$member$address<TRes> {
  _CopyWithStubImpl$Query$Member$member$address(this._res);

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

class Query$Member$member$emergencyContact {
  Query$Member$member$emergencyContact({
    required this.name,
    required this.relationship,
    required this.phone,
    this.$__typename = 'EmergencyContact',
  });

  factory Query$Member$member$emergencyContact.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$relationship = json['relationship'];
    final l$phone = json['phone'];
    final l$$__typename = json['__typename'];
    return Query$Member$member$emergencyContact(
      name: (l$name as String),
      relationship: (l$relationship as String),
      phone: (l$phone as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String relationship;

  final String phone;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$relationship = relationship;
    _resultData['relationship'] = l$relationship;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$relationship = relationship;
    final l$phone = phone;
    final l$$__typename = $__typename;
    return Object.hashAll([l$name, l$relationship, l$phone, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Member$member$emergencyContact ||
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
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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

extension UtilityExtension$Query$Member$member$emergencyContact
    on Query$Member$member$emergencyContact {
  CopyWith$Query$Member$member$emergencyContact<
    Query$Member$member$emergencyContact
  >
  get copyWith => CopyWith$Query$Member$member$emergencyContact(this, (i) => i);
}

abstract class CopyWith$Query$Member$member$emergencyContact<TRes> {
  factory CopyWith$Query$Member$member$emergencyContact(
    Query$Member$member$emergencyContact instance,
    TRes Function(Query$Member$member$emergencyContact) then,
  ) = _CopyWithImpl$Query$Member$member$emergencyContact;

  factory CopyWith$Query$Member$member$emergencyContact.stub(TRes res) =
      _CopyWithStubImpl$Query$Member$member$emergencyContact;

  TRes call({
    String? name,
    String? relationship,
    String? phone,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Member$member$emergencyContact<TRes>
    implements CopyWith$Query$Member$member$emergencyContact<TRes> {
  _CopyWithImpl$Query$Member$member$emergencyContact(
    this._instance,
    this._then,
  );

  final Query$Member$member$emergencyContact _instance;

  final TRes Function(Query$Member$member$emergencyContact) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? relationship = _undefined,
    Object? phone = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Member$member$emergencyContact(
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      relationship: relationship == _undefined || relationship == null
          ? _instance.relationship
          : (relationship as String),
      phone: phone == _undefined || phone == null
          ? _instance.phone
          : (phone as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Member$member$emergencyContact<TRes>
    implements CopyWith$Query$Member$member$emergencyContact<TRes> {
  _CopyWithStubImpl$Query$Member$member$emergencyContact(this._res);

  TRes _res;

  call({
    String? name,
    String? relationship,
    String? phone,
    String? $__typename,
  }) => _res;
}

class Query$Member$member$preferences {
  Query$Member$member$preferences({
    required this.receiveNewsletter,
    required this.receivePromotions,
    required this.allowDataSharing,
    this.preferredLanguage,
    this.$__typename = 'MemberPreferences',
  });

  factory Query$Member$member$preferences.fromJson(Map<String, dynamic> json) {
    final l$receiveNewsletter = json['receiveNewsletter'];
    final l$receivePromotions = json['receivePromotions'];
    final l$allowDataSharing = json['allowDataSharing'];
    final l$preferredLanguage = json['preferredLanguage'];
    final l$$__typename = json['__typename'];
    return Query$Member$member$preferences(
      receiveNewsletter: (l$receiveNewsletter as bool),
      receivePromotions: (l$receivePromotions as bool),
      allowDataSharing: (l$allowDataSharing as bool),
      preferredLanguage: (l$preferredLanguage as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool receiveNewsletter;

  final bool receivePromotions;

  final bool allowDataSharing;

  final String? preferredLanguage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$receiveNewsletter = receiveNewsletter;
    _resultData['receiveNewsletter'] = l$receiveNewsletter;
    final l$receivePromotions = receivePromotions;
    _resultData['receivePromotions'] = l$receivePromotions;
    final l$allowDataSharing = allowDataSharing;
    _resultData['allowDataSharing'] = l$allowDataSharing;
    final l$preferredLanguage = preferredLanguage;
    _resultData['preferredLanguage'] = l$preferredLanguage;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$receiveNewsletter = receiveNewsletter;
    final l$receivePromotions = receivePromotions;
    final l$allowDataSharing = allowDataSharing;
    final l$preferredLanguage = preferredLanguage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$receiveNewsletter,
      l$receivePromotions,
      l$allowDataSharing,
      l$preferredLanguage,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Member$member$preferences ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$receiveNewsletter = receiveNewsletter;
    final lOther$receiveNewsletter = other.receiveNewsletter;
    if (l$receiveNewsletter != lOther$receiveNewsletter) {
      return false;
    }
    final l$receivePromotions = receivePromotions;
    final lOther$receivePromotions = other.receivePromotions;
    if (l$receivePromotions != lOther$receivePromotions) {
      return false;
    }
    final l$allowDataSharing = allowDataSharing;
    final lOther$allowDataSharing = other.allowDataSharing;
    if (l$allowDataSharing != lOther$allowDataSharing) {
      return false;
    }
    final l$preferredLanguage = preferredLanguage;
    final lOther$preferredLanguage = other.preferredLanguage;
    if (l$preferredLanguage != lOther$preferredLanguage) {
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

extension UtilityExtension$Query$Member$member$preferences
    on Query$Member$member$preferences {
  CopyWith$Query$Member$member$preferences<Query$Member$member$preferences>
  get copyWith => CopyWith$Query$Member$member$preferences(this, (i) => i);
}

abstract class CopyWith$Query$Member$member$preferences<TRes> {
  factory CopyWith$Query$Member$member$preferences(
    Query$Member$member$preferences instance,
    TRes Function(Query$Member$member$preferences) then,
  ) = _CopyWithImpl$Query$Member$member$preferences;

  factory CopyWith$Query$Member$member$preferences.stub(TRes res) =
      _CopyWithStubImpl$Query$Member$member$preferences;

  TRes call({
    bool? receiveNewsletter,
    bool? receivePromotions,
    bool? allowDataSharing,
    String? preferredLanguage,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Member$member$preferences<TRes>
    implements CopyWith$Query$Member$member$preferences<TRes> {
  _CopyWithImpl$Query$Member$member$preferences(this._instance, this._then);

  final Query$Member$member$preferences _instance;

  final TRes Function(Query$Member$member$preferences) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? receiveNewsletter = _undefined,
    Object? receivePromotions = _undefined,
    Object? allowDataSharing = _undefined,
    Object? preferredLanguage = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Member$member$preferences(
      receiveNewsletter:
          receiveNewsletter == _undefined || receiveNewsletter == null
          ? _instance.receiveNewsletter
          : (receiveNewsletter as bool),
      receivePromotions:
          receivePromotions == _undefined || receivePromotions == null
          ? _instance.receivePromotions
          : (receivePromotions as bool),
      allowDataSharing:
          allowDataSharing == _undefined || allowDataSharing == null
          ? _instance.allowDataSharing
          : (allowDataSharing as bool),
      preferredLanguage: preferredLanguage == _undefined
          ? _instance.preferredLanguage
          : (preferredLanguage as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Member$member$preferences<TRes>
    implements CopyWith$Query$Member$member$preferences<TRes> {
  _CopyWithStubImpl$Query$Member$member$preferences(this._res);

  TRes _res;

  call({
    bool? receiveNewsletter,
    bool? receivePromotions,
    bool? allowDataSharing,
    String? preferredLanguage,
    String? $__typename,
  }) => _res;
}
