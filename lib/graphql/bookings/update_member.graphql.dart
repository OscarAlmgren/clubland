import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$UpdateMember {
  factory Variables$Mutation$UpdateMember({
    required String id,
    required Input$UpdateMemberInput input,
  }) => Variables$Mutation$UpdateMember._({r'id': id, r'input': input});

  Variables$Mutation$UpdateMember._(this._$data);

  factory Variables$Mutation$UpdateMember.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$input = data['input'];
    result$data['input'] = Input$UpdateMemberInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateMember._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Input$UpdateMemberInput get input =>
      (_$data['input'] as Input$UpdateMemberInput);

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

  TRes call({String? id, Input$UpdateMemberInput? input});
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
        'input': (input as Input$UpdateMemberInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateMember<TRes>
    implements CopyWith$Variables$Mutation$UpdateMember<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateMember(this._res);

  TRes _res;

  call({String? id, Input$UpdateMemberInput? input}) => _res;
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
            name: NameNode(value: 'UpdateMemberInput'),
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
    this.userId,
    required this.memberNumber,
    required this.membershipType,
    required this.status,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    this.dateOfBirth,
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
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$email = json['email'];
    final l$phone = json['phone'];
    final l$dateOfBirth = json['dateOfBirth'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMember$updateMember(
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
    String? membershipType,
    Enum$MemberStatus? status,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    DateTime? dateOfBirth,
    DateTime? updatedAt,
    String? $__typename,
  });
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
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? phone = _undefined,
    Object? dateOfBirth = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateMember$updateMember(
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
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
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
    String? membershipType,
    Enum$MemberStatus? status,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    DateTime? dateOfBirth,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;
}
