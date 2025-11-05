class Input$LoginInput {
  factory Input$LoginInput({required String email, required String password}) =>
      Input$LoginInput._({r'email': email, r'password': password});

  Input$LoginInput._(this._$data);

  factory Input$LoginInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    return Input$LoginInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get password => (_$data['password'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    return result$data;
  }

  CopyWith$Input$LoginInput<Input$LoginInput> get copyWith =>
      CopyWith$Input$LoginInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$LoginInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$password = password;
    return Object.hashAll([l$email, l$password]);
  }
}

abstract class CopyWith$Input$LoginInput<TRes> {
  factory CopyWith$Input$LoginInput(
    Input$LoginInput instance,
    TRes Function(Input$LoginInput) then,
  ) = _CopyWithImpl$Input$LoginInput;

  factory CopyWith$Input$LoginInput.stub(TRes res) =
      _CopyWithStubImpl$Input$LoginInput;

  TRes call({String? email, String? password});
}

class _CopyWithImpl$Input$LoginInput<TRes>
    implements CopyWith$Input$LoginInput<TRes> {
  _CopyWithImpl$Input$LoginInput(this._instance, this._then);

  final Input$LoginInput _instance;

  final TRes Function(Input$LoginInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? email = _undefined, Object? password = _undefined}) =>
      _then(
        Input$LoginInput._({
          ..._instance._$data,
          if (email != _undefined && email != null) 'email': (email as String),
          if (password != _undefined && password != null)
            'password': (password as String),
        }),
      );
}

class _CopyWithStubImpl$Input$LoginInput<TRes>
    implements CopyWith$Input$LoginInput<TRes> {
  _CopyWithStubImpl$Input$LoginInput(this._res);

  TRes _res;

  call({String? email, String? password}) => _res;
}

class Input$RegisterInput {
  factory Input$RegisterInput({
    required String email,
    required String password,
    required String username,
    required String clubId,
    required String firstName,
    required String lastName,
  }) => Input$RegisterInput._({
    r'email': email,
    r'password': password,
    r'username': username,
    r'clubId': clubId,
    r'firstName': firstName,
    r'lastName': lastName,
  });

  Input$RegisterInput._(this._$data);

  factory Input$RegisterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    final l$username = data['username'];
    result$data['username'] = (l$username as String);
    final l$clubId = data['clubId'];
    result$data['clubId'] = (l$clubId as String);
    final l$firstName = data['firstName'];
    result$data['firstName'] = (l$firstName as String);
    final l$lastName = data['lastName'];
    result$data['lastName'] = (l$lastName as String);
    return Input$RegisterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get password => (_$data['password'] as String);

  String get username => (_$data['username'] as String);

  String get clubId => (_$data['clubId'] as String);

  String get firstName => (_$data['firstName'] as String);

  String get lastName => (_$data['lastName'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    final l$username = username;
    result$data['username'] = l$username;
    final l$clubId = clubId;
    result$data['clubId'] = l$clubId;
    final l$firstName = firstName;
    result$data['firstName'] = l$firstName;
    final l$lastName = lastName;
    result$data['lastName'] = l$lastName;
    return result$data;
  }

  CopyWith$Input$RegisterInput<Input$RegisterInput> get copyWith =>
      CopyWith$Input$RegisterInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$RegisterInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
      return false;
    }
    final l$clubId = clubId;
    final lOther$clubId = other.clubId;
    if (l$clubId != lOther$clubId) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$password = password;
    final l$username = username;
    final l$clubId = clubId;
    final l$firstName = firstName;
    final l$lastName = lastName;
    return Object.hashAll([
      l$email,
      l$password,
      l$username,
      l$clubId,
      l$firstName,
      l$lastName,
    ]);
  }
}

abstract class CopyWith$Input$RegisterInput<TRes> {
  factory CopyWith$Input$RegisterInput(
    Input$RegisterInput instance,
    TRes Function(Input$RegisterInput) then,
  ) = _CopyWithImpl$Input$RegisterInput;

  factory CopyWith$Input$RegisterInput.stub(TRes res) =
      _CopyWithStubImpl$Input$RegisterInput;

  TRes call({
    String? email,
    String? password,
    String? username,
    String? clubId,
    String? firstName,
    String? lastName,
  });
}

class _CopyWithImpl$Input$RegisterInput<TRes>
    implements CopyWith$Input$RegisterInput<TRes> {
  _CopyWithImpl$Input$RegisterInput(this._instance, this._then);

  final Input$RegisterInput _instance;

  final TRes Function(Input$RegisterInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? password = _undefined,
    Object? username = _undefined,
    Object? clubId = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
  }) => _then(
    Input$RegisterInput._({
      ..._instance._$data,
      if (email != _undefined && email != null) 'email': (email as String),
      if (password != _undefined && password != null)
        'password': (password as String),
      if (username != _undefined && username != null)
        'username': (username as String),
      if (clubId != _undefined && clubId != null) 'clubId': (clubId as String),
      if (firstName != _undefined && firstName != null)
        'firstName': (firstName as String),
      if (lastName != _undefined && lastName != null)
        'lastName': (lastName as String),
    }),
  );
}

class _CopyWithStubImpl$Input$RegisterInput<TRes>
    implements CopyWith$Input$RegisterInput<TRes> {
  _CopyWithStubImpl$Input$RegisterInput(this._res);

  TRes _res;

  call({
    String? email,
    String? password,
    String? username,
    String? clubId,
    String? firstName,
    String? lastName,
  }) => _res;
}

class Input$PasskeyCredentialInput {
  factory Input$PasskeyCredentialInput({
    required String id,
    required String rawId,
    required String type,
    required String response,
  }) => Input$PasskeyCredentialInput._({
    r'id': id,
    r'rawId': rawId,
    r'type': type,
    r'response': response,
  });

  Input$PasskeyCredentialInput._(this._$data);

  factory Input$PasskeyCredentialInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$rawId = data['rawId'];
    result$data['rawId'] = (l$rawId as String);
    final l$type = data['type'];
    result$data['type'] = (l$type as String);
    final l$response = data['response'];
    result$data['response'] = (l$response as String);
    return Input$PasskeyCredentialInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get rawId => (_$data['rawId'] as String);

  String get type => (_$data['type'] as String);

  String get response => (_$data['response'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$rawId = rawId;
    result$data['rawId'] = l$rawId;
    final l$type = type;
    result$data['type'] = l$type;
    final l$response = response;
    result$data['response'] = l$response;
    return result$data;
  }

  CopyWith$Input$PasskeyCredentialInput<Input$PasskeyCredentialInput>
  get copyWith => CopyWith$Input$PasskeyCredentialInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$PasskeyCredentialInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$rawId = rawId;
    final lOther$rawId = other.rawId;
    if (l$rawId != lOther$rawId) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$response = response;
    final lOther$response = other.response;
    if (l$response != lOther$response) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$rawId = rawId;
    final l$type = type;
    final l$response = response;
    return Object.hashAll([l$id, l$rawId, l$type, l$response]);
  }
}

abstract class CopyWith$Input$PasskeyCredentialInput<TRes> {
  factory CopyWith$Input$PasskeyCredentialInput(
    Input$PasskeyCredentialInput instance,
    TRes Function(Input$PasskeyCredentialInput) then,
  ) = _CopyWithImpl$Input$PasskeyCredentialInput;

  factory CopyWith$Input$PasskeyCredentialInput.stub(TRes res) =
      _CopyWithStubImpl$Input$PasskeyCredentialInput;

  TRes call({String? id, String? rawId, String? type, String? response});
}

class _CopyWithImpl$Input$PasskeyCredentialInput<TRes>
    implements CopyWith$Input$PasskeyCredentialInput<TRes> {
  _CopyWithImpl$Input$PasskeyCredentialInput(this._instance, this._then);

  final Input$PasskeyCredentialInput _instance;

  final TRes Function(Input$PasskeyCredentialInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? rawId = _undefined,
    Object? type = _undefined,
    Object? response = _undefined,
  }) => _then(
    Input$PasskeyCredentialInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (rawId != _undefined && rawId != null) 'rawId': (rawId as String),
      if (type != _undefined && type != null) 'type': (type as String),
      if (response != _undefined && response != null)
        'response': (response as String),
    }),
  );
}

class _CopyWithStubImpl$Input$PasskeyCredentialInput<TRes>
    implements CopyWith$Input$PasskeyCredentialInput<TRes> {
  _CopyWithStubImpl$Input$PasskeyCredentialInput(this._res);

  TRes _res;

  call({String? id, String? rawId, String? type, String? response}) => _res;
}

class Input$CreateMemberInput {
  factory Input$CreateMemberInput({
    required String userId,
    required Enum$MembershipType membershipType,
    required Input$MemberProfileInput profile,
  }) => Input$CreateMemberInput._({
    r'userId': userId,
    r'membershipType': membershipType,
    r'profile': profile,
  });

  Input$CreateMemberInput._(this._$data);

  factory Input$CreateMemberInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    final l$membershipType = data['membershipType'];
    result$data['membershipType'] = fromJson$Enum$MembershipType(
      (l$membershipType as String),
    );
    final l$profile = data['profile'];
    result$data['profile'] = Input$MemberProfileInput.fromJson(
      (l$profile as Map<String, dynamic>),
    );
    return Input$CreateMemberInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);

  Enum$MembershipType get membershipType =>
      (_$data['membershipType'] as Enum$MembershipType);

  Input$MemberProfileInput get profile =>
      (_$data['profile'] as Input$MemberProfileInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    final l$membershipType = membershipType;
    result$data['membershipType'] = toJson$Enum$MembershipType(
      l$membershipType,
    );
    final l$profile = profile;
    result$data['profile'] = l$profile.toJson();
    return result$data;
  }

  CopyWith$Input$CreateMemberInput<Input$CreateMemberInput> get copyWith =>
      CopyWith$Input$CreateMemberInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateMemberInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$membershipType = membershipType;
    final lOther$membershipType = other.membershipType;
    if (l$membershipType != lOther$membershipType) {
      return false;
    }
    final l$profile = profile;
    final lOther$profile = other.profile;
    if (l$profile != lOther$profile) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    final l$membershipType = membershipType;
    final l$profile = profile;
    return Object.hashAll([l$userId, l$membershipType, l$profile]);
  }
}

abstract class CopyWith$Input$CreateMemberInput<TRes> {
  factory CopyWith$Input$CreateMemberInput(
    Input$CreateMemberInput instance,
    TRes Function(Input$CreateMemberInput) then,
  ) = _CopyWithImpl$Input$CreateMemberInput;

  factory CopyWith$Input$CreateMemberInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateMemberInput;

  TRes call({
    String? userId,
    Enum$MembershipType? membershipType,
    Input$MemberProfileInput? profile,
  });
  CopyWith$Input$MemberProfileInput<TRes> get profile;
}

class _CopyWithImpl$Input$CreateMemberInput<TRes>
    implements CopyWith$Input$CreateMemberInput<TRes> {
  _CopyWithImpl$Input$CreateMemberInput(this._instance, this._then);

  final Input$CreateMemberInput _instance;

  final TRes Function(Input$CreateMemberInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userId = _undefined,
    Object? membershipType = _undefined,
    Object? profile = _undefined,
  }) => _then(
    Input$CreateMemberInput._({
      ..._instance._$data,
      if (userId != _undefined && userId != null) 'userId': (userId as String),
      if (membershipType != _undefined && membershipType != null)
        'membershipType': (membershipType as Enum$MembershipType),
      if (profile != _undefined && profile != null)
        'profile': (profile as Input$MemberProfileInput),
    }),
  );

  CopyWith$Input$MemberProfileInput<TRes> get profile {
    final local$profile = _instance.profile;
    return CopyWith$Input$MemberProfileInput(
      local$profile,
      (e) => call(profile: e),
    );
  }
}

class _CopyWithStubImpl$Input$CreateMemberInput<TRes>
    implements CopyWith$Input$CreateMemberInput<TRes> {
  _CopyWithStubImpl$Input$CreateMemberInput(this._res);

  TRes _res;

  call({
    String? userId,
    Enum$MembershipType? membershipType,
    Input$MemberProfileInput? profile,
  }) => _res;

  CopyWith$Input$MemberProfileInput<TRes> get profile =>
      CopyWith$Input$MemberProfileInput.stub(_res);
}

class Input$MemberProfileInput {
  factory Input$MemberProfileInput({
    required String firstName,
    required String lastName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    Input$AddressInput? address,
    Input$EmergencyContactInput? emergencyContact,
    Input$MemberPreferencesInput? preferences,
  }) => Input$MemberProfileInput._({
    r'firstName': firstName,
    r'lastName': lastName,
    if (dateOfBirth != null) r'dateOfBirth': dateOfBirth,
    if (phoneNumber != null) r'phoneNumber': phoneNumber,
    if (address != null) r'address': address,
    if (emergencyContact != null) r'emergencyContact': emergencyContact,
    if (preferences != null) r'preferences': preferences,
  });

  Input$MemberProfileInput._(this._$data);

  factory Input$MemberProfileInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$firstName = data['firstName'];
    result$data['firstName'] = (l$firstName as String);
    final l$lastName = data['lastName'];
    result$data['lastName'] = (l$lastName as String);
    if (data.containsKey('dateOfBirth')) {
      final l$dateOfBirth = data['dateOfBirth'];
      result$data['dateOfBirth'] = l$dateOfBirth == null
          ? null
          : DateTime.parse((l$dateOfBirth as String));
    }
    if (data.containsKey('phoneNumber')) {
      final l$phoneNumber = data['phoneNumber'];
      result$data['phoneNumber'] = (l$phoneNumber as String?);
    }
    if (data.containsKey('address')) {
      final l$address = data['address'];
      result$data['address'] = l$address == null
          ? null
          : Input$AddressInput.fromJson((l$address as Map<String, dynamic>));
    }
    if (data.containsKey('emergencyContact')) {
      final l$emergencyContact = data['emergencyContact'];
      result$data['emergencyContact'] = l$emergencyContact == null
          ? null
          : Input$EmergencyContactInput.fromJson(
              (l$emergencyContact as Map<String, dynamic>),
            );
    }
    if (data.containsKey('preferences')) {
      final l$preferences = data['preferences'];
      result$data['preferences'] = l$preferences == null
          ? null
          : Input$MemberPreferencesInput.fromJson(
              (l$preferences as Map<String, dynamic>),
            );
    }
    return Input$MemberProfileInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get firstName => (_$data['firstName'] as String);

  String get lastName => (_$data['lastName'] as String);

  DateTime? get dateOfBirth => (_$data['dateOfBirth'] as DateTime?);

  String? get phoneNumber => (_$data['phoneNumber'] as String?);

  Input$AddressInput? get address => (_$data['address'] as Input$AddressInput?);

  Input$EmergencyContactInput? get emergencyContact =>
      (_$data['emergencyContact'] as Input$EmergencyContactInput?);

  Input$MemberPreferencesInput? get preferences =>
      (_$data['preferences'] as Input$MemberPreferencesInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$firstName = firstName;
    result$data['firstName'] = l$firstName;
    final l$lastName = lastName;
    result$data['lastName'] = l$lastName;
    if (_$data.containsKey('dateOfBirth')) {
      final l$dateOfBirth = dateOfBirth;
      result$data['dateOfBirth'] = l$dateOfBirth?.toIso8601String();
    }
    if (_$data.containsKey('phoneNumber')) {
      final l$phoneNumber = phoneNumber;
      result$data['phoneNumber'] = l$phoneNumber;
    }
    if (_$data.containsKey('address')) {
      final l$address = address;
      result$data['address'] = l$address?.toJson();
    }
    if (_$data.containsKey('emergencyContact')) {
      final l$emergencyContact = emergencyContact;
      result$data['emergencyContact'] = l$emergencyContact?.toJson();
    }
    if (_$data.containsKey('preferences')) {
      final l$preferences = preferences;
      result$data['preferences'] = l$preferences?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$MemberProfileInput<Input$MemberProfileInput> get copyWith =>
      CopyWith$Input$MemberProfileInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MemberProfileInput ||
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
    if (_$data.containsKey('dateOfBirth') !=
        other._$data.containsKey('dateOfBirth')) {
      return false;
    }
    if (l$dateOfBirth != lOther$dateOfBirth) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (_$data.containsKey('phoneNumber') !=
        other._$data.containsKey('phoneNumber')) {
      return false;
    }
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (_$data.containsKey('address') != other._$data.containsKey('address')) {
      return false;
    }
    if (l$address != lOther$address) {
      return false;
    }
    final l$emergencyContact = emergencyContact;
    final lOther$emergencyContact = other.emergencyContact;
    if (_$data.containsKey('emergencyContact') !=
        other._$data.containsKey('emergencyContact')) {
      return false;
    }
    if (l$emergencyContact != lOther$emergencyContact) {
      return false;
    }
    final l$preferences = preferences;
    final lOther$preferences = other.preferences;
    if (_$data.containsKey('preferences') !=
        other._$data.containsKey('preferences')) {
      return false;
    }
    if (l$preferences != lOther$preferences) {
      return false;
    }
    return true;
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
    return Object.hashAll([
      l$firstName,
      l$lastName,
      _$data.containsKey('dateOfBirth') ? l$dateOfBirth : const {},
      _$data.containsKey('phoneNumber') ? l$phoneNumber : const {},
      _$data.containsKey('address') ? l$address : const {},
      _$data.containsKey('emergencyContact') ? l$emergencyContact : const {},
      _$data.containsKey('preferences') ? l$preferences : const {},
    ]);
  }
}

abstract class CopyWith$Input$MemberProfileInput<TRes> {
  factory CopyWith$Input$MemberProfileInput(
    Input$MemberProfileInput instance,
    TRes Function(Input$MemberProfileInput) then,
  ) = _CopyWithImpl$Input$MemberProfileInput;

  factory CopyWith$Input$MemberProfileInput.stub(TRes res) =
      _CopyWithStubImpl$Input$MemberProfileInput;

  TRes call({
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    Input$AddressInput? address,
    Input$EmergencyContactInput? emergencyContact,
    Input$MemberPreferencesInput? preferences,
  });
  CopyWith$Input$AddressInput<TRes> get address;
  CopyWith$Input$EmergencyContactInput<TRes> get emergencyContact;
  CopyWith$Input$MemberPreferencesInput<TRes> get preferences;
}

class _CopyWithImpl$Input$MemberProfileInput<TRes>
    implements CopyWith$Input$MemberProfileInput<TRes> {
  _CopyWithImpl$Input$MemberProfileInput(this._instance, this._then);

  final Input$MemberProfileInput _instance;

  final TRes Function(Input$MemberProfileInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? dateOfBirth = _undefined,
    Object? phoneNumber = _undefined,
    Object? address = _undefined,
    Object? emergencyContact = _undefined,
    Object? preferences = _undefined,
  }) => _then(
    Input$MemberProfileInput._({
      ..._instance._$data,
      if (firstName != _undefined && firstName != null)
        'firstName': (firstName as String),
      if (lastName != _undefined && lastName != null)
        'lastName': (lastName as String),
      if (dateOfBirth != _undefined) 'dateOfBirth': (dateOfBirth as DateTime?),
      if (phoneNumber != _undefined) 'phoneNumber': (phoneNumber as String?),
      if (address != _undefined) 'address': (address as Input$AddressInput?),
      if (emergencyContact != _undefined)
        'emergencyContact': (emergencyContact as Input$EmergencyContactInput?),
      if (preferences != _undefined)
        'preferences': (preferences as Input$MemberPreferencesInput?),
    }),
  );

  CopyWith$Input$AddressInput<TRes> get address {
    final local$address = _instance.address;
    return local$address == null
        ? CopyWith$Input$AddressInput.stub(_then(_instance))
        : CopyWith$Input$AddressInput(local$address, (e) => call(address: e));
  }

  CopyWith$Input$EmergencyContactInput<TRes> get emergencyContact {
    final local$emergencyContact = _instance.emergencyContact;
    return local$emergencyContact == null
        ? CopyWith$Input$EmergencyContactInput.stub(_then(_instance))
        : CopyWith$Input$EmergencyContactInput(
            local$emergencyContact,
            (e) => call(emergencyContact: e),
          );
  }

  CopyWith$Input$MemberPreferencesInput<TRes> get preferences {
    final local$preferences = _instance.preferences;
    return local$preferences == null
        ? CopyWith$Input$MemberPreferencesInput.stub(_then(_instance))
        : CopyWith$Input$MemberPreferencesInput(
            local$preferences,
            (e) => call(preferences: e),
          );
  }
}

class _CopyWithStubImpl$Input$MemberProfileInput<TRes>
    implements CopyWith$Input$MemberProfileInput<TRes> {
  _CopyWithStubImpl$Input$MemberProfileInput(this._res);

  TRes _res;

  call({
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    Input$AddressInput? address,
    Input$EmergencyContactInput? emergencyContact,
    Input$MemberPreferencesInput? preferences,
  }) => _res;

  CopyWith$Input$AddressInput<TRes> get address =>
      CopyWith$Input$AddressInput.stub(_res);

  CopyWith$Input$EmergencyContactInput<TRes> get emergencyContact =>
      CopyWith$Input$EmergencyContactInput.stub(_res);

  CopyWith$Input$MemberPreferencesInput<TRes> get preferences =>
      CopyWith$Input$MemberPreferencesInput.stub(_res);
}

class Input$AddressInput {
  factory Input$AddressInput({
    required String street,
    required String city,
    required String state,
    required String postalCode,
    required String country,
  }) => Input$AddressInput._({
    r'street': street,
    r'city': city,
    r'state': state,
    r'postalCode': postalCode,
    r'country': country,
  });

  Input$AddressInput._(this._$data);

  factory Input$AddressInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$street = data['street'];
    result$data['street'] = (l$street as String);
    final l$city = data['city'];
    result$data['city'] = (l$city as String);
    final l$state = data['state'];
    result$data['state'] = (l$state as String);
    final l$postalCode = data['postalCode'];
    result$data['postalCode'] = (l$postalCode as String);
    final l$country = data['country'];
    result$data['country'] = (l$country as String);
    return Input$AddressInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get street => (_$data['street'] as String);

  String get city => (_$data['city'] as String);

  String get state => (_$data['state'] as String);

  String get postalCode => (_$data['postalCode'] as String);

  String get country => (_$data['country'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$street = street;
    result$data['street'] = l$street;
    final l$city = city;
    result$data['city'] = l$city;
    final l$state = state;
    result$data['state'] = l$state;
    final l$postalCode = postalCode;
    result$data['postalCode'] = l$postalCode;
    final l$country = country;
    result$data['country'] = l$country;
    return result$data;
  }

  CopyWith$Input$AddressInput<Input$AddressInput> get copyWith =>
      CopyWith$Input$AddressInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$AddressInput || runtimeType != other.runtimeType) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$street = street;
    final l$city = city;
    final l$state = state;
    final l$postalCode = postalCode;
    final l$country = country;
    return Object.hashAll([l$street, l$city, l$state, l$postalCode, l$country]);
  }
}

abstract class CopyWith$Input$AddressInput<TRes> {
  factory CopyWith$Input$AddressInput(
    Input$AddressInput instance,
    TRes Function(Input$AddressInput) then,
  ) = _CopyWithImpl$Input$AddressInput;

  factory CopyWith$Input$AddressInput.stub(TRes res) =
      _CopyWithStubImpl$Input$AddressInput;

  TRes call({
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
  });
}

class _CopyWithImpl$Input$AddressInput<TRes>
    implements CopyWith$Input$AddressInput<TRes> {
  _CopyWithImpl$Input$AddressInput(this._instance, this._then);

  final Input$AddressInput _instance;

  final TRes Function(Input$AddressInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? street = _undefined,
    Object? city = _undefined,
    Object? state = _undefined,
    Object? postalCode = _undefined,
    Object? country = _undefined,
  }) => _then(
    Input$AddressInput._({
      ..._instance._$data,
      if (street != _undefined && street != null) 'street': (street as String),
      if (city != _undefined && city != null) 'city': (city as String),
      if (state != _undefined && state != null) 'state': (state as String),
      if (postalCode != _undefined && postalCode != null)
        'postalCode': (postalCode as String),
      if (country != _undefined && country != null)
        'country': (country as String),
    }),
  );
}

class _CopyWithStubImpl$Input$AddressInput<TRes>
    implements CopyWith$Input$AddressInput<TRes> {
  _CopyWithStubImpl$Input$AddressInput(this._res);

  TRes _res;

  call({
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
  }) => _res;
}

class Input$EmergencyContactInput {
  factory Input$EmergencyContactInput({
    required String name,
    required String relationship,
    required String phoneNumber,
  }) => Input$EmergencyContactInput._({
    r'name': name,
    r'relationship': relationship,
    r'phoneNumber': phoneNumber,
  });

  Input$EmergencyContactInput._(this._$data);

  factory Input$EmergencyContactInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$relationship = data['relationship'];
    result$data['relationship'] = (l$relationship as String);
    final l$phoneNumber = data['phoneNumber'];
    result$data['phoneNumber'] = (l$phoneNumber as String);
    return Input$EmergencyContactInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String get relationship => (_$data['relationship'] as String);

  String get phoneNumber => (_$data['phoneNumber'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$relationship = relationship;
    result$data['relationship'] = l$relationship;
    final l$phoneNumber = phoneNumber;
    result$data['phoneNumber'] = l$phoneNumber;
    return result$data;
  }

  CopyWith$Input$EmergencyContactInput<Input$EmergencyContactInput>
  get copyWith => CopyWith$Input$EmergencyContactInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$EmergencyContactInput ||
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
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$relationship = relationship;
    final l$phoneNumber = phoneNumber;
    return Object.hashAll([l$name, l$relationship, l$phoneNumber]);
  }
}

abstract class CopyWith$Input$EmergencyContactInput<TRes> {
  factory CopyWith$Input$EmergencyContactInput(
    Input$EmergencyContactInput instance,
    TRes Function(Input$EmergencyContactInput) then,
  ) = _CopyWithImpl$Input$EmergencyContactInput;

  factory CopyWith$Input$EmergencyContactInput.stub(TRes res) =
      _CopyWithStubImpl$Input$EmergencyContactInput;

  TRes call({String? name, String? relationship, String? phoneNumber});
}

class _CopyWithImpl$Input$EmergencyContactInput<TRes>
    implements CopyWith$Input$EmergencyContactInput<TRes> {
  _CopyWithImpl$Input$EmergencyContactInput(this._instance, this._then);

  final Input$EmergencyContactInput _instance;

  final TRes Function(Input$EmergencyContactInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? relationship = _undefined,
    Object? phoneNumber = _undefined,
  }) => _then(
    Input$EmergencyContactInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (relationship != _undefined && relationship != null)
        'relationship': (relationship as String),
      if (phoneNumber != _undefined && phoneNumber != null)
        'phoneNumber': (phoneNumber as String),
    }),
  );
}

class _CopyWithStubImpl$Input$EmergencyContactInput<TRes>
    implements CopyWith$Input$EmergencyContactInput<TRes> {
  _CopyWithStubImpl$Input$EmergencyContactInput(this._res);

  TRes _res;

  call({String? name, String? relationship, String? phoneNumber}) => _res;
}

class Input$MemberPreferencesInput {
  factory Input$MemberPreferencesInput({
    required bool emailNotifications,
    required bool smsNotifications,
    required bool pushNotifications,
    required bool marketingEmails,
  }) => Input$MemberPreferencesInput._({
    r'emailNotifications': emailNotifications,
    r'smsNotifications': smsNotifications,
    r'pushNotifications': pushNotifications,
    r'marketingEmails': marketingEmails,
  });

  Input$MemberPreferencesInput._(this._$data);

  factory Input$MemberPreferencesInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$emailNotifications = data['emailNotifications'];
    result$data['emailNotifications'] = (l$emailNotifications as bool);
    final l$smsNotifications = data['smsNotifications'];
    result$data['smsNotifications'] = (l$smsNotifications as bool);
    final l$pushNotifications = data['pushNotifications'];
    result$data['pushNotifications'] = (l$pushNotifications as bool);
    final l$marketingEmails = data['marketingEmails'];
    result$data['marketingEmails'] = (l$marketingEmails as bool);
    return Input$MemberPreferencesInput._(result$data);
  }

  Map<String, dynamic> _$data;

  bool get emailNotifications => (_$data['emailNotifications'] as bool);

  bool get smsNotifications => (_$data['smsNotifications'] as bool);

  bool get pushNotifications => (_$data['pushNotifications'] as bool);

  bool get marketingEmails => (_$data['marketingEmails'] as bool);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$emailNotifications = emailNotifications;
    result$data['emailNotifications'] = l$emailNotifications;
    final l$smsNotifications = smsNotifications;
    result$data['smsNotifications'] = l$smsNotifications;
    final l$pushNotifications = pushNotifications;
    result$data['pushNotifications'] = l$pushNotifications;
    final l$marketingEmails = marketingEmails;
    result$data['marketingEmails'] = l$marketingEmails;
    return result$data;
  }

  CopyWith$Input$MemberPreferencesInput<Input$MemberPreferencesInput>
  get copyWith => CopyWith$Input$MemberPreferencesInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MemberPreferencesInput ||
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
    return true;
  }

  @override
  int get hashCode {
    final l$emailNotifications = emailNotifications;
    final l$smsNotifications = smsNotifications;
    final l$pushNotifications = pushNotifications;
    final l$marketingEmails = marketingEmails;
    return Object.hashAll([
      l$emailNotifications,
      l$smsNotifications,
      l$pushNotifications,
      l$marketingEmails,
    ]);
  }
}

abstract class CopyWith$Input$MemberPreferencesInput<TRes> {
  factory CopyWith$Input$MemberPreferencesInput(
    Input$MemberPreferencesInput instance,
    TRes Function(Input$MemberPreferencesInput) then,
  ) = _CopyWithImpl$Input$MemberPreferencesInput;

  factory CopyWith$Input$MemberPreferencesInput.stub(TRes res) =
      _CopyWithStubImpl$Input$MemberPreferencesInput;

  TRes call({
    bool? emailNotifications,
    bool? smsNotifications,
    bool? pushNotifications,
    bool? marketingEmails,
  });
}

class _CopyWithImpl$Input$MemberPreferencesInput<TRes>
    implements CopyWith$Input$MemberPreferencesInput<TRes> {
  _CopyWithImpl$Input$MemberPreferencesInput(this._instance, this._then);

  final Input$MemberPreferencesInput _instance;

  final TRes Function(Input$MemberPreferencesInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? emailNotifications = _undefined,
    Object? smsNotifications = _undefined,
    Object? pushNotifications = _undefined,
    Object? marketingEmails = _undefined,
  }) => _then(
    Input$MemberPreferencesInput._({
      ..._instance._$data,
      if (emailNotifications != _undefined && emailNotifications != null)
        'emailNotifications': (emailNotifications as bool),
      if (smsNotifications != _undefined && smsNotifications != null)
        'smsNotifications': (smsNotifications as bool),
      if (pushNotifications != _undefined && pushNotifications != null)
        'pushNotifications': (pushNotifications as bool),
      if (marketingEmails != _undefined && marketingEmails != null)
        'marketingEmails': (marketingEmails as bool),
    }),
  );
}

class _CopyWithStubImpl$Input$MemberPreferencesInput<TRes>
    implements CopyWith$Input$MemberPreferencesInput<TRes> {
  _CopyWithStubImpl$Input$MemberPreferencesInput(this._res);

  TRes _res;

  call({
    bool? emailNotifications,
    bool? smsNotifications,
    bool? pushNotifications,
    bool? marketingEmails,
  }) => _res;
}

class Input$CreateReciprocalAgreementInput {
  factory Input$CreateReciprocalAgreementInput({
    required String partnerClubId,
    required Input$AgreementTermsInput terms,
    required DateTime effectiveDate,
    DateTime? expirationDate,
  }) => Input$CreateReciprocalAgreementInput._({
    r'partnerClubId': partnerClubId,
    r'terms': terms,
    r'effectiveDate': effectiveDate,
    if (expirationDate != null) r'expirationDate': expirationDate,
  });

  Input$CreateReciprocalAgreementInput._(this._$data);

  factory Input$CreateReciprocalAgreementInput.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$partnerClubId = data['partnerClubId'];
    result$data['partnerClubId'] = (l$partnerClubId as String);
    final l$terms = data['terms'];
    result$data['terms'] = Input$AgreementTermsInput.fromJson(
      (l$terms as Map<String, dynamic>),
    );
    final l$effectiveDate = data['effectiveDate'];
    result$data['effectiveDate'] = DateTime.parse((l$effectiveDate as String));
    if (data.containsKey('expirationDate')) {
      final l$expirationDate = data['expirationDate'];
      result$data['expirationDate'] = l$expirationDate == null
          ? null
          : DateTime.parse((l$expirationDate as String));
    }
    return Input$CreateReciprocalAgreementInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get partnerClubId => (_$data['partnerClubId'] as String);

  Input$AgreementTermsInput get terms =>
      (_$data['terms'] as Input$AgreementTermsInput);

  DateTime get effectiveDate => (_$data['effectiveDate'] as DateTime);

  DateTime? get expirationDate => (_$data['expirationDate'] as DateTime?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$partnerClubId = partnerClubId;
    result$data['partnerClubId'] = l$partnerClubId;
    final l$terms = terms;
    result$data['terms'] = l$terms.toJson();
    final l$effectiveDate = effectiveDate;
    result$data['effectiveDate'] = l$effectiveDate.toIso8601String();
    if (_$data.containsKey('expirationDate')) {
      final l$expirationDate = expirationDate;
      result$data['expirationDate'] = l$expirationDate?.toIso8601String();
    }
    return result$data;
  }

  CopyWith$Input$CreateReciprocalAgreementInput<
    Input$CreateReciprocalAgreementInput
  >
  get copyWith => CopyWith$Input$CreateReciprocalAgreementInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateReciprocalAgreementInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$partnerClubId = partnerClubId;
    final lOther$partnerClubId = other.partnerClubId;
    if (l$partnerClubId != lOther$partnerClubId) {
      return false;
    }
    final l$terms = terms;
    final lOther$terms = other.terms;
    if (l$terms != lOther$terms) {
      return false;
    }
    final l$effectiveDate = effectiveDate;
    final lOther$effectiveDate = other.effectiveDate;
    if (l$effectiveDate != lOther$effectiveDate) {
      return false;
    }
    final l$expirationDate = expirationDate;
    final lOther$expirationDate = other.expirationDate;
    if (_$data.containsKey('expirationDate') !=
        other._$data.containsKey('expirationDate')) {
      return false;
    }
    if (l$expirationDate != lOther$expirationDate) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$partnerClubId = partnerClubId;
    final l$terms = terms;
    final l$effectiveDate = effectiveDate;
    final l$expirationDate = expirationDate;
    return Object.hashAll([
      l$partnerClubId,
      l$terms,
      l$effectiveDate,
      _$data.containsKey('expirationDate') ? l$expirationDate : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateReciprocalAgreementInput<TRes> {
  factory CopyWith$Input$CreateReciprocalAgreementInput(
    Input$CreateReciprocalAgreementInput instance,
    TRes Function(Input$CreateReciprocalAgreementInput) then,
  ) = _CopyWithImpl$Input$CreateReciprocalAgreementInput;

  factory CopyWith$Input$CreateReciprocalAgreementInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateReciprocalAgreementInput;

  TRes call({
    String? partnerClubId,
    Input$AgreementTermsInput? terms,
    DateTime? effectiveDate,
    DateTime? expirationDate,
  });
  CopyWith$Input$AgreementTermsInput<TRes> get terms;
}

class _CopyWithImpl$Input$CreateReciprocalAgreementInput<TRes>
    implements CopyWith$Input$CreateReciprocalAgreementInput<TRes> {
  _CopyWithImpl$Input$CreateReciprocalAgreementInput(
    this._instance,
    this._then,
  );

  final Input$CreateReciprocalAgreementInput _instance;

  final TRes Function(Input$CreateReciprocalAgreementInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? partnerClubId = _undefined,
    Object? terms = _undefined,
    Object? effectiveDate = _undefined,
    Object? expirationDate = _undefined,
  }) => _then(
    Input$CreateReciprocalAgreementInput._({
      ..._instance._$data,
      if (partnerClubId != _undefined && partnerClubId != null)
        'partnerClubId': (partnerClubId as String),
      if (terms != _undefined && terms != null)
        'terms': (terms as Input$AgreementTermsInput),
      if (effectiveDate != _undefined && effectiveDate != null)
        'effectiveDate': (effectiveDate as DateTime),
      if (expirationDate != _undefined)
        'expirationDate': (expirationDate as DateTime?),
    }),
  );

  CopyWith$Input$AgreementTermsInput<TRes> get terms {
    final local$terms = _instance.terms;
    return CopyWith$Input$AgreementTermsInput(
      local$terms,
      (e) => call(terms: e),
    );
  }
}

class _CopyWithStubImpl$Input$CreateReciprocalAgreementInput<TRes>
    implements CopyWith$Input$CreateReciprocalAgreementInput<TRes> {
  _CopyWithStubImpl$Input$CreateReciprocalAgreementInput(this._res);

  TRes _res;

  call({
    String? partnerClubId,
    Input$AgreementTermsInput? terms,
    DateTime? effectiveDate,
    DateTime? expirationDate,
  }) => _res;

  CopyWith$Input$AgreementTermsInput<TRes> get terms =>
      CopyWith$Input$AgreementTermsInput.stub(_res);
}

class Input$AgreementTermsInput {
  factory Input$AgreementTermsInput({
    required int maxVisitsPerMonth,
    double? reciprocalFee,
    List<DateTime>? blackoutDates,
    String? specialConditions,
  }) => Input$AgreementTermsInput._({
    r'maxVisitsPerMonth': maxVisitsPerMonth,
    if (reciprocalFee != null) r'reciprocalFee': reciprocalFee,
    if (blackoutDates != null) r'blackoutDates': blackoutDates,
    if (specialConditions != null) r'specialConditions': specialConditions,
  });

  Input$AgreementTermsInput._(this._$data);

  factory Input$AgreementTermsInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$maxVisitsPerMonth = data['maxVisitsPerMonth'];
    result$data['maxVisitsPerMonth'] = (l$maxVisitsPerMonth as int);
    if (data.containsKey('reciprocalFee')) {
      final l$reciprocalFee = data['reciprocalFee'];
      result$data['reciprocalFee'] = (l$reciprocalFee as num?)?.toDouble();
    }
    if (data.containsKey('blackoutDates')) {
      final l$blackoutDates = data['blackoutDates'];
      result$data['blackoutDates'] = (l$blackoutDates as List<dynamic>?)
          ?.map((e) => DateTime.parse((e as String)))
          .toList();
    }
    if (data.containsKey('specialConditions')) {
      final l$specialConditions = data['specialConditions'];
      result$data['specialConditions'] = (l$specialConditions as String?);
    }
    return Input$AgreementTermsInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int get maxVisitsPerMonth => (_$data['maxVisitsPerMonth'] as int);

  double? get reciprocalFee => (_$data['reciprocalFee'] as double?);

  List<DateTime>? get blackoutDates =>
      (_$data['blackoutDates'] as List<DateTime>?);

  String? get specialConditions => (_$data['specialConditions'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    result$data['maxVisitsPerMonth'] = l$maxVisitsPerMonth;
    if (_$data.containsKey('reciprocalFee')) {
      final l$reciprocalFee = reciprocalFee;
      result$data['reciprocalFee'] = l$reciprocalFee;
    }
    if (_$data.containsKey('blackoutDates')) {
      final l$blackoutDates = blackoutDates;
      result$data['blackoutDates'] = l$blackoutDates
          ?.map((e) => e.toIso8601String())
          .toList();
    }
    if (_$data.containsKey('specialConditions')) {
      final l$specialConditions = specialConditions;
      result$data['specialConditions'] = l$specialConditions;
    }
    return result$data;
  }

  CopyWith$Input$AgreementTermsInput<Input$AgreementTermsInput> get copyWith =>
      CopyWith$Input$AgreementTermsInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$AgreementTermsInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    final lOther$maxVisitsPerMonth = other.maxVisitsPerMonth;
    if (l$maxVisitsPerMonth != lOther$maxVisitsPerMonth) {
      return false;
    }
    final l$reciprocalFee = reciprocalFee;
    final lOther$reciprocalFee = other.reciprocalFee;
    if (_$data.containsKey('reciprocalFee') !=
        other._$data.containsKey('reciprocalFee')) {
      return false;
    }
    if (l$reciprocalFee != lOther$reciprocalFee) {
      return false;
    }
    final l$blackoutDates = blackoutDates;
    final lOther$blackoutDates = other.blackoutDates;
    if (_$data.containsKey('blackoutDates') !=
        other._$data.containsKey('blackoutDates')) {
      return false;
    }
    if (l$blackoutDates != null && lOther$blackoutDates != null) {
      if (l$blackoutDates.length != lOther$blackoutDates.length) {
        return false;
      }
      for (int i = 0; i < l$blackoutDates.length; i++) {
        final l$blackoutDates$entry = l$blackoutDates[i];
        final lOther$blackoutDates$entry = lOther$blackoutDates[i];
        if (l$blackoutDates$entry != lOther$blackoutDates$entry) {
          return false;
        }
      }
    } else if (l$blackoutDates != lOther$blackoutDates) {
      return false;
    }
    final l$specialConditions = specialConditions;
    final lOther$specialConditions = other.specialConditions;
    if (_$data.containsKey('specialConditions') !=
        other._$data.containsKey('specialConditions')) {
      return false;
    }
    if (l$specialConditions != lOther$specialConditions) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    final l$reciprocalFee = reciprocalFee;
    final l$blackoutDates = blackoutDates;
    final l$specialConditions = specialConditions;
    return Object.hashAll([
      l$maxVisitsPerMonth,
      _$data.containsKey('reciprocalFee') ? l$reciprocalFee : const {},
      _$data.containsKey('blackoutDates')
          ? l$blackoutDates == null
                ? null
                : Object.hashAll(l$blackoutDates.map((v) => v))
          : const {},
      _$data.containsKey('specialConditions') ? l$specialConditions : const {},
    ]);
  }
}

abstract class CopyWith$Input$AgreementTermsInput<TRes> {
  factory CopyWith$Input$AgreementTermsInput(
    Input$AgreementTermsInput instance,
    TRes Function(Input$AgreementTermsInput) then,
  ) = _CopyWithImpl$Input$AgreementTermsInput;

  factory CopyWith$Input$AgreementTermsInput.stub(TRes res) =
      _CopyWithStubImpl$Input$AgreementTermsInput;

  TRes call({
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    List<DateTime>? blackoutDates,
    String? specialConditions,
  });
}

class _CopyWithImpl$Input$AgreementTermsInput<TRes>
    implements CopyWith$Input$AgreementTermsInput<TRes> {
  _CopyWithImpl$Input$AgreementTermsInput(this._instance, this._then);

  final Input$AgreementTermsInput _instance;

  final TRes Function(Input$AgreementTermsInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? maxVisitsPerMonth = _undefined,
    Object? reciprocalFee = _undefined,
    Object? blackoutDates = _undefined,
    Object? specialConditions = _undefined,
  }) => _then(
    Input$AgreementTermsInput._({
      ..._instance._$data,
      if (maxVisitsPerMonth != _undefined && maxVisitsPerMonth != null)
        'maxVisitsPerMonth': (maxVisitsPerMonth as int),
      if (reciprocalFee != _undefined)
        'reciprocalFee': (reciprocalFee as double?),
      if (blackoutDates != _undefined)
        'blackoutDates': (blackoutDates as List<DateTime>?),
      if (specialConditions != _undefined)
        'specialConditions': (specialConditions as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$AgreementTermsInput<TRes>
    implements CopyWith$Input$AgreementTermsInput<TRes> {
  _CopyWithStubImpl$Input$AgreementTermsInput(this._res);

  TRes _res;

  call({
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    List<DateTime>? blackoutDates,
    String? specialConditions,
  }) => _res;
}

class Input$RecordVisitInput {
  factory Input$RecordVisitInput({
    required String memberId,
    required String visitingClubId,
    List<String>? services,
    double? cost,
  }) => Input$RecordVisitInput._({
    r'memberId': memberId,
    r'visitingClubId': visitingClubId,
    if (services != null) r'services': services,
    if (cost != null) r'cost': cost,
  });

  Input$RecordVisitInput._(this._$data);

  factory Input$RecordVisitInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$memberId = data['memberId'];
    result$data['memberId'] = (l$memberId as String);
    final l$visitingClubId = data['visitingClubId'];
    result$data['visitingClubId'] = (l$visitingClubId as String);
    if (data.containsKey('services')) {
      final l$services = data['services'];
      result$data['services'] = (l$services as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('cost')) {
      final l$cost = data['cost'];
      result$data['cost'] = (l$cost as num?)?.toDouble();
    }
    return Input$RecordVisitInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get memberId => (_$data['memberId'] as String);

  String get visitingClubId => (_$data['visitingClubId'] as String);

  List<String>? get services => (_$data['services'] as List<String>?);

  double? get cost => (_$data['cost'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$memberId = memberId;
    result$data['memberId'] = l$memberId;
    final l$visitingClubId = visitingClubId;
    result$data['visitingClubId'] = l$visitingClubId;
    if (_$data.containsKey('services')) {
      final l$services = services;
      result$data['services'] = l$services?.map((e) => e).toList();
    }
    if (_$data.containsKey('cost')) {
      final l$cost = cost;
      result$data['cost'] = l$cost;
    }
    return result$data;
  }

  CopyWith$Input$RecordVisitInput<Input$RecordVisitInput> get copyWith =>
      CopyWith$Input$RecordVisitInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$RecordVisitInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$memberId = memberId;
    final lOther$memberId = other.memberId;
    if (l$memberId != lOther$memberId) {
      return false;
    }
    final l$visitingClubId = visitingClubId;
    final lOther$visitingClubId = other.visitingClubId;
    if (l$visitingClubId != lOther$visitingClubId) {
      return false;
    }
    final l$services = services;
    final lOther$services = other.services;
    if (_$data.containsKey('services') !=
        other._$data.containsKey('services')) {
      return false;
    }
    if (l$services != null && lOther$services != null) {
      if (l$services.length != lOther$services.length) {
        return false;
      }
      for (int i = 0; i < l$services.length; i++) {
        final l$services$entry = l$services[i];
        final lOther$services$entry = lOther$services[i];
        if (l$services$entry != lOther$services$entry) {
          return false;
        }
      }
    } else if (l$services != lOther$services) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (_$data.containsKey('cost') != other._$data.containsKey('cost')) {
      return false;
    }
    if (l$cost != lOther$cost) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$memberId = memberId;
    final l$visitingClubId = visitingClubId;
    final l$services = services;
    final l$cost = cost;
    return Object.hashAll([
      l$memberId,
      l$visitingClubId,
      _$data.containsKey('services')
          ? l$services == null
                ? null
                : Object.hashAll(l$services.map((v) => v))
          : const {},
      _$data.containsKey('cost') ? l$cost : const {},
    ]);
  }
}

abstract class CopyWith$Input$RecordVisitInput<TRes> {
  factory CopyWith$Input$RecordVisitInput(
    Input$RecordVisitInput instance,
    TRes Function(Input$RecordVisitInput) then,
  ) = _CopyWithImpl$Input$RecordVisitInput;

  factory CopyWith$Input$RecordVisitInput.stub(TRes res) =
      _CopyWithStubImpl$Input$RecordVisitInput;

  TRes call({
    String? memberId,
    String? visitingClubId,
    List<String>? services,
    double? cost,
  });
}

class _CopyWithImpl$Input$RecordVisitInput<TRes>
    implements CopyWith$Input$RecordVisitInput<TRes> {
  _CopyWithImpl$Input$RecordVisitInput(this._instance, this._then);

  final Input$RecordVisitInput _instance;

  final TRes Function(Input$RecordVisitInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? memberId = _undefined,
    Object? visitingClubId = _undefined,
    Object? services = _undefined,
    Object? cost = _undefined,
  }) => _then(
    Input$RecordVisitInput._({
      ..._instance._$data,
      if (memberId != _undefined && memberId != null)
        'memberId': (memberId as String),
      if (visitingClubId != _undefined && visitingClubId != null)
        'visitingClubId': (visitingClubId as String),
      if (services != _undefined) 'services': (services as List<String>?),
      if (cost != _undefined) 'cost': (cost as double?),
    }),
  );
}

class _CopyWithStubImpl$Input$RecordVisitInput<TRes>
    implements CopyWith$Input$RecordVisitInput<TRes> {
  _CopyWithStubImpl$Input$RecordVisitInput(this._res);

  TRes _res;

  call({
    String? memberId,
    String? visitingClubId,
    List<String>? services,
    double? cost,
  }) => _res;
}

class Input$CheckOutVisitInput {
  factory Input$CheckOutVisitInput({
    required String visitId,
    List<String>? services,
    double? cost,
  }) => Input$CheckOutVisitInput._({
    r'visitId': visitId,
    if (services != null) r'services': services,
    if (cost != null) r'cost': cost,
  });

  Input$CheckOutVisitInput._(this._$data);

  factory Input$CheckOutVisitInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$visitId = data['visitId'];
    result$data['visitId'] = (l$visitId as String);
    if (data.containsKey('services')) {
      final l$services = data['services'];
      result$data['services'] = (l$services as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('cost')) {
      final l$cost = data['cost'];
      result$data['cost'] = (l$cost as num?)?.toDouble();
    }
    return Input$CheckOutVisitInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get visitId => (_$data['visitId'] as String);

  List<String>? get services => (_$data['services'] as List<String>?);

  double? get cost => (_$data['cost'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$visitId = visitId;
    result$data['visitId'] = l$visitId;
    if (_$data.containsKey('services')) {
      final l$services = services;
      result$data['services'] = l$services?.map((e) => e).toList();
    }
    if (_$data.containsKey('cost')) {
      final l$cost = cost;
      result$data['cost'] = l$cost;
    }
    return result$data;
  }

  CopyWith$Input$CheckOutVisitInput<Input$CheckOutVisitInput> get copyWith =>
      CopyWith$Input$CheckOutVisitInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CheckOutVisitInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$visitId = visitId;
    final lOther$visitId = other.visitId;
    if (l$visitId != lOther$visitId) {
      return false;
    }
    final l$services = services;
    final lOther$services = other.services;
    if (_$data.containsKey('services') !=
        other._$data.containsKey('services')) {
      return false;
    }
    if (l$services != null && lOther$services != null) {
      if (l$services.length != lOther$services.length) {
        return false;
      }
      for (int i = 0; i < l$services.length; i++) {
        final l$services$entry = l$services[i];
        final lOther$services$entry = lOther$services[i];
        if (l$services$entry != lOther$services$entry) {
          return false;
        }
      }
    } else if (l$services != lOther$services) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (_$data.containsKey('cost') != other._$data.containsKey('cost')) {
      return false;
    }
    if (l$cost != lOther$cost) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$visitId = visitId;
    final l$services = services;
    final l$cost = cost;
    return Object.hashAll([
      l$visitId,
      _$data.containsKey('services')
          ? l$services == null
                ? null
                : Object.hashAll(l$services.map((v) => v))
          : const {},
      _$data.containsKey('cost') ? l$cost : const {},
    ]);
  }
}

abstract class CopyWith$Input$CheckOutVisitInput<TRes> {
  factory CopyWith$Input$CheckOutVisitInput(
    Input$CheckOutVisitInput instance,
    TRes Function(Input$CheckOutVisitInput) then,
  ) = _CopyWithImpl$Input$CheckOutVisitInput;

  factory CopyWith$Input$CheckOutVisitInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CheckOutVisitInput;

  TRes call({String? visitId, List<String>? services, double? cost});
}

class _CopyWithImpl$Input$CheckOutVisitInput<TRes>
    implements CopyWith$Input$CheckOutVisitInput<TRes> {
  _CopyWithImpl$Input$CheckOutVisitInput(this._instance, this._then);

  final Input$CheckOutVisitInput _instance;

  final TRes Function(Input$CheckOutVisitInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? visitId = _undefined,
    Object? services = _undefined,
    Object? cost = _undefined,
  }) => _then(
    Input$CheckOutVisitInput._({
      ..._instance._$data,
      if (visitId != _undefined && visitId != null)
        'visitId': (visitId as String),
      if (services != _undefined) 'services': (services as List<String>?),
      if (cost != _undefined) 'cost': (cost as double?),
    }),
  );
}

class _CopyWithStubImpl$Input$CheckOutVisitInput<TRes>
    implements CopyWith$Input$CheckOutVisitInput<TRes> {
  _CopyWithStubImpl$Input$CheckOutVisitInput(this._res);

  TRes _res;

  call({String? visitId, List<String>? services, double? cost}) => _res;
}

class Input$CreateNotificationInput {
  factory Input$CreateNotificationInput({
    required List<String> userIds,
    required Enum$NotificationType type,
    required String title,
    required String message,
    required List<Enum$NotificationChannel> channels,
    DateTime? scheduledAt,
  }) => Input$CreateNotificationInput._({
    r'userIds': userIds,
    r'type': type,
    r'title': title,
    r'message': message,
    r'channels': channels,
    if (scheduledAt != null) r'scheduledAt': scheduledAt,
  });

  Input$CreateNotificationInput._(this._$data);

  factory Input$CreateNotificationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userIds = data['userIds'];
    result$data['userIds'] = (l$userIds as List<dynamic>)
        .map((e) => (e as String))
        .toList();
    final l$type = data['type'];
    result$data['type'] = fromJson$Enum$NotificationType((l$type as String));
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$message = data['message'];
    result$data['message'] = (l$message as String);
    final l$channels = data['channels'];
    result$data['channels'] = (l$channels as List<dynamic>)
        .map((e) => fromJson$Enum$NotificationChannel((e as String)))
        .toList();
    if (data.containsKey('scheduledAt')) {
      final l$scheduledAt = data['scheduledAt'];
      result$data['scheduledAt'] = l$scheduledAt == null
          ? null
          : DateTime.parse((l$scheduledAt as String));
    }
    return Input$CreateNotificationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String> get userIds => (_$data['userIds'] as List<String>);

  Enum$NotificationType get type => (_$data['type'] as Enum$NotificationType);

  String get title => (_$data['title'] as String);

  String get message => (_$data['message'] as String);

  List<Enum$NotificationChannel> get channels =>
      (_$data['channels'] as List<Enum$NotificationChannel>);

  DateTime? get scheduledAt => (_$data['scheduledAt'] as DateTime?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userIds = userIds;
    result$data['userIds'] = l$userIds.map((e) => e).toList();
    final l$type = type;
    result$data['type'] = toJson$Enum$NotificationType(l$type);
    final l$title = title;
    result$data['title'] = l$title;
    final l$message = message;
    result$data['message'] = l$message;
    final l$channels = channels;
    result$data['channels'] = l$channels
        .map((e) => toJson$Enum$NotificationChannel(e))
        .toList();
    if (_$data.containsKey('scheduledAt')) {
      final l$scheduledAt = scheduledAt;
      result$data['scheduledAt'] = l$scheduledAt?.toIso8601String();
    }
    return result$data;
  }

  CopyWith$Input$CreateNotificationInput<Input$CreateNotificationInput>
  get copyWith => CopyWith$Input$CreateNotificationInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateNotificationInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userIds = userIds;
    final lOther$userIds = other.userIds;
    if (l$userIds.length != lOther$userIds.length) {
      return false;
    }
    for (int i = 0; i < l$userIds.length; i++) {
      final l$userIds$entry = l$userIds[i];
      final lOther$userIds$entry = lOther$userIds[i];
      if (l$userIds$entry != lOther$userIds$entry) {
        return false;
      }
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$channels = channels;
    final lOther$channels = other.channels;
    if (l$channels.length != lOther$channels.length) {
      return false;
    }
    for (int i = 0; i < l$channels.length; i++) {
      final l$channels$entry = l$channels[i];
      final lOther$channels$entry = lOther$channels[i];
      if (l$channels$entry != lOther$channels$entry) {
        return false;
      }
    }
    final l$scheduledAt = scheduledAt;
    final lOther$scheduledAt = other.scheduledAt;
    if (_$data.containsKey('scheduledAt') !=
        other._$data.containsKey('scheduledAt')) {
      return false;
    }
    if (l$scheduledAt != lOther$scheduledAt) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userIds = userIds;
    final l$type = type;
    final l$title = title;
    final l$message = message;
    final l$channels = channels;
    final l$scheduledAt = scheduledAt;
    return Object.hashAll([
      Object.hashAll(l$userIds.map((v) => v)),
      l$type,
      l$title,
      l$message,
      Object.hashAll(l$channels.map((v) => v)),
      _$data.containsKey('scheduledAt') ? l$scheduledAt : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateNotificationInput<TRes> {
  factory CopyWith$Input$CreateNotificationInput(
    Input$CreateNotificationInput instance,
    TRes Function(Input$CreateNotificationInput) then,
  ) = _CopyWithImpl$Input$CreateNotificationInput;

  factory CopyWith$Input$CreateNotificationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateNotificationInput;

  TRes call({
    List<String>? userIds,
    Enum$NotificationType? type,
    String? title,
    String? message,
    List<Enum$NotificationChannel>? channels,
    DateTime? scheduledAt,
  });
}

class _CopyWithImpl$Input$CreateNotificationInput<TRes>
    implements CopyWith$Input$CreateNotificationInput<TRes> {
  _CopyWithImpl$Input$CreateNotificationInput(this._instance, this._then);

  final Input$CreateNotificationInput _instance;

  final TRes Function(Input$CreateNotificationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userIds = _undefined,
    Object? type = _undefined,
    Object? title = _undefined,
    Object? message = _undefined,
    Object? channels = _undefined,
    Object? scheduledAt = _undefined,
  }) => _then(
    Input$CreateNotificationInput._({
      ..._instance._$data,
      if (userIds != _undefined && userIds != null)
        'userIds': (userIds as List<String>),
      if (type != _undefined && type != null)
        'type': (type as Enum$NotificationType),
      if (title != _undefined && title != null) 'title': (title as String),
      if (message != _undefined && message != null)
        'message': (message as String),
      if (channels != _undefined && channels != null)
        'channels': (channels as List<Enum$NotificationChannel>),
      if (scheduledAt != _undefined) 'scheduledAt': (scheduledAt as DateTime?),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateNotificationInput<TRes>
    implements CopyWith$Input$CreateNotificationInput<TRes> {
  _CopyWithStubImpl$Input$CreateNotificationInput(this._res);

  TRes _res;

  call({
    List<String>? userIds,
    Enum$NotificationType? type,
    String? title,
    String? message,
    List<Enum$NotificationChannel>? channels,
    DateTime? scheduledAt,
  }) => _res;
}

class Input$CreateProposalInput {
  factory Input$CreateProposalInput({
    required String title,
    required String description,
    required Enum$ProposalType type,
    required DateTime votingDeadline,
  }) => Input$CreateProposalInput._({
    r'title': title,
    r'description': description,
    r'type': type,
    r'votingDeadline': votingDeadline,
  });

  Input$CreateProposalInput._(this._$data);

  factory Input$CreateProposalInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$description = data['description'];
    result$data['description'] = (l$description as String);
    final l$type = data['type'];
    result$data['type'] = fromJson$Enum$ProposalType((l$type as String));
    final l$votingDeadline = data['votingDeadline'];
    result$data['votingDeadline'] = DateTime.parse(
      (l$votingDeadline as String),
    );
    return Input$CreateProposalInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get title => (_$data['title'] as String);

  String get description => (_$data['description'] as String);

  Enum$ProposalType get type => (_$data['type'] as Enum$ProposalType);

  DateTime get votingDeadline => (_$data['votingDeadline'] as DateTime);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$title = title;
    result$data['title'] = l$title;
    final l$description = description;
    result$data['description'] = l$description;
    final l$type = type;
    result$data['type'] = toJson$Enum$ProposalType(l$type);
    final l$votingDeadline = votingDeadline;
    result$data['votingDeadline'] = l$votingDeadline.toIso8601String();
    return result$data;
  }

  CopyWith$Input$CreateProposalInput<Input$CreateProposalInput> get copyWith =>
      CopyWith$Input$CreateProposalInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateProposalInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$votingDeadline = votingDeadline;
    final lOther$votingDeadline = other.votingDeadline;
    if (l$votingDeadline != lOther$votingDeadline) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$description = description;
    final l$type = type;
    final l$votingDeadline = votingDeadline;
    return Object.hashAll([l$title, l$description, l$type, l$votingDeadline]);
  }
}

abstract class CopyWith$Input$CreateProposalInput<TRes> {
  factory CopyWith$Input$CreateProposalInput(
    Input$CreateProposalInput instance,
    TRes Function(Input$CreateProposalInput) then,
  ) = _CopyWithImpl$Input$CreateProposalInput;

  factory CopyWith$Input$CreateProposalInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateProposalInput;

  TRes call({
    String? title,
    String? description,
    Enum$ProposalType? type,
    DateTime? votingDeadline,
  });
}

class _CopyWithImpl$Input$CreateProposalInput<TRes>
    implements CopyWith$Input$CreateProposalInput<TRes> {
  _CopyWithImpl$Input$CreateProposalInput(this._instance, this._then);

  final Input$CreateProposalInput _instance;

  final TRes Function(Input$CreateProposalInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? description = _undefined,
    Object? type = _undefined,
    Object? votingDeadline = _undefined,
  }) => _then(
    Input$CreateProposalInput._({
      ..._instance._$data,
      if (title != _undefined && title != null) 'title': (title as String),
      if (description != _undefined && description != null)
        'description': (description as String),
      if (type != _undefined && type != null)
        'type': (type as Enum$ProposalType),
      if (votingDeadline != _undefined && votingDeadline != null)
        'votingDeadline': (votingDeadline as DateTime),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateProposalInput<TRes>
    implements CopyWith$Input$CreateProposalInput<TRes> {
  _CopyWithStubImpl$Input$CreateProposalInput(this._res);

  TRes _res;

  call({
    String? title,
    String? description,
    Enum$ProposalType? type,
    DateTime? votingDeadline,
  }) => _res;
}

class Input$CastVoteInput {
  factory Input$CastVoteInput({
    required String proposalId,
    required Enum$VoteChoice choice,
    String? comment,
  }) => Input$CastVoteInput._({
    r'proposalId': proposalId,
    r'choice': choice,
    if (comment != null) r'comment': comment,
  });

  Input$CastVoteInput._(this._$data);

  factory Input$CastVoteInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$proposalId = data['proposalId'];
    result$data['proposalId'] = (l$proposalId as String);
    final l$choice = data['choice'];
    result$data['choice'] = fromJson$Enum$VoteChoice((l$choice as String));
    if (data.containsKey('comment')) {
      final l$comment = data['comment'];
      result$data['comment'] = (l$comment as String?);
    }
    return Input$CastVoteInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get proposalId => (_$data['proposalId'] as String);

  Enum$VoteChoice get choice => (_$data['choice'] as Enum$VoteChoice);

  String? get comment => (_$data['comment'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$proposalId = proposalId;
    result$data['proposalId'] = l$proposalId;
    final l$choice = choice;
    result$data['choice'] = toJson$Enum$VoteChoice(l$choice);
    if (_$data.containsKey('comment')) {
      final l$comment = comment;
      result$data['comment'] = l$comment;
    }
    return result$data;
  }

  CopyWith$Input$CastVoteInput<Input$CastVoteInput> get copyWith =>
      CopyWith$Input$CastVoteInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CastVoteInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$proposalId = proposalId;
    final lOther$proposalId = other.proposalId;
    if (l$proposalId != lOther$proposalId) {
      return false;
    }
    final l$choice = choice;
    final lOther$choice = other.choice;
    if (l$choice != lOther$choice) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (_$data.containsKey('comment') != other._$data.containsKey('comment')) {
      return false;
    }
    if (l$comment != lOther$comment) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$proposalId = proposalId;
    final l$choice = choice;
    final l$comment = comment;
    return Object.hashAll([
      l$proposalId,
      l$choice,
      _$data.containsKey('comment') ? l$comment : const {},
    ]);
  }
}

abstract class CopyWith$Input$CastVoteInput<TRes> {
  factory CopyWith$Input$CastVoteInput(
    Input$CastVoteInput instance,
    TRes Function(Input$CastVoteInput) then,
  ) = _CopyWithImpl$Input$CastVoteInput;

  factory CopyWith$Input$CastVoteInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CastVoteInput;

  TRes call({String? proposalId, Enum$VoteChoice? choice, String? comment});
}

class _CopyWithImpl$Input$CastVoteInput<TRes>
    implements CopyWith$Input$CastVoteInput<TRes> {
  _CopyWithImpl$Input$CastVoteInput(this._instance, this._then);

  final Input$CastVoteInput _instance;

  final TRes Function(Input$CastVoteInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? proposalId = _undefined,
    Object? choice = _undefined,
    Object? comment = _undefined,
  }) => _then(
    Input$CastVoteInput._({
      ..._instance._$data,
      if (proposalId != _undefined && proposalId != null)
        'proposalId': (proposalId as String),
      if (choice != _undefined && choice != null)
        'choice': (choice as Enum$VoteChoice),
      if (comment != _undefined) 'comment': (comment as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$CastVoteInput<TRes>
    implements CopyWith$Input$CastVoteInput<TRes> {
  _CopyWithStubImpl$Input$CastVoteInput(this._res);

  TRes _res;

  call({String? proposalId, Enum$VoteChoice? choice, String? comment}) => _res;
}

class Input$CreateFacilityInput {
  factory Input$CreateFacilityInput({
    required String name,
    String? description,
    required String type,
    required int capacity,
    List<String>? amenities,
    int? minBookingDuration,
    int? maxBookingDuration,
    int? advanceBookingDays,
    int? cancellationDeadline,
    String? operatingHours,
  }) => Input$CreateFacilityInput._({
    r'name': name,
    if (description != null) r'description': description,
    r'type': type,
    r'capacity': capacity,
    if (amenities != null) r'amenities': amenities,
    if (minBookingDuration != null) r'minBookingDuration': minBookingDuration,
    if (maxBookingDuration != null) r'maxBookingDuration': maxBookingDuration,
    if (advanceBookingDays != null) r'advanceBookingDays': advanceBookingDays,
    if (cancellationDeadline != null)
      r'cancellationDeadline': cancellationDeadline,
    if (operatingHours != null) r'operatingHours': operatingHours,
  });

  Input$CreateFacilityInput._(this._$data);

  factory Input$CreateFacilityInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    final l$type = data['type'];
    result$data['type'] = (l$type as String);
    final l$capacity = data['capacity'];
    result$data['capacity'] = (l$capacity as int);
    if (data.containsKey('amenities')) {
      final l$amenities = data['amenities'];
      result$data['amenities'] = (l$amenities as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('minBookingDuration')) {
      final l$minBookingDuration = data['minBookingDuration'];
      result$data['minBookingDuration'] = (l$minBookingDuration as int?);
    }
    if (data.containsKey('maxBookingDuration')) {
      final l$maxBookingDuration = data['maxBookingDuration'];
      result$data['maxBookingDuration'] = (l$maxBookingDuration as int?);
    }
    if (data.containsKey('advanceBookingDays')) {
      final l$advanceBookingDays = data['advanceBookingDays'];
      result$data['advanceBookingDays'] = (l$advanceBookingDays as int?);
    }
    if (data.containsKey('cancellationDeadline')) {
      final l$cancellationDeadline = data['cancellationDeadline'];
      result$data['cancellationDeadline'] = (l$cancellationDeadline as int?);
    }
    if (data.containsKey('operatingHours')) {
      final l$operatingHours = data['operatingHours'];
      result$data['operatingHours'] = (l$operatingHours as String?);
    }
    return Input$CreateFacilityInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String? get description => (_$data['description'] as String?);

  String get type => (_$data['type'] as String);

  int get capacity => (_$data['capacity'] as int);

  List<String>? get amenities => (_$data['amenities'] as List<String>?);

  int? get minBookingDuration => (_$data['minBookingDuration'] as int?);

  int? get maxBookingDuration => (_$data['maxBookingDuration'] as int?);

  int? get advanceBookingDays => (_$data['advanceBookingDays'] as int?);

  int? get cancellationDeadline => (_$data['cancellationDeadline'] as int?);

  String? get operatingHours => (_$data['operatingHours'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    final l$type = type;
    result$data['type'] = l$type;
    final l$capacity = capacity;
    result$data['capacity'] = l$capacity;
    if (_$data.containsKey('amenities')) {
      final l$amenities = amenities;
      result$data['amenities'] = l$amenities?.map((e) => e).toList();
    }
    if (_$data.containsKey('minBookingDuration')) {
      final l$minBookingDuration = minBookingDuration;
      result$data['minBookingDuration'] = l$minBookingDuration;
    }
    if (_$data.containsKey('maxBookingDuration')) {
      final l$maxBookingDuration = maxBookingDuration;
      result$data['maxBookingDuration'] = l$maxBookingDuration;
    }
    if (_$data.containsKey('advanceBookingDays')) {
      final l$advanceBookingDays = advanceBookingDays;
      result$data['advanceBookingDays'] = l$advanceBookingDays;
    }
    if (_$data.containsKey('cancellationDeadline')) {
      final l$cancellationDeadline = cancellationDeadline;
      result$data['cancellationDeadline'] = l$cancellationDeadline;
    }
    if (_$data.containsKey('operatingHours')) {
      final l$operatingHours = operatingHours;
      result$data['operatingHours'] = l$operatingHours;
    }
    return result$data;
  }

  CopyWith$Input$CreateFacilityInput<Input$CreateFacilityInput> get copyWith =>
      CopyWith$Input$CreateFacilityInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateFacilityInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$capacity = capacity;
    final lOther$capacity = other.capacity;
    if (l$capacity != lOther$capacity) {
      return false;
    }
    final l$amenities = amenities;
    final lOther$amenities = other.amenities;
    if (_$data.containsKey('amenities') !=
        other._$data.containsKey('amenities')) {
      return false;
    }
    if (l$amenities != null && lOther$amenities != null) {
      if (l$amenities.length != lOther$amenities.length) {
        return false;
      }
      for (int i = 0; i < l$amenities.length; i++) {
        final l$amenities$entry = l$amenities[i];
        final lOther$amenities$entry = lOther$amenities[i];
        if (l$amenities$entry != lOther$amenities$entry) {
          return false;
        }
      }
    } else if (l$amenities != lOther$amenities) {
      return false;
    }
    final l$minBookingDuration = minBookingDuration;
    final lOther$minBookingDuration = other.minBookingDuration;
    if (_$data.containsKey('minBookingDuration') !=
        other._$data.containsKey('minBookingDuration')) {
      return false;
    }
    if (l$minBookingDuration != lOther$minBookingDuration) {
      return false;
    }
    final l$maxBookingDuration = maxBookingDuration;
    final lOther$maxBookingDuration = other.maxBookingDuration;
    if (_$data.containsKey('maxBookingDuration') !=
        other._$data.containsKey('maxBookingDuration')) {
      return false;
    }
    if (l$maxBookingDuration != lOther$maxBookingDuration) {
      return false;
    }
    final l$advanceBookingDays = advanceBookingDays;
    final lOther$advanceBookingDays = other.advanceBookingDays;
    if (_$data.containsKey('advanceBookingDays') !=
        other._$data.containsKey('advanceBookingDays')) {
      return false;
    }
    if (l$advanceBookingDays != lOther$advanceBookingDays) {
      return false;
    }
    final l$cancellationDeadline = cancellationDeadline;
    final lOther$cancellationDeadline = other.cancellationDeadline;
    if (_$data.containsKey('cancellationDeadline') !=
        other._$data.containsKey('cancellationDeadline')) {
      return false;
    }
    if (l$cancellationDeadline != lOther$cancellationDeadline) {
      return false;
    }
    final l$operatingHours = operatingHours;
    final lOther$operatingHours = other.operatingHours;
    if (_$data.containsKey('operatingHours') !=
        other._$data.containsKey('operatingHours')) {
      return false;
    }
    if (l$operatingHours != lOther$operatingHours) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$type = type;
    final l$capacity = capacity;
    final l$amenities = amenities;
    final l$minBookingDuration = minBookingDuration;
    final l$maxBookingDuration = maxBookingDuration;
    final l$advanceBookingDays = advanceBookingDays;
    final l$cancellationDeadline = cancellationDeadline;
    final l$operatingHours = operatingHours;
    return Object.hashAll([
      l$name,
      _$data.containsKey('description') ? l$description : const {},
      l$type,
      l$capacity,
      _$data.containsKey('amenities')
          ? l$amenities == null
                ? null
                : Object.hashAll(l$amenities.map((v) => v))
          : const {},
      _$data.containsKey('minBookingDuration')
          ? l$minBookingDuration
          : const {},
      _$data.containsKey('maxBookingDuration')
          ? l$maxBookingDuration
          : const {},
      _$data.containsKey('advanceBookingDays')
          ? l$advanceBookingDays
          : const {},
      _$data.containsKey('cancellationDeadline')
          ? l$cancellationDeadline
          : const {},
      _$data.containsKey('operatingHours') ? l$operatingHours : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateFacilityInput<TRes> {
  factory CopyWith$Input$CreateFacilityInput(
    Input$CreateFacilityInput instance,
    TRes Function(Input$CreateFacilityInput) then,
  ) = _CopyWithImpl$Input$CreateFacilityInput;

  factory CopyWith$Input$CreateFacilityInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateFacilityInput;

  TRes call({
    String? name,
    String? description,
    String? type,
    int? capacity,
    List<String>? amenities,
    int? minBookingDuration,
    int? maxBookingDuration,
    int? advanceBookingDays,
    int? cancellationDeadline,
    String? operatingHours,
  });
}

class _CopyWithImpl$Input$CreateFacilityInput<TRes>
    implements CopyWith$Input$CreateFacilityInput<TRes> {
  _CopyWithImpl$Input$CreateFacilityInput(this._instance, this._then);

  final Input$CreateFacilityInput _instance;

  final TRes Function(Input$CreateFacilityInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? type = _undefined,
    Object? capacity = _undefined,
    Object? amenities = _undefined,
    Object? minBookingDuration = _undefined,
    Object? maxBookingDuration = _undefined,
    Object? advanceBookingDays = _undefined,
    Object? cancellationDeadline = _undefined,
    Object? operatingHours = _undefined,
  }) => _then(
    Input$CreateFacilityInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (description != _undefined) 'description': (description as String?),
      if (type != _undefined && type != null) 'type': (type as String),
      if (capacity != _undefined && capacity != null)
        'capacity': (capacity as int),
      if (amenities != _undefined) 'amenities': (amenities as List<String>?),
      if (minBookingDuration != _undefined)
        'minBookingDuration': (minBookingDuration as int?),
      if (maxBookingDuration != _undefined)
        'maxBookingDuration': (maxBookingDuration as int?),
      if (advanceBookingDays != _undefined)
        'advanceBookingDays': (advanceBookingDays as int?),
      if (cancellationDeadline != _undefined)
        'cancellationDeadline': (cancellationDeadline as int?),
      if (operatingHours != _undefined)
        'operatingHours': (operatingHours as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateFacilityInput<TRes>
    implements CopyWith$Input$CreateFacilityInput<TRes> {
  _CopyWithStubImpl$Input$CreateFacilityInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    String? type,
    int? capacity,
    List<String>? amenities,
    int? minBookingDuration,
    int? maxBookingDuration,
    int? advanceBookingDays,
    int? cancellationDeadline,
    String? operatingHours,
  }) => _res;
}

class Input$UpdateFacilityInput {
  factory Input$UpdateFacilityInput({
    String? name,
    String? description,
    String? type,
    int? capacity,
    List<String>? amenities,
    Enum$FacilityStatus? status,
    int? minBookingDuration,
    int? maxBookingDuration,
    int? advanceBookingDays,
    int? cancellationDeadline,
    String? operatingHours,
  }) => Input$UpdateFacilityInput._({
    if (name != null) r'name': name,
    if (description != null) r'description': description,
    if (type != null) r'type': type,
    if (capacity != null) r'capacity': capacity,
    if (amenities != null) r'amenities': amenities,
    if (status != null) r'status': status,
    if (minBookingDuration != null) r'minBookingDuration': minBookingDuration,
    if (maxBookingDuration != null) r'maxBookingDuration': maxBookingDuration,
    if (advanceBookingDays != null) r'advanceBookingDays': advanceBookingDays,
    if (cancellationDeadline != null)
      r'cancellationDeadline': cancellationDeadline,
    if (operatingHours != null) r'operatingHours': operatingHours,
  });

  Input$UpdateFacilityInput._(this._$data);

  factory Input$UpdateFacilityInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = (l$type as String?);
    }
    if (data.containsKey('capacity')) {
      final l$capacity = data['capacity'];
      result$data['capacity'] = (l$capacity as int?);
    }
    if (data.containsKey('amenities')) {
      final l$amenities = data['amenities'];
      result$data['amenities'] = (l$amenities as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$FacilityStatus((l$status as String));
    }
    if (data.containsKey('minBookingDuration')) {
      final l$minBookingDuration = data['minBookingDuration'];
      result$data['minBookingDuration'] = (l$minBookingDuration as int?);
    }
    if (data.containsKey('maxBookingDuration')) {
      final l$maxBookingDuration = data['maxBookingDuration'];
      result$data['maxBookingDuration'] = (l$maxBookingDuration as int?);
    }
    if (data.containsKey('advanceBookingDays')) {
      final l$advanceBookingDays = data['advanceBookingDays'];
      result$data['advanceBookingDays'] = (l$advanceBookingDays as int?);
    }
    if (data.containsKey('cancellationDeadline')) {
      final l$cancellationDeadline = data['cancellationDeadline'];
      result$data['cancellationDeadline'] = (l$cancellationDeadline as int?);
    }
    if (data.containsKey('operatingHours')) {
      final l$operatingHours = data['operatingHours'];
      result$data['operatingHours'] = (l$operatingHours as String?);
    }
    return Input$UpdateFacilityInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get description => (_$data['description'] as String?);

  String? get type => (_$data['type'] as String?);

  int? get capacity => (_$data['capacity'] as int?);

  List<String>? get amenities => (_$data['amenities'] as List<String>?);

  Enum$FacilityStatus? get status => (_$data['status'] as Enum$FacilityStatus?);

  int? get minBookingDuration => (_$data['minBookingDuration'] as int?);

  int? get maxBookingDuration => (_$data['maxBookingDuration'] as int?);

  int? get advanceBookingDays => (_$data['advanceBookingDays'] as int?);

  int? get cancellationDeadline => (_$data['cancellationDeadline'] as int?);

  String? get operatingHours => (_$data['operatingHours'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type;
    }
    if (_$data.containsKey('capacity')) {
      final l$capacity = capacity;
      result$data['capacity'] = l$capacity;
    }
    if (_$data.containsKey('amenities')) {
      final l$amenities = amenities;
      result$data['amenities'] = l$amenities?.map((e) => e).toList();
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$FacilityStatus(l$status);
    }
    if (_$data.containsKey('minBookingDuration')) {
      final l$minBookingDuration = minBookingDuration;
      result$data['minBookingDuration'] = l$minBookingDuration;
    }
    if (_$data.containsKey('maxBookingDuration')) {
      final l$maxBookingDuration = maxBookingDuration;
      result$data['maxBookingDuration'] = l$maxBookingDuration;
    }
    if (_$data.containsKey('advanceBookingDays')) {
      final l$advanceBookingDays = advanceBookingDays;
      result$data['advanceBookingDays'] = l$advanceBookingDays;
    }
    if (_$data.containsKey('cancellationDeadline')) {
      final l$cancellationDeadline = cancellationDeadline;
      result$data['cancellationDeadline'] = l$cancellationDeadline;
    }
    if (_$data.containsKey('operatingHours')) {
      final l$operatingHours = operatingHours;
      result$data['operatingHours'] = l$operatingHours;
    }
    return result$data;
  }

  CopyWith$Input$UpdateFacilityInput<Input$UpdateFacilityInput> get copyWith =>
      CopyWith$Input$UpdateFacilityInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateFacilityInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    final l$capacity = capacity;
    final lOther$capacity = other.capacity;
    if (_$data.containsKey('capacity') !=
        other._$data.containsKey('capacity')) {
      return false;
    }
    if (l$capacity != lOther$capacity) {
      return false;
    }
    final l$amenities = amenities;
    final lOther$amenities = other.amenities;
    if (_$data.containsKey('amenities') !=
        other._$data.containsKey('amenities')) {
      return false;
    }
    if (l$amenities != null && lOther$amenities != null) {
      if (l$amenities.length != lOther$amenities.length) {
        return false;
      }
      for (int i = 0; i < l$amenities.length; i++) {
        final l$amenities$entry = l$amenities[i];
        final lOther$amenities$entry = lOther$amenities[i];
        if (l$amenities$entry != lOther$amenities$entry) {
          return false;
        }
      }
    } else if (l$amenities != lOther$amenities) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$minBookingDuration = minBookingDuration;
    final lOther$minBookingDuration = other.minBookingDuration;
    if (_$data.containsKey('minBookingDuration') !=
        other._$data.containsKey('minBookingDuration')) {
      return false;
    }
    if (l$minBookingDuration != lOther$minBookingDuration) {
      return false;
    }
    final l$maxBookingDuration = maxBookingDuration;
    final lOther$maxBookingDuration = other.maxBookingDuration;
    if (_$data.containsKey('maxBookingDuration') !=
        other._$data.containsKey('maxBookingDuration')) {
      return false;
    }
    if (l$maxBookingDuration != lOther$maxBookingDuration) {
      return false;
    }
    final l$advanceBookingDays = advanceBookingDays;
    final lOther$advanceBookingDays = other.advanceBookingDays;
    if (_$data.containsKey('advanceBookingDays') !=
        other._$data.containsKey('advanceBookingDays')) {
      return false;
    }
    if (l$advanceBookingDays != lOther$advanceBookingDays) {
      return false;
    }
    final l$cancellationDeadline = cancellationDeadline;
    final lOther$cancellationDeadline = other.cancellationDeadline;
    if (_$data.containsKey('cancellationDeadline') !=
        other._$data.containsKey('cancellationDeadline')) {
      return false;
    }
    if (l$cancellationDeadline != lOther$cancellationDeadline) {
      return false;
    }
    final l$operatingHours = operatingHours;
    final lOther$operatingHours = other.operatingHours;
    if (_$data.containsKey('operatingHours') !=
        other._$data.containsKey('operatingHours')) {
      return false;
    }
    if (l$operatingHours != lOther$operatingHours) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$type = type;
    final l$capacity = capacity;
    final l$amenities = amenities;
    final l$status = status;
    final l$minBookingDuration = minBookingDuration;
    final l$maxBookingDuration = maxBookingDuration;
    final l$advanceBookingDays = advanceBookingDays;
    final l$cancellationDeadline = cancellationDeadline;
    final l$operatingHours = operatingHours;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('capacity') ? l$capacity : const {},
      _$data.containsKey('amenities')
          ? l$amenities == null
                ? null
                : Object.hashAll(l$amenities.map((v) => v))
          : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('minBookingDuration')
          ? l$minBookingDuration
          : const {},
      _$data.containsKey('maxBookingDuration')
          ? l$maxBookingDuration
          : const {},
      _$data.containsKey('advanceBookingDays')
          ? l$advanceBookingDays
          : const {},
      _$data.containsKey('cancellationDeadline')
          ? l$cancellationDeadline
          : const {},
      _$data.containsKey('operatingHours') ? l$operatingHours : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateFacilityInput<TRes> {
  factory CopyWith$Input$UpdateFacilityInput(
    Input$UpdateFacilityInput instance,
    TRes Function(Input$UpdateFacilityInput) then,
  ) = _CopyWithImpl$Input$UpdateFacilityInput;

  factory CopyWith$Input$UpdateFacilityInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateFacilityInput;

  TRes call({
    String? name,
    String? description,
    String? type,
    int? capacity,
    List<String>? amenities,
    Enum$FacilityStatus? status,
    int? minBookingDuration,
    int? maxBookingDuration,
    int? advanceBookingDays,
    int? cancellationDeadline,
    String? operatingHours,
  });
}

class _CopyWithImpl$Input$UpdateFacilityInput<TRes>
    implements CopyWith$Input$UpdateFacilityInput<TRes> {
  _CopyWithImpl$Input$UpdateFacilityInput(this._instance, this._then);

  final Input$UpdateFacilityInput _instance;

  final TRes Function(Input$UpdateFacilityInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? type = _undefined,
    Object? capacity = _undefined,
    Object? amenities = _undefined,
    Object? status = _undefined,
    Object? minBookingDuration = _undefined,
    Object? maxBookingDuration = _undefined,
    Object? advanceBookingDays = _undefined,
    Object? cancellationDeadline = _undefined,
    Object? operatingHours = _undefined,
  }) => _then(
    Input$UpdateFacilityInput._({
      ..._instance._$data,
      if (name != _undefined) 'name': (name as String?),
      if (description != _undefined) 'description': (description as String?),
      if (type != _undefined) 'type': (type as String?),
      if (capacity != _undefined) 'capacity': (capacity as int?),
      if (amenities != _undefined) 'amenities': (amenities as List<String>?),
      if (status != _undefined) 'status': (status as Enum$FacilityStatus?),
      if (minBookingDuration != _undefined)
        'minBookingDuration': (minBookingDuration as int?),
      if (maxBookingDuration != _undefined)
        'maxBookingDuration': (maxBookingDuration as int?),
      if (advanceBookingDays != _undefined)
        'advanceBookingDays': (advanceBookingDays as int?),
      if (cancellationDeadline != _undefined)
        'cancellationDeadline': (cancellationDeadline as int?),
      if (operatingHours != _undefined)
        'operatingHours': (operatingHours as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateFacilityInput<TRes>
    implements CopyWith$Input$UpdateFacilityInput<TRes> {
  _CopyWithStubImpl$Input$UpdateFacilityInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    String? type,
    int? capacity,
    List<String>? amenities,
    Enum$FacilityStatus? status,
    int? minBookingDuration,
    int? maxBookingDuration,
    int? advanceBookingDays,
    int? cancellationDeadline,
    String? operatingHours,
  }) => _res;
}

class Input$FacilityFilterInput {
  factory Input$FacilityFilterInput({
    String? type,
    Enum$FacilityStatus? status,
  }) => Input$FacilityFilterInput._({
    if (type != null) r'type': type,
    if (status != null) r'status': status,
  });

  Input$FacilityFilterInput._(this._$data);

  factory Input$FacilityFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = (l$type as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$FacilityStatus((l$status as String));
    }
    return Input$FacilityFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get type => (_$data['type'] as String?);

  Enum$FacilityStatus? get status => (_$data['status'] as Enum$FacilityStatus?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$FacilityStatus(l$status);
    }
    return result$data;
  }

  CopyWith$Input$FacilityFilterInput<Input$FacilityFilterInput> get copyWith =>
      CopyWith$Input$FacilityFilterInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$FacilityFilterInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$status = status;
    return Object.hashAll([
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('status') ? l$status : const {},
    ]);
  }
}

abstract class CopyWith$Input$FacilityFilterInput<TRes> {
  factory CopyWith$Input$FacilityFilterInput(
    Input$FacilityFilterInput instance,
    TRes Function(Input$FacilityFilterInput) then,
  ) = _CopyWithImpl$Input$FacilityFilterInput;

  factory CopyWith$Input$FacilityFilterInput.stub(TRes res) =
      _CopyWithStubImpl$Input$FacilityFilterInput;

  TRes call({String? type, Enum$FacilityStatus? status});
}

class _CopyWithImpl$Input$FacilityFilterInput<TRes>
    implements CopyWith$Input$FacilityFilterInput<TRes> {
  _CopyWithImpl$Input$FacilityFilterInput(this._instance, this._then);

  final Input$FacilityFilterInput _instance;

  final TRes Function(Input$FacilityFilterInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? type = _undefined, Object? status = _undefined}) => _then(
    Input$FacilityFilterInput._({
      ..._instance._$data,
      if (type != _undefined) 'type': (type as String?),
      if (status != _undefined) 'status': (status as Enum$FacilityStatus?),
    }),
  );
}

class _CopyWithStubImpl$Input$FacilityFilterInput<TRes>
    implements CopyWith$Input$FacilityFilterInput<TRes> {
  _CopyWithStubImpl$Input$FacilityFilterInput(this._res);

  TRes _res;

  call({String? type, Enum$FacilityStatus? status}) => _res;
}

class Input$CreateBookingInput {
  factory Input$CreateBookingInput({
    required String facilityId,
    required DateTime startTime,
    required DateTime endTime,
    String? notes,
    List<String>? participants,
    int? partySize,
    String? mealType,
    List<String>? dietaryRestrictions,
    String? specialRequests,
    String? tablePreference,
    String? eventType,
    List<String>? serviceAddons,
    int? guestCount,
  }) => Input$CreateBookingInput._({
    r'facilityId': facilityId,
    r'startTime': startTime,
    r'endTime': endTime,
    if (notes != null) r'notes': notes,
    if (participants != null) r'participants': participants,
    if (partySize != null) r'partySize': partySize,
    if (mealType != null) r'mealType': mealType,
    if (dietaryRestrictions != null)
      r'dietaryRestrictions': dietaryRestrictions,
    if (specialRequests != null) r'specialRequests': specialRequests,
    if (tablePreference != null) r'tablePreference': tablePreference,
    if (eventType != null) r'eventType': eventType,
    if (serviceAddons != null) r'serviceAddons': serviceAddons,
    if (guestCount != null) r'guestCount': guestCount,
  });

  Input$CreateBookingInput._(this._$data);

  factory Input$CreateBookingInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$facilityId = data['facilityId'];
    result$data['facilityId'] = (l$facilityId as String);
    final l$startTime = data['startTime'];
    result$data['startTime'] = DateTime.parse((l$startTime as String));
    final l$endTime = data['endTime'];
    result$data['endTime'] = DateTime.parse((l$endTime as String));
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    if (data.containsKey('participants')) {
      final l$participants = data['participants'];
      result$data['participants'] = (l$participants as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('partySize')) {
      final l$partySize = data['partySize'];
      result$data['partySize'] = (l$partySize as int?);
    }
    if (data.containsKey('mealType')) {
      final l$mealType = data['mealType'];
      result$data['mealType'] = (l$mealType as String?);
    }
    if (data.containsKey('dietaryRestrictions')) {
      final l$dietaryRestrictions = data['dietaryRestrictions'];
      result$data['dietaryRestrictions'] =
          (l$dietaryRestrictions as List<dynamic>?)
              ?.map((e) => (e as String))
              .toList();
    }
    if (data.containsKey('specialRequests')) {
      final l$specialRequests = data['specialRequests'];
      result$data['specialRequests'] = (l$specialRequests as String?);
    }
    if (data.containsKey('tablePreference')) {
      final l$tablePreference = data['tablePreference'];
      result$data['tablePreference'] = (l$tablePreference as String?);
    }
    if (data.containsKey('eventType')) {
      final l$eventType = data['eventType'];
      result$data['eventType'] = (l$eventType as String?);
    }
    if (data.containsKey('serviceAddons')) {
      final l$serviceAddons = data['serviceAddons'];
      result$data['serviceAddons'] = (l$serviceAddons as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('guestCount')) {
      final l$guestCount = data['guestCount'];
      result$data['guestCount'] = (l$guestCount as int?);
    }
    return Input$CreateBookingInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get facilityId => (_$data['facilityId'] as String);

  DateTime get startTime => (_$data['startTime'] as DateTime);

  DateTime get endTime => (_$data['endTime'] as DateTime);

  String? get notes => (_$data['notes'] as String?);

  List<String>? get participants => (_$data['participants'] as List<String>?);

  int? get partySize => (_$data['partySize'] as int?);

  String? get mealType => (_$data['mealType'] as String?);

  List<String>? get dietaryRestrictions =>
      (_$data['dietaryRestrictions'] as List<String>?);

  String? get specialRequests => (_$data['specialRequests'] as String?);

  String? get tablePreference => (_$data['tablePreference'] as String?);

  String? get eventType => (_$data['eventType'] as String?);

  List<String>? get serviceAddons => (_$data['serviceAddons'] as List<String>?);

  int? get guestCount => (_$data['guestCount'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$facilityId = facilityId;
    result$data['facilityId'] = l$facilityId;
    final l$startTime = startTime;
    result$data['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    result$data['endTime'] = l$endTime.toIso8601String();
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    if (_$data.containsKey('participants')) {
      final l$participants = participants;
      result$data['participants'] = l$participants?.map((e) => e).toList();
    }
    if (_$data.containsKey('partySize')) {
      final l$partySize = partySize;
      result$data['partySize'] = l$partySize;
    }
    if (_$data.containsKey('mealType')) {
      final l$mealType = mealType;
      result$data['mealType'] = l$mealType;
    }
    if (_$data.containsKey('dietaryRestrictions')) {
      final l$dietaryRestrictions = dietaryRestrictions;
      result$data['dietaryRestrictions'] = l$dietaryRestrictions
          ?.map((e) => e)
          .toList();
    }
    if (_$data.containsKey('specialRequests')) {
      final l$specialRequests = specialRequests;
      result$data['specialRequests'] = l$specialRequests;
    }
    if (_$data.containsKey('tablePreference')) {
      final l$tablePreference = tablePreference;
      result$data['tablePreference'] = l$tablePreference;
    }
    if (_$data.containsKey('eventType')) {
      final l$eventType = eventType;
      result$data['eventType'] = l$eventType;
    }
    if (_$data.containsKey('serviceAddons')) {
      final l$serviceAddons = serviceAddons;
      result$data['serviceAddons'] = l$serviceAddons?.map((e) => e).toList();
    }
    if (_$data.containsKey('guestCount')) {
      final l$guestCount = guestCount;
      result$data['guestCount'] = l$guestCount;
    }
    return result$data;
  }

  CopyWith$Input$CreateBookingInput<Input$CreateBookingInput> get copyWith =>
      CopyWith$Input$CreateBookingInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateBookingInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$facilityId = facilityId;
    final lOther$facilityId = other.facilityId;
    if (l$facilityId != lOther$facilityId) {
      return false;
    }
    final l$startTime = startTime;
    final lOther$startTime = other.startTime;
    if (l$startTime != lOther$startTime) {
      return false;
    }
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (l$endTime != lOther$endTime) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (_$data.containsKey('notes') != other._$data.containsKey('notes')) {
      return false;
    }
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$participants = participants;
    final lOther$participants = other.participants;
    if (_$data.containsKey('participants') !=
        other._$data.containsKey('participants')) {
      return false;
    }
    if (l$participants != null && lOther$participants != null) {
      if (l$participants.length != lOther$participants.length) {
        return false;
      }
      for (int i = 0; i < l$participants.length; i++) {
        final l$participants$entry = l$participants[i];
        final lOther$participants$entry = lOther$participants[i];
        if (l$participants$entry != lOther$participants$entry) {
          return false;
        }
      }
    } else if (l$participants != lOther$participants) {
      return false;
    }
    final l$partySize = partySize;
    final lOther$partySize = other.partySize;
    if (_$data.containsKey('partySize') !=
        other._$data.containsKey('partySize')) {
      return false;
    }
    if (l$partySize != lOther$partySize) {
      return false;
    }
    final l$mealType = mealType;
    final lOther$mealType = other.mealType;
    if (_$data.containsKey('mealType') !=
        other._$data.containsKey('mealType')) {
      return false;
    }
    if (l$mealType != lOther$mealType) {
      return false;
    }
    final l$dietaryRestrictions = dietaryRestrictions;
    final lOther$dietaryRestrictions = other.dietaryRestrictions;
    if (_$data.containsKey('dietaryRestrictions') !=
        other._$data.containsKey('dietaryRestrictions')) {
      return false;
    }
    if (l$dietaryRestrictions != null && lOther$dietaryRestrictions != null) {
      if (l$dietaryRestrictions.length != lOther$dietaryRestrictions.length) {
        return false;
      }
      for (int i = 0; i < l$dietaryRestrictions.length; i++) {
        final l$dietaryRestrictions$entry = l$dietaryRestrictions[i];
        final lOther$dietaryRestrictions$entry = lOther$dietaryRestrictions[i];
        if (l$dietaryRestrictions$entry != lOther$dietaryRestrictions$entry) {
          return false;
        }
      }
    } else if (l$dietaryRestrictions != lOther$dietaryRestrictions) {
      return false;
    }
    final l$specialRequests = specialRequests;
    final lOther$specialRequests = other.specialRequests;
    if (_$data.containsKey('specialRequests') !=
        other._$data.containsKey('specialRequests')) {
      return false;
    }
    if (l$specialRequests != lOther$specialRequests) {
      return false;
    }
    final l$tablePreference = tablePreference;
    final lOther$tablePreference = other.tablePreference;
    if (_$data.containsKey('tablePreference') !=
        other._$data.containsKey('tablePreference')) {
      return false;
    }
    if (l$tablePreference != lOther$tablePreference) {
      return false;
    }
    final l$eventType = eventType;
    final lOther$eventType = other.eventType;
    if (_$data.containsKey('eventType') !=
        other._$data.containsKey('eventType')) {
      return false;
    }
    if (l$eventType != lOther$eventType) {
      return false;
    }
    final l$serviceAddons = serviceAddons;
    final lOther$serviceAddons = other.serviceAddons;
    if (_$data.containsKey('serviceAddons') !=
        other._$data.containsKey('serviceAddons')) {
      return false;
    }
    if (l$serviceAddons != null && lOther$serviceAddons != null) {
      if (l$serviceAddons.length != lOther$serviceAddons.length) {
        return false;
      }
      for (int i = 0; i < l$serviceAddons.length; i++) {
        final l$serviceAddons$entry = l$serviceAddons[i];
        final lOther$serviceAddons$entry = lOther$serviceAddons[i];
        if (l$serviceAddons$entry != lOther$serviceAddons$entry) {
          return false;
        }
      }
    } else if (l$serviceAddons != lOther$serviceAddons) {
      return false;
    }
    final l$guestCount = guestCount;
    final lOther$guestCount = other.guestCount;
    if (_$data.containsKey('guestCount') !=
        other._$data.containsKey('guestCount')) {
      return false;
    }
    if (l$guestCount != lOther$guestCount) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$facilityId = facilityId;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$notes = notes;
    final l$participants = participants;
    final l$partySize = partySize;
    final l$mealType = mealType;
    final l$dietaryRestrictions = dietaryRestrictions;
    final l$specialRequests = specialRequests;
    final l$tablePreference = tablePreference;
    final l$eventType = eventType;
    final l$serviceAddons = serviceAddons;
    final l$guestCount = guestCount;
    return Object.hashAll([
      l$facilityId,
      l$startTime,
      l$endTime,
      _$data.containsKey('notes') ? l$notes : const {},
      _$data.containsKey('participants')
          ? l$participants == null
                ? null
                : Object.hashAll(l$participants.map((v) => v))
          : const {},
      _$data.containsKey('partySize') ? l$partySize : const {},
      _$data.containsKey('mealType') ? l$mealType : const {},
      _$data.containsKey('dietaryRestrictions')
          ? l$dietaryRestrictions == null
                ? null
                : Object.hashAll(l$dietaryRestrictions.map((v) => v))
          : const {},
      _$data.containsKey('specialRequests') ? l$specialRequests : const {},
      _$data.containsKey('tablePreference') ? l$tablePreference : const {},
      _$data.containsKey('eventType') ? l$eventType : const {},
      _$data.containsKey('serviceAddons')
          ? l$serviceAddons == null
                ? null
                : Object.hashAll(l$serviceAddons.map((v) => v))
          : const {},
      _$data.containsKey('guestCount') ? l$guestCount : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateBookingInput<TRes> {
  factory CopyWith$Input$CreateBookingInput(
    Input$CreateBookingInput instance,
    TRes Function(Input$CreateBookingInput) then,
  ) = _CopyWithImpl$Input$CreateBookingInput;

  factory CopyWith$Input$CreateBookingInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateBookingInput;

  TRes call({
    String? facilityId,
    DateTime? startTime,
    DateTime? endTime,
    String? notes,
    List<String>? participants,
    int? partySize,
    String? mealType,
    List<String>? dietaryRestrictions,
    String? specialRequests,
    String? tablePreference,
    String? eventType,
    List<String>? serviceAddons,
    int? guestCount,
  });
}

class _CopyWithImpl$Input$CreateBookingInput<TRes>
    implements CopyWith$Input$CreateBookingInput<TRes> {
  _CopyWithImpl$Input$CreateBookingInput(this._instance, this._then);

  final Input$CreateBookingInput _instance;

  final TRes Function(Input$CreateBookingInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? facilityId = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? notes = _undefined,
    Object? participants = _undefined,
    Object? partySize = _undefined,
    Object? mealType = _undefined,
    Object? dietaryRestrictions = _undefined,
    Object? specialRequests = _undefined,
    Object? tablePreference = _undefined,
    Object? eventType = _undefined,
    Object? serviceAddons = _undefined,
    Object? guestCount = _undefined,
  }) => _then(
    Input$CreateBookingInput._({
      ..._instance._$data,
      if (facilityId != _undefined && facilityId != null)
        'facilityId': (facilityId as String),
      if (startTime != _undefined && startTime != null)
        'startTime': (startTime as DateTime),
      if (endTime != _undefined && endTime != null)
        'endTime': (endTime as DateTime),
      if (notes != _undefined) 'notes': (notes as String?),
      if (participants != _undefined)
        'participants': (participants as List<String>?),
      if (partySize != _undefined) 'partySize': (partySize as int?),
      if (mealType != _undefined) 'mealType': (mealType as String?),
      if (dietaryRestrictions != _undefined)
        'dietaryRestrictions': (dietaryRestrictions as List<String>?),
      if (specialRequests != _undefined)
        'specialRequests': (specialRequests as String?),
      if (tablePreference != _undefined)
        'tablePreference': (tablePreference as String?),
      if (eventType != _undefined) 'eventType': (eventType as String?),
      if (serviceAddons != _undefined)
        'serviceAddons': (serviceAddons as List<String>?),
      if (guestCount != _undefined) 'guestCount': (guestCount as int?),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateBookingInput<TRes>
    implements CopyWith$Input$CreateBookingInput<TRes> {
  _CopyWithStubImpl$Input$CreateBookingInput(this._res);

  TRes _res;

  call({
    String? facilityId,
    DateTime? startTime,
    DateTime? endTime,
    String? notes,
    List<String>? participants,
    int? partySize,
    String? mealType,
    List<String>? dietaryRestrictions,
    String? specialRequests,
    String? tablePreference,
    String? eventType,
    List<String>? serviceAddons,
    int? guestCount,
  }) => _res;
}

class Input$UpdateBookingInput {
  factory Input$UpdateBookingInput({
    DateTime? startTime,
    DateTime? endTime,
    String? notes,
    List<String>? participants,
    int? partySize,
    String? mealType,
    List<String>? dietaryRestrictions,
    String? specialRequests,
    String? tablePreference,
    String? eventType,
    List<String>? serviceAddons,
    int? guestCount,
  }) => Input$UpdateBookingInput._({
    if (startTime != null) r'startTime': startTime,
    if (endTime != null) r'endTime': endTime,
    if (notes != null) r'notes': notes,
    if (participants != null) r'participants': participants,
    if (partySize != null) r'partySize': partySize,
    if (mealType != null) r'mealType': mealType,
    if (dietaryRestrictions != null)
      r'dietaryRestrictions': dietaryRestrictions,
    if (specialRequests != null) r'specialRequests': specialRequests,
    if (tablePreference != null) r'tablePreference': tablePreference,
    if (eventType != null) r'eventType': eventType,
    if (serviceAddons != null) r'serviceAddons': serviceAddons,
    if (guestCount != null) r'guestCount': guestCount,
  });

  Input$UpdateBookingInput._(this._$data);

  factory Input$UpdateBookingInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('startTime')) {
      final l$startTime = data['startTime'];
      result$data['startTime'] = l$startTime == null
          ? null
          : DateTime.parse((l$startTime as String));
    }
    if (data.containsKey('endTime')) {
      final l$endTime = data['endTime'];
      result$data['endTime'] = l$endTime == null
          ? null
          : DateTime.parse((l$endTime as String));
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    if (data.containsKey('participants')) {
      final l$participants = data['participants'];
      result$data['participants'] = (l$participants as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('partySize')) {
      final l$partySize = data['partySize'];
      result$data['partySize'] = (l$partySize as int?);
    }
    if (data.containsKey('mealType')) {
      final l$mealType = data['mealType'];
      result$data['mealType'] = (l$mealType as String?);
    }
    if (data.containsKey('dietaryRestrictions')) {
      final l$dietaryRestrictions = data['dietaryRestrictions'];
      result$data['dietaryRestrictions'] =
          (l$dietaryRestrictions as List<dynamic>?)
              ?.map((e) => (e as String))
              .toList();
    }
    if (data.containsKey('specialRequests')) {
      final l$specialRequests = data['specialRequests'];
      result$data['specialRequests'] = (l$specialRequests as String?);
    }
    if (data.containsKey('tablePreference')) {
      final l$tablePreference = data['tablePreference'];
      result$data['tablePreference'] = (l$tablePreference as String?);
    }
    if (data.containsKey('eventType')) {
      final l$eventType = data['eventType'];
      result$data['eventType'] = (l$eventType as String?);
    }
    if (data.containsKey('serviceAddons')) {
      final l$serviceAddons = data['serviceAddons'];
      result$data['serviceAddons'] = (l$serviceAddons as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('guestCount')) {
      final l$guestCount = data['guestCount'];
      result$data['guestCount'] = (l$guestCount as int?);
    }
    return Input$UpdateBookingInput._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime? get startTime => (_$data['startTime'] as DateTime?);

  DateTime? get endTime => (_$data['endTime'] as DateTime?);

  String? get notes => (_$data['notes'] as String?);

  List<String>? get participants => (_$data['participants'] as List<String>?);

  int? get partySize => (_$data['partySize'] as int?);

  String? get mealType => (_$data['mealType'] as String?);

  List<String>? get dietaryRestrictions =>
      (_$data['dietaryRestrictions'] as List<String>?);

  String? get specialRequests => (_$data['specialRequests'] as String?);

  String? get tablePreference => (_$data['tablePreference'] as String?);

  String? get eventType => (_$data['eventType'] as String?);

  List<String>? get serviceAddons => (_$data['serviceAddons'] as List<String>?);

  int? get guestCount => (_$data['guestCount'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('startTime')) {
      final l$startTime = startTime;
      result$data['startTime'] = l$startTime?.toIso8601String();
    }
    if (_$data.containsKey('endTime')) {
      final l$endTime = endTime;
      result$data['endTime'] = l$endTime?.toIso8601String();
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    if (_$data.containsKey('participants')) {
      final l$participants = participants;
      result$data['participants'] = l$participants?.map((e) => e).toList();
    }
    if (_$data.containsKey('partySize')) {
      final l$partySize = partySize;
      result$data['partySize'] = l$partySize;
    }
    if (_$data.containsKey('mealType')) {
      final l$mealType = mealType;
      result$data['mealType'] = l$mealType;
    }
    if (_$data.containsKey('dietaryRestrictions')) {
      final l$dietaryRestrictions = dietaryRestrictions;
      result$data['dietaryRestrictions'] = l$dietaryRestrictions
          ?.map((e) => e)
          .toList();
    }
    if (_$data.containsKey('specialRequests')) {
      final l$specialRequests = specialRequests;
      result$data['specialRequests'] = l$specialRequests;
    }
    if (_$data.containsKey('tablePreference')) {
      final l$tablePreference = tablePreference;
      result$data['tablePreference'] = l$tablePreference;
    }
    if (_$data.containsKey('eventType')) {
      final l$eventType = eventType;
      result$data['eventType'] = l$eventType;
    }
    if (_$data.containsKey('serviceAddons')) {
      final l$serviceAddons = serviceAddons;
      result$data['serviceAddons'] = l$serviceAddons?.map((e) => e).toList();
    }
    if (_$data.containsKey('guestCount')) {
      final l$guestCount = guestCount;
      result$data['guestCount'] = l$guestCount;
    }
    return result$data;
  }

  CopyWith$Input$UpdateBookingInput<Input$UpdateBookingInput> get copyWith =>
      CopyWith$Input$UpdateBookingInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateBookingInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$startTime = startTime;
    final lOther$startTime = other.startTime;
    if (_$data.containsKey('startTime') !=
        other._$data.containsKey('startTime')) {
      return false;
    }
    if (l$startTime != lOther$startTime) {
      return false;
    }
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (_$data.containsKey('endTime') != other._$data.containsKey('endTime')) {
      return false;
    }
    if (l$endTime != lOther$endTime) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (_$data.containsKey('notes') != other._$data.containsKey('notes')) {
      return false;
    }
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$participants = participants;
    final lOther$participants = other.participants;
    if (_$data.containsKey('participants') !=
        other._$data.containsKey('participants')) {
      return false;
    }
    if (l$participants != null && lOther$participants != null) {
      if (l$participants.length != lOther$participants.length) {
        return false;
      }
      for (int i = 0; i < l$participants.length; i++) {
        final l$participants$entry = l$participants[i];
        final lOther$participants$entry = lOther$participants[i];
        if (l$participants$entry != lOther$participants$entry) {
          return false;
        }
      }
    } else if (l$participants != lOther$participants) {
      return false;
    }
    final l$partySize = partySize;
    final lOther$partySize = other.partySize;
    if (_$data.containsKey('partySize') !=
        other._$data.containsKey('partySize')) {
      return false;
    }
    if (l$partySize != lOther$partySize) {
      return false;
    }
    final l$mealType = mealType;
    final lOther$mealType = other.mealType;
    if (_$data.containsKey('mealType') !=
        other._$data.containsKey('mealType')) {
      return false;
    }
    if (l$mealType != lOther$mealType) {
      return false;
    }
    final l$dietaryRestrictions = dietaryRestrictions;
    final lOther$dietaryRestrictions = other.dietaryRestrictions;
    if (_$data.containsKey('dietaryRestrictions') !=
        other._$data.containsKey('dietaryRestrictions')) {
      return false;
    }
    if (l$dietaryRestrictions != null && lOther$dietaryRestrictions != null) {
      if (l$dietaryRestrictions.length != lOther$dietaryRestrictions.length) {
        return false;
      }
      for (int i = 0; i < l$dietaryRestrictions.length; i++) {
        final l$dietaryRestrictions$entry = l$dietaryRestrictions[i];
        final lOther$dietaryRestrictions$entry = lOther$dietaryRestrictions[i];
        if (l$dietaryRestrictions$entry != lOther$dietaryRestrictions$entry) {
          return false;
        }
      }
    } else if (l$dietaryRestrictions != lOther$dietaryRestrictions) {
      return false;
    }
    final l$specialRequests = specialRequests;
    final lOther$specialRequests = other.specialRequests;
    if (_$data.containsKey('specialRequests') !=
        other._$data.containsKey('specialRequests')) {
      return false;
    }
    if (l$specialRequests != lOther$specialRequests) {
      return false;
    }
    final l$tablePreference = tablePreference;
    final lOther$tablePreference = other.tablePreference;
    if (_$data.containsKey('tablePreference') !=
        other._$data.containsKey('tablePreference')) {
      return false;
    }
    if (l$tablePreference != lOther$tablePreference) {
      return false;
    }
    final l$eventType = eventType;
    final lOther$eventType = other.eventType;
    if (_$data.containsKey('eventType') !=
        other._$data.containsKey('eventType')) {
      return false;
    }
    if (l$eventType != lOther$eventType) {
      return false;
    }
    final l$serviceAddons = serviceAddons;
    final lOther$serviceAddons = other.serviceAddons;
    if (_$data.containsKey('serviceAddons') !=
        other._$data.containsKey('serviceAddons')) {
      return false;
    }
    if (l$serviceAddons != null && lOther$serviceAddons != null) {
      if (l$serviceAddons.length != lOther$serviceAddons.length) {
        return false;
      }
      for (int i = 0; i < l$serviceAddons.length; i++) {
        final l$serviceAddons$entry = l$serviceAddons[i];
        final lOther$serviceAddons$entry = lOther$serviceAddons[i];
        if (l$serviceAddons$entry != lOther$serviceAddons$entry) {
          return false;
        }
      }
    } else if (l$serviceAddons != lOther$serviceAddons) {
      return false;
    }
    final l$guestCount = guestCount;
    final lOther$guestCount = other.guestCount;
    if (_$data.containsKey('guestCount') !=
        other._$data.containsKey('guestCount')) {
      return false;
    }
    if (l$guestCount != lOther$guestCount) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$notes = notes;
    final l$participants = participants;
    final l$partySize = partySize;
    final l$mealType = mealType;
    final l$dietaryRestrictions = dietaryRestrictions;
    final l$specialRequests = specialRequests;
    final l$tablePreference = tablePreference;
    final l$eventType = eventType;
    final l$serviceAddons = serviceAddons;
    final l$guestCount = guestCount;
    return Object.hashAll([
      _$data.containsKey('startTime') ? l$startTime : const {},
      _$data.containsKey('endTime') ? l$endTime : const {},
      _$data.containsKey('notes') ? l$notes : const {},
      _$data.containsKey('participants')
          ? l$participants == null
                ? null
                : Object.hashAll(l$participants.map((v) => v))
          : const {},
      _$data.containsKey('partySize') ? l$partySize : const {},
      _$data.containsKey('mealType') ? l$mealType : const {},
      _$data.containsKey('dietaryRestrictions')
          ? l$dietaryRestrictions == null
                ? null
                : Object.hashAll(l$dietaryRestrictions.map((v) => v))
          : const {},
      _$data.containsKey('specialRequests') ? l$specialRequests : const {},
      _$data.containsKey('tablePreference') ? l$tablePreference : const {},
      _$data.containsKey('eventType') ? l$eventType : const {},
      _$data.containsKey('serviceAddons')
          ? l$serviceAddons == null
                ? null
                : Object.hashAll(l$serviceAddons.map((v) => v))
          : const {},
      _$data.containsKey('guestCount') ? l$guestCount : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateBookingInput<TRes> {
  factory CopyWith$Input$UpdateBookingInput(
    Input$UpdateBookingInput instance,
    TRes Function(Input$UpdateBookingInput) then,
  ) = _CopyWithImpl$Input$UpdateBookingInput;

  factory CopyWith$Input$UpdateBookingInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateBookingInput;

  TRes call({
    DateTime? startTime,
    DateTime? endTime,
    String? notes,
    List<String>? participants,
    int? partySize,
    String? mealType,
    List<String>? dietaryRestrictions,
    String? specialRequests,
    String? tablePreference,
    String? eventType,
    List<String>? serviceAddons,
    int? guestCount,
  });
}

class _CopyWithImpl$Input$UpdateBookingInput<TRes>
    implements CopyWith$Input$UpdateBookingInput<TRes> {
  _CopyWithImpl$Input$UpdateBookingInput(this._instance, this._then);

  final Input$UpdateBookingInput _instance;

  final TRes Function(Input$UpdateBookingInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? notes = _undefined,
    Object? participants = _undefined,
    Object? partySize = _undefined,
    Object? mealType = _undefined,
    Object? dietaryRestrictions = _undefined,
    Object? specialRequests = _undefined,
    Object? tablePreference = _undefined,
    Object? eventType = _undefined,
    Object? serviceAddons = _undefined,
    Object? guestCount = _undefined,
  }) => _then(
    Input$UpdateBookingInput._({
      ..._instance._$data,
      if (startTime != _undefined) 'startTime': (startTime as DateTime?),
      if (endTime != _undefined) 'endTime': (endTime as DateTime?),
      if (notes != _undefined) 'notes': (notes as String?),
      if (participants != _undefined)
        'participants': (participants as List<String>?),
      if (partySize != _undefined) 'partySize': (partySize as int?),
      if (mealType != _undefined) 'mealType': (mealType as String?),
      if (dietaryRestrictions != _undefined)
        'dietaryRestrictions': (dietaryRestrictions as List<String>?),
      if (specialRequests != _undefined)
        'specialRequests': (specialRequests as String?),
      if (tablePreference != _undefined)
        'tablePreference': (tablePreference as String?),
      if (eventType != _undefined) 'eventType': (eventType as String?),
      if (serviceAddons != _undefined)
        'serviceAddons': (serviceAddons as List<String>?),
      if (guestCount != _undefined) 'guestCount': (guestCount as int?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateBookingInput<TRes>
    implements CopyWith$Input$UpdateBookingInput<TRes> {
  _CopyWithStubImpl$Input$UpdateBookingInput(this._res);

  TRes _res;

  call({
    DateTime? startTime,
    DateTime? endTime,
    String? notes,
    List<String>? participants,
    int? partySize,
    String? mealType,
    List<String>? dietaryRestrictions,
    String? specialRequests,
    String? tablePreference,
    String? eventType,
    List<String>? serviceAddons,
    int? guestCount,
  }) => _res;
}

class Input$BookingFilterInput {
  factory Input$BookingFilterInput({
    Enum$BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    String? facilityId,
    String? userId,
  }) => Input$BookingFilterInput._({
    if (status != null) r'status': status,
    if (startDate != null) r'startDate': startDate,
    if (endDate != null) r'endDate': endDate,
    if (facilityId != null) r'facilityId': facilityId,
    if (userId != null) r'userId': userId,
  });

  Input$BookingFilterInput._(this._$data);

  factory Input$BookingFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$BookingStatus((l$status as String));
    }
    if (data.containsKey('startDate')) {
      final l$startDate = data['startDate'];
      result$data['startDate'] = l$startDate == null
          ? null
          : DateTime.parse((l$startDate as String));
    }
    if (data.containsKey('endDate')) {
      final l$endDate = data['endDate'];
      result$data['endDate'] = l$endDate == null
          ? null
          : DateTime.parse((l$endDate as String));
    }
    if (data.containsKey('facilityId')) {
      final l$facilityId = data['facilityId'];
      result$data['facilityId'] = (l$facilityId as String?);
    }
    if (data.containsKey('userId')) {
      final l$userId = data['userId'];
      result$data['userId'] = (l$userId as String?);
    }
    return Input$BookingFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$BookingStatus? get status => (_$data['status'] as Enum$BookingStatus?);

  DateTime? get startDate => (_$data['startDate'] as DateTime?);

  DateTime? get endDate => (_$data['endDate'] as DateTime?);

  String? get facilityId => (_$data['facilityId'] as String?);

  String? get userId => (_$data['userId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$BookingStatus(l$status);
    }
    if (_$data.containsKey('startDate')) {
      final l$startDate = startDate;
      result$data['startDate'] = l$startDate?.toIso8601String();
    }
    if (_$data.containsKey('endDate')) {
      final l$endDate = endDate;
      result$data['endDate'] = l$endDate?.toIso8601String();
    }
    if (_$data.containsKey('facilityId')) {
      final l$facilityId = facilityId;
      result$data['facilityId'] = l$facilityId;
    }
    if (_$data.containsKey('userId')) {
      final l$userId = userId;
      result$data['userId'] = l$userId;
    }
    return result$data;
  }

  CopyWith$Input$BookingFilterInput<Input$BookingFilterInput> get copyWith =>
      CopyWith$Input$BookingFilterInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$BookingFilterInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (_$data.containsKey('startDate') !=
        other._$data.containsKey('startDate')) {
      return false;
    }
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (_$data.containsKey('endDate') != other._$data.containsKey('endDate')) {
      return false;
    }
    if (l$endDate != lOther$endDate) {
      return false;
    }
    final l$facilityId = facilityId;
    final lOther$facilityId = other.facilityId;
    if (_$data.containsKey('facilityId') !=
        other._$data.containsKey('facilityId')) {
      return false;
    }
    if (l$facilityId != lOther$facilityId) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (_$data.containsKey('userId') != other._$data.containsKey('userId')) {
      return false;
    }
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$status = status;
    final l$startDate = startDate;
    final l$endDate = endDate;
    final l$facilityId = facilityId;
    final l$userId = userId;
    return Object.hashAll([
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('startDate') ? l$startDate : const {},
      _$data.containsKey('endDate') ? l$endDate : const {},
      _$data.containsKey('facilityId') ? l$facilityId : const {},
      _$data.containsKey('userId') ? l$userId : const {},
    ]);
  }
}

abstract class CopyWith$Input$BookingFilterInput<TRes> {
  factory CopyWith$Input$BookingFilterInput(
    Input$BookingFilterInput instance,
    TRes Function(Input$BookingFilterInput) then,
  ) = _CopyWithImpl$Input$BookingFilterInput;

  factory CopyWith$Input$BookingFilterInput.stub(TRes res) =
      _CopyWithStubImpl$Input$BookingFilterInput;

  TRes call({
    Enum$BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    String? facilityId,
    String? userId,
  });
}

class _CopyWithImpl$Input$BookingFilterInput<TRes>
    implements CopyWith$Input$BookingFilterInput<TRes> {
  _CopyWithImpl$Input$BookingFilterInput(this._instance, this._then);

  final Input$BookingFilterInput _instance;

  final TRes Function(Input$BookingFilterInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? status = _undefined,
    Object? startDate = _undefined,
    Object? endDate = _undefined,
    Object? facilityId = _undefined,
    Object? userId = _undefined,
  }) => _then(
    Input$BookingFilterInput._({
      ..._instance._$data,
      if (status != _undefined) 'status': (status as Enum$BookingStatus?),
      if (startDate != _undefined) 'startDate': (startDate as DateTime?),
      if (endDate != _undefined) 'endDate': (endDate as DateTime?),
      if (facilityId != _undefined) 'facilityId': (facilityId as String?),
      if (userId != _undefined) 'userId': (userId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$BookingFilterInput<TRes>
    implements CopyWith$Input$BookingFilterInput<TRes> {
  _CopyWithStubImpl$Input$BookingFilterInput(this._res);

  TRes _res;

  call({
    Enum$BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    String? facilityId,
    String? userId,
  }) => _res;
}

class Input$ClubFilterInput {
  factory Input$ClubFilterInput({
    String? search,
    String? city,
    Enum$ClubStatus? status,
    List<String>? amenities,
  }) => Input$ClubFilterInput._({
    if (search != null) r'search': search,
    if (city != null) r'city': city,
    if (status != null) r'status': status,
    if (amenities != null) r'amenities': amenities,
  });

  Input$ClubFilterInput._(this._$data);

  factory Input$ClubFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('search')) {
      final l$search = data['search'];
      result$data['search'] = (l$search as String?);
    }
    if (data.containsKey('city')) {
      final l$city = data['city'];
      result$data['city'] = (l$city as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$ClubStatus((l$status as String));
    }
    if (data.containsKey('amenities')) {
      final l$amenities = data['amenities'];
      result$data['amenities'] = (l$amenities as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    return Input$ClubFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get search => (_$data['search'] as String?);

  String? get city => (_$data['city'] as String?);

  Enum$ClubStatus? get status => (_$data['status'] as Enum$ClubStatus?);

  List<String>? get amenities => (_$data['amenities'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('search')) {
      final l$search = search;
      result$data['search'] = l$search;
    }
    if (_$data.containsKey('city')) {
      final l$city = city;
      result$data['city'] = l$city;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$ClubStatus(l$status);
    }
    if (_$data.containsKey('amenities')) {
      final l$amenities = amenities;
      result$data['amenities'] = l$amenities?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$ClubFilterInput<Input$ClubFilterInput> get copyWith =>
      CopyWith$Input$ClubFilterInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ClubFilterInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$search = search;
    final lOther$search = other.search;
    if (_$data.containsKey('search') != other._$data.containsKey('search')) {
      return false;
    }
    if (l$search != lOther$search) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (_$data.containsKey('city') != other._$data.containsKey('city')) {
      return false;
    }
    if (l$city != lOther$city) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$amenities = amenities;
    final lOther$amenities = other.amenities;
    if (_$data.containsKey('amenities') !=
        other._$data.containsKey('amenities')) {
      return false;
    }
    if (l$amenities != null && lOther$amenities != null) {
      if (l$amenities.length != lOther$amenities.length) {
        return false;
      }
      for (int i = 0; i < l$amenities.length; i++) {
        final l$amenities$entry = l$amenities[i];
        final lOther$amenities$entry = lOther$amenities[i];
        if (l$amenities$entry != lOther$amenities$entry) {
          return false;
        }
      }
    } else if (l$amenities != lOther$amenities) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$search = search;
    final l$city = city;
    final l$status = status;
    final l$amenities = amenities;
    return Object.hashAll([
      _$data.containsKey('search') ? l$search : const {},
      _$data.containsKey('city') ? l$city : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('amenities')
          ? l$amenities == null
                ? null
                : Object.hashAll(l$amenities.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$ClubFilterInput<TRes> {
  factory CopyWith$Input$ClubFilterInput(
    Input$ClubFilterInput instance,
    TRes Function(Input$ClubFilterInput) then,
  ) = _CopyWithImpl$Input$ClubFilterInput;

  factory CopyWith$Input$ClubFilterInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ClubFilterInput;

  TRes call({
    String? search,
    String? city,
    Enum$ClubStatus? status,
    List<String>? amenities,
  });
}

class _CopyWithImpl$Input$ClubFilterInput<TRes>
    implements CopyWith$Input$ClubFilterInput<TRes> {
  _CopyWithImpl$Input$ClubFilterInput(this._instance, this._then);

  final Input$ClubFilterInput _instance;

  final TRes Function(Input$ClubFilterInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? search = _undefined,
    Object? city = _undefined,
    Object? status = _undefined,
    Object? amenities = _undefined,
  }) => _then(
    Input$ClubFilterInput._({
      ..._instance._$data,
      if (search != _undefined) 'search': (search as String?),
      if (city != _undefined) 'city': (city as String?),
      if (status != _undefined) 'status': (status as Enum$ClubStatus?),
      if (amenities != _undefined) 'amenities': (amenities as List<String>?),
    }),
  );
}

class _CopyWithStubImpl$Input$ClubFilterInput<TRes>
    implements CopyWith$Input$ClubFilterInput<TRes> {
  _CopyWithStubImpl$Input$ClubFilterInput(this._res);

  TRes _res;

  call({
    String? search,
    String? city,
    Enum$ClubStatus? status,
    List<String>? amenities,
  }) => _res;
}

class Input$CreateClubInput {
  factory Input$CreateClubInput({
    required String name,
    required String slug,
    String? description,
    required String location,
    String? website,
    String? contactEmail,
    String? contactPhone,
    String? address,
    Input$ClubSettingsInput? settings,
  }) => Input$CreateClubInput._({
    r'name': name,
    r'slug': slug,
    if (description != null) r'description': description,
    r'location': location,
    if (website != null) r'website': website,
    if (contactEmail != null) r'contactEmail': contactEmail,
    if (contactPhone != null) r'contactPhone': contactPhone,
    if (address != null) r'address': address,
    if (settings != null) r'settings': settings,
  });

  Input$CreateClubInput._(this._$data);

  factory Input$CreateClubInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$slug = data['slug'];
    result$data['slug'] = (l$slug as String);
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    final l$location = data['location'];
    result$data['location'] = (l$location as String);
    if (data.containsKey('website')) {
      final l$website = data['website'];
      result$data['website'] = (l$website as String?);
    }
    if (data.containsKey('contactEmail')) {
      final l$contactEmail = data['contactEmail'];
      result$data['contactEmail'] = (l$contactEmail as String?);
    }
    if (data.containsKey('contactPhone')) {
      final l$contactPhone = data['contactPhone'];
      result$data['contactPhone'] = (l$contactPhone as String?);
    }
    if (data.containsKey('address')) {
      final l$address = data['address'];
      result$data['address'] = (l$address as String?);
    }
    if (data.containsKey('settings')) {
      final l$settings = data['settings'];
      result$data['settings'] = l$settings == null
          ? null
          : Input$ClubSettingsInput.fromJson(
              (l$settings as Map<String, dynamic>),
            );
    }
    return Input$CreateClubInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String get slug => (_$data['slug'] as String);

  String? get description => (_$data['description'] as String?);

  String get location => (_$data['location'] as String);

  String? get website => (_$data['website'] as String?);

  String? get contactEmail => (_$data['contactEmail'] as String?);

  String? get contactPhone => (_$data['contactPhone'] as String?);

  String? get address => (_$data['address'] as String?);

  Input$ClubSettingsInput? get settings =>
      (_$data['settings'] as Input$ClubSettingsInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$slug = slug;
    result$data['slug'] = l$slug;
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    final l$location = location;
    result$data['location'] = l$location;
    if (_$data.containsKey('website')) {
      final l$website = website;
      result$data['website'] = l$website;
    }
    if (_$data.containsKey('contactEmail')) {
      final l$contactEmail = contactEmail;
      result$data['contactEmail'] = l$contactEmail;
    }
    if (_$data.containsKey('contactPhone')) {
      final l$contactPhone = contactPhone;
      result$data['contactPhone'] = l$contactPhone;
    }
    if (_$data.containsKey('address')) {
      final l$address = address;
      result$data['address'] = l$address;
    }
    if (_$data.containsKey('settings')) {
      final l$settings = settings;
      result$data['settings'] = l$settings?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$CreateClubInput<Input$CreateClubInput> get copyWith =>
      CopyWith$Input$CreateClubInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateClubInput || runtimeType != other.runtimeType) {
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
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
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
    if (_$data.containsKey('website') != other._$data.containsKey('website')) {
      return false;
    }
    if (l$website != lOther$website) {
      return false;
    }
    final l$contactEmail = contactEmail;
    final lOther$contactEmail = other.contactEmail;
    if (_$data.containsKey('contactEmail') !=
        other._$data.containsKey('contactEmail')) {
      return false;
    }
    if (l$contactEmail != lOther$contactEmail) {
      return false;
    }
    final l$contactPhone = contactPhone;
    final lOther$contactPhone = other.contactPhone;
    if (_$data.containsKey('contactPhone') !=
        other._$data.containsKey('contactPhone')) {
      return false;
    }
    if (l$contactPhone != lOther$contactPhone) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (_$data.containsKey('address') != other._$data.containsKey('address')) {
      return false;
    }
    if (l$address != lOther$address) {
      return false;
    }
    final l$settings = settings;
    final lOther$settings = other.settings;
    if (_$data.containsKey('settings') !=
        other._$data.containsKey('settings')) {
      return false;
    }
    if (l$settings != lOther$settings) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$slug = slug;
    final l$description = description;
    final l$location = location;
    final l$website = website;
    final l$contactEmail = contactEmail;
    final l$contactPhone = contactPhone;
    final l$address = address;
    final l$settings = settings;
    return Object.hashAll([
      l$name,
      l$slug,
      _$data.containsKey('description') ? l$description : const {},
      l$location,
      _$data.containsKey('website') ? l$website : const {},
      _$data.containsKey('contactEmail') ? l$contactEmail : const {},
      _$data.containsKey('contactPhone') ? l$contactPhone : const {},
      _$data.containsKey('address') ? l$address : const {},
      _$data.containsKey('settings') ? l$settings : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateClubInput<TRes> {
  factory CopyWith$Input$CreateClubInput(
    Input$CreateClubInput instance,
    TRes Function(Input$CreateClubInput) then,
  ) = _CopyWithImpl$Input$CreateClubInput;

  factory CopyWith$Input$CreateClubInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateClubInput;

  TRes call({
    String? name,
    String? slug,
    String? description,
    String? location,
    String? website,
    String? contactEmail,
    String? contactPhone,
    String? address,
    Input$ClubSettingsInput? settings,
  });
  CopyWith$Input$ClubSettingsInput<TRes> get settings;
}

class _CopyWithImpl$Input$CreateClubInput<TRes>
    implements CopyWith$Input$CreateClubInput<TRes> {
  _CopyWithImpl$Input$CreateClubInput(this._instance, this._then);

  final Input$CreateClubInput _instance;

  final TRes Function(Input$CreateClubInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? slug = _undefined,
    Object? description = _undefined,
    Object? location = _undefined,
    Object? website = _undefined,
    Object? contactEmail = _undefined,
    Object? contactPhone = _undefined,
    Object? address = _undefined,
    Object? settings = _undefined,
  }) => _then(
    Input$CreateClubInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (slug != _undefined && slug != null) 'slug': (slug as String),
      if (description != _undefined) 'description': (description as String?),
      if (location != _undefined && location != null)
        'location': (location as String),
      if (website != _undefined) 'website': (website as String?),
      if (contactEmail != _undefined) 'contactEmail': (contactEmail as String?),
      if (contactPhone != _undefined) 'contactPhone': (contactPhone as String?),
      if (address != _undefined) 'address': (address as String?),
      if (settings != _undefined)
        'settings': (settings as Input$ClubSettingsInput?),
    }),
  );

  CopyWith$Input$ClubSettingsInput<TRes> get settings {
    final local$settings = _instance.settings;
    return local$settings == null
        ? CopyWith$Input$ClubSettingsInput.stub(_then(_instance))
        : CopyWith$Input$ClubSettingsInput(
            local$settings,
            (e) => call(settings: e),
          );
  }
}

class _CopyWithStubImpl$Input$CreateClubInput<TRes>
    implements CopyWith$Input$CreateClubInput<TRes> {
  _CopyWithStubImpl$Input$CreateClubInput(this._res);

  TRes _res;

  call({
    String? name,
    String? slug,
    String? description,
    String? location,
    String? website,
    String? contactEmail,
    String? contactPhone,
    String? address,
    Input$ClubSettingsInput? settings,
  }) => _res;

  CopyWith$Input$ClubSettingsInput<TRes> get settings =>
      CopyWith$Input$ClubSettingsInput.stub(_res);
}

class Input$UpdateClubInput {
  factory Input$UpdateClubInput({
    String? name,
    String? description,
    String? location,
    String? website,
    String? contactEmail,
    String? contactPhone,
    String? address,
    Input$ClubSettingsInput? settings,
    Enum$ClubStatus? status,
  }) => Input$UpdateClubInput._({
    if (name != null) r'name': name,
    if (description != null) r'description': description,
    if (location != null) r'location': location,
    if (website != null) r'website': website,
    if (contactEmail != null) r'contactEmail': contactEmail,
    if (contactPhone != null) r'contactPhone': contactPhone,
    if (address != null) r'address': address,
    if (settings != null) r'settings': settings,
    if (status != null) r'status': status,
  });

  Input$UpdateClubInput._(this._$data);

  factory Input$UpdateClubInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('location')) {
      final l$location = data['location'];
      result$data['location'] = (l$location as String?);
    }
    if (data.containsKey('website')) {
      final l$website = data['website'];
      result$data['website'] = (l$website as String?);
    }
    if (data.containsKey('contactEmail')) {
      final l$contactEmail = data['contactEmail'];
      result$data['contactEmail'] = (l$contactEmail as String?);
    }
    if (data.containsKey('contactPhone')) {
      final l$contactPhone = data['contactPhone'];
      result$data['contactPhone'] = (l$contactPhone as String?);
    }
    if (data.containsKey('address')) {
      final l$address = data['address'];
      result$data['address'] = (l$address as String?);
    }
    if (data.containsKey('settings')) {
      final l$settings = data['settings'];
      result$data['settings'] = l$settings == null
          ? null
          : Input$ClubSettingsInput.fromJson(
              (l$settings as Map<String, dynamic>),
            );
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$ClubStatus((l$status as String));
    }
    return Input$UpdateClubInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get description => (_$data['description'] as String?);

  String? get location => (_$data['location'] as String?);

  String? get website => (_$data['website'] as String?);

  String? get contactEmail => (_$data['contactEmail'] as String?);

  String? get contactPhone => (_$data['contactPhone'] as String?);

  String? get address => (_$data['address'] as String?);

  Input$ClubSettingsInput? get settings =>
      (_$data['settings'] as Input$ClubSettingsInput?);

  Enum$ClubStatus? get status => (_$data['status'] as Enum$ClubStatus?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('location')) {
      final l$location = location;
      result$data['location'] = l$location;
    }
    if (_$data.containsKey('website')) {
      final l$website = website;
      result$data['website'] = l$website;
    }
    if (_$data.containsKey('contactEmail')) {
      final l$contactEmail = contactEmail;
      result$data['contactEmail'] = l$contactEmail;
    }
    if (_$data.containsKey('contactPhone')) {
      final l$contactPhone = contactPhone;
      result$data['contactPhone'] = l$contactPhone;
    }
    if (_$data.containsKey('address')) {
      final l$address = address;
      result$data['address'] = l$address;
    }
    if (_$data.containsKey('settings')) {
      final l$settings = settings;
      result$data['settings'] = l$settings?.toJson();
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$ClubStatus(l$status);
    }
    return result$data;
  }

  CopyWith$Input$UpdateClubInput<Input$UpdateClubInput> get copyWith =>
      CopyWith$Input$UpdateClubInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateClubInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (_$data.containsKey('location') !=
        other._$data.containsKey('location')) {
      return false;
    }
    if (l$location != lOther$location) {
      return false;
    }
    final l$website = website;
    final lOther$website = other.website;
    if (_$data.containsKey('website') != other._$data.containsKey('website')) {
      return false;
    }
    if (l$website != lOther$website) {
      return false;
    }
    final l$contactEmail = contactEmail;
    final lOther$contactEmail = other.contactEmail;
    if (_$data.containsKey('contactEmail') !=
        other._$data.containsKey('contactEmail')) {
      return false;
    }
    if (l$contactEmail != lOther$contactEmail) {
      return false;
    }
    final l$contactPhone = contactPhone;
    final lOther$contactPhone = other.contactPhone;
    if (_$data.containsKey('contactPhone') !=
        other._$data.containsKey('contactPhone')) {
      return false;
    }
    if (l$contactPhone != lOther$contactPhone) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (_$data.containsKey('address') != other._$data.containsKey('address')) {
      return false;
    }
    if (l$address != lOther$address) {
      return false;
    }
    final l$settings = settings;
    final lOther$settings = other.settings;
    if (_$data.containsKey('settings') !=
        other._$data.containsKey('settings')) {
      return false;
    }
    if (l$settings != lOther$settings) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$location = location;
    final l$website = website;
    final l$contactEmail = contactEmail;
    final l$contactPhone = contactPhone;
    final l$address = address;
    final l$settings = settings;
    final l$status = status;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('location') ? l$location : const {},
      _$data.containsKey('website') ? l$website : const {},
      _$data.containsKey('contactEmail') ? l$contactEmail : const {},
      _$data.containsKey('contactPhone') ? l$contactPhone : const {},
      _$data.containsKey('address') ? l$address : const {},
      _$data.containsKey('settings') ? l$settings : const {},
      _$data.containsKey('status') ? l$status : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateClubInput<TRes> {
  factory CopyWith$Input$UpdateClubInput(
    Input$UpdateClubInput instance,
    TRes Function(Input$UpdateClubInput) then,
  ) = _CopyWithImpl$Input$UpdateClubInput;

  factory CopyWith$Input$UpdateClubInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateClubInput;

  TRes call({
    String? name,
    String? description,
    String? location,
    String? website,
    String? contactEmail,
    String? contactPhone,
    String? address,
    Input$ClubSettingsInput? settings,
    Enum$ClubStatus? status,
  });
  CopyWith$Input$ClubSettingsInput<TRes> get settings;
}

class _CopyWithImpl$Input$UpdateClubInput<TRes>
    implements CopyWith$Input$UpdateClubInput<TRes> {
  _CopyWithImpl$Input$UpdateClubInput(this._instance, this._then);

  final Input$UpdateClubInput _instance;

  final TRes Function(Input$UpdateClubInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? location = _undefined,
    Object? website = _undefined,
    Object? contactEmail = _undefined,
    Object? contactPhone = _undefined,
    Object? address = _undefined,
    Object? settings = _undefined,
    Object? status = _undefined,
  }) => _then(
    Input$UpdateClubInput._({
      ..._instance._$data,
      if (name != _undefined) 'name': (name as String?),
      if (description != _undefined) 'description': (description as String?),
      if (location != _undefined) 'location': (location as String?),
      if (website != _undefined) 'website': (website as String?),
      if (contactEmail != _undefined) 'contactEmail': (contactEmail as String?),
      if (contactPhone != _undefined) 'contactPhone': (contactPhone as String?),
      if (address != _undefined) 'address': (address as String?),
      if (settings != _undefined)
        'settings': (settings as Input$ClubSettingsInput?),
      if (status != _undefined) 'status': (status as Enum$ClubStatus?),
    }),
  );

  CopyWith$Input$ClubSettingsInput<TRes> get settings {
    final local$settings = _instance.settings;
    return local$settings == null
        ? CopyWith$Input$ClubSettingsInput.stub(_then(_instance))
        : CopyWith$Input$ClubSettingsInput(
            local$settings,
            (e) => call(settings: e),
          );
  }
}

class _CopyWithStubImpl$Input$UpdateClubInput<TRes>
    implements CopyWith$Input$UpdateClubInput<TRes> {
  _CopyWithStubImpl$Input$UpdateClubInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    String? location,
    String? website,
    String? contactEmail,
    String? contactPhone,
    String? address,
    Input$ClubSettingsInput? settings,
    Enum$ClubStatus? status,
  }) => _res;

  CopyWith$Input$ClubSettingsInput<TRes> get settings =>
      CopyWith$Input$ClubSettingsInput.stub(_res);
}

class Input$ClubSettingsInput {
  factory Input$ClubSettingsInput({
    bool? allowReciprocal,
    bool? requireApproval,
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    bool? enablePasskeyAuth,
    bool? requirePasskeyAuth,
    int? sessionTimeoutMinutes,
    int? maxFailedAttempts,
    int? lockoutDurationMinutes,
    bool? enableAuditLogging,
  }) => Input$ClubSettingsInput._({
    if (allowReciprocal != null) r'allowReciprocal': allowReciprocal,
    if (requireApproval != null) r'requireApproval': requireApproval,
    if (maxVisitsPerMonth != null) r'maxVisitsPerMonth': maxVisitsPerMonth,
    if (reciprocalFee != null) r'reciprocalFee': reciprocalFee,
    if (enablePasskeyAuth != null) r'enablePasskeyAuth': enablePasskeyAuth,
    if (requirePasskeyAuth != null) r'requirePasskeyAuth': requirePasskeyAuth,
    if (sessionTimeoutMinutes != null)
      r'sessionTimeoutMinutes': sessionTimeoutMinutes,
    if (maxFailedAttempts != null) r'maxFailedAttempts': maxFailedAttempts,
    if (lockoutDurationMinutes != null)
      r'lockoutDurationMinutes': lockoutDurationMinutes,
    if (enableAuditLogging != null) r'enableAuditLogging': enableAuditLogging,
  });

  Input$ClubSettingsInput._(this._$data);

  factory Input$ClubSettingsInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('allowReciprocal')) {
      final l$allowReciprocal = data['allowReciprocal'];
      result$data['allowReciprocal'] = (l$allowReciprocal as bool?);
    }
    if (data.containsKey('requireApproval')) {
      final l$requireApproval = data['requireApproval'];
      result$data['requireApproval'] = (l$requireApproval as bool?);
    }
    if (data.containsKey('maxVisitsPerMonth')) {
      final l$maxVisitsPerMonth = data['maxVisitsPerMonth'];
      result$data['maxVisitsPerMonth'] = (l$maxVisitsPerMonth as int?);
    }
    if (data.containsKey('reciprocalFee')) {
      final l$reciprocalFee = data['reciprocalFee'];
      result$data['reciprocalFee'] = (l$reciprocalFee as num?)?.toDouble();
    }
    if (data.containsKey('enablePasskeyAuth')) {
      final l$enablePasskeyAuth = data['enablePasskeyAuth'];
      result$data['enablePasskeyAuth'] = (l$enablePasskeyAuth as bool?);
    }
    if (data.containsKey('requirePasskeyAuth')) {
      final l$requirePasskeyAuth = data['requirePasskeyAuth'];
      result$data['requirePasskeyAuth'] = (l$requirePasskeyAuth as bool?);
    }
    if (data.containsKey('sessionTimeoutMinutes')) {
      final l$sessionTimeoutMinutes = data['sessionTimeoutMinutes'];
      result$data['sessionTimeoutMinutes'] = (l$sessionTimeoutMinutes as int?);
    }
    if (data.containsKey('maxFailedAttempts')) {
      final l$maxFailedAttempts = data['maxFailedAttempts'];
      result$data['maxFailedAttempts'] = (l$maxFailedAttempts as int?);
    }
    if (data.containsKey('lockoutDurationMinutes')) {
      final l$lockoutDurationMinutes = data['lockoutDurationMinutes'];
      result$data['lockoutDurationMinutes'] =
          (l$lockoutDurationMinutes as int?);
    }
    if (data.containsKey('enableAuditLogging')) {
      final l$enableAuditLogging = data['enableAuditLogging'];
      result$data['enableAuditLogging'] = (l$enableAuditLogging as bool?);
    }
    return Input$ClubSettingsInput._(result$data);
  }

  Map<String, dynamic> _$data;

  bool? get allowReciprocal => (_$data['allowReciprocal'] as bool?);

  bool? get requireApproval => (_$data['requireApproval'] as bool?);

  int? get maxVisitsPerMonth => (_$data['maxVisitsPerMonth'] as int?);

  double? get reciprocalFee => (_$data['reciprocalFee'] as double?);

  bool? get enablePasskeyAuth => (_$data['enablePasskeyAuth'] as bool?);

  bool? get requirePasskeyAuth => (_$data['requirePasskeyAuth'] as bool?);

  int? get sessionTimeoutMinutes => (_$data['sessionTimeoutMinutes'] as int?);

  int? get maxFailedAttempts => (_$data['maxFailedAttempts'] as int?);

  int? get lockoutDurationMinutes => (_$data['lockoutDurationMinutes'] as int?);

  bool? get enableAuditLogging => (_$data['enableAuditLogging'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('allowReciprocal')) {
      final l$allowReciprocal = allowReciprocal;
      result$data['allowReciprocal'] = l$allowReciprocal;
    }
    if (_$data.containsKey('requireApproval')) {
      final l$requireApproval = requireApproval;
      result$data['requireApproval'] = l$requireApproval;
    }
    if (_$data.containsKey('maxVisitsPerMonth')) {
      final l$maxVisitsPerMonth = maxVisitsPerMonth;
      result$data['maxVisitsPerMonth'] = l$maxVisitsPerMonth;
    }
    if (_$data.containsKey('reciprocalFee')) {
      final l$reciprocalFee = reciprocalFee;
      result$data['reciprocalFee'] = l$reciprocalFee;
    }
    if (_$data.containsKey('enablePasskeyAuth')) {
      final l$enablePasskeyAuth = enablePasskeyAuth;
      result$data['enablePasskeyAuth'] = l$enablePasskeyAuth;
    }
    if (_$data.containsKey('requirePasskeyAuth')) {
      final l$requirePasskeyAuth = requirePasskeyAuth;
      result$data['requirePasskeyAuth'] = l$requirePasskeyAuth;
    }
    if (_$data.containsKey('sessionTimeoutMinutes')) {
      final l$sessionTimeoutMinutes = sessionTimeoutMinutes;
      result$data['sessionTimeoutMinutes'] = l$sessionTimeoutMinutes;
    }
    if (_$data.containsKey('maxFailedAttempts')) {
      final l$maxFailedAttempts = maxFailedAttempts;
      result$data['maxFailedAttempts'] = l$maxFailedAttempts;
    }
    if (_$data.containsKey('lockoutDurationMinutes')) {
      final l$lockoutDurationMinutes = lockoutDurationMinutes;
      result$data['lockoutDurationMinutes'] = l$lockoutDurationMinutes;
    }
    if (_$data.containsKey('enableAuditLogging')) {
      final l$enableAuditLogging = enableAuditLogging;
      result$data['enableAuditLogging'] = l$enableAuditLogging;
    }
    return result$data;
  }

  CopyWith$Input$ClubSettingsInput<Input$ClubSettingsInput> get copyWith =>
      CopyWith$Input$ClubSettingsInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ClubSettingsInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$allowReciprocal = allowReciprocal;
    final lOther$allowReciprocal = other.allowReciprocal;
    if (_$data.containsKey('allowReciprocal') !=
        other._$data.containsKey('allowReciprocal')) {
      return false;
    }
    if (l$allowReciprocal != lOther$allowReciprocal) {
      return false;
    }
    final l$requireApproval = requireApproval;
    final lOther$requireApproval = other.requireApproval;
    if (_$data.containsKey('requireApproval') !=
        other._$data.containsKey('requireApproval')) {
      return false;
    }
    if (l$requireApproval != lOther$requireApproval) {
      return false;
    }
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    final lOther$maxVisitsPerMonth = other.maxVisitsPerMonth;
    if (_$data.containsKey('maxVisitsPerMonth') !=
        other._$data.containsKey('maxVisitsPerMonth')) {
      return false;
    }
    if (l$maxVisitsPerMonth != lOther$maxVisitsPerMonth) {
      return false;
    }
    final l$reciprocalFee = reciprocalFee;
    final lOther$reciprocalFee = other.reciprocalFee;
    if (_$data.containsKey('reciprocalFee') !=
        other._$data.containsKey('reciprocalFee')) {
      return false;
    }
    if (l$reciprocalFee != lOther$reciprocalFee) {
      return false;
    }
    final l$enablePasskeyAuth = enablePasskeyAuth;
    final lOther$enablePasskeyAuth = other.enablePasskeyAuth;
    if (_$data.containsKey('enablePasskeyAuth') !=
        other._$data.containsKey('enablePasskeyAuth')) {
      return false;
    }
    if (l$enablePasskeyAuth != lOther$enablePasskeyAuth) {
      return false;
    }
    final l$requirePasskeyAuth = requirePasskeyAuth;
    final lOther$requirePasskeyAuth = other.requirePasskeyAuth;
    if (_$data.containsKey('requirePasskeyAuth') !=
        other._$data.containsKey('requirePasskeyAuth')) {
      return false;
    }
    if (l$requirePasskeyAuth != lOther$requirePasskeyAuth) {
      return false;
    }
    final l$sessionTimeoutMinutes = sessionTimeoutMinutes;
    final lOther$sessionTimeoutMinutes = other.sessionTimeoutMinutes;
    if (_$data.containsKey('sessionTimeoutMinutes') !=
        other._$data.containsKey('sessionTimeoutMinutes')) {
      return false;
    }
    if (l$sessionTimeoutMinutes != lOther$sessionTimeoutMinutes) {
      return false;
    }
    final l$maxFailedAttempts = maxFailedAttempts;
    final lOther$maxFailedAttempts = other.maxFailedAttempts;
    if (_$data.containsKey('maxFailedAttempts') !=
        other._$data.containsKey('maxFailedAttempts')) {
      return false;
    }
    if (l$maxFailedAttempts != lOther$maxFailedAttempts) {
      return false;
    }
    final l$lockoutDurationMinutes = lockoutDurationMinutes;
    final lOther$lockoutDurationMinutes = other.lockoutDurationMinutes;
    if (_$data.containsKey('lockoutDurationMinutes') !=
        other._$data.containsKey('lockoutDurationMinutes')) {
      return false;
    }
    if (l$lockoutDurationMinutes != lOther$lockoutDurationMinutes) {
      return false;
    }
    final l$enableAuditLogging = enableAuditLogging;
    final lOther$enableAuditLogging = other.enableAuditLogging;
    if (_$data.containsKey('enableAuditLogging') !=
        other._$data.containsKey('enableAuditLogging')) {
      return false;
    }
    if (l$enableAuditLogging != lOther$enableAuditLogging) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$allowReciprocal = allowReciprocal;
    final l$requireApproval = requireApproval;
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    final l$reciprocalFee = reciprocalFee;
    final l$enablePasskeyAuth = enablePasskeyAuth;
    final l$requirePasskeyAuth = requirePasskeyAuth;
    final l$sessionTimeoutMinutes = sessionTimeoutMinutes;
    final l$maxFailedAttempts = maxFailedAttempts;
    final l$lockoutDurationMinutes = lockoutDurationMinutes;
    final l$enableAuditLogging = enableAuditLogging;
    return Object.hashAll([
      _$data.containsKey('allowReciprocal') ? l$allowReciprocal : const {},
      _$data.containsKey('requireApproval') ? l$requireApproval : const {},
      _$data.containsKey('maxVisitsPerMonth') ? l$maxVisitsPerMonth : const {},
      _$data.containsKey('reciprocalFee') ? l$reciprocalFee : const {},
      _$data.containsKey('enablePasskeyAuth') ? l$enablePasskeyAuth : const {},
      _$data.containsKey('requirePasskeyAuth')
          ? l$requirePasskeyAuth
          : const {},
      _$data.containsKey('sessionTimeoutMinutes')
          ? l$sessionTimeoutMinutes
          : const {},
      _$data.containsKey('maxFailedAttempts') ? l$maxFailedAttempts : const {},
      _$data.containsKey('lockoutDurationMinutes')
          ? l$lockoutDurationMinutes
          : const {},
      _$data.containsKey('enableAuditLogging')
          ? l$enableAuditLogging
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$ClubSettingsInput<TRes> {
  factory CopyWith$Input$ClubSettingsInput(
    Input$ClubSettingsInput instance,
    TRes Function(Input$ClubSettingsInput) then,
  ) = _CopyWithImpl$Input$ClubSettingsInput;

  factory CopyWith$Input$ClubSettingsInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ClubSettingsInput;

  TRes call({
    bool? allowReciprocal,
    bool? requireApproval,
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    bool? enablePasskeyAuth,
    bool? requirePasskeyAuth,
    int? sessionTimeoutMinutes,
    int? maxFailedAttempts,
    int? lockoutDurationMinutes,
    bool? enableAuditLogging,
  });
}

class _CopyWithImpl$Input$ClubSettingsInput<TRes>
    implements CopyWith$Input$ClubSettingsInput<TRes> {
  _CopyWithImpl$Input$ClubSettingsInput(this._instance, this._then);

  final Input$ClubSettingsInput _instance;

  final TRes Function(Input$ClubSettingsInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? allowReciprocal = _undefined,
    Object? requireApproval = _undefined,
    Object? maxVisitsPerMonth = _undefined,
    Object? reciprocalFee = _undefined,
    Object? enablePasskeyAuth = _undefined,
    Object? requirePasskeyAuth = _undefined,
    Object? sessionTimeoutMinutes = _undefined,
    Object? maxFailedAttempts = _undefined,
    Object? lockoutDurationMinutes = _undefined,
    Object? enableAuditLogging = _undefined,
  }) => _then(
    Input$ClubSettingsInput._({
      ..._instance._$data,
      if (allowReciprocal != _undefined)
        'allowReciprocal': (allowReciprocal as bool?),
      if (requireApproval != _undefined)
        'requireApproval': (requireApproval as bool?),
      if (maxVisitsPerMonth != _undefined)
        'maxVisitsPerMonth': (maxVisitsPerMonth as int?),
      if (reciprocalFee != _undefined)
        'reciprocalFee': (reciprocalFee as double?),
      if (enablePasskeyAuth != _undefined)
        'enablePasskeyAuth': (enablePasskeyAuth as bool?),
      if (requirePasskeyAuth != _undefined)
        'requirePasskeyAuth': (requirePasskeyAuth as bool?),
      if (sessionTimeoutMinutes != _undefined)
        'sessionTimeoutMinutes': (sessionTimeoutMinutes as int?),
      if (maxFailedAttempts != _undefined)
        'maxFailedAttempts': (maxFailedAttempts as int?),
      if (lockoutDurationMinutes != _undefined)
        'lockoutDurationMinutes': (lockoutDurationMinutes as int?),
      if (enableAuditLogging != _undefined)
        'enableAuditLogging': (enableAuditLogging as bool?),
    }),
  );
}

class _CopyWithStubImpl$Input$ClubSettingsInput<TRes>
    implements CopyWith$Input$ClubSettingsInput<TRes> {
  _CopyWithStubImpl$Input$ClubSettingsInput(this._res);

  TRes _res;

  call({
    bool? allowReciprocal,
    bool? requireApproval,
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    bool? enablePasskeyAuth,
    bool? requirePasskeyAuth,
    int? sessionTimeoutMinutes,
    int? maxFailedAttempts,
    int? lockoutDurationMinutes,
    bool? enableAuditLogging,
  }) => _res;
}

class Input$CreateRSVPInput {
  factory Input$CreateRSVPInput({int? guestCount, String? notes}) =>
      Input$CreateRSVPInput._({
        if (guestCount != null) r'guestCount': guestCount,
        if (notes != null) r'notes': notes,
      });

  Input$CreateRSVPInput._(this._$data);

  factory Input$CreateRSVPInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('guestCount')) {
      final l$guestCount = data['guestCount'];
      result$data['guestCount'] = (l$guestCount as int?);
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Input$CreateRSVPInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get guestCount => (_$data['guestCount'] as int?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('guestCount')) {
      final l$guestCount = guestCount;
      result$data['guestCount'] = l$guestCount;
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    return result$data;
  }

  CopyWith$Input$CreateRSVPInput<Input$CreateRSVPInput> get copyWith =>
      CopyWith$Input$CreateRSVPInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateRSVPInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$guestCount = guestCount;
    final lOther$guestCount = other.guestCount;
    if (_$data.containsKey('guestCount') !=
        other._$data.containsKey('guestCount')) {
      return false;
    }
    if (l$guestCount != lOther$guestCount) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (_$data.containsKey('notes') != other._$data.containsKey('notes')) {
      return false;
    }
    if (l$notes != lOther$notes) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$guestCount = guestCount;
    final l$notes = notes;
    return Object.hashAll([
      _$data.containsKey('guestCount') ? l$guestCount : const {},
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateRSVPInput<TRes> {
  factory CopyWith$Input$CreateRSVPInput(
    Input$CreateRSVPInput instance,
    TRes Function(Input$CreateRSVPInput) then,
  ) = _CopyWithImpl$Input$CreateRSVPInput;

  factory CopyWith$Input$CreateRSVPInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateRSVPInput;

  TRes call({int? guestCount, String? notes});
}

class _CopyWithImpl$Input$CreateRSVPInput<TRes>
    implements CopyWith$Input$CreateRSVPInput<TRes> {
  _CopyWithImpl$Input$CreateRSVPInput(this._instance, this._then);

  final Input$CreateRSVPInput _instance;

  final TRes Function(Input$CreateRSVPInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? guestCount = _undefined, Object? notes = _undefined}) =>
      _then(
        Input$CreateRSVPInput._({
          ..._instance._$data,
          if (guestCount != _undefined) 'guestCount': (guestCount as int?),
          if (notes != _undefined) 'notes': (notes as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$CreateRSVPInput<TRes>
    implements CopyWith$Input$CreateRSVPInput<TRes> {
  _CopyWithStubImpl$Input$CreateRSVPInput(this._res);

  TRes _res;

  call({int? guestCount, String? notes}) => _res;
}

class Input$UpdateRSVPInput {
  factory Input$UpdateRSVPInput({
    Enum$RSVPStatus? status,
    int? guestCount,
    String? notes,
  }) => Input$UpdateRSVPInput._({
    if (status != null) r'status': status,
    if (guestCount != null) r'guestCount': guestCount,
    if (notes != null) r'notes': notes,
  });

  Input$UpdateRSVPInput._(this._$data);

  factory Input$UpdateRSVPInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$RSVPStatus((l$status as String));
    }
    if (data.containsKey('guestCount')) {
      final l$guestCount = data['guestCount'];
      result$data['guestCount'] = (l$guestCount as int?);
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Input$UpdateRSVPInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$RSVPStatus? get status => (_$data['status'] as Enum$RSVPStatus?);

  int? get guestCount => (_$data['guestCount'] as int?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$RSVPStatus(l$status);
    }
    if (_$data.containsKey('guestCount')) {
      final l$guestCount = guestCount;
      result$data['guestCount'] = l$guestCount;
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    return result$data;
  }

  CopyWith$Input$UpdateRSVPInput<Input$UpdateRSVPInput> get copyWith =>
      CopyWith$Input$UpdateRSVPInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateRSVPInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$guestCount = guestCount;
    final lOther$guestCount = other.guestCount;
    if (_$data.containsKey('guestCount') !=
        other._$data.containsKey('guestCount')) {
      return false;
    }
    if (l$guestCount != lOther$guestCount) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (_$data.containsKey('notes') != other._$data.containsKey('notes')) {
      return false;
    }
    if (l$notes != lOther$notes) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$status = status;
    final l$guestCount = guestCount;
    final l$notes = notes;
    return Object.hashAll([
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('guestCount') ? l$guestCount : const {},
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateRSVPInput<TRes> {
  factory CopyWith$Input$UpdateRSVPInput(
    Input$UpdateRSVPInput instance,
    TRes Function(Input$UpdateRSVPInput) then,
  ) = _CopyWithImpl$Input$UpdateRSVPInput;

  factory CopyWith$Input$UpdateRSVPInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateRSVPInput;

  TRes call({Enum$RSVPStatus? status, int? guestCount, String? notes});
}

class _CopyWithImpl$Input$UpdateRSVPInput<TRes>
    implements CopyWith$Input$UpdateRSVPInput<TRes> {
  _CopyWithImpl$Input$UpdateRSVPInput(this._instance, this._then);

  final Input$UpdateRSVPInput _instance;

  final TRes Function(Input$UpdateRSVPInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? status = _undefined,
    Object? guestCount = _undefined,
    Object? notes = _undefined,
  }) => _then(
    Input$UpdateRSVPInput._({
      ..._instance._$data,
      if (status != _undefined) 'status': (status as Enum$RSVPStatus?),
      if (guestCount != _undefined) 'guestCount': (guestCount as int?),
      if (notes != _undefined) 'notes': (notes as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateRSVPInput<TRes>
    implements CopyWith$Input$UpdateRSVPInput<TRes> {
  _CopyWithStubImpl$Input$UpdateRSVPInput(this._res);

  TRes _res;

  call({Enum$RSVPStatus? status, int? guestCount, String? notes}) => _res;
}

class Input$EventFilterInput {
  factory Input$EventFilterInput({
    DateTime? startDate,
    DateTime? endDate,
    String? eventType,
  }) => Input$EventFilterInput._({
    if (startDate != null) r'startDate': startDate,
    if (endDate != null) r'endDate': endDate,
    if (eventType != null) r'eventType': eventType,
  });

  Input$EventFilterInput._(this._$data);

  factory Input$EventFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('startDate')) {
      final l$startDate = data['startDate'];
      result$data['startDate'] = l$startDate == null
          ? null
          : DateTime.parse((l$startDate as String));
    }
    if (data.containsKey('endDate')) {
      final l$endDate = data['endDate'];
      result$data['endDate'] = l$endDate == null
          ? null
          : DateTime.parse((l$endDate as String));
    }
    if (data.containsKey('eventType')) {
      final l$eventType = data['eventType'];
      result$data['eventType'] = (l$eventType as String?);
    }
    return Input$EventFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime? get startDate => (_$data['startDate'] as DateTime?);

  DateTime? get endDate => (_$data['endDate'] as DateTime?);

  String? get eventType => (_$data['eventType'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('startDate')) {
      final l$startDate = startDate;
      result$data['startDate'] = l$startDate?.toIso8601String();
    }
    if (_$data.containsKey('endDate')) {
      final l$endDate = endDate;
      result$data['endDate'] = l$endDate?.toIso8601String();
    }
    if (_$data.containsKey('eventType')) {
      final l$eventType = eventType;
      result$data['eventType'] = l$eventType;
    }
    return result$data;
  }

  CopyWith$Input$EventFilterInput<Input$EventFilterInput> get copyWith =>
      CopyWith$Input$EventFilterInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$EventFilterInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (_$data.containsKey('startDate') !=
        other._$data.containsKey('startDate')) {
      return false;
    }
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (_$data.containsKey('endDate') != other._$data.containsKey('endDate')) {
      return false;
    }
    if (l$endDate != lOther$endDate) {
      return false;
    }
    final l$eventType = eventType;
    final lOther$eventType = other.eventType;
    if (_$data.containsKey('eventType') !=
        other._$data.containsKey('eventType')) {
      return false;
    }
    if (l$eventType != lOther$eventType) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$startDate = startDate;
    final l$endDate = endDate;
    final l$eventType = eventType;
    return Object.hashAll([
      _$data.containsKey('startDate') ? l$startDate : const {},
      _$data.containsKey('endDate') ? l$endDate : const {},
      _$data.containsKey('eventType') ? l$eventType : const {},
    ]);
  }
}

abstract class CopyWith$Input$EventFilterInput<TRes> {
  factory CopyWith$Input$EventFilterInput(
    Input$EventFilterInput instance,
    TRes Function(Input$EventFilterInput) then,
  ) = _CopyWithImpl$Input$EventFilterInput;

  factory CopyWith$Input$EventFilterInput.stub(TRes res) =
      _CopyWithStubImpl$Input$EventFilterInput;

  TRes call({DateTime? startDate, DateTime? endDate, String? eventType});
}

class _CopyWithImpl$Input$EventFilterInput<TRes>
    implements CopyWith$Input$EventFilterInput<TRes> {
  _CopyWithImpl$Input$EventFilterInput(this._instance, this._then);

  final Input$EventFilterInput _instance;

  final TRes Function(Input$EventFilterInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? startDate = _undefined,
    Object? endDate = _undefined,
    Object? eventType = _undefined,
  }) => _then(
    Input$EventFilterInput._({
      ..._instance._$data,
      if (startDate != _undefined) 'startDate': (startDate as DateTime?),
      if (endDate != _undefined) 'endDate': (endDate as DateTime?),
      if (eventType != _undefined) 'eventType': (eventType as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$EventFilterInput<TRes>
    implements CopyWith$Input$EventFilterInput<TRes> {
  _CopyWithStubImpl$Input$EventFilterInput(this._res);

  TRes _res;

  call({DateTime? startDate, DateTime? endDate, String? eventType}) => _res;
}

class Input$EventFilters {
  factory Input$EventFilters({
    DateTime? startDate,
    DateTime? endDate,
    String? eventType,
  }) => Input$EventFilters._({
    if (startDate != null) r'startDate': startDate,
    if (endDate != null) r'endDate': endDate,
    if (eventType != null) r'eventType': eventType,
  });

  Input$EventFilters._(this._$data);

  factory Input$EventFilters.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('startDate')) {
      final l$startDate = data['startDate'];
      result$data['startDate'] = l$startDate == null
          ? null
          : DateTime.parse((l$startDate as String));
    }
    if (data.containsKey('endDate')) {
      final l$endDate = data['endDate'];
      result$data['endDate'] = l$endDate == null
          ? null
          : DateTime.parse((l$endDate as String));
    }
    if (data.containsKey('eventType')) {
      final l$eventType = data['eventType'];
      result$data['eventType'] = (l$eventType as String?);
    }
    return Input$EventFilters._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime? get startDate => (_$data['startDate'] as DateTime?);

  DateTime? get endDate => (_$data['endDate'] as DateTime?);

  String? get eventType => (_$data['eventType'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('startDate')) {
      final l$startDate = startDate;
      result$data['startDate'] = l$startDate?.toIso8601String();
    }
    if (_$data.containsKey('endDate')) {
      final l$endDate = endDate;
      result$data['endDate'] = l$endDate?.toIso8601String();
    }
    if (_$data.containsKey('eventType')) {
      final l$eventType = eventType;
      result$data['eventType'] = l$eventType;
    }
    return result$data;
  }

  CopyWith$Input$EventFilters<Input$EventFilters> get copyWith =>
      CopyWith$Input$EventFilters(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$EventFilters || runtimeType != other.runtimeType) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (_$data.containsKey('startDate') !=
        other._$data.containsKey('startDate')) {
      return false;
    }
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (_$data.containsKey('endDate') != other._$data.containsKey('endDate')) {
      return false;
    }
    if (l$endDate != lOther$endDate) {
      return false;
    }
    final l$eventType = eventType;
    final lOther$eventType = other.eventType;
    if (_$data.containsKey('eventType') !=
        other._$data.containsKey('eventType')) {
      return false;
    }
    if (l$eventType != lOther$eventType) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$startDate = startDate;
    final l$endDate = endDate;
    final l$eventType = eventType;
    return Object.hashAll([
      _$data.containsKey('startDate') ? l$startDate : const {},
      _$data.containsKey('endDate') ? l$endDate : const {},
      _$data.containsKey('eventType') ? l$eventType : const {},
    ]);
  }
}

abstract class CopyWith$Input$EventFilters<TRes> {
  factory CopyWith$Input$EventFilters(
    Input$EventFilters instance,
    TRes Function(Input$EventFilters) then,
  ) = _CopyWithImpl$Input$EventFilters;

  factory CopyWith$Input$EventFilters.stub(TRes res) =
      _CopyWithStubImpl$Input$EventFilters;

  TRes call({DateTime? startDate, DateTime? endDate, String? eventType});
}

class _CopyWithImpl$Input$EventFilters<TRes>
    implements CopyWith$Input$EventFilters<TRes> {
  _CopyWithImpl$Input$EventFilters(this._instance, this._then);

  final Input$EventFilters _instance;

  final TRes Function(Input$EventFilters) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? startDate = _undefined,
    Object? endDate = _undefined,
    Object? eventType = _undefined,
  }) => _then(
    Input$EventFilters._({
      ..._instance._$data,
      if (startDate != _undefined) 'startDate': (startDate as DateTime?),
      if (endDate != _undefined) 'endDate': (endDate as DateTime?),
      if (eventType != _undefined) 'eventType': (eventType as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$EventFilters<TRes>
    implements CopyWith$Input$EventFilters<TRes> {
  _CopyWithStubImpl$Input$EventFilters(this._res);

  TRes _res;

  call({DateTime? startDate, DateTime? endDate, String? eventType}) => _res;
}

class Input$LocationInput {
  factory Input$LocationInput({
    required double latitude,
    required double longitude,
  }) => Input$LocationInput._({r'latitude': latitude, r'longitude': longitude});

  Input$LocationInput._(this._$data);

  factory Input$LocationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$latitude = data['latitude'];
    result$data['latitude'] = (l$latitude as num).toDouble();
    final l$longitude = data['longitude'];
    result$data['longitude'] = (l$longitude as num).toDouble();
    return Input$LocationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  double get latitude => (_$data['latitude'] as double);

  double get longitude => (_$data['longitude'] as double);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$latitude = latitude;
    result$data['latitude'] = l$latitude;
    final l$longitude = longitude;
    result$data['longitude'] = l$longitude;
    return result$data;
  }

  CopyWith$Input$LocationInput<Input$LocationInput> get copyWith =>
      CopyWith$Input$LocationInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$LocationInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$latitude = latitude;
    final lOther$latitude = other.latitude;
    if (l$latitude != lOther$latitude) {
      return false;
    }
    final l$longitude = longitude;
    final lOther$longitude = other.longitude;
    if (l$longitude != lOther$longitude) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$latitude = latitude;
    final l$longitude = longitude;
    return Object.hashAll([l$latitude, l$longitude]);
  }
}

abstract class CopyWith$Input$LocationInput<TRes> {
  factory CopyWith$Input$LocationInput(
    Input$LocationInput instance,
    TRes Function(Input$LocationInput) then,
  ) = _CopyWithImpl$Input$LocationInput;

  factory CopyWith$Input$LocationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$LocationInput;

  TRes call({double? latitude, double? longitude});
}

class _CopyWithImpl$Input$LocationInput<TRes>
    implements CopyWith$Input$LocationInput<TRes> {
  _CopyWithImpl$Input$LocationInput(this._instance, this._then);

  final Input$LocationInput _instance;

  final TRes Function(Input$LocationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? latitude = _undefined, Object? longitude = _undefined}) =>
      _then(
        Input$LocationInput._({
          ..._instance._$data,
          if (latitude != _undefined && latitude != null)
            'latitude': (latitude as double),
          if (longitude != _undefined && longitude != null)
            'longitude': (longitude as double),
        }),
      );
}

class _CopyWithStubImpl$Input$LocationInput<TRes>
    implements CopyWith$Input$LocationInput<TRes> {
  _CopyWithStubImpl$Input$LocationInput(this._res);

  TRes _res;

  call({double? latitude, double? longitude}) => _res;
}

class Input$PaginationInput {
  factory Input$PaginationInput({
    int? page,
    int? pageSize,
    int? first,
    String? after,
  }) => Input$PaginationInput._({
    if (page != null) r'page': page,
    if (pageSize != null) r'pageSize': pageSize,
    if (first != null) r'first': first,
    if (after != null) r'after': after,
  });

  Input$PaginationInput._(this._$data);

  factory Input$PaginationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('page')) {
      final l$page = data['page'];
      result$data['page'] = (l$page as int?);
    }
    if (data.containsKey('pageSize')) {
      final l$pageSize = data['pageSize'];
      result$data['pageSize'] = (l$pageSize as int?);
    }
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    return Input$PaginationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get page => (_$data['page'] as int?);

  int? get pageSize => (_$data['pageSize'] as int?);

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('page')) {
      final l$page = page;
      result$data['page'] = l$page;
    }
    if (_$data.containsKey('pageSize')) {
      final l$pageSize = pageSize;
      result$data['pageSize'] = l$pageSize;
    }
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    return result$data;
  }

  CopyWith$Input$PaginationInput<Input$PaginationInput> get copyWith =>
      CopyWith$Input$PaginationInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$PaginationInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (_$data.containsKey('page') != other._$data.containsKey('page')) {
      return false;
    }
    if (l$page != lOther$page) {
      return false;
    }
    final l$pageSize = pageSize;
    final lOther$pageSize = other.pageSize;
    if (_$data.containsKey('pageSize') !=
        other._$data.containsKey('pageSize')) {
      return false;
    }
    if (l$pageSize != lOther$pageSize) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    final l$after = after;
    final lOther$after = other.after;
    if (_$data.containsKey('after') != other._$data.containsKey('after')) {
      return false;
    }
    if (l$after != lOther$after) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$pageSize = pageSize;
    final l$first = first;
    final l$after = after;
    return Object.hashAll([
      _$data.containsKey('page') ? l$page : const {},
      _$data.containsKey('pageSize') ? l$pageSize : const {},
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
    ]);
  }
}

abstract class CopyWith$Input$PaginationInput<TRes> {
  factory CopyWith$Input$PaginationInput(
    Input$PaginationInput instance,
    TRes Function(Input$PaginationInput) then,
  ) = _CopyWithImpl$Input$PaginationInput;

  factory CopyWith$Input$PaginationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$PaginationInput;

  TRes call({int? page, int? pageSize, int? first, String? after});
}

class _CopyWithImpl$Input$PaginationInput<TRes>
    implements CopyWith$Input$PaginationInput<TRes> {
  _CopyWithImpl$Input$PaginationInput(this._instance, this._then);

  final Input$PaginationInput _instance;

  final TRes Function(Input$PaginationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? page = _undefined,
    Object? pageSize = _undefined,
    Object? first = _undefined,
    Object? after = _undefined,
  }) => _then(
    Input$PaginationInput._({
      ..._instance._$data,
      if (page != _undefined) 'page': (page as int?),
      if (pageSize != _undefined) 'pageSize': (pageSize as int?),
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$PaginationInput<TRes>
    implements CopyWith$Input$PaginationInput<TRes> {
  _CopyWithStubImpl$Input$PaginationInput(this._res);

  TRes _res;

  call({int? page, int? pageSize, int? first, String? after}) => _res;
}

enum Enum$UserStatus {
  ACTIVE,
  INACTIVE,
  SUSPENDED,
  PENDING_VERIFICATION,
  $unknown;

  factory Enum$UserStatus.fromJson(String value) =>
      fromJson$Enum$UserStatus(value);

  String toJson() => toJson$Enum$UserStatus(this);
}

String toJson$Enum$UserStatus(Enum$UserStatus e) {
  switch (e) {
    case Enum$UserStatus.ACTIVE:
      return r'ACTIVE';
    case Enum$UserStatus.INACTIVE:
      return r'INACTIVE';
    case Enum$UserStatus.SUSPENDED:
      return r'SUSPENDED';
    case Enum$UserStatus.PENDING_VERIFICATION:
      return r'PENDING_VERIFICATION';
    case Enum$UserStatus.$unknown:
      return r'$unknown';
  }
}

Enum$UserStatus fromJson$Enum$UserStatus(String value) {
  switch (value) {
    case r'ACTIVE':
      return Enum$UserStatus.ACTIVE;
    case r'INACTIVE':
      return Enum$UserStatus.INACTIVE;
    case r'SUSPENDED':
      return Enum$UserStatus.SUSPENDED;
    case r'PENDING_VERIFICATION':
      return Enum$UserStatus.PENDING_VERIFICATION;
    default:
      return Enum$UserStatus.$unknown;
  }
}

enum Enum$MembershipType {
  REGULAR,
  PREMIUM,
  LIFETIME,
  CORPORATE,
  $unknown;

  factory Enum$MembershipType.fromJson(String value) =>
      fromJson$Enum$MembershipType(value);

  String toJson() => toJson$Enum$MembershipType(this);
}

String toJson$Enum$MembershipType(Enum$MembershipType e) {
  switch (e) {
    case Enum$MembershipType.REGULAR:
      return r'REGULAR';
    case Enum$MembershipType.PREMIUM:
      return r'PREMIUM';
    case Enum$MembershipType.LIFETIME:
      return r'LIFETIME';
    case Enum$MembershipType.CORPORATE:
      return r'CORPORATE';
    case Enum$MembershipType.$unknown:
      return r'$unknown';
  }
}

Enum$MembershipType fromJson$Enum$MembershipType(String value) {
  switch (value) {
    case r'REGULAR':
      return Enum$MembershipType.REGULAR;
    case r'PREMIUM':
      return Enum$MembershipType.PREMIUM;
    case r'LIFETIME':
      return Enum$MembershipType.LIFETIME;
    case r'CORPORATE':
      return Enum$MembershipType.CORPORATE;
    default:
      return Enum$MembershipType.$unknown;
  }
}

enum Enum$MemberStatus {
  ACTIVE,
  INACTIVE,
  SUSPENDED,
  PENDING,
  $unknown;

  factory Enum$MemberStatus.fromJson(String value) =>
      fromJson$Enum$MemberStatus(value);

  String toJson() => toJson$Enum$MemberStatus(this);
}

String toJson$Enum$MemberStatus(Enum$MemberStatus e) {
  switch (e) {
    case Enum$MemberStatus.ACTIVE:
      return r'ACTIVE';
    case Enum$MemberStatus.INACTIVE:
      return r'INACTIVE';
    case Enum$MemberStatus.SUSPENDED:
      return r'SUSPENDED';
    case Enum$MemberStatus.PENDING:
      return r'PENDING';
    case Enum$MemberStatus.$unknown:
      return r'$unknown';
  }
}

Enum$MemberStatus fromJson$Enum$MemberStatus(String value) {
  switch (value) {
    case r'ACTIVE':
      return Enum$MemberStatus.ACTIVE;
    case r'INACTIVE':
      return Enum$MemberStatus.INACTIVE;
    case r'SUSPENDED':
      return Enum$MemberStatus.SUSPENDED;
    case r'PENDING':
      return Enum$MemberStatus.PENDING;
    default:
      return Enum$MemberStatus.$unknown;
  }
}

enum Enum$ClubStatus {
  ACTIVE,
  INACTIVE,
  SUSPENDED,
  $unknown;

  factory Enum$ClubStatus.fromJson(String value) =>
      fromJson$Enum$ClubStatus(value);

  String toJson() => toJson$Enum$ClubStatus(this);
}

String toJson$Enum$ClubStatus(Enum$ClubStatus e) {
  switch (e) {
    case Enum$ClubStatus.ACTIVE:
      return r'ACTIVE';
    case Enum$ClubStatus.INACTIVE:
      return r'INACTIVE';
    case Enum$ClubStatus.SUSPENDED:
      return r'SUSPENDED';
    case Enum$ClubStatus.$unknown:
      return r'$unknown';
  }
}

Enum$ClubStatus fromJson$Enum$ClubStatus(String value) {
  switch (value) {
    case r'ACTIVE':
      return Enum$ClubStatus.ACTIVE;
    case r'INACTIVE':
      return Enum$ClubStatus.INACTIVE;
    case r'SUSPENDED':
      return Enum$ClubStatus.SUSPENDED;
    default:
      return Enum$ClubStatus.$unknown;
  }
}

enum Enum$FacilityStatus {
  AVAILABLE,
  UNAVAILABLE,
  MAINTENANCE,
  RESERVED,
  $unknown;

  factory Enum$FacilityStatus.fromJson(String value) =>
      fromJson$Enum$FacilityStatus(value);

  String toJson() => toJson$Enum$FacilityStatus(this);
}

String toJson$Enum$FacilityStatus(Enum$FacilityStatus e) {
  switch (e) {
    case Enum$FacilityStatus.AVAILABLE:
      return r'AVAILABLE';
    case Enum$FacilityStatus.UNAVAILABLE:
      return r'UNAVAILABLE';
    case Enum$FacilityStatus.MAINTENANCE:
      return r'MAINTENANCE';
    case Enum$FacilityStatus.RESERVED:
      return r'RESERVED';
    case Enum$FacilityStatus.$unknown:
      return r'$unknown';
  }
}

Enum$FacilityStatus fromJson$Enum$FacilityStatus(String value) {
  switch (value) {
    case r'AVAILABLE':
      return Enum$FacilityStatus.AVAILABLE;
    case r'UNAVAILABLE':
      return Enum$FacilityStatus.UNAVAILABLE;
    case r'MAINTENANCE':
      return Enum$FacilityStatus.MAINTENANCE;
    case r'RESERVED':
      return Enum$FacilityStatus.RESERVED;
    default:
      return Enum$FacilityStatus.$unknown;
  }
}

enum Enum$BookingStatus {
  PENDING,
  CONFIRMED,
  CANCELLED,
  COMPLETED,
  NO_SHOW,
  $unknown;

  factory Enum$BookingStatus.fromJson(String value) =>
      fromJson$Enum$BookingStatus(value);

  String toJson() => toJson$Enum$BookingStatus(this);
}

String toJson$Enum$BookingStatus(Enum$BookingStatus e) {
  switch (e) {
    case Enum$BookingStatus.PENDING:
      return r'PENDING';
    case Enum$BookingStatus.CONFIRMED:
      return r'CONFIRMED';
    case Enum$BookingStatus.CANCELLED:
      return r'CANCELLED';
    case Enum$BookingStatus.COMPLETED:
      return r'COMPLETED';
    case Enum$BookingStatus.NO_SHOW:
      return r'NO_SHOW';
    case Enum$BookingStatus.$unknown:
      return r'$unknown';
  }
}

Enum$BookingStatus fromJson$Enum$BookingStatus(String value) {
  switch (value) {
    case r'PENDING':
      return Enum$BookingStatus.PENDING;
    case r'CONFIRMED':
      return Enum$BookingStatus.CONFIRMED;
    case r'CANCELLED':
      return Enum$BookingStatus.CANCELLED;
    case r'COMPLETED':
      return Enum$BookingStatus.COMPLETED;
    case r'NO_SHOW':
      return Enum$BookingStatus.NO_SHOW;
    default:
      return Enum$BookingStatus.$unknown;
  }
}

enum Enum$AgreementStatus {
  PENDING,
  APPROVED,
  ACTIVE,
  SUSPENDED,
  EXPIRED,
  REJECTED,
  $unknown;

  factory Enum$AgreementStatus.fromJson(String value) =>
      fromJson$Enum$AgreementStatus(value);

  String toJson() => toJson$Enum$AgreementStatus(this);
}

String toJson$Enum$AgreementStatus(Enum$AgreementStatus e) {
  switch (e) {
    case Enum$AgreementStatus.PENDING:
      return r'PENDING';
    case Enum$AgreementStatus.APPROVED:
      return r'APPROVED';
    case Enum$AgreementStatus.ACTIVE:
      return r'ACTIVE';
    case Enum$AgreementStatus.SUSPENDED:
      return r'SUSPENDED';
    case Enum$AgreementStatus.EXPIRED:
      return r'EXPIRED';
    case Enum$AgreementStatus.REJECTED:
      return r'REJECTED';
    case Enum$AgreementStatus.$unknown:
      return r'$unknown';
  }
}

Enum$AgreementStatus fromJson$Enum$AgreementStatus(String value) {
  switch (value) {
    case r'PENDING':
      return Enum$AgreementStatus.PENDING;
    case r'APPROVED':
      return Enum$AgreementStatus.APPROVED;
    case r'ACTIVE':
      return Enum$AgreementStatus.ACTIVE;
    case r'SUSPENDED':
      return Enum$AgreementStatus.SUSPENDED;
    case r'EXPIRED':
      return Enum$AgreementStatus.EXPIRED;
    case r'REJECTED':
      return Enum$AgreementStatus.REJECTED;
    default:
      return Enum$AgreementStatus.$unknown;
  }
}

enum Enum$VisitStatus {
  CHECKED_IN,
  CHECKED_OUT,
  CANCELLED,
  NO_SHOW,
  $unknown;

  factory Enum$VisitStatus.fromJson(String value) =>
      fromJson$Enum$VisitStatus(value);

  String toJson() => toJson$Enum$VisitStatus(this);
}

String toJson$Enum$VisitStatus(Enum$VisitStatus e) {
  switch (e) {
    case Enum$VisitStatus.CHECKED_IN:
      return r'CHECKED_IN';
    case Enum$VisitStatus.CHECKED_OUT:
      return r'CHECKED_OUT';
    case Enum$VisitStatus.CANCELLED:
      return r'CANCELLED';
    case Enum$VisitStatus.NO_SHOW:
      return r'NO_SHOW';
    case Enum$VisitStatus.$unknown:
      return r'$unknown';
  }
}

Enum$VisitStatus fromJson$Enum$VisitStatus(String value) {
  switch (value) {
    case r'CHECKED_IN':
      return Enum$VisitStatus.CHECKED_IN;
    case r'CHECKED_OUT':
      return Enum$VisitStatus.CHECKED_OUT;
    case r'CANCELLED':
      return Enum$VisitStatus.CANCELLED;
    case r'NO_SHOW':
      return Enum$VisitStatus.NO_SHOW;
    default:
      return Enum$VisitStatus.$unknown;
  }
}

enum Enum$NotificationType {
  SYSTEM,
  MEMBERSHIP,
  RECIPROCAL,
  VISIT,
  BILLING,
  SECURITY,
  $unknown;

  factory Enum$NotificationType.fromJson(String value) =>
      fromJson$Enum$NotificationType(value);

  String toJson() => toJson$Enum$NotificationType(this);
}

String toJson$Enum$NotificationType(Enum$NotificationType e) {
  switch (e) {
    case Enum$NotificationType.SYSTEM:
      return r'SYSTEM';
    case Enum$NotificationType.MEMBERSHIP:
      return r'MEMBERSHIP';
    case Enum$NotificationType.RECIPROCAL:
      return r'RECIPROCAL';
    case Enum$NotificationType.VISIT:
      return r'VISIT';
    case Enum$NotificationType.BILLING:
      return r'BILLING';
    case Enum$NotificationType.SECURITY:
      return r'SECURITY';
    case Enum$NotificationType.$unknown:
      return r'$unknown';
  }
}

Enum$NotificationType fromJson$Enum$NotificationType(String value) {
  switch (value) {
    case r'SYSTEM':
      return Enum$NotificationType.SYSTEM;
    case r'MEMBERSHIP':
      return Enum$NotificationType.MEMBERSHIP;
    case r'RECIPROCAL':
      return Enum$NotificationType.RECIPROCAL;
    case r'VISIT':
      return Enum$NotificationType.VISIT;
    case r'BILLING':
      return Enum$NotificationType.BILLING;
    case r'SECURITY':
      return Enum$NotificationType.SECURITY;
    default:
      return Enum$NotificationType.$unknown;
  }
}

enum Enum$NotificationStatus {
  PENDING,
  SENT,
  DELIVERED,
  READ,
  FAILED,
  $unknown;

  factory Enum$NotificationStatus.fromJson(String value) =>
      fromJson$Enum$NotificationStatus(value);

  String toJson() => toJson$Enum$NotificationStatus(this);
}

String toJson$Enum$NotificationStatus(Enum$NotificationStatus e) {
  switch (e) {
    case Enum$NotificationStatus.PENDING:
      return r'PENDING';
    case Enum$NotificationStatus.SENT:
      return r'SENT';
    case Enum$NotificationStatus.DELIVERED:
      return r'DELIVERED';
    case Enum$NotificationStatus.READ:
      return r'READ';
    case Enum$NotificationStatus.FAILED:
      return r'FAILED';
    case Enum$NotificationStatus.$unknown:
      return r'$unknown';
  }
}

Enum$NotificationStatus fromJson$Enum$NotificationStatus(String value) {
  switch (value) {
    case r'PENDING':
      return Enum$NotificationStatus.PENDING;
    case r'SENT':
      return Enum$NotificationStatus.SENT;
    case r'DELIVERED':
      return Enum$NotificationStatus.DELIVERED;
    case r'READ':
      return Enum$NotificationStatus.READ;
    case r'FAILED':
      return Enum$NotificationStatus.FAILED;
    default:
      return Enum$NotificationStatus.$unknown;
  }
}

enum Enum$NotificationChannel {
  EMAIL,
  SMS,
  PUSH,
  IN_APP,
  $unknown;

  factory Enum$NotificationChannel.fromJson(String value) =>
      fromJson$Enum$NotificationChannel(value);

  String toJson() => toJson$Enum$NotificationChannel(this);
}

String toJson$Enum$NotificationChannel(Enum$NotificationChannel e) {
  switch (e) {
    case Enum$NotificationChannel.EMAIL:
      return r'EMAIL';
    case Enum$NotificationChannel.SMS:
      return r'SMS';
    case Enum$NotificationChannel.PUSH:
      return r'PUSH';
    case Enum$NotificationChannel.IN_APP:
      return r'IN_APP';
    case Enum$NotificationChannel.$unknown:
      return r'$unknown';
  }
}

Enum$NotificationChannel fromJson$Enum$NotificationChannel(String value) {
  switch (value) {
    case r'EMAIL':
      return Enum$NotificationChannel.EMAIL;
    case r'SMS':
      return Enum$NotificationChannel.SMS;
    case r'PUSH':
      return Enum$NotificationChannel.PUSH;
    case r'IN_APP':
      return Enum$NotificationChannel.IN_APP;
    default:
      return Enum$NotificationChannel.$unknown;
  }
}

enum Enum$TransactionType {
  MEMBER_REGISTRATION,
  VISIT_RECORD,
  AGREEMENT_CREATION,
  PAYMENT_RECORD,
  $unknown;

  factory Enum$TransactionType.fromJson(String value) =>
      fromJson$Enum$TransactionType(value);

  String toJson() => toJson$Enum$TransactionType(this);
}

String toJson$Enum$TransactionType(Enum$TransactionType e) {
  switch (e) {
    case Enum$TransactionType.MEMBER_REGISTRATION:
      return r'MEMBER_REGISTRATION';
    case Enum$TransactionType.VISIT_RECORD:
      return r'VISIT_RECORD';
    case Enum$TransactionType.AGREEMENT_CREATION:
      return r'AGREEMENT_CREATION';
    case Enum$TransactionType.PAYMENT_RECORD:
      return r'PAYMENT_RECORD';
    case Enum$TransactionType.$unknown:
      return r'$unknown';
  }
}

Enum$TransactionType fromJson$Enum$TransactionType(String value) {
  switch (value) {
    case r'MEMBER_REGISTRATION':
      return Enum$TransactionType.MEMBER_REGISTRATION;
    case r'VISIT_RECORD':
      return Enum$TransactionType.VISIT_RECORD;
    case r'AGREEMENT_CREATION':
      return Enum$TransactionType.AGREEMENT_CREATION;
    case r'PAYMENT_RECORD':
      return Enum$TransactionType.PAYMENT_RECORD;
    default:
      return Enum$TransactionType.$unknown;
  }
}

enum Enum$TransactionStatus {
  PENDING,
  SUBMITTED,
  CONFIRMED,
  FAILED,
  $unknown;

  factory Enum$TransactionStatus.fromJson(String value) =>
      fromJson$Enum$TransactionStatus(value);

  String toJson() => toJson$Enum$TransactionStatus(this);
}

String toJson$Enum$TransactionStatus(Enum$TransactionStatus e) {
  switch (e) {
    case Enum$TransactionStatus.PENDING:
      return r'PENDING';
    case Enum$TransactionStatus.SUBMITTED:
      return r'SUBMITTED';
    case Enum$TransactionStatus.CONFIRMED:
      return r'CONFIRMED';
    case Enum$TransactionStatus.FAILED:
      return r'FAILED';
    case Enum$TransactionStatus.$unknown:
      return r'$unknown';
  }
}

Enum$TransactionStatus fromJson$Enum$TransactionStatus(String value) {
  switch (value) {
    case r'PENDING':
      return Enum$TransactionStatus.PENDING;
    case r'SUBMITTED':
      return Enum$TransactionStatus.SUBMITTED;
    case r'CONFIRMED':
      return Enum$TransactionStatus.CONFIRMED;
    case r'FAILED':
      return Enum$TransactionStatus.FAILED;
    default:
      return Enum$TransactionStatus.$unknown;
  }
}

enum Enum$ProposalType {
  AGREEMENT_CHANGE,
  POLICY_UPDATE,
  FEE_ADJUSTMENT,
  SYSTEM_UPGRADE,
  $unknown;

  factory Enum$ProposalType.fromJson(String value) =>
      fromJson$Enum$ProposalType(value);

  String toJson() => toJson$Enum$ProposalType(this);
}

String toJson$Enum$ProposalType(Enum$ProposalType e) {
  switch (e) {
    case Enum$ProposalType.AGREEMENT_CHANGE:
      return r'AGREEMENT_CHANGE';
    case Enum$ProposalType.POLICY_UPDATE:
      return r'POLICY_UPDATE';
    case Enum$ProposalType.FEE_ADJUSTMENT:
      return r'FEE_ADJUSTMENT';
    case Enum$ProposalType.SYSTEM_UPGRADE:
      return r'SYSTEM_UPGRADE';
    case Enum$ProposalType.$unknown:
      return r'$unknown';
  }
}

Enum$ProposalType fromJson$Enum$ProposalType(String value) {
  switch (value) {
    case r'AGREEMENT_CHANGE':
      return Enum$ProposalType.AGREEMENT_CHANGE;
    case r'POLICY_UPDATE':
      return Enum$ProposalType.POLICY_UPDATE;
    case r'FEE_ADJUSTMENT':
      return Enum$ProposalType.FEE_ADJUSTMENT;
    case r'SYSTEM_UPGRADE':
      return Enum$ProposalType.SYSTEM_UPGRADE;
    default:
      return Enum$ProposalType.$unknown;
  }
}

enum Enum$ProposalStatus {
  DRAFT,
  VOTING,
  PASSED,
  REJECTED,
  IMPLEMENTED,
  $unknown;

  factory Enum$ProposalStatus.fromJson(String value) =>
      fromJson$Enum$ProposalStatus(value);

  String toJson() => toJson$Enum$ProposalStatus(this);
}

String toJson$Enum$ProposalStatus(Enum$ProposalStatus e) {
  switch (e) {
    case Enum$ProposalStatus.DRAFT:
      return r'DRAFT';
    case Enum$ProposalStatus.VOTING:
      return r'VOTING';
    case Enum$ProposalStatus.PASSED:
      return r'PASSED';
    case Enum$ProposalStatus.REJECTED:
      return r'REJECTED';
    case Enum$ProposalStatus.IMPLEMENTED:
      return r'IMPLEMENTED';
    case Enum$ProposalStatus.$unknown:
      return r'$unknown';
  }
}

Enum$ProposalStatus fromJson$Enum$ProposalStatus(String value) {
  switch (value) {
    case r'DRAFT':
      return Enum$ProposalStatus.DRAFT;
    case r'VOTING':
      return Enum$ProposalStatus.VOTING;
    case r'PASSED':
      return Enum$ProposalStatus.PASSED;
    case r'REJECTED':
      return Enum$ProposalStatus.REJECTED;
    case r'IMPLEMENTED':
      return Enum$ProposalStatus.IMPLEMENTED;
    default:
      return Enum$ProposalStatus.$unknown;
  }
}

enum Enum$VoteChoice {
  YES,
  NO,
  ABSTAIN,
  $unknown;

  factory Enum$VoteChoice.fromJson(String value) =>
      fromJson$Enum$VoteChoice(value);

  String toJson() => toJson$Enum$VoteChoice(this);
}

String toJson$Enum$VoteChoice(Enum$VoteChoice e) {
  switch (e) {
    case Enum$VoteChoice.YES:
      return r'YES';
    case Enum$VoteChoice.NO:
      return r'NO';
    case Enum$VoteChoice.ABSTAIN:
      return r'ABSTAIN';
    case Enum$VoteChoice.$unknown:
      return r'$unknown';
  }
}

Enum$VoteChoice fromJson$Enum$VoteChoice(String value) {
  switch (value) {
    case r'YES':
      return Enum$VoteChoice.YES;
    case r'NO':
      return Enum$VoteChoice.NO;
    case r'ABSTAIN':
      return Enum$VoteChoice.ABSTAIN;
    default:
      return Enum$VoteChoice.$unknown;
  }
}

enum Enum$RSVPStatus {
  PENDING,
  CONFIRMED,
  TENTATIVE,
  DECLINED,
  WAITLIST,
  CANCELLED,
  $unknown;

  factory Enum$RSVPStatus.fromJson(String value) =>
      fromJson$Enum$RSVPStatus(value);

  String toJson() => toJson$Enum$RSVPStatus(this);
}

String toJson$Enum$RSVPStatus(Enum$RSVPStatus e) {
  switch (e) {
    case Enum$RSVPStatus.PENDING:
      return r'PENDING';
    case Enum$RSVPStatus.CONFIRMED:
      return r'CONFIRMED';
    case Enum$RSVPStatus.TENTATIVE:
      return r'TENTATIVE';
    case Enum$RSVPStatus.DECLINED:
      return r'DECLINED';
    case Enum$RSVPStatus.WAITLIST:
      return r'WAITLIST';
    case Enum$RSVPStatus.CANCELLED:
      return r'CANCELLED';
    case Enum$RSVPStatus.$unknown:
      return r'$unknown';
  }
}

Enum$RSVPStatus fromJson$Enum$RSVPStatus(String value) {
  switch (value) {
    case r'PENDING':
      return Enum$RSVPStatus.PENDING;
    case r'CONFIRMED':
      return Enum$RSVPStatus.CONFIRMED;
    case r'TENTATIVE':
      return Enum$RSVPStatus.TENTATIVE;
    case r'DECLINED':
      return Enum$RSVPStatus.DECLINED;
    case r'WAITLIST':
      return Enum$RSVPStatus.WAITLIST;
    case r'CANCELLED':
      return Enum$RSVPStatus.CANCELLED;
    default:
      return Enum$RSVPStatus.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
