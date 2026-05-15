class Input$PaginationInput {
  factory Input$PaginationInput({
    int? page,
    int? pageSize,
    int? limit,
    int? offset,
  }) => Input$PaginationInput._({
    if (page != null) r'page': page,
    if (pageSize != null) r'pageSize': pageSize,
    if (limit != null) r'limit': limit,
    if (offset != null) r'offset': offset,
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
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    return Input$PaginationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get page => (_$data['page'] as int?);

  int? get pageSize => (_$data['pageSize'] as int?);

  int? get limit => (_$data['limit'] as int?);

  int? get offset => (_$data['offset'] as int?);

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
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
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
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (_$data.containsKey('offset') != other._$data.containsKey('offset')) {
      return false;
    }
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$pageSize = pageSize;
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      _$data.containsKey('page') ? l$page : const {},
      _$data.containsKey('pageSize') ? l$pageSize : const {},
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
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

  TRes call({int? page, int? pageSize, int? limit, int? offset});
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
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) => _then(
    Input$PaginationInput._({
      ..._instance._$data,
      if (page != _undefined) 'page': (page as int?),
      if (pageSize != _undefined) 'pageSize': (pageSize as int?),
      if (limit != _undefined) 'limit': (limit as int?),
      if (offset != _undefined) 'offset': (offset as int?),
    }),
  );
}

class _CopyWithStubImpl$Input$PaginationInput<TRes>
    implements CopyWith$Input$PaginationInput<TRes> {
  _CopyWithStubImpl$Input$PaginationInput(this._res);

  TRes _res;

  call({int? page, int? pageSize, int? limit, int? offset}) => _res;
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

class Input$TrackEventInput {
  factory Input$TrackEventInput({
    required Enum$EventType eventType,
    required String eventName,
    dynamic? properties,
    String? sessionId,
    String? ipAddress,
    String? userAgent,
    String? referrer,
    String? source,
    String? medium,
    String? campaign,
  }) => Input$TrackEventInput._({
    r'eventType': eventType,
    r'eventName': eventName,
    if (properties != null) r'properties': properties,
    if (sessionId != null) r'sessionId': sessionId,
    if (ipAddress != null) r'ipAddress': ipAddress,
    if (userAgent != null) r'userAgent': userAgent,
    if (referrer != null) r'referrer': referrer,
    if (source != null) r'source': source,
    if (medium != null) r'medium': medium,
    if (campaign != null) r'campaign': campaign,
  });

  Input$TrackEventInput._(this._$data);

  factory Input$TrackEventInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$eventType = data['eventType'];
    result$data['eventType'] = fromJson$Enum$EventType((l$eventType as String));
    final l$eventName = data['eventName'];
    result$data['eventName'] = (l$eventName as String);
    if (data.containsKey('properties')) {
      final l$properties = data['properties'];
      result$data['properties'] = (l$properties as dynamic?);
    }
    if (data.containsKey('sessionId')) {
      final l$sessionId = data['sessionId'];
      result$data['sessionId'] = (l$sessionId as String?);
    }
    if (data.containsKey('ipAddress')) {
      final l$ipAddress = data['ipAddress'];
      result$data['ipAddress'] = (l$ipAddress as String?);
    }
    if (data.containsKey('userAgent')) {
      final l$userAgent = data['userAgent'];
      result$data['userAgent'] = (l$userAgent as String?);
    }
    if (data.containsKey('referrer')) {
      final l$referrer = data['referrer'];
      result$data['referrer'] = (l$referrer as String?);
    }
    if (data.containsKey('source')) {
      final l$source = data['source'];
      result$data['source'] = (l$source as String?);
    }
    if (data.containsKey('medium')) {
      final l$medium = data['medium'];
      result$data['medium'] = (l$medium as String?);
    }
    if (data.containsKey('campaign')) {
      final l$campaign = data['campaign'];
      result$data['campaign'] = (l$campaign as String?);
    }
    return Input$TrackEventInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$EventType get eventType => (_$data['eventType'] as Enum$EventType);

  String get eventName => (_$data['eventName'] as String);

  dynamic? get properties => (_$data['properties'] as dynamic?);

  String? get sessionId => (_$data['sessionId'] as String?);

  String? get ipAddress => (_$data['ipAddress'] as String?);

  String? get userAgent => (_$data['userAgent'] as String?);

  String? get referrer => (_$data['referrer'] as String?);

  String? get source => (_$data['source'] as String?);

  String? get medium => (_$data['medium'] as String?);

  String? get campaign => (_$data['campaign'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$eventType = eventType;
    result$data['eventType'] = toJson$Enum$EventType(l$eventType);
    final l$eventName = eventName;
    result$data['eventName'] = l$eventName;
    if (_$data.containsKey('properties')) {
      final l$properties = properties;
      result$data['properties'] = l$properties;
    }
    if (_$data.containsKey('sessionId')) {
      final l$sessionId = sessionId;
      result$data['sessionId'] = l$sessionId;
    }
    if (_$data.containsKey('ipAddress')) {
      final l$ipAddress = ipAddress;
      result$data['ipAddress'] = l$ipAddress;
    }
    if (_$data.containsKey('userAgent')) {
      final l$userAgent = userAgent;
      result$data['userAgent'] = l$userAgent;
    }
    if (_$data.containsKey('referrer')) {
      final l$referrer = referrer;
      result$data['referrer'] = l$referrer;
    }
    if (_$data.containsKey('source')) {
      final l$source = source;
      result$data['source'] = l$source;
    }
    if (_$data.containsKey('medium')) {
      final l$medium = medium;
      result$data['medium'] = l$medium;
    }
    if (_$data.containsKey('campaign')) {
      final l$campaign = campaign;
      result$data['campaign'] = l$campaign;
    }
    return result$data;
  }

  CopyWith$Input$TrackEventInput<Input$TrackEventInput> get copyWith =>
      CopyWith$Input$TrackEventInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$TrackEventInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eventType = eventType;
    final lOther$eventType = other.eventType;
    if (l$eventType != lOther$eventType) {
      return false;
    }
    final l$eventName = eventName;
    final lOther$eventName = other.eventName;
    if (l$eventName != lOther$eventName) {
      return false;
    }
    final l$properties = properties;
    final lOther$properties = other.properties;
    if (_$data.containsKey('properties') !=
        other._$data.containsKey('properties')) {
      return false;
    }
    if (l$properties != lOther$properties) {
      return false;
    }
    final l$sessionId = sessionId;
    final lOther$sessionId = other.sessionId;
    if (_$data.containsKey('sessionId') !=
        other._$data.containsKey('sessionId')) {
      return false;
    }
    if (l$sessionId != lOther$sessionId) {
      return false;
    }
    final l$ipAddress = ipAddress;
    final lOther$ipAddress = other.ipAddress;
    if (_$data.containsKey('ipAddress') !=
        other._$data.containsKey('ipAddress')) {
      return false;
    }
    if (l$ipAddress != lOther$ipAddress) {
      return false;
    }
    final l$userAgent = userAgent;
    final lOther$userAgent = other.userAgent;
    if (_$data.containsKey('userAgent') !=
        other._$data.containsKey('userAgent')) {
      return false;
    }
    if (l$userAgent != lOther$userAgent) {
      return false;
    }
    final l$referrer = referrer;
    final lOther$referrer = other.referrer;
    if (_$data.containsKey('referrer') !=
        other._$data.containsKey('referrer')) {
      return false;
    }
    if (l$referrer != lOther$referrer) {
      return false;
    }
    final l$source = source;
    final lOther$source = other.source;
    if (_$data.containsKey('source') != other._$data.containsKey('source')) {
      return false;
    }
    if (l$source != lOther$source) {
      return false;
    }
    final l$medium = medium;
    final lOther$medium = other.medium;
    if (_$data.containsKey('medium') != other._$data.containsKey('medium')) {
      return false;
    }
    if (l$medium != lOther$medium) {
      return false;
    }
    final l$campaign = campaign;
    final lOther$campaign = other.campaign;
    if (_$data.containsKey('campaign') !=
        other._$data.containsKey('campaign')) {
      return false;
    }
    if (l$campaign != lOther$campaign) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eventType = eventType;
    final l$eventName = eventName;
    final l$properties = properties;
    final l$sessionId = sessionId;
    final l$ipAddress = ipAddress;
    final l$userAgent = userAgent;
    final l$referrer = referrer;
    final l$source = source;
    final l$medium = medium;
    final l$campaign = campaign;
    return Object.hashAll([
      l$eventType,
      l$eventName,
      _$data.containsKey('properties') ? l$properties : const {},
      _$data.containsKey('sessionId') ? l$sessionId : const {},
      _$data.containsKey('ipAddress') ? l$ipAddress : const {},
      _$data.containsKey('userAgent') ? l$userAgent : const {},
      _$data.containsKey('referrer') ? l$referrer : const {},
      _$data.containsKey('source') ? l$source : const {},
      _$data.containsKey('medium') ? l$medium : const {},
      _$data.containsKey('campaign') ? l$campaign : const {},
    ]);
  }
}

abstract class CopyWith$Input$TrackEventInput<TRes> {
  factory CopyWith$Input$TrackEventInput(
    Input$TrackEventInput instance,
    TRes Function(Input$TrackEventInput) then,
  ) = _CopyWithImpl$Input$TrackEventInput;

  factory CopyWith$Input$TrackEventInput.stub(TRes res) =
      _CopyWithStubImpl$Input$TrackEventInput;

  TRes call({
    Enum$EventType? eventType,
    String? eventName,
    dynamic? properties,
    String? sessionId,
    String? ipAddress,
    String? userAgent,
    String? referrer,
    String? source,
    String? medium,
    String? campaign,
  });
}

class _CopyWithImpl$Input$TrackEventInput<TRes>
    implements CopyWith$Input$TrackEventInput<TRes> {
  _CopyWithImpl$Input$TrackEventInput(this._instance, this._then);

  final Input$TrackEventInput _instance;

  final TRes Function(Input$TrackEventInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? eventType = _undefined,
    Object? eventName = _undefined,
    Object? properties = _undefined,
    Object? sessionId = _undefined,
    Object? ipAddress = _undefined,
    Object? userAgent = _undefined,
    Object? referrer = _undefined,
    Object? source = _undefined,
    Object? medium = _undefined,
    Object? campaign = _undefined,
  }) => _then(
    Input$TrackEventInput._({
      ..._instance._$data,
      if (eventType != _undefined && eventType != null)
        'eventType': (eventType as Enum$EventType),
      if (eventName != _undefined && eventName != null)
        'eventName': (eventName as String),
      if (properties != _undefined) 'properties': (properties as dynamic?),
      if (sessionId != _undefined) 'sessionId': (sessionId as String?),
      if (ipAddress != _undefined) 'ipAddress': (ipAddress as String?),
      if (userAgent != _undefined) 'userAgent': (userAgent as String?),
      if (referrer != _undefined) 'referrer': (referrer as String?),
      if (source != _undefined) 'source': (source as String?),
      if (medium != _undefined) 'medium': (medium as String?),
      if (campaign != _undefined) 'campaign': (campaign as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$TrackEventInput<TRes>
    implements CopyWith$Input$TrackEventInput<TRes> {
  _CopyWithStubImpl$Input$TrackEventInput(this._res);

  TRes _res;

  call({
    Enum$EventType? eventType,
    String? eventName,
    dynamic? properties,
    String? sessionId,
    String? ipAddress,
    String? userAgent,
    String? referrer,
    String? source,
    String? medium,
    String? campaign,
  }) => _res;
}

class Input$RecordMetricInput {
  factory Input$RecordMetricInput({
    required String name,
    required double value,
    String? unit,
    dynamic? dimensions,
    required Enum$AggregationType aggregationType,
  }) => Input$RecordMetricInput._({
    r'name': name,
    r'value': value,
    if (unit != null) r'unit': unit,
    if (dimensions != null) r'dimensions': dimensions,
    r'aggregationType': aggregationType,
  });

  Input$RecordMetricInput._(this._$data);

  factory Input$RecordMetricInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$value = data['value'];
    result$data['value'] = (l$value as num).toDouble();
    if (data.containsKey('unit')) {
      final l$unit = data['unit'];
      result$data['unit'] = (l$unit as String?);
    }
    if (data.containsKey('dimensions')) {
      final l$dimensions = data['dimensions'];
      result$data['dimensions'] = (l$dimensions as dynamic?);
    }
    final l$aggregationType = data['aggregationType'];
    result$data['aggregationType'] = fromJson$Enum$AggregationType(
      (l$aggregationType as String),
    );
    return Input$RecordMetricInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  double get value => (_$data['value'] as double);

  String? get unit => (_$data['unit'] as String?);

  dynamic? get dimensions => (_$data['dimensions'] as dynamic?);

  Enum$AggregationType get aggregationType =>
      (_$data['aggregationType'] as Enum$AggregationType);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$value = value;
    result$data['value'] = l$value;
    if (_$data.containsKey('unit')) {
      final l$unit = unit;
      result$data['unit'] = l$unit;
    }
    if (_$data.containsKey('dimensions')) {
      final l$dimensions = dimensions;
      result$data['dimensions'] = l$dimensions;
    }
    final l$aggregationType = aggregationType;
    result$data['aggregationType'] = toJson$Enum$AggregationType(
      l$aggregationType,
    );
    return result$data;
  }

  CopyWith$Input$RecordMetricInput<Input$RecordMetricInput> get copyWith =>
      CopyWith$Input$RecordMetricInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$RecordMetricInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final l$unit = unit;
    final lOther$unit = other.unit;
    if (_$data.containsKey('unit') != other._$data.containsKey('unit')) {
      return false;
    }
    if (l$unit != lOther$unit) {
      return false;
    }
    final l$dimensions = dimensions;
    final lOther$dimensions = other.dimensions;
    if (_$data.containsKey('dimensions') !=
        other._$data.containsKey('dimensions')) {
      return false;
    }
    if (l$dimensions != lOther$dimensions) {
      return false;
    }
    final l$aggregationType = aggregationType;
    final lOther$aggregationType = other.aggregationType;
    if (l$aggregationType != lOther$aggregationType) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$value = value;
    final l$unit = unit;
    final l$dimensions = dimensions;
    final l$aggregationType = aggregationType;
    return Object.hashAll([
      l$name,
      l$value,
      _$data.containsKey('unit') ? l$unit : const {},
      _$data.containsKey('dimensions') ? l$dimensions : const {},
      l$aggregationType,
    ]);
  }
}

abstract class CopyWith$Input$RecordMetricInput<TRes> {
  factory CopyWith$Input$RecordMetricInput(
    Input$RecordMetricInput instance,
    TRes Function(Input$RecordMetricInput) then,
  ) = _CopyWithImpl$Input$RecordMetricInput;

  factory CopyWith$Input$RecordMetricInput.stub(TRes res) =
      _CopyWithStubImpl$Input$RecordMetricInput;

  TRes call({
    String? name,
    double? value,
    String? unit,
    dynamic? dimensions,
    Enum$AggregationType? aggregationType,
  });
}

class _CopyWithImpl$Input$RecordMetricInput<TRes>
    implements CopyWith$Input$RecordMetricInput<TRes> {
  _CopyWithImpl$Input$RecordMetricInput(this._instance, this._then);

  final Input$RecordMetricInput _instance;

  final TRes Function(Input$RecordMetricInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? value = _undefined,
    Object? unit = _undefined,
    Object? dimensions = _undefined,
    Object? aggregationType = _undefined,
  }) => _then(
    Input$RecordMetricInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (value != _undefined && value != null) 'value': (value as double),
      if (unit != _undefined) 'unit': (unit as String?),
      if (dimensions != _undefined) 'dimensions': (dimensions as dynamic?),
      if (aggregationType != _undefined && aggregationType != null)
        'aggregationType': (aggregationType as Enum$AggregationType),
    }),
  );
}

class _CopyWithStubImpl$Input$RecordMetricInput<TRes>
    implements CopyWith$Input$RecordMetricInput<TRes> {
  _CopyWithStubImpl$Input$RecordMetricInput(this._res);

  TRes _res;

  call({
    String? name,
    double? value,
    String? unit,
    dynamic? dimensions,
    Enum$AggregationType? aggregationType,
  }) => _res;
}

class Input$GenerateReportInput {
  factory Input$GenerateReportInput({
    required String name,
    required Enum$ReportType type,
    required DateTime startDate,
    required DateTime endDate,
    dynamic? parameters,
  }) => Input$GenerateReportInput._({
    r'name': name,
    r'type': type,
    r'startDate': startDate,
    r'endDate': endDate,
    if (parameters != null) r'parameters': parameters,
  });

  Input$GenerateReportInput._(this._$data);

  factory Input$GenerateReportInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$type = data['type'];
    result$data['type'] = fromJson$Enum$ReportType((l$type as String));
    final l$startDate = data['startDate'];
    result$data['startDate'] = DateTime.parse((l$startDate as String));
    final l$endDate = data['endDate'];
    result$data['endDate'] = DateTime.parse((l$endDate as String));
    if (data.containsKey('parameters')) {
      final l$parameters = data['parameters'];
      result$data['parameters'] = (l$parameters as dynamic?);
    }
    return Input$GenerateReportInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  Enum$ReportType get type => (_$data['type'] as Enum$ReportType);

  DateTime get startDate => (_$data['startDate'] as DateTime);

  DateTime get endDate => (_$data['endDate'] as DateTime);

  dynamic? get parameters => (_$data['parameters'] as dynamic?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$type = type;
    result$data['type'] = toJson$Enum$ReportType(l$type);
    final l$startDate = startDate;
    result$data['startDate'] = l$startDate.toIso8601String();
    final l$endDate = endDate;
    result$data['endDate'] = l$endDate.toIso8601String();
    if (_$data.containsKey('parameters')) {
      final l$parameters = parameters;
      result$data['parameters'] = l$parameters;
    }
    return result$data;
  }

  CopyWith$Input$GenerateReportInput<Input$GenerateReportInput> get copyWith =>
      CopyWith$Input$GenerateReportInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$GenerateReportInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (l$endDate != lOther$endDate) {
      return false;
    }
    final l$parameters = parameters;
    final lOther$parameters = other.parameters;
    if (_$data.containsKey('parameters') !=
        other._$data.containsKey('parameters')) {
      return false;
    }
    if (l$parameters != lOther$parameters) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$type = type;
    final l$startDate = startDate;
    final l$endDate = endDate;
    final l$parameters = parameters;
    return Object.hashAll([
      l$name,
      l$type,
      l$startDate,
      l$endDate,
      _$data.containsKey('parameters') ? l$parameters : const {},
    ]);
  }
}

abstract class CopyWith$Input$GenerateReportInput<TRes> {
  factory CopyWith$Input$GenerateReportInput(
    Input$GenerateReportInput instance,
    TRes Function(Input$GenerateReportInput) then,
  ) = _CopyWithImpl$Input$GenerateReportInput;

  factory CopyWith$Input$GenerateReportInput.stub(TRes res) =
      _CopyWithStubImpl$Input$GenerateReportInput;

  TRes call({
    String? name,
    Enum$ReportType? type,
    DateTime? startDate,
    DateTime? endDate,
    dynamic? parameters,
  });
}

class _CopyWithImpl$Input$GenerateReportInput<TRes>
    implements CopyWith$Input$GenerateReportInput<TRes> {
  _CopyWithImpl$Input$GenerateReportInput(this._instance, this._then);

  final Input$GenerateReportInput _instance;

  final TRes Function(Input$GenerateReportInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? type = _undefined,
    Object? startDate = _undefined,
    Object? endDate = _undefined,
    Object? parameters = _undefined,
  }) => _then(
    Input$GenerateReportInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (type != _undefined && type != null) 'type': (type as Enum$ReportType),
      if (startDate != _undefined && startDate != null)
        'startDate': (startDate as DateTime),
      if (endDate != _undefined && endDate != null)
        'endDate': (endDate as DateTime),
      if (parameters != _undefined) 'parameters': (parameters as dynamic?),
    }),
  );
}

class _CopyWithStubImpl$Input$GenerateReportInput<TRes>
    implements CopyWith$Input$GenerateReportInput<TRes> {
  _CopyWithStubImpl$Input$GenerateReportInput(this._res);

  TRes _res;

  call({
    String? name,
    Enum$ReportType? type,
    DateTime? startDate,
    DateTime? endDate,
    dynamic? parameters,
  }) => _res;
}

class Input$CompleteReportInput {
  factory Input$CompleteReportInput({
    required dynamic data,
    required dynamic summary,
    String? fileURL,
  }) => Input$CompleteReportInput._({
    r'data': data,
    r'summary': summary,
    if (fileURL != null) r'fileURL': fileURL,
  });

  Input$CompleteReportInput._(this._$data);

  factory Input$CompleteReportInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$data = data['data'];
    result$data['data'] = (l$data as dynamic);
    final l$summary = data['summary'];
    result$data['summary'] = (l$summary as dynamic);
    if (data.containsKey('fileURL')) {
      final l$fileURL = data['fileURL'];
      result$data['fileURL'] = (l$fileURL as String?);
    }
    return Input$CompleteReportInput._(result$data);
  }

  Map<String, dynamic> _$data;

  dynamic get data => (_$data['data'] as dynamic);

  dynamic get summary => (_$data['summary'] as dynamic);

  String? get fileURL => (_$data['fileURL'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$data = data;
    result$data['data'] = l$data;
    final l$summary = summary;
    result$data['summary'] = l$summary;
    if (_$data.containsKey('fileURL')) {
      final l$fileURL = fileURL;
      result$data['fileURL'] = l$fileURL;
    }
    return result$data;
  }

  CopyWith$Input$CompleteReportInput<Input$CompleteReportInput> get copyWith =>
      CopyWith$Input$CompleteReportInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CompleteReportInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    final l$summary = summary;
    final lOther$summary = other.summary;
    if (l$summary != lOther$summary) {
      return false;
    }
    final l$fileURL = fileURL;
    final lOther$fileURL = other.fileURL;
    if (_$data.containsKey('fileURL') != other._$data.containsKey('fileURL')) {
      return false;
    }
    if (l$fileURL != lOther$fileURL) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$data = data;
    final l$summary = summary;
    final l$fileURL = fileURL;
    return Object.hashAll([
      l$data,
      l$summary,
      _$data.containsKey('fileURL') ? l$fileURL : const {},
    ]);
  }
}

abstract class CopyWith$Input$CompleteReportInput<TRes> {
  factory CopyWith$Input$CompleteReportInput(
    Input$CompleteReportInput instance,
    TRes Function(Input$CompleteReportInput) then,
  ) = _CopyWithImpl$Input$CompleteReportInput;

  factory CopyWith$Input$CompleteReportInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CompleteReportInput;

  TRes call({dynamic? data, dynamic? summary, String? fileURL});
}

class _CopyWithImpl$Input$CompleteReportInput<TRes>
    implements CopyWith$Input$CompleteReportInput<TRes> {
  _CopyWithImpl$Input$CompleteReportInput(this._instance, this._then);

  final Input$CompleteReportInput _instance;

  final TRes Function(Input$CompleteReportInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? data = _undefined,
    Object? summary = _undefined,
    Object? fileURL = _undefined,
  }) => _then(
    Input$CompleteReportInput._({
      ..._instance._$data,
      if (data != _undefined && data != null) 'data': (data as dynamic),
      if (summary != _undefined && summary != null)
        'summary': (summary as dynamic),
      if (fileURL != _undefined) 'fileURL': (fileURL as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$CompleteReportInput<TRes>
    implements CopyWith$Input$CompleteReportInput<TRes> {
  _CopyWithStubImpl$Input$CompleteReportInput(this._res);

  TRes _res;

  call({dynamic? data, dynamic? summary, String? fileURL}) => _res;
}

class Input$CreateDashboardInput {
  factory Input$CreateDashboardInput({
    required String name,
    dynamic? layout,
    required List<Input$DashboardWidgetInput> widgets,
    bool? isPublic,
    List<String>? sharedWith,
  }) => Input$CreateDashboardInput._({
    r'name': name,
    if (layout != null) r'layout': layout,
    r'widgets': widgets,
    if (isPublic != null) r'isPublic': isPublic,
    if (sharedWith != null) r'sharedWith': sharedWith,
  });

  Input$CreateDashboardInput._(this._$data);

  factory Input$CreateDashboardInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('layout')) {
      final l$layout = data['layout'];
      result$data['layout'] = (l$layout as dynamic?);
    }
    final l$widgets = data['widgets'];
    result$data['widgets'] = (l$widgets as List<dynamic>)
        .map(
          (e) =>
              Input$DashboardWidgetInput.fromJson((e as Map<String, dynamic>)),
        )
        .toList();
    if (data.containsKey('isPublic')) {
      final l$isPublic = data['isPublic'];
      result$data['isPublic'] = (l$isPublic as bool?);
    }
    if (data.containsKey('sharedWith')) {
      final l$sharedWith = data['sharedWith'];
      result$data['sharedWith'] = (l$sharedWith as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    return Input$CreateDashboardInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  dynamic? get layout => (_$data['layout'] as dynamic?);

  List<Input$DashboardWidgetInput> get widgets =>
      (_$data['widgets'] as List<Input$DashboardWidgetInput>);

  bool? get isPublic => (_$data['isPublic'] as bool?);

  List<String>? get sharedWith => (_$data['sharedWith'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('layout')) {
      final l$layout = layout;
      result$data['layout'] = l$layout;
    }
    final l$widgets = widgets;
    result$data['widgets'] = l$widgets.map((e) => e.toJson()).toList();
    if (_$data.containsKey('isPublic')) {
      final l$isPublic = isPublic;
      result$data['isPublic'] = l$isPublic;
    }
    if (_$data.containsKey('sharedWith')) {
      final l$sharedWith = sharedWith;
      result$data['sharedWith'] = l$sharedWith?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$CreateDashboardInput<Input$CreateDashboardInput>
  get copyWith => CopyWith$Input$CreateDashboardInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateDashboardInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$layout = layout;
    final lOther$layout = other.layout;
    if (_$data.containsKey('layout') != other._$data.containsKey('layout')) {
      return false;
    }
    if (l$layout != lOther$layout) {
      return false;
    }
    final l$widgets = widgets;
    final lOther$widgets = other.widgets;
    if (l$widgets.length != lOther$widgets.length) {
      return false;
    }
    for (int i = 0; i < l$widgets.length; i++) {
      final l$widgets$entry = l$widgets[i];
      final lOther$widgets$entry = lOther$widgets[i];
      if (l$widgets$entry != lOther$widgets$entry) {
        return false;
      }
    }
    final l$isPublic = isPublic;
    final lOther$isPublic = other.isPublic;
    if (_$data.containsKey('isPublic') !=
        other._$data.containsKey('isPublic')) {
      return false;
    }
    if (l$isPublic != lOther$isPublic) {
      return false;
    }
    final l$sharedWith = sharedWith;
    final lOther$sharedWith = other.sharedWith;
    if (_$data.containsKey('sharedWith') !=
        other._$data.containsKey('sharedWith')) {
      return false;
    }
    if (l$sharedWith != null && lOther$sharedWith != null) {
      if (l$sharedWith.length != lOther$sharedWith.length) {
        return false;
      }
      for (int i = 0; i < l$sharedWith.length; i++) {
        final l$sharedWith$entry = l$sharedWith[i];
        final lOther$sharedWith$entry = lOther$sharedWith[i];
        if (l$sharedWith$entry != lOther$sharedWith$entry) {
          return false;
        }
      }
    } else if (l$sharedWith != lOther$sharedWith) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$layout = layout;
    final l$widgets = widgets;
    final l$isPublic = isPublic;
    final l$sharedWith = sharedWith;
    return Object.hashAll([
      l$name,
      _$data.containsKey('layout') ? l$layout : const {},
      Object.hashAll(l$widgets.map((v) => v)),
      _$data.containsKey('isPublic') ? l$isPublic : const {},
      _$data.containsKey('sharedWith')
          ? l$sharedWith == null
                ? null
                : Object.hashAll(l$sharedWith.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateDashboardInput<TRes> {
  factory CopyWith$Input$CreateDashboardInput(
    Input$CreateDashboardInput instance,
    TRes Function(Input$CreateDashboardInput) then,
  ) = _CopyWithImpl$Input$CreateDashboardInput;

  factory CopyWith$Input$CreateDashboardInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateDashboardInput;

  TRes call({
    String? name,
    dynamic? layout,
    List<Input$DashboardWidgetInput>? widgets,
    bool? isPublic,
    List<String>? sharedWith,
  });
  TRes widgets(
    Iterable<Input$DashboardWidgetInput> Function(
      Iterable<CopyWith$Input$DashboardWidgetInput<Input$DashboardWidgetInput>>,
    )
    _fn,
  );
}

class _CopyWithImpl$Input$CreateDashboardInput<TRes>
    implements CopyWith$Input$CreateDashboardInput<TRes> {
  _CopyWithImpl$Input$CreateDashboardInput(this._instance, this._then);

  final Input$CreateDashboardInput _instance;

  final TRes Function(Input$CreateDashboardInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? layout = _undefined,
    Object? widgets = _undefined,
    Object? isPublic = _undefined,
    Object? sharedWith = _undefined,
  }) => _then(
    Input$CreateDashboardInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (layout != _undefined) 'layout': (layout as dynamic?),
      if (widgets != _undefined && widgets != null)
        'widgets': (widgets as List<Input$DashboardWidgetInput>),
      if (isPublic != _undefined) 'isPublic': (isPublic as bool?),
      if (sharedWith != _undefined) 'sharedWith': (sharedWith as List<String>?),
    }),
  );

  TRes widgets(
    Iterable<Input$DashboardWidgetInput> Function(
      Iterable<CopyWith$Input$DashboardWidgetInput<Input$DashboardWidgetInput>>,
    )
    _fn,
  ) => call(
    widgets: _fn(
      _instance.widgets.map(
        (e) => CopyWith$Input$DashboardWidgetInput(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Input$CreateDashboardInput<TRes>
    implements CopyWith$Input$CreateDashboardInput<TRes> {
  _CopyWithStubImpl$Input$CreateDashboardInput(this._res);

  TRes _res;

  call({
    String? name,
    dynamic? layout,
    List<Input$DashboardWidgetInput>? widgets,
    bool? isPublic,
    List<String>? sharedWith,
  }) => _res;

  widgets(_fn) => _res;
}

class Input$DashboardWidgetInput {
  factory Input$DashboardWidgetInput({
    required String type,
    required String title,
    required dynamic config,
  }) => Input$DashboardWidgetInput._({
    r'type': type,
    r'title': title,
    r'config': config,
  });

  Input$DashboardWidgetInput._(this._$data);

  factory Input$DashboardWidgetInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$type = data['type'];
    result$data['type'] = (l$type as String);
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$config = data['config'];
    result$data['config'] = (l$config as dynamic);
    return Input$DashboardWidgetInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get type => (_$data['type'] as String);

  String get title => (_$data['title'] as String);

  dynamic get config => (_$data['config'] as dynamic);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$type = type;
    result$data['type'] = l$type;
    final l$title = title;
    result$data['title'] = l$title;
    final l$config = config;
    result$data['config'] = l$config;
    return result$data;
  }

  CopyWith$Input$DashboardWidgetInput<Input$DashboardWidgetInput>
  get copyWith => CopyWith$Input$DashboardWidgetInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$DashboardWidgetInput ||
        runtimeType != other.runtimeType) {
      return false;
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
    final l$config = config;
    final lOther$config = other.config;
    if (l$config != lOther$config) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$title = title;
    final l$config = config;
    return Object.hashAll([l$type, l$title, l$config]);
  }
}

abstract class CopyWith$Input$DashboardWidgetInput<TRes> {
  factory CopyWith$Input$DashboardWidgetInput(
    Input$DashboardWidgetInput instance,
    TRes Function(Input$DashboardWidgetInput) then,
  ) = _CopyWithImpl$Input$DashboardWidgetInput;

  factory CopyWith$Input$DashboardWidgetInput.stub(TRes res) =
      _CopyWithStubImpl$Input$DashboardWidgetInput;

  TRes call({String? type, String? title, dynamic? config});
}

class _CopyWithImpl$Input$DashboardWidgetInput<TRes>
    implements CopyWith$Input$DashboardWidgetInput<TRes> {
  _CopyWithImpl$Input$DashboardWidgetInput(this._instance, this._then);

  final Input$DashboardWidgetInput _instance;

  final TRes Function(Input$DashboardWidgetInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? title = _undefined,
    Object? config = _undefined,
  }) => _then(
    Input$DashboardWidgetInput._({
      ..._instance._$data,
      if (type != _undefined && type != null) 'type': (type as String),
      if (title != _undefined && title != null) 'title': (title as String),
      if (config != _undefined && config != null) 'config': (config as dynamic),
    }),
  );
}

class _CopyWithStubImpl$Input$DashboardWidgetInput<TRes>
    implements CopyWith$Input$DashboardWidgetInput<TRes> {
  _CopyWithStubImpl$Input$DashboardWidgetInput(this._res);

  TRes _res;

  call({String? type, String? title, dynamic? config}) => _res;
}

class Input$UpdateDashboardInput {
  factory Input$UpdateDashboardInput({
    String? name,
    dynamic? layout,
    List<Input$DashboardWidgetInput>? widgets,
    bool? isPublic,
    List<String>? sharedWith,
  }) => Input$UpdateDashboardInput._({
    if (name != null) r'name': name,
    if (layout != null) r'layout': layout,
    if (widgets != null) r'widgets': widgets,
    if (isPublic != null) r'isPublic': isPublic,
    if (sharedWith != null) r'sharedWith': sharedWith,
  });

  Input$UpdateDashboardInput._(this._$data);

  factory Input$UpdateDashboardInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('layout')) {
      final l$layout = data['layout'];
      result$data['layout'] = (l$layout as dynamic?);
    }
    if (data.containsKey('widgets')) {
      final l$widgets = data['widgets'];
      result$data['widgets'] = (l$widgets as List<dynamic>?)
          ?.map(
            (e) => Input$DashboardWidgetInput.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList();
    }
    if (data.containsKey('isPublic')) {
      final l$isPublic = data['isPublic'];
      result$data['isPublic'] = (l$isPublic as bool?);
    }
    if (data.containsKey('sharedWith')) {
      final l$sharedWith = data['sharedWith'];
      result$data['sharedWith'] = (l$sharedWith as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    return Input$UpdateDashboardInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  dynamic? get layout => (_$data['layout'] as dynamic?);

  List<Input$DashboardWidgetInput>? get widgets =>
      (_$data['widgets'] as List<Input$DashboardWidgetInput>?);

  bool? get isPublic => (_$data['isPublic'] as bool?);

  List<String>? get sharedWith => (_$data['sharedWith'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('layout')) {
      final l$layout = layout;
      result$data['layout'] = l$layout;
    }
    if (_$data.containsKey('widgets')) {
      final l$widgets = widgets;
      result$data['widgets'] = l$widgets?.map((e) => e.toJson()).toList();
    }
    if (_$data.containsKey('isPublic')) {
      final l$isPublic = isPublic;
      result$data['isPublic'] = l$isPublic;
    }
    if (_$data.containsKey('sharedWith')) {
      final l$sharedWith = sharedWith;
      result$data['sharedWith'] = l$sharedWith?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$UpdateDashboardInput<Input$UpdateDashboardInput>
  get copyWith => CopyWith$Input$UpdateDashboardInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateDashboardInput ||
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
    final l$layout = layout;
    final lOther$layout = other.layout;
    if (_$data.containsKey('layout') != other._$data.containsKey('layout')) {
      return false;
    }
    if (l$layout != lOther$layout) {
      return false;
    }
    final l$widgets = widgets;
    final lOther$widgets = other.widgets;
    if (_$data.containsKey('widgets') != other._$data.containsKey('widgets')) {
      return false;
    }
    if (l$widgets != null && lOther$widgets != null) {
      if (l$widgets.length != lOther$widgets.length) {
        return false;
      }
      for (int i = 0; i < l$widgets.length; i++) {
        final l$widgets$entry = l$widgets[i];
        final lOther$widgets$entry = lOther$widgets[i];
        if (l$widgets$entry != lOther$widgets$entry) {
          return false;
        }
      }
    } else if (l$widgets != lOther$widgets) {
      return false;
    }
    final l$isPublic = isPublic;
    final lOther$isPublic = other.isPublic;
    if (_$data.containsKey('isPublic') !=
        other._$data.containsKey('isPublic')) {
      return false;
    }
    if (l$isPublic != lOther$isPublic) {
      return false;
    }
    final l$sharedWith = sharedWith;
    final lOther$sharedWith = other.sharedWith;
    if (_$data.containsKey('sharedWith') !=
        other._$data.containsKey('sharedWith')) {
      return false;
    }
    if (l$sharedWith != null && lOther$sharedWith != null) {
      if (l$sharedWith.length != lOther$sharedWith.length) {
        return false;
      }
      for (int i = 0; i < l$sharedWith.length; i++) {
        final l$sharedWith$entry = l$sharedWith[i];
        final lOther$sharedWith$entry = lOther$sharedWith[i];
        if (l$sharedWith$entry != lOther$sharedWith$entry) {
          return false;
        }
      }
    } else if (l$sharedWith != lOther$sharedWith) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$layout = layout;
    final l$widgets = widgets;
    final l$isPublic = isPublic;
    final l$sharedWith = sharedWith;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('layout') ? l$layout : const {},
      _$data.containsKey('widgets')
          ? l$widgets == null
                ? null
                : Object.hashAll(l$widgets.map((v) => v))
          : const {},
      _$data.containsKey('isPublic') ? l$isPublic : const {},
      _$data.containsKey('sharedWith')
          ? l$sharedWith == null
                ? null
                : Object.hashAll(l$sharedWith.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateDashboardInput<TRes> {
  factory CopyWith$Input$UpdateDashboardInput(
    Input$UpdateDashboardInput instance,
    TRes Function(Input$UpdateDashboardInput) then,
  ) = _CopyWithImpl$Input$UpdateDashboardInput;

  factory CopyWith$Input$UpdateDashboardInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateDashboardInput;

  TRes call({
    String? name,
    dynamic? layout,
    List<Input$DashboardWidgetInput>? widgets,
    bool? isPublic,
    List<String>? sharedWith,
  });
  TRes widgets(
    Iterable<Input$DashboardWidgetInput>? Function(
      Iterable<
        CopyWith$Input$DashboardWidgetInput<Input$DashboardWidgetInput>
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Input$UpdateDashboardInput<TRes>
    implements CopyWith$Input$UpdateDashboardInput<TRes> {
  _CopyWithImpl$Input$UpdateDashboardInput(this._instance, this._then);

  final Input$UpdateDashboardInput _instance;

  final TRes Function(Input$UpdateDashboardInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? layout = _undefined,
    Object? widgets = _undefined,
    Object? isPublic = _undefined,
    Object? sharedWith = _undefined,
  }) => _then(
    Input$UpdateDashboardInput._({
      ..._instance._$data,
      if (name != _undefined) 'name': (name as String?),
      if (layout != _undefined) 'layout': (layout as dynamic?),
      if (widgets != _undefined)
        'widgets': (widgets as List<Input$DashboardWidgetInput>?),
      if (isPublic != _undefined) 'isPublic': (isPublic as bool?),
      if (sharedWith != _undefined) 'sharedWith': (sharedWith as List<String>?),
    }),
  );

  TRes widgets(
    Iterable<Input$DashboardWidgetInput>? Function(
      Iterable<
        CopyWith$Input$DashboardWidgetInput<Input$DashboardWidgetInput>
      >?,
    )
    _fn,
  ) => call(
    widgets: _fn(
      _instance.widgets?.map(
        (e) => CopyWith$Input$DashboardWidgetInput(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Input$UpdateDashboardInput<TRes>
    implements CopyWith$Input$UpdateDashboardInput<TRes> {
  _CopyWithStubImpl$Input$UpdateDashboardInput(this._res);

  TRes _res;

  call({
    String? name,
    dynamic? layout,
    List<Input$DashboardWidgetInput>? widgets,
    bool? isPublic,
    List<String>? sharedWith,
  }) => _res;

  widgets(_fn) => _res;
}

class Input$CreateIntegrationInput {
  factory Input$CreateIntegrationInput({
    required String name,
    required Enum$IntegrationProvider provider,
    required String apiKey,
    dynamic? config,
  }) => Input$CreateIntegrationInput._({
    r'name': name,
    r'provider': provider,
    r'apiKey': apiKey,
    if (config != null) r'config': config,
  });

  Input$CreateIntegrationInput._(this._$data);

  factory Input$CreateIntegrationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$provider = data['provider'];
    result$data['provider'] = fromJson$Enum$IntegrationProvider(
      (l$provider as String),
    );
    final l$apiKey = data['apiKey'];
    result$data['apiKey'] = (l$apiKey as String);
    if (data.containsKey('config')) {
      final l$config = data['config'];
      result$data['config'] = (l$config as dynamic?);
    }
    return Input$CreateIntegrationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  Enum$IntegrationProvider get provider =>
      (_$data['provider'] as Enum$IntegrationProvider);

  String get apiKey => (_$data['apiKey'] as String);

  dynamic? get config => (_$data['config'] as dynamic?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$provider = provider;
    result$data['provider'] = toJson$Enum$IntegrationProvider(l$provider);
    final l$apiKey = apiKey;
    result$data['apiKey'] = l$apiKey;
    if (_$data.containsKey('config')) {
      final l$config = config;
      result$data['config'] = l$config;
    }
    return result$data;
  }

  CopyWith$Input$CreateIntegrationInput<Input$CreateIntegrationInput>
  get copyWith => CopyWith$Input$CreateIntegrationInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateIntegrationInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$provider = provider;
    final lOther$provider = other.provider;
    if (l$provider != lOther$provider) {
      return false;
    }
    final l$apiKey = apiKey;
    final lOther$apiKey = other.apiKey;
    if (l$apiKey != lOther$apiKey) {
      return false;
    }
    final l$config = config;
    final lOther$config = other.config;
    if (_$data.containsKey('config') != other._$data.containsKey('config')) {
      return false;
    }
    if (l$config != lOther$config) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$provider = provider;
    final l$apiKey = apiKey;
    final l$config = config;
    return Object.hashAll([
      l$name,
      l$provider,
      l$apiKey,
      _$data.containsKey('config') ? l$config : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateIntegrationInput<TRes> {
  factory CopyWith$Input$CreateIntegrationInput(
    Input$CreateIntegrationInput instance,
    TRes Function(Input$CreateIntegrationInput) then,
  ) = _CopyWithImpl$Input$CreateIntegrationInput;

  factory CopyWith$Input$CreateIntegrationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateIntegrationInput;

  TRes call({
    String? name,
    Enum$IntegrationProvider? provider,
    String? apiKey,
    dynamic? config,
  });
}

class _CopyWithImpl$Input$CreateIntegrationInput<TRes>
    implements CopyWith$Input$CreateIntegrationInput<TRes> {
  _CopyWithImpl$Input$CreateIntegrationInput(this._instance, this._then);

  final Input$CreateIntegrationInput _instance;

  final TRes Function(Input$CreateIntegrationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? provider = _undefined,
    Object? apiKey = _undefined,
    Object? config = _undefined,
  }) => _then(
    Input$CreateIntegrationInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (provider != _undefined && provider != null)
        'provider': (provider as Enum$IntegrationProvider),
      if (apiKey != _undefined && apiKey != null) 'apiKey': (apiKey as String),
      if (config != _undefined) 'config': (config as dynamic?),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateIntegrationInput<TRes>
    implements CopyWith$Input$CreateIntegrationInput<TRes> {
  _CopyWithStubImpl$Input$CreateIntegrationInput(this._res);

  TRes _res;

  call({
    String? name,
    Enum$IntegrationProvider? provider,
    String? apiKey,
    dynamic? config,
  }) => _res;
}

class Input$UpdateIntegrationInput {
  factory Input$UpdateIntegrationInput({
    String? name,
    String? apiKey,
    dynamic? config,
    bool? isActive,
  }) => Input$UpdateIntegrationInput._({
    if (name != null) r'name': name,
    if (apiKey != null) r'apiKey': apiKey,
    if (config != null) r'config': config,
    if (isActive != null) r'isActive': isActive,
  });

  Input$UpdateIntegrationInput._(this._$data);

  factory Input$UpdateIntegrationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('apiKey')) {
      final l$apiKey = data['apiKey'];
      result$data['apiKey'] = (l$apiKey as String?);
    }
    if (data.containsKey('config')) {
      final l$config = data['config'];
      result$data['config'] = (l$config as dynamic?);
    }
    if (data.containsKey('isActive')) {
      final l$isActive = data['isActive'];
      result$data['isActive'] = (l$isActive as bool?);
    }
    return Input$UpdateIntegrationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get apiKey => (_$data['apiKey'] as String?);

  dynamic? get config => (_$data['config'] as dynamic?);

  bool? get isActive => (_$data['isActive'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('apiKey')) {
      final l$apiKey = apiKey;
      result$data['apiKey'] = l$apiKey;
    }
    if (_$data.containsKey('config')) {
      final l$config = config;
      result$data['config'] = l$config;
    }
    if (_$data.containsKey('isActive')) {
      final l$isActive = isActive;
      result$data['isActive'] = l$isActive;
    }
    return result$data;
  }

  CopyWith$Input$UpdateIntegrationInput<Input$UpdateIntegrationInput>
  get copyWith => CopyWith$Input$UpdateIntegrationInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateIntegrationInput ||
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
    final l$apiKey = apiKey;
    final lOther$apiKey = other.apiKey;
    if (_$data.containsKey('apiKey') != other._$data.containsKey('apiKey')) {
      return false;
    }
    if (l$apiKey != lOther$apiKey) {
      return false;
    }
    final l$config = config;
    final lOther$config = other.config;
    if (_$data.containsKey('config') != other._$data.containsKey('config')) {
      return false;
    }
    if (l$config != lOther$config) {
      return false;
    }
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (_$data.containsKey('isActive') !=
        other._$data.containsKey('isActive')) {
      return false;
    }
    if (l$isActive != lOther$isActive) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$apiKey = apiKey;
    final l$config = config;
    final l$isActive = isActive;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('apiKey') ? l$apiKey : const {},
      _$data.containsKey('config') ? l$config : const {},
      _$data.containsKey('isActive') ? l$isActive : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateIntegrationInput<TRes> {
  factory CopyWith$Input$UpdateIntegrationInput(
    Input$UpdateIntegrationInput instance,
    TRes Function(Input$UpdateIntegrationInput) then,
  ) = _CopyWithImpl$Input$UpdateIntegrationInput;

  factory CopyWith$Input$UpdateIntegrationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateIntegrationInput;

  TRes call({String? name, String? apiKey, dynamic? config, bool? isActive});
}

class _CopyWithImpl$Input$UpdateIntegrationInput<TRes>
    implements CopyWith$Input$UpdateIntegrationInput<TRes> {
  _CopyWithImpl$Input$UpdateIntegrationInput(this._instance, this._then);

  final Input$UpdateIntegrationInput _instance;

  final TRes Function(Input$UpdateIntegrationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? apiKey = _undefined,
    Object? config = _undefined,
    Object? isActive = _undefined,
  }) => _then(
    Input$UpdateIntegrationInput._({
      ..._instance._$data,
      if (name != _undefined) 'name': (name as String?),
      if (apiKey != _undefined) 'apiKey': (apiKey as String?),
      if (config != _undefined) 'config': (config as dynamic?),
      if (isActive != _undefined) 'isActive': (isActive as bool?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateIntegrationInput<TRes>
    implements CopyWith$Input$UpdateIntegrationInput<TRes> {
  _CopyWithStubImpl$Input$UpdateIntegrationInput(this._res);

  TRes _res;

  call({String? name, String? apiKey, dynamic? config, bool? isActive}) => _res;
}

class Input$PasskeyCredentialInput {
  factory Input$PasskeyCredentialInput({
    required String id,
    required String rawId,
    required String type,
    required dynamic response,
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
    result$data['response'] = (l$response as dynamic);
    return Input$PasskeyCredentialInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get rawId => (_$data['rawId'] as String);

  String get type => (_$data['type'] as String);

  dynamic get response => (_$data['response'] as dynamic);

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

  TRes call({String? id, String? rawId, String? type, dynamic? response});
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
        'response': (response as dynamic),
    }),
  );
}

class _CopyWithStubImpl$Input$PasskeyCredentialInput<TRes>
    implements CopyWith$Input$PasskeyCredentialInput<TRes> {
  _CopyWithStubImpl$Input$PasskeyCredentialInput(this._res);

  TRes _res;

  call({String? id, String? rawId, String? type, dynamic? response}) => _res;
}

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
    String? username,
    required String firstName,
    required String lastName,
    String? password,
  }) => Input$RegisterInput._({
    r'email': email,
    if (username != null) r'username': username,
    r'firstName': firstName,
    r'lastName': lastName,
    if (password != null) r'password': password,
  });

  Input$RegisterInput._(this._$data);

  factory Input$RegisterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    if (data.containsKey('username')) {
      final l$username = data['username'];
      result$data['username'] = (l$username as String?);
    }
    final l$firstName = data['firstName'];
    result$data['firstName'] = (l$firstName as String);
    final l$lastName = data['lastName'];
    result$data['lastName'] = (l$lastName as String);
    if (data.containsKey('password')) {
      final l$password = data['password'];
      result$data['password'] = (l$password as String?);
    }
    return Input$RegisterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String? get username => (_$data['username'] as String?);

  String get firstName => (_$data['firstName'] as String);

  String get lastName => (_$data['lastName'] as String);

  String? get password => (_$data['password'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    if (_$data.containsKey('username')) {
      final l$username = username;
      result$data['username'] = l$username;
    }
    final l$firstName = firstName;
    result$data['firstName'] = l$firstName;
    final l$lastName = lastName;
    result$data['lastName'] = l$lastName;
    if (_$data.containsKey('password')) {
      final l$password = password;
      result$data['password'] = l$password;
    }
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
    final l$username = username;
    final lOther$username = other.username;
    if (_$data.containsKey('username') !=
        other._$data.containsKey('username')) {
      return false;
    }
    if (l$username != lOther$username) {
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
    final l$password = password;
    final lOther$password = other.password;
    if (_$data.containsKey('password') !=
        other._$data.containsKey('password')) {
      return false;
    }
    if (l$password != lOther$password) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$username = username;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$password = password;
    return Object.hashAll([
      l$email,
      _$data.containsKey('username') ? l$username : const {},
      l$firstName,
      l$lastName,
      _$data.containsKey('password') ? l$password : const {},
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
    String? username,
    String? firstName,
    String? lastName,
    String? password,
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
    Object? username = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? password = _undefined,
  }) => _then(
    Input$RegisterInput._({
      ..._instance._$data,
      if (email != _undefined && email != null) 'email': (email as String),
      if (username != _undefined) 'username': (username as String?),
      if (firstName != _undefined && firstName != null)
        'firstName': (firstName as String),
      if (lastName != _undefined && lastName != null)
        'lastName': (lastName as String),
      if (password != _undefined) 'password': (password as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$RegisterInput<TRes>
    implements CopyWith$Input$RegisterInput<TRes> {
  _CopyWithStubImpl$Input$RegisterInput(this._res);

  TRes _res;

  call({
    String? email,
    String? username,
    String? firstName,
    String? lastName,
    String? password,
  }) => _res;
}

class Input$IssueLOIInput {
  factory Input$IssueLOIInput({
    required int memberId,
    required String homeClubId,
    required String visitingClubId,
    required String purpose,
    required DateTime requestedDate,
    required int durationDays,
    int? guestCount,
  }) => Input$IssueLOIInput._({
    r'memberId': memberId,
    r'homeClubId': homeClubId,
    r'visitingClubId': visitingClubId,
    r'purpose': purpose,
    r'requestedDate': requestedDate,
    r'durationDays': durationDays,
    if (guestCount != null) r'guestCount': guestCount,
  });

  Input$IssueLOIInput._(this._$data);

  factory Input$IssueLOIInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$memberId = data['memberId'];
    result$data['memberId'] = (l$memberId as int);
    final l$homeClubId = data['homeClubId'];
    result$data['homeClubId'] = (l$homeClubId as String);
    final l$visitingClubId = data['visitingClubId'];
    result$data['visitingClubId'] = (l$visitingClubId as String);
    final l$purpose = data['purpose'];
    result$data['purpose'] = (l$purpose as String);
    final l$requestedDate = data['requestedDate'];
    result$data['requestedDate'] = DateTime.parse((l$requestedDate as String));
    final l$durationDays = data['durationDays'];
    result$data['durationDays'] = (l$durationDays as int);
    if (data.containsKey('guestCount')) {
      final l$guestCount = data['guestCount'];
      result$data['guestCount'] = (l$guestCount as int?);
    }
    return Input$IssueLOIInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int get memberId => (_$data['memberId'] as int);

  String get homeClubId => (_$data['homeClubId'] as String);

  String get visitingClubId => (_$data['visitingClubId'] as String);

  String get purpose => (_$data['purpose'] as String);

  DateTime get requestedDate => (_$data['requestedDate'] as DateTime);

  int get durationDays => (_$data['durationDays'] as int);

  int? get guestCount => (_$data['guestCount'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$memberId = memberId;
    result$data['memberId'] = l$memberId;
    final l$homeClubId = homeClubId;
    result$data['homeClubId'] = l$homeClubId;
    final l$visitingClubId = visitingClubId;
    result$data['visitingClubId'] = l$visitingClubId;
    final l$purpose = purpose;
    result$data['purpose'] = l$purpose;
    final l$requestedDate = requestedDate;
    result$data['requestedDate'] = l$requestedDate.toIso8601String();
    final l$durationDays = durationDays;
    result$data['durationDays'] = l$durationDays;
    if (_$data.containsKey('guestCount')) {
      final l$guestCount = guestCount;
      result$data['guestCount'] = l$guestCount;
    }
    return result$data;
  }

  CopyWith$Input$IssueLOIInput<Input$IssueLOIInput> get copyWith =>
      CopyWith$Input$IssueLOIInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$IssueLOIInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$memberId = memberId;
    final lOther$memberId = other.memberId;
    if (l$memberId != lOther$memberId) {
      return false;
    }
    final l$homeClubId = homeClubId;
    final lOther$homeClubId = other.homeClubId;
    if (l$homeClubId != lOther$homeClubId) {
      return false;
    }
    final l$visitingClubId = visitingClubId;
    final lOther$visitingClubId = other.visitingClubId;
    if (l$visitingClubId != lOther$visitingClubId) {
      return false;
    }
    final l$purpose = purpose;
    final lOther$purpose = other.purpose;
    if (l$purpose != lOther$purpose) {
      return false;
    }
    final l$requestedDate = requestedDate;
    final lOther$requestedDate = other.requestedDate;
    if (l$requestedDate != lOther$requestedDate) {
      return false;
    }
    final l$durationDays = durationDays;
    final lOther$durationDays = other.durationDays;
    if (l$durationDays != lOther$durationDays) {
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
    final l$memberId = memberId;
    final l$homeClubId = homeClubId;
    final l$visitingClubId = visitingClubId;
    final l$purpose = purpose;
    final l$requestedDate = requestedDate;
    final l$durationDays = durationDays;
    final l$guestCount = guestCount;
    return Object.hashAll([
      l$memberId,
      l$homeClubId,
      l$visitingClubId,
      l$purpose,
      l$requestedDate,
      l$durationDays,
      _$data.containsKey('guestCount') ? l$guestCount : const {},
    ]);
  }
}

abstract class CopyWith$Input$IssueLOIInput<TRes> {
  factory CopyWith$Input$IssueLOIInput(
    Input$IssueLOIInput instance,
    TRes Function(Input$IssueLOIInput) then,
  ) = _CopyWithImpl$Input$IssueLOIInput;

  factory CopyWith$Input$IssueLOIInput.stub(TRes res) =
      _CopyWithStubImpl$Input$IssueLOIInput;

  TRes call({
    int? memberId,
    String? homeClubId,
    String? visitingClubId,
    String? purpose,
    DateTime? requestedDate,
    int? durationDays,
    int? guestCount,
  });
}

class _CopyWithImpl$Input$IssueLOIInput<TRes>
    implements CopyWith$Input$IssueLOIInput<TRes> {
  _CopyWithImpl$Input$IssueLOIInput(this._instance, this._then);

  final Input$IssueLOIInput _instance;

  final TRes Function(Input$IssueLOIInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? memberId = _undefined,
    Object? homeClubId = _undefined,
    Object? visitingClubId = _undefined,
    Object? purpose = _undefined,
    Object? requestedDate = _undefined,
    Object? durationDays = _undefined,
    Object? guestCount = _undefined,
  }) => _then(
    Input$IssueLOIInput._({
      ..._instance._$data,
      if (memberId != _undefined && memberId != null)
        'memberId': (memberId as int),
      if (homeClubId != _undefined && homeClubId != null)
        'homeClubId': (homeClubId as String),
      if (visitingClubId != _undefined && visitingClubId != null)
        'visitingClubId': (visitingClubId as String),
      if (purpose != _undefined && purpose != null)
        'purpose': (purpose as String),
      if (requestedDate != _undefined && requestedDate != null)
        'requestedDate': (requestedDate as DateTime),
      if (durationDays != _undefined && durationDays != null)
        'durationDays': (durationDays as int),
      if (guestCount != _undefined) 'guestCount': (guestCount as int?),
    }),
  );
}

class _CopyWithStubImpl$Input$IssueLOIInput<TRes>
    implements CopyWith$Input$IssueLOIInput<TRes> {
  _CopyWithStubImpl$Input$IssueLOIInput(this._res);

  TRes _res;

  call({
    int? memberId,
    String? homeClubId,
    String? visitingClubId,
    String? purpose,
    DateTime? requestedDate,
    int? durationDays,
    int? guestCount,
  }) => _res;
}

class Input$BookingRulesInput {
  factory Input$BookingRulesInput({
    int? minAdvanceBooking,
    int? maxAdvanceBooking,
    int? minDuration,
    int? maxDuration,
    String? cancellationPolicy,
    String? refundPolicy,
    required bool requiresDeposit,
    double? depositAmount,
  }) => Input$BookingRulesInput._({
    if (minAdvanceBooking != null) r'minAdvanceBooking': minAdvanceBooking,
    if (maxAdvanceBooking != null) r'maxAdvanceBooking': maxAdvanceBooking,
    if (minDuration != null) r'minDuration': minDuration,
    if (maxDuration != null) r'maxDuration': maxDuration,
    if (cancellationPolicy != null) r'cancellationPolicy': cancellationPolicy,
    if (refundPolicy != null) r'refundPolicy': refundPolicy,
    r'requiresDeposit': requiresDeposit,
    if (depositAmount != null) r'depositAmount': depositAmount,
  });

  Input$BookingRulesInput._(this._$data);

  factory Input$BookingRulesInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('minAdvanceBooking')) {
      final l$minAdvanceBooking = data['minAdvanceBooking'];
      result$data['minAdvanceBooking'] = (l$minAdvanceBooking as int?);
    }
    if (data.containsKey('maxAdvanceBooking')) {
      final l$maxAdvanceBooking = data['maxAdvanceBooking'];
      result$data['maxAdvanceBooking'] = (l$maxAdvanceBooking as int?);
    }
    if (data.containsKey('minDuration')) {
      final l$minDuration = data['minDuration'];
      result$data['minDuration'] = (l$minDuration as int?);
    }
    if (data.containsKey('maxDuration')) {
      final l$maxDuration = data['maxDuration'];
      result$data['maxDuration'] = (l$maxDuration as int?);
    }
    if (data.containsKey('cancellationPolicy')) {
      final l$cancellationPolicy = data['cancellationPolicy'];
      result$data['cancellationPolicy'] = (l$cancellationPolicy as String?);
    }
    if (data.containsKey('refundPolicy')) {
      final l$refundPolicy = data['refundPolicy'];
      result$data['refundPolicy'] = (l$refundPolicy as String?);
    }
    final l$requiresDeposit = data['requiresDeposit'];
    result$data['requiresDeposit'] = (l$requiresDeposit as bool);
    if (data.containsKey('depositAmount')) {
      final l$depositAmount = data['depositAmount'];
      result$data['depositAmount'] = (l$depositAmount as num?)?.toDouble();
    }
    return Input$BookingRulesInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get minAdvanceBooking => (_$data['minAdvanceBooking'] as int?);

  int? get maxAdvanceBooking => (_$data['maxAdvanceBooking'] as int?);

  int? get minDuration => (_$data['minDuration'] as int?);

  int? get maxDuration => (_$data['maxDuration'] as int?);

  String? get cancellationPolicy => (_$data['cancellationPolicy'] as String?);

  String? get refundPolicy => (_$data['refundPolicy'] as String?);

  bool get requiresDeposit => (_$data['requiresDeposit'] as bool);

  double? get depositAmount => (_$data['depositAmount'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('minAdvanceBooking')) {
      final l$minAdvanceBooking = minAdvanceBooking;
      result$data['minAdvanceBooking'] = l$minAdvanceBooking;
    }
    if (_$data.containsKey('maxAdvanceBooking')) {
      final l$maxAdvanceBooking = maxAdvanceBooking;
      result$data['maxAdvanceBooking'] = l$maxAdvanceBooking;
    }
    if (_$data.containsKey('minDuration')) {
      final l$minDuration = minDuration;
      result$data['minDuration'] = l$minDuration;
    }
    if (_$data.containsKey('maxDuration')) {
      final l$maxDuration = maxDuration;
      result$data['maxDuration'] = l$maxDuration;
    }
    if (_$data.containsKey('cancellationPolicy')) {
      final l$cancellationPolicy = cancellationPolicy;
      result$data['cancellationPolicy'] = l$cancellationPolicy;
    }
    if (_$data.containsKey('refundPolicy')) {
      final l$refundPolicy = refundPolicy;
      result$data['refundPolicy'] = l$refundPolicy;
    }
    final l$requiresDeposit = requiresDeposit;
    result$data['requiresDeposit'] = l$requiresDeposit;
    if (_$data.containsKey('depositAmount')) {
      final l$depositAmount = depositAmount;
      result$data['depositAmount'] = l$depositAmount;
    }
    return result$data;
  }

  CopyWith$Input$BookingRulesInput<Input$BookingRulesInput> get copyWith =>
      CopyWith$Input$BookingRulesInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$BookingRulesInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$minAdvanceBooking = minAdvanceBooking;
    final lOther$minAdvanceBooking = other.minAdvanceBooking;
    if (_$data.containsKey('minAdvanceBooking') !=
        other._$data.containsKey('minAdvanceBooking')) {
      return false;
    }
    if (l$minAdvanceBooking != lOther$minAdvanceBooking) {
      return false;
    }
    final l$maxAdvanceBooking = maxAdvanceBooking;
    final lOther$maxAdvanceBooking = other.maxAdvanceBooking;
    if (_$data.containsKey('maxAdvanceBooking') !=
        other._$data.containsKey('maxAdvanceBooking')) {
      return false;
    }
    if (l$maxAdvanceBooking != lOther$maxAdvanceBooking) {
      return false;
    }
    final l$minDuration = minDuration;
    final lOther$minDuration = other.minDuration;
    if (_$data.containsKey('minDuration') !=
        other._$data.containsKey('minDuration')) {
      return false;
    }
    if (l$minDuration != lOther$minDuration) {
      return false;
    }
    final l$maxDuration = maxDuration;
    final lOther$maxDuration = other.maxDuration;
    if (_$data.containsKey('maxDuration') !=
        other._$data.containsKey('maxDuration')) {
      return false;
    }
    if (l$maxDuration != lOther$maxDuration) {
      return false;
    }
    final l$cancellationPolicy = cancellationPolicy;
    final lOther$cancellationPolicy = other.cancellationPolicy;
    if (_$data.containsKey('cancellationPolicy') !=
        other._$data.containsKey('cancellationPolicy')) {
      return false;
    }
    if (l$cancellationPolicy != lOther$cancellationPolicy) {
      return false;
    }
    final l$refundPolicy = refundPolicy;
    final lOther$refundPolicy = other.refundPolicy;
    if (_$data.containsKey('refundPolicy') !=
        other._$data.containsKey('refundPolicy')) {
      return false;
    }
    if (l$refundPolicy != lOther$refundPolicy) {
      return false;
    }
    final l$requiresDeposit = requiresDeposit;
    final lOther$requiresDeposit = other.requiresDeposit;
    if (l$requiresDeposit != lOther$requiresDeposit) {
      return false;
    }
    final l$depositAmount = depositAmount;
    final lOther$depositAmount = other.depositAmount;
    if (_$data.containsKey('depositAmount') !=
        other._$data.containsKey('depositAmount')) {
      return false;
    }
    if (l$depositAmount != lOther$depositAmount) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$minAdvanceBooking = minAdvanceBooking;
    final l$maxAdvanceBooking = maxAdvanceBooking;
    final l$minDuration = minDuration;
    final l$maxDuration = maxDuration;
    final l$cancellationPolicy = cancellationPolicy;
    final l$refundPolicy = refundPolicy;
    final l$requiresDeposit = requiresDeposit;
    final l$depositAmount = depositAmount;
    return Object.hashAll([
      _$data.containsKey('minAdvanceBooking') ? l$minAdvanceBooking : const {},
      _$data.containsKey('maxAdvanceBooking') ? l$maxAdvanceBooking : const {},
      _$data.containsKey('minDuration') ? l$minDuration : const {},
      _$data.containsKey('maxDuration') ? l$maxDuration : const {},
      _$data.containsKey('cancellationPolicy')
          ? l$cancellationPolicy
          : const {},
      _$data.containsKey('refundPolicy') ? l$refundPolicy : const {},
      l$requiresDeposit,
      _$data.containsKey('depositAmount') ? l$depositAmount : const {},
    ]);
  }
}

abstract class CopyWith$Input$BookingRulesInput<TRes> {
  factory CopyWith$Input$BookingRulesInput(
    Input$BookingRulesInput instance,
    TRes Function(Input$BookingRulesInput) then,
  ) = _CopyWithImpl$Input$BookingRulesInput;

  factory CopyWith$Input$BookingRulesInput.stub(TRes res) =
      _CopyWithStubImpl$Input$BookingRulesInput;

  TRes call({
    int? minAdvanceBooking,
    int? maxAdvanceBooking,
    int? minDuration,
    int? maxDuration,
    String? cancellationPolicy,
    String? refundPolicy,
    bool? requiresDeposit,
    double? depositAmount,
  });
}

class _CopyWithImpl$Input$BookingRulesInput<TRes>
    implements CopyWith$Input$BookingRulesInput<TRes> {
  _CopyWithImpl$Input$BookingRulesInput(this._instance, this._then);

  final Input$BookingRulesInput _instance;

  final TRes Function(Input$BookingRulesInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? minAdvanceBooking = _undefined,
    Object? maxAdvanceBooking = _undefined,
    Object? minDuration = _undefined,
    Object? maxDuration = _undefined,
    Object? cancellationPolicy = _undefined,
    Object? refundPolicy = _undefined,
    Object? requiresDeposit = _undefined,
    Object? depositAmount = _undefined,
  }) => _then(
    Input$BookingRulesInput._({
      ..._instance._$data,
      if (minAdvanceBooking != _undefined)
        'minAdvanceBooking': (minAdvanceBooking as int?),
      if (maxAdvanceBooking != _undefined)
        'maxAdvanceBooking': (maxAdvanceBooking as int?),
      if (minDuration != _undefined) 'minDuration': (minDuration as int?),
      if (maxDuration != _undefined) 'maxDuration': (maxDuration as int?),
      if (cancellationPolicy != _undefined)
        'cancellationPolicy': (cancellationPolicy as String?),
      if (refundPolicy != _undefined) 'refundPolicy': (refundPolicy as String?),
      if (requiresDeposit != _undefined && requiresDeposit != null)
        'requiresDeposit': (requiresDeposit as bool),
      if (depositAmount != _undefined)
        'depositAmount': (depositAmount as double?),
    }),
  );
}

class _CopyWithStubImpl$Input$BookingRulesInput<TRes>
    implements CopyWith$Input$BookingRulesInput<TRes> {
  _CopyWithStubImpl$Input$BookingRulesInput(this._res);

  TRes _res;

  call({
    int? minAdvanceBooking,
    int? maxAdvanceBooking,
    int? minDuration,
    int? maxDuration,
    String? cancellationPolicy,
    String? refundPolicy,
    bool? requiresDeposit,
    double? depositAmount,
  }) => _res;
}

class Input$ReservationRulesInput {
  factory Input$ReservationRulesInput({
    int? minAdvanceReservation,
    int? maxAdvanceReservation,
    int? minPartySize,
    int? maxPartySize,
    String? cancellationPolicy,
    String? noShowPolicy,
    required bool requiresDepositForLargeGroups,
    int? largeGroupThreshold,
  }) => Input$ReservationRulesInput._({
    if (minAdvanceReservation != null)
      r'minAdvanceReservation': minAdvanceReservation,
    if (maxAdvanceReservation != null)
      r'maxAdvanceReservation': maxAdvanceReservation,
    if (minPartySize != null) r'minPartySize': minPartySize,
    if (maxPartySize != null) r'maxPartySize': maxPartySize,
    if (cancellationPolicy != null) r'cancellationPolicy': cancellationPolicy,
    if (noShowPolicy != null) r'noShowPolicy': noShowPolicy,
    r'requiresDepositForLargeGroups': requiresDepositForLargeGroups,
    if (largeGroupThreshold != null)
      r'largeGroupThreshold': largeGroupThreshold,
  });

  Input$ReservationRulesInput._(this._$data);

  factory Input$ReservationRulesInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('minAdvanceReservation')) {
      final l$minAdvanceReservation = data['minAdvanceReservation'];
      result$data['minAdvanceReservation'] = (l$minAdvanceReservation as int?);
    }
    if (data.containsKey('maxAdvanceReservation')) {
      final l$maxAdvanceReservation = data['maxAdvanceReservation'];
      result$data['maxAdvanceReservation'] = (l$maxAdvanceReservation as int?);
    }
    if (data.containsKey('minPartySize')) {
      final l$minPartySize = data['minPartySize'];
      result$data['minPartySize'] = (l$minPartySize as int?);
    }
    if (data.containsKey('maxPartySize')) {
      final l$maxPartySize = data['maxPartySize'];
      result$data['maxPartySize'] = (l$maxPartySize as int?);
    }
    if (data.containsKey('cancellationPolicy')) {
      final l$cancellationPolicy = data['cancellationPolicy'];
      result$data['cancellationPolicy'] = (l$cancellationPolicy as String?);
    }
    if (data.containsKey('noShowPolicy')) {
      final l$noShowPolicy = data['noShowPolicy'];
      result$data['noShowPolicy'] = (l$noShowPolicy as String?);
    }
    final l$requiresDepositForLargeGroups =
        data['requiresDepositForLargeGroups'];
    result$data['requiresDepositForLargeGroups'] =
        (l$requiresDepositForLargeGroups as bool);
    if (data.containsKey('largeGroupThreshold')) {
      final l$largeGroupThreshold = data['largeGroupThreshold'];
      result$data['largeGroupThreshold'] = (l$largeGroupThreshold as int?);
    }
    return Input$ReservationRulesInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get minAdvanceReservation => (_$data['minAdvanceReservation'] as int?);

  int? get maxAdvanceReservation => (_$data['maxAdvanceReservation'] as int?);

  int? get minPartySize => (_$data['minPartySize'] as int?);

  int? get maxPartySize => (_$data['maxPartySize'] as int?);

  String? get cancellationPolicy => (_$data['cancellationPolicy'] as String?);

  String? get noShowPolicy => (_$data['noShowPolicy'] as String?);

  bool get requiresDepositForLargeGroups =>
      (_$data['requiresDepositForLargeGroups'] as bool);

  int? get largeGroupThreshold => (_$data['largeGroupThreshold'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('minAdvanceReservation')) {
      final l$minAdvanceReservation = minAdvanceReservation;
      result$data['minAdvanceReservation'] = l$minAdvanceReservation;
    }
    if (_$data.containsKey('maxAdvanceReservation')) {
      final l$maxAdvanceReservation = maxAdvanceReservation;
      result$data['maxAdvanceReservation'] = l$maxAdvanceReservation;
    }
    if (_$data.containsKey('minPartySize')) {
      final l$minPartySize = minPartySize;
      result$data['minPartySize'] = l$minPartySize;
    }
    if (_$data.containsKey('maxPartySize')) {
      final l$maxPartySize = maxPartySize;
      result$data['maxPartySize'] = l$maxPartySize;
    }
    if (_$data.containsKey('cancellationPolicy')) {
      final l$cancellationPolicy = cancellationPolicy;
      result$data['cancellationPolicy'] = l$cancellationPolicy;
    }
    if (_$data.containsKey('noShowPolicy')) {
      final l$noShowPolicy = noShowPolicy;
      result$data['noShowPolicy'] = l$noShowPolicy;
    }
    final l$requiresDepositForLargeGroups = requiresDepositForLargeGroups;
    result$data['requiresDepositForLargeGroups'] =
        l$requiresDepositForLargeGroups;
    if (_$data.containsKey('largeGroupThreshold')) {
      final l$largeGroupThreshold = largeGroupThreshold;
      result$data['largeGroupThreshold'] = l$largeGroupThreshold;
    }
    return result$data;
  }

  CopyWith$Input$ReservationRulesInput<Input$ReservationRulesInput>
  get copyWith => CopyWith$Input$ReservationRulesInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ReservationRulesInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$minAdvanceReservation = minAdvanceReservation;
    final lOther$minAdvanceReservation = other.minAdvanceReservation;
    if (_$data.containsKey('minAdvanceReservation') !=
        other._$data.containsKey('minAdvanceReservation')) {
      return false;
    }
    if (l$minAdvanceReservation != lOther$minAdvanceReservation) {
      return false;
    }
    final l$maxAdvanceReservation = maxAdvanceReservation;
    final lOther$maxAdvanceReservation = other.maxAdvanceReservation;
    if (_$data.containsKey('maxAdvanceReservation') !=
        other._$data.containsKey('maxAdvanceReservation')) {
      return false;
    }
    if (l$maxAdvanceReservation != lOther$maxAdvanceReservation) {
      return false;
    }
    final l$minPartySize = minPartySize;
    final lOther$minPartySize = other.minPartySize;
    if (_$data.containsKey('minPartySize') !=
        other._$data.containsKey('minPartySize')) {
      return false;
    }
    if (l$minPartySize != lOther$minPartySize) {
      return false;
    }
    final l$maxPartySize = maxPartySize;
    final lOther$maxPartySize = other.maxPartySize;
    if (_$data.containsKey('maxPartySize') !=
        other._$data.containsKey('maxPartySize')) {
      return false;
    }
    if (l$maxPartySize != lOther$maxPartySize) {
      return false;
    }
    final l$cancellationPolicy = cancellationPolicy;
    final lOther$cancellationPolicy = other.cancellationPolicy;
    if (_$data.containsKey('cancellationPolicy') !=
        other._$data.containsKey('cancellationPolicy')) {
      return false;
    }
    if (l$cancellationPolicy != lOther$cancellationPolicy) {
      return false;
    }
    final l$noShowPolicy = noShowPolicy;
    final lOther$noShowPolicy = other.noShowPolicy;
    if (_$data.containsKey('noShowPolicy') !=
        other._$data.containsKey('noShowPolicy')) {
      return false;
    }
    if (l$noShowPolicy != lOther$noShowPolicy) {
      return false;
    }
    final l$requiresDepositForLargeGroups = requiresDepositForLargeGroups;
    final lOther$requiresDepositForLargeGroups =
        other.requiresDepositForLargeGroups;
    if (l$requiresDepositForLargeGroups !=
        lOther$requiresDepositForLargeGroups) {
      return false;
    }
    final l$largeGroupThreshold = largeGroupThreshold;
    final lOther$largeGroupThreshold = other.largeGroupThreshold;
    if (_$data.containsKey('largeGroupThreshold') !=
        other._$data.containsKey('largeGroupThreshold')) {
      return false;
    }
    if (l$largeGroupThreshold != lOther$largeGroupThreshold) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$minAdvanceReservation = minAdvanceReservation;
    final l$maxAdvanceReservation = maxAdvanceReservation;
    final l$minPartySize = minPartySize;
    final l$maxPartySize = maxPartySize;
    final l$cancellationPolicy = cancellationPolicy;
    final l$noShowPolicy = noShowPolicy;
    final l$requiresDepositForLargeGroups = requiresDepositForLargeGroups;
    final l$largeGroupThreshold = largeGroupThreshold;
    return Object.hashAll([
      _$data.containsKey('minAdvanceReservation')
          ? l$minAdvanceReservation
          : const {},
      _$data.containsKey('maxAdvanceReservation')
          ? l$maxAdvanceReservation
          : const {},
      _$data.containsKey('minPartySize') ? l$minPartySize : const {},
      _$data.containsKey('maxPartySize') ? l$maxPartySize : const {},
      _$data.containsKey('cancellationPolicy')
          ? l$cancellationPolicy
          : const {},
      _$data.containsKey('noShowPolicy') ? l$noShowPolicy : const {},
      l$requiresDepositForLargeGroups,
      _$data.containsKey('largeGroupThreshold')
          ? l$largeGroupThreshold
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$ReservationRulesInput<TRes> {
  factory CopyWith$Input$ReservationRulesInput(
    Input$ReservationRulesInput instance,
    TRes Function(Input$ReservationRulesInput) then,
  ) = _CopyWithImpl$Input$ReservationRulesInput;

  factory CopyWith$Input$ReservationRulesInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ReservationRulesInput;

  TRes call({
    int? minAdvanceReservation,
    int? maxAdvanceReservation,
    int? minPartySize,
    int? maxPartySize,
    String? cancellationPolicy,
    String? noShowPolicy,
    bool? requiresDepositForLargeGroups,
    int? largeGroupThreshold,
  });
}

class _CopyWithImpl$Input$ReservationRulesInput<TRes>
    implements CopyWith$Input$ReservationRulesInput<TRes> {
  _CopyWithImpl$Input$ReservationRulesInput(this._instance, this._then);

  final Input$ReservationRulesInput _instance;

  final TRes Function(Input$ReservationRulesInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? minAdvanceReservation = _undefined,
    Object? maxAdvanceReservation = _undefined,
    Object? minPartySize = _undefined,
    Object? maxPartySize = _undefined,
    Object? cancellationPolicy = _undefined,
    Object? noShowPolicy = _undefined,
    Object? requiresDepositForLargeGroups = _undefined,
    Object? largeGroupThreshold = _undefined,
  }) => _then(
    Input$ReservationRulesInput._({
      ..._instance._$data,
      if (minAdvanceReservation != _undefined)
        'minAdvanceReservation': (minAdvanceReservation as int?),
      if (maxAdvanceReservation != _undefined)
        'maxAdvanceReservation': (maxAdvanceReservation as int?),
      if (minPartySize != _undefined) 'minPartySize': (minPartySize as int?),
      if (maxPartySize != _undefined) 'maxPartySize': (maxPartySize as int?),
      if (cancellationPolicy != _undefined)
        'cancellationPolicy': (cancellationPolicy as String?),
      if (noShowPolicy != _undefined) 'noShowPolicy': (noShowPolicy as String?),
      if (requiresDepositForLargeGroups != _undefined &&
          requiresDepositForLargeGroups != null)
        'requiresDepositForLargeGroups':
            (requiresDepositForLargeGroups as bool),
      if (largeGroupThreshold != _undefined)
        'largeGroupThreshold': (largeGroupThreshold as int?),
    }),
  );
}

class _CopyWithStubImpl$Input$ReservationRulesInput<TRes>
    implements CopyWith$Input$ReservationRulesInput<TRes> {
  _CopyWithStubImpl$Input$ReservationRulesInput(this._res);

  TRes _res;

  call({
    int? minAdvanceReservation,
    int? maxAdvanceReservation,
    int? minPartySize,
    int? maxPartySize,
    String? cancellationPolicy,
    String? noShowPolicy,
    bool? requiresDepositForLargeGroups,
    int? largeGroupThreshold,
  }) => _res;
}

class Input$CreateFacilityInput {
  factory Input$CreateFacilityInput({
    required String name,
    String? description,
    required Enum$FacilityType type,
    required int capacity,
    required List<String> amenities,
    String? location,
    List<String>? images,
    dynamic? operatingHours,
    Input$BookingRulesInput? bookingRules,
    bool? requiresApproval,
    double? bookingFee,
    String? currency,
  }) => Input$CreateFacilityInput._({
    r'name': name,
    if (description != null) r'description': description,
    r'type': type,
    r'capacity': capacity,
    r'amenities': amenities,
    if (location != null) r'location': location,
    if (images != null) r'images': images,
    if (operatingHours != null) r'operatingHours': operatingHours,
    if (bookingRules != null) r'bookingRules': bookingRules,
    if (requiresApproval != null) r'requiresApproval': requiresApproval,
    if (bookingFee != null) r'bookingFee': bookingFee,
    if (currency != null) r'currency': currency,
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
    result$data['type'] = fromJson$Enum$FacilityType((l$type as String));
    final l$capacity = data['capacity'];
    result$data['capacity'] = (l$capacity as int);
    final l$amenities = data['amenities'];
    result$data['amenities'] = (l$amenities as List<dynamic>)
        .map((e) => (e as String))
        .toList();
    if (data.containsKey('location')) {
      final l$location = data['location'];
      result$data['location'] = (l$location as String?);
    }
    if (data.containsKey('images')) {
      final l$images = data['images'];
      result$data['images'] = (l$images as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('operatingHours')) {
      final l$operatingHours = data['operatingHours'];
      result$data['operatingHours'] = (l$operatingHours as dynamic?);
    }
    if (data.containsKey('bookingRules')) {
      final l$bookingRules = data['bookingRules'];
      result$data['bookingRules'] = l$bookingRules == null
          ? null
          : Input$BookingRulesInput.fromJson(
              (l$bookingRules as Map<String, dynamic>),
            );
    }
    if (data.containsKey('requiresApproval')) {
      final l$requiresApproval = data['requiresApproval'];
      result$data['requiresApproval'] = (l$requiresApproval as bool?);
    }
    if (data.containsKey('bookingFee')) {
      final l$bookingFee = data['bookingFee'];
      result$data['bookingFee'] = (l$bookingFee as num?)?.toDouble();
    }
    if (data.containsKey('currency')) {
      final l$currency = data['currency'];
      result$data['currency'] = (l$currency as String?);
    }
    return Input$CreateFacilityInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String? get description => (_$data['description'] as String?);

  Enum$FacilityType get type => (_$data['type'] as Enum$FacilityType);

  int get capacity => (_$data['capacity'] as int);

  List<String> get amenities => (_$data['amenities'] as List<String>);

  String? get location => (_$data['location'] as String?);

  List<String>? get images => (_$data['images'] as List<String>?);

  dynamic? get operatingHours => (_$data['operatingHours'] as dynamic?);

  Input$BookingRulesInput? get bookingRules =>
      (_$data['bookingRules'] as Input$BookingRulesInput?);

  bool? get requiresApproval => (_$data['requiresApproval'] as bool?);

  double? get bookingFee => (_$data['bookingFee'] as double?);

  String? get currency => (_$data['currency'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    final l$type = type;
    result$data['type'] = toJson$Enum$FacilityType(l$type);
    final l$capacity = capacity;
    result$data['capacity'] = l$capacity;
    final l$amenities = amenities;
    result$data['amenities'] = l$amenities.map((e) => e).toList();
    if (_$data.containsKey('location')) {
      final l$location = location;
      result$data['location'] = l$location;
    }
    if (_$data.containsKey('images')) {
      final l$images = images;
      result$data['images'] = l$images?.map((e) => e).toList();
    }
    if (_$data.containsKey('operatingHours')) {
      final l$operatingHours = operatingHours;
      result$data['operatingHours'] = l$operatingHours;
    }
    if (_$data.containsKey('bookingRules')) {
      final l$bookingRules = bookingRules;
      result$data['bookingRules'] = l$bookingRules?.toJson();
    }
    if (_$data.containsKey('requiresApproval')) {
      final l$requiresApproval = requiresApproval;
      result$data['requiresApproval'] = l$requiresApproval;
    }
    if (_$data.containsKey('bookingFee')) {
      final l$bookingFee = bookingFee;
      result$data['bookingFee'] = l$bookingFee;
    }
    if (_$data.containsKey('currency')) {
      final l$currency = currency;
      result$data['currency'] = l$currency;
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
    final l$location = location;
    final lOther$location = other.location;
    if (_$data.containsKey('location') !=
        other._$data.containsKey('location')) {
      return false;
    }
    if (l$location != lOther$location) {
      return false;
    }
    final l$images = images;
    final lOther$images = other.images;
    if (_$data.containsKey('images') != other._$data.containsKey('images')) {
      return false;
    }
    if (l$images != null && lOther$images != null) {
      if (l$images.length != lOther$images.length) {
        return false;
      }
      for (int i = 0; i < l$images.length; i++) {
        final l$images$entry = l$images[i];
        final lOther$images$entry = lOther$images[i];
        if (l$images$entry != lOther$images$entry) {
          return false;
        }
      }
    } else if (l$images != lOther$images) {
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
    final l$bookingRules = bookingRules;
    final lOther$bookingRules = other.bookingRules;
    if (_$data.containsKey('bookingRules') !=
        other._$data.containsKey('bookingRules')) {
      return false;
    }
    if (l$bookingRules != lOther$bookingRules) {
      return false;
    }
    final l$requiresApproval = requiresApproval;
    final lOther$requiresApproval = other.requiresApproval;
    if (_$data.containsKey('requiresApproval') !=
        other._$data.containsKey('requiresApproval')) {
      return false;
    }
    if (l$requiresApproval != lOther$requiresApproval) {
      return false;
    }
    final l$bookingFee = bookingFee;
    final lOther$bookingFee = other.bookingFee;
    if (_$data.containsKey('bookingFee') !=
        other._$data.containsKey('bookingFee')) {
      return false;
    }
    if (l$bookingFee != lOther$bookingFee) {
      return false;
    }
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (_$data.containsKey('currency') !=
        other._$data.containsKey('currency')) {
      return false;
    }
    if (l$currency != lOther$currency) {
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
    final l$location = location;
    final l$images = images;
    final l$operatingHours = operatingHours;
    final l$bookingRules = bookingRules;
    final l$requiresApproval = requiresApproval;
    final l$bookingFee = bookingFee;
    final l$currency = currency;
    return Object.hashAll([
      l$name,
      _$data.containsKey('description') ? l$description : const {},
      l$type,
      l$capacity,
      Object.hashAll(l$amenities.map((v) => v)),
      _$data.containsKey('location') ? l$location : const {},
      _$data.containsKey('images')
          ? l$images == null
                ? null
                : Object.hashAll(l$images.map((v) => v))
          : const {},
      _$data.containsKey('operatingHours') ? l$operatingHours : const {},
      _$data.containsKey('bookingRules') ? l$bookingRules : const {},
      _$data.containsKey('requiresApproval') ? l$requiresApproval : const {},
      _$data.containsKey('bookingFee') ? l$bookingFee : const {},
      _$data.containsKey('currency') ? l$currency : const {},
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
    Enum$FacilityType? type,
    int? capacity,
    List<String>? amenities,
    String? location,
    List<String>? images,
    dynamic? operatingHours,
    Input$BookingRulesInput? bookingRules,
    bool? requiresApproval,
    double? bookingFee,
    String? currency,
  });
  CopyWith$Input$BookingRulesInput<TRes> get bookingRules;
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
    Object? location = _undefined,
    Object? images = _undefined,
    Object? operatingHours = _undefined,
    Object? bookingRules = _undefined,
    Object? requiresApproval = _undefined,
    Object? bookingFee = _undefined,
    Object? currency = _undefined,
  }) => _then(
    Input$CreateFacilityInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (description != _undefined) 'description': (description as String?),
      if (type != _undefined && type != null)
        'type': (type as Enum$FacilityType),
      if (capacity != _undefined && capacity != null)
        'capacity': (capacity as int),
      if (amenities != _undefined && amenities != null)
        'amenities': (amenities as List<String>),
      if (location != _undefined) 'location': (location as String?),
      if (images != _undefined) 'images': (images as List<String>?),
      if (operatingHours != _undefined)
        'operatingHours': (operatingHours as dynamic?),
      if (bookingRules != _undefined)
        'bookingRules': (bookingRules as Input$BookingRulesInput?),
      if (requiresApproval != _undefined)
        'requiresApproval': (requiresApproval as bool?),
      if (bookingFee != _undefined) 'bookingFee': (bookingFee as double?),
      if (currency != _undefined) 'currency': (currency as String?),
    }),
  );

  CopyWith$Input$BookingRulesInput<TRes> get bookingRules {
    final local$bookingRules = _instance.bookingRules;
    return local$bookingRules == null
        ? CopyWith$Input$BookingRulesInput.stub(_then(_instance))
        : CopyWith$Input$BookingRulesInput(
            local$bookingRules,
            (e) => call(bookingRules: e),
          );
  }
}

class _CopyWithStubImpl$Input$CreateFacilityInput<TRes>
    implements CopyWith$Input$CreateFacilityInput<TRes> {
  _CopyWithStubImpl$Input$CreateFacilityInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    Enum$FacilityType? type,
    int? capacity,
    List<String>? amenities,
    String? location,
    List<String>? images,
    dynamic? operatingHours,
    Input$BookingRulesInput? bookingRules,
    bool? requiresApproval,
    double? bookingFee,
    String? currency,
  }) => _res;

  CopyWith$Input$BookingRulesInput<TRes> get bookingRules =>
      CopyWith$Input$BookingRulesInput.stub(_res);
}

class Input$UpdateFacilityInput {
  factory Input$UpdateFacilityInput({
    String? name,
    String? description,
    Enum$FacilityType? type,
    int? capacity,
    List<String>? amenities,
    String? location,
    List<String>? images,
    dynamic? operatingHours,
    Input$BookingRulesInput? bookingRules,
    bool? isActive,
    bool? requiresApproval,
    double? bookingFee,
    String? currency,
  }) => Input$UpdateFacilityInput._({
    if (name != null) r'name': name,
    if (description != null) r'description': description,
    if (type != null) r'type': type,
    if (capacity != null) r'capacity': capacity,
    if (amenities != null) r'amenities': amenities,
    if (location != null) r'location': location,
    if (images != null) r'images': images,
    if (operatingHours != null) r'operatingHours': operatingHours,
    if (bookingRules != null) r'bookingRules': bookingRules,
    if (isActive != null) r'isActive': isActive,
    if (requiresApproval != null) r'requiresApproval': requiresApproval,
    if (bookingFee != null) r'bookingFee': bookingFee,
    if (currency != null) r'currency': currency,
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
      result$data['type'] = l$type == null
          ? null
          : fromJson$Enum$FacilityType((l$type as String));
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
    if (data.containsKey('location')) {
      final l$location = data['location'];
      result$data['location'] = (l$location as String?);
    }
    if (data.containsKey('images')) {
      final l$images = data['images'];
      result$data['images'] = (l$images as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('operatingHours')) {
      final l$operatingHours = data['operatingHours'];
      result$data['operatingHours'] = (l$operatingHours as dynamic?);
    }
    if (data.containsKey('bookingRules')) {
      final l$bookingRules = data['bookingRules'];
      result$data['bookingRules'] = l$bookingRules == null
          ? null
          : Input$BookingRulesInput.fromJson(
              (l$bookingRules as Map<String, dynamic>),
            );
    }
    if (data.containsKey('isActive')) {
      final l$isActive = data['isActive'];
      result$data['isActive'] = (l$isActive as bool?);
    }
    if (data.containsKey('requiresApproval')) {
      final l$requiresApproval = data['requiresApproval'];
      result$data['requiresApproval'] = (l$requiresApproval as bool?);
    }
    if (data.containsKey('bookingFee')) {
      final l$bookingFee = data['bookingFee'];
      result$data['bookingFee'] = (l$bookingFee as num?)?.toDouble();
    }
    if (data.containsKey('currency')) {
      final l$currency = data['currency'];
      result$data['currency'] = (l$currency as String?);
    }
    return Input$UpdateFacilityInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get description => (_$data['description'] as String?);

  Enum$FacilityType? get type => (_$data['type'] as Enum$FacilityType?);

  int? get capacity => (_$data['capacity'] as int?);

  List<String>? get amenities => (_$data['amenities'] as List<String>?);

  String? get location => (_$data['location'] as String?);

  List<String>? get images => (_$data['images'] as List<String>?);

  dynamic? get operatingHours => (_$data['operatingHours'] as dynamic?);

  Input$BookingRulesInput? get bookingRules =>
      (_$data['bookingRules'] as Input$BookingRulesInput?);

  bool? get isActive => (_$data['isActive'] as bool?);

  bool? get requiresApproval => (_$data['requiresApproval'] as bool?);

  double? get bookingFee => (_$data['bookingFee'] as double?);

  String? get currency => (_$data['currency'] as String?);

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
      result$data['type'] = l$type == null
          ? null
          : toJson$Enum$FacilityType(l$type);
    }
    if (_$data.containsKey('capacity')) {
      final l$capacity = capacity;
      result$data['capacity'] = l$capacity;
    }
    if (_$data.containsKey('amenities')) {
      final l$amenities = amenities;
      result$data['amenities'] = l$amenities?.map((e) => e).toList();
    }
    if (_$data.containsKey('location')) {
      final l$location = location;
      result$data['location'] = l$location;
    }
    if (_$data.containsKey('images')) {
      final l$images = images;
      result$data['images'] = l$images?.map((e) => e).toList();
    }
    if (_$data.containsKey('operatingHours')) {
      final l$operatingHours = operatingHours;
      result$data['operatingHours'] = l$operatingHours;
    }
    if (_$data.containsKey('bookingRules')) {
      final l$bookingRules = bookingRules;
      result$data['bookingRules'] = l$bookingRules?.toJson();
    }
    if (_$data.containsKey('isActive')) {
      final l$isActive = isActive;
      result$data['isActive'] = l$isActive;
    }
    if (_$data.containsKey('requiresApproval')) {
      final l$requiresApproval = requiresApproval;
      result$data['requiresApproval'] = l$requiresApproval;
    }
    if (_$data.containsKey('bookingFee')) {
      final l$bookingFee = bookingFee;
      result$data['bookingFee'] = l$bookingFee;
    }
    if (_$data.containsKey('currency')) {
      final l$currency = currency;
      result$data['currency'] = l$currency;
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
    final l$location = location;
    final lOther$location = other.location;
    if (_$data.containsKey('location') !=
        other._$data.containsKey('location')) {
      return false;
    }
    if (l$location != lOther$location) {
      return false;
    }
    final l$images = images;
    final lOther$images = other.images;
    if (_$data.containsKey('images') != other._$data.containsKey('images')) {
      return false;
    }
    if (l$images != null && lOther$images != null) {
      if (l$images.length != lOther$images.length) {
        return false;
      }
      for (int i = 0; i < l$images.length; i++) {
        final l$images$entry = l$images[i];
        final lOther$images$entry = lOther$images[i];
        if (l$images$entry != lOther$images$entry) {
          return false;
        }
      }
    } else if (l$images != lOther$images) {
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
    final l$bookingRules = bookingRules;
    final lOther$bookingRules = other.bookingRules;
    if (_$data.containsKey('bookingRules') !=
        other._$data.containsKey('bookingRules')) {
      return false;
    }
    if (l$bookingRules != lOther$bookingRules) {
      return false;
    }
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (_$data.containsKey('isActive') !=
        other._$data.containsKey('isActive')) {
      return false;
    }
    if (l$isActive != lOther$isActive) {
      return false;
    }
    final l$requiresApproval = requiresApproval;
    final lOther$requiresApproval = other.requiresApproval;
    if (_$data.containsKey('requiresApproval') !=
        other._$data.containsKey('requiresApproval')) {
      return false;
    }
    if (l$requiresApproval != lOther$requiresApproval) {
      return false;
    }
    final l$bookingFee = bookingFee;
    final lOther$bookingFee = other.bookingFee;
    if (_$data.containsKey('bookingFee') !=
        other._$data.containsKey('bookingFee')) {
      return false;
    }
    if (l$bookingFee != lOther$bookingFee) {
      return false;
    }
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (_$data.containsKey('currency') !=
        other._$data.containsKey('currency')) {
      return false;
    }
    if (l$currency != lOther$currency) {
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
    final l$location = location;
    final l$images = images;
    final l$operatingHours = operatingHours;
    final l$bookingRules = bookingRules;
    final l$isActive = isActive;
    final l$requiresApproval = requiresApproval;
    final l$bookingFee = bookingFee;
    final l$currency = currency;
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
      _$data.containsKey('location') ? l$location : const {},
      _$data.containsKey('images')
          ? l$images == null
                ? null
                : Object.hashAll(l$images.map((v) => v))
          : const {},
      _$data.containsKey('operatingHours') ? l$operatingHours : const {},
      _$data.containsKey('bookingRules') ? l$bookingRules : const {},
      _$data.containsKey('isActive') ? l$isActive : const {},
      _$data.containsKey('requiresApproval') ? l$requiresApproval : const {},
      _$data.containsKey('bookingFee') ? l$bookingFee : const {},
      _$data.containsKey('currency') ? l$currency : const {},
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
    Enum$FacilityType? type,
    int? capacity,
    List<String>? amenities,
    String? location,
    List<String>? images,
    dynamic? operatingHours,
    Input$BookingRulesInput? bookingRules,
    bool? isActive,
    bool? requiresApproval,
    double? bookingFee,
    String? currency,
  });
  CopyWith$Input$BookingRulesInput<TRes> get bookingRules;
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
    Object? location = _undefined,
    Object? images = _undefined,
    Object? operatingHours = _undefined,
    Object? bookingRules = _undefined,
    Object? isActive = _undefined,
    Object? requiresApproval = _undefined,
    Object? bookingFee = _undefined,
    Object? currency = _undefined,
  }) => _then(
    Input$UpdateFacilityInput._({
      ..._instance._$data,
      if (name != _undefined) 'name': (name as String?),
      if (description != _undefined) 'description': (description as String?),
      if (type != _undefined) 'type': (type as Enum$FacilityType?),
      if (capacity != _undefined) 'capacity': (capacity as int?),
      if (amenities != _undefined) 'amenities': (amenities as List<String>?),
      if (location != _undefined) 'location': (location as String?),
      if (images != _undefined) 'images': (images as List<String>?),
      if (operatingHours != _undefined)
        'operatingHours': (operatingHours as dynamic?),
      if (bookingRules != _undefined)
        'bookingRules': (bookingRules as Input$BookingRulesInput?),
      if (isActive != _undefined) 'isActive': (isActive as bool?),
      if (requiresApproval != _undefined)
        'requiresApproval': (requiresApproval as bool?),
      if (bookingFee != _undefined) 'bookingFee': (bookingFee as double?),
      if (currency != _undefined) 'currency': (currency as String?),
    }),
  );

  CopyWith$Input$BookingRulesInput<TRes> get bookingRules {
    final local$bookingRules = _instance.bookingRules;
    return local$bookingRules == null
        ? CopyWith$Input$BookingRulesInput.stub(_then(_instance))
        : CopyWith$Input$BookingRulesInput(
            local$bookingRules,
            (e) => call(bookingRules: e),
          );
  }
}

class _CopyWithStubImpl$Input$UpdateFacilityInput<TRes>
    implements CopyWith$Input$UpdateFacilityInput<TRes> {
  _CopyWithStubImpl$Input$UpdateFacilityInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    Enum$FacilityType? type,
    int? capacity,
    List<String>? amenities,
    String? location,
    List<String>? images,
    dynamic? operatingHours,
    Input$BookingRulesInput? bookingRules,
    bool? isActive,
    bool? requiresApproval,
    double? bookingFee,
    String? currency,
  }) => _res;

  CopyWith$Input$BookingRulesInput<TRes> get bookingRules =>
      CopyWith$Input$BookingRulesInput.stub(_res);
}

class Input$CreateBookingInput {
  factory Input$CreateBookingInput({
    required String facilityId,
    required DateTime startTime,
    required DateTime endTime,
    String? purpose,
    int? guestCount,
    String? specialRequests,
  }) => Input$CreateBookingInput._({
    r'facilityId': facilityId,
    r'startTime': startTime,
    r'endTime': endTime,
    if (purpose != null) r'purpose': purpose,
    if (guestCount != null) r'guestCount': guestCount,
    if (specialRequests != null) r'specialRequests': specialRequests,
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
    if (data.containsKey('purpose')) {
      final l$purpose = data['purpose'];
      result$data['purpose'] = (l$purpose as String?);
    }
    if (data.containsKey('guestCount')) {
      final l$guestCount = data['guestCount'];
      result$data['guestCount'] = (l$guestCount as int?);
    }
    if (data.containsKey('specialRequests')) {
      final l$specialRequests = data['specialRequests'];
      result$data['specialRequests'] = (l$specialRequests as String?);
    }
    return Input$CreateBookingInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get facilityId => (_$data['facilityId'] as String);

  DateTime get startTime => (_$data['startTime'] as DateTime);

  DateTime get endTime => (_$data['endTime'] as DateTime);

  String? get purpose => (_$data['purpose'] as String?);

  int? get guestCount => (_$data['guestCount'] as int?);

  String? get specialRequests => (_$data['specialRequests'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$facilityId = facilityId;
    result$data['facilityId'] = l$facilityId;
    final l$startTime = startTime;
    result$data['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    result$data['endTime'] = l$endTime.toIso8601String();
    if (_$data.containsKey('purpose')) {
      final l$purpose = purpose;
      result$data['purpose'] = l$purpose;
    }
    if (_$data.containsKey('guestCount')) {
      final l$guestCount = guestCount;
      result$data['guestCount'] = l$guestCount;
    }
    if (_$data.containsKey('specialRequests')) {
      final l$specialRequests = specialRequests;
      result$data['specialRequests'] = l$specialRequests;
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
    final l$purpose = purpose;
    final lOther$purpose = other.purpose;
    if (_$data.containsKey('purpose') != other._$data.containsKey('purpose')) {
      return false;
    }
    if (l$purpose != lOther$purpose) {
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
    final l$specialRequests = specialRequests;
    final lOther$specialRequests = other.specialRequests;
    if (_$data.containsKey('specialRequests') !=
        other._$data.containsKey('specialRequests')) {
      return false;
    }
    if (l$specialRequests != lOther$specialRequests) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$facilityId = facilityId;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$purpose = purpose;
    final l$guestCount = guestCount;
    final l$specialRequests = specialRequests;
    return Object.hashAll([
      l$facilityId,
      l$startTime,
      l$endTime,
      _$data.containsKey('purpose') ? l$purpose : const {},
      _$data.containsKey('guestCount') ? l$guestCount : const {},
      _$data.containsKey('specialRequests') ? l$specialRequests : const {},
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
    String? purpose,
    int? guestCount,
    String? specialRequests,
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
    Object? purpose = _undefined,
    Object? guestCount = _undefined,
    Object? specialRequests = _undefined,
  }) => _then(
    Input$CreateBookingInput._({
      ..._instance._$data,
      if (facilityId != _undefined && facilityId != null)
        'facilityId': (facilityId as String),
      if (startTime != _undefined && startTime != null)
        'startTime': (startTime as DateTime),
      if (endTime != _undefined && endTime != null)
        'endTime': (endTime as DateTime),
      if (purpose != _undefined) 'purpose': (purpose as String?),
      if (guestCount != _undefined) 'guestCount': (guestCount as int?),
      if (specialRequests != _undefined)
        'specialRequests': (specialRequests as String?),
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
    String? purpose,
    int? guestCount,
    String? specialRequests,
  }) => _res;
}

class Input$UpdateBookingInput {
  factory Input$UpdateBookingInput({
    DateTime? startTime,
    DateTime? endTime,
    String? purpose,
    int? guestCount,
    String? specialRequests,
  }) => Input$UpdateBookingInput._({
    if (startTime != null) r'startTime': startTime,
    if (endTime != null) r'endTime': endTime,
    if (purpose != null) r'purpose': purpose,
    if (guestCount != null) r'guestCount': guestCount,
    if (specialRequests != null) r'specialRequests': specialRequests,
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
    if (data.containsKey('purpose')) {
      final l$purpose = data['purpose'];
      result$data['purpose'] = (l$purpose as String?);
    }
    if (data.containsKey('guestCount')) {
      final l$guestCount = data['guestCount'];
      result$data['guestCount'] = (l$guestCount as int?);
    }
    if (data.containsKey('specialRequests')) {
      final l$specialRequests = data['specialRequests'];
      result$data['specialRequests'] = (l$specialRequests as String?);
    }
    return Input$UpdateBookingInput._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime? get startTime => (_$data['startTime'] as DateTime?);

  DateTime? get endTime => (_$data['endTime'] as DateTime?);

  String? get purpose => (_$data['purpose'] as String?);

  int? get guestCount => (_$data['guestCount'] as int?);

  String? get specialRequests => (_$data['specialRequests'] as String?);

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
    if (_$data.containsKey('purpose')) {
      final l$purpose = purpose;
      result$data['purpose'] = l$purpose;
    }
    if (_$data.containsKey('guestCount')) {
      final l$guestCount = guestCount;
      result$data['guestCount'] = l$guestCount;
    }
    if (_$data.containsKey('specialRequests')) {
      final l$specialRequests = specialRequests;
      result$data['specialRequests'] = l$specialRequests;
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
    final l$purpose = purpose;
    final lOther$purpose = other.purpose;
    if (_$data.containsKey('purpose') != other._$data.containsKey('purpose')) {
      return false;
    }
    if (l$purpose != lOther$purpose) {
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
    final l$specialRequests = specialRequests;
    final lOther$specialRequests = other.specialRequests;
    if (_$data.containsKey('specialRequests') !=
        other._$data.containsKey('specialRequests')) {
      return false;
    }
    if (l$specialRequests != lOther$specialRequests) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$purpose = purpose;
    final l$guestCount = guestCount;
    final l$specialRequests = specialRequests;
    return Object.hashAll([
      _$data.containsKey('startTime') ? l$startTime : const {},
      _$data.containsKey('endTime') ? l$endTime : const {},
      _$data.containsKey('purpose') ? l$purpose : const {},
      _$data.containsKey('guestCount') ? l$guestCount : const {},
      _$data.containsKey('specialRequests') ? l$specialRequests : const {},
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
    String? purpose,
    int? guestCount,
    String? specialRequests,
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
    Object? purpose = _undefined,
    Object? guestCount = _undefined,
    Object? specialRequests = _undefined,
  }) => _then(
    Input$UpdateBookingInput._({
      ..._instance._$data,
      if (startTime != _undefined) 'startTime': (startTime as DateTime?),
      if (endTime != _undefined) 'endTime': (endTime as DateTime?),
      if (purpose != _undefined) 'purpose': (purpose as String?),
      if (guestCount != _undefined) 'guestCount': (guestCount as int?),
      if (specialRequests != _undefined)
        'specialRequests': (specialRequests as String?),
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
    String? purpose,
    int? guestCount,
    String? specialRequests,
  }) => _res;
}

class Input$CreateRestaurantInput {
  factory Input$CreateRestaurantInput({
    required String name,
    String? description,
    required List<String> cuisine,
    String? dressCode,
    required int capacity,
    List<String>? images,
    dynamic? openingHours,
    String? menuURL,
    String? contactPhone,
    String? contactEmail,
    Input$ReservationRulesInput? reservationRules,
    bool? requiresReservation,
  }) => Input$CreateRestaurantInput._({
    r'name': name,
    if (description != null) r'description': description,
    r'cuisine': cuisine,
    if (dressCode != null) r'dressCode': dressCode,
    r'capacity': capacity,
    if (images != null) r'images': images,
    if (openingHours != null) r'openingHours': openingHours,
    if (menuURL != null) r'menuURL': menuURL,
    if (contactPhone != null) r'contactPhone': contactPhone,
    if (contactEmail != null) r'contactEmail': contactEmail,
    if (reservationRules != null) r'reservationRules': reservationRules,
    if (requiresReservation != null)
      r'requiresReservation': requiresReservation,
  });

  Input$CreateRestaurantInput._(this._$data);

  factory Input$CreateRestaurantInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    final l$cuisine = data['cuisine'];
    result$data['cuisine'] = (l$cuisine as List<dynamic>)
        .map((e) => (e as String))
        .toList();
    if (data.containsKey('dressCode')) {
      final l$dressCode = data['dressCode'];
      result$data['dressCode'] = (l$dressCode as String?);
    }
    final l$capacity = data['capacity'];
    result$data['capacity'] = (l$capacity as int);
    if (data.containsKey('images')) {
      final l$images = data['images'];
      result$data['images'] = (l$images as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('openingHours')) {
      final l$openingHours = data['openingHours'];
      result$data['openingHours'] = (l$openingHours as dynamic?);
    }
    if (data.containsKey('menuURL')) {
      final l$menuURL = data['menuURL'];
      result$data['menuURL'] = (l$menuURL as String?);
    }
    if (data.containsKey('contactPhone')) {
      final l$contactPhone = data['contactPhone'];
      result$data['contactPhone'] = (l$contactPhone as String?);
    }
    if (data.containsKey('contactEmail')) {
      final l$contactEmail = data['contactEmail'];
      result$data['contactEmail'] = (l$contactEmail as String?);
    }
    if (data.containsKey('reservationRules')) {
      final l$reservationRules = data['reservationRules'];
      result$data['reservationRules'] = l$reservationRules == null
          ? null
          : Input$ReservationRulesInput.fromJson(
              (l$reservationRules as Map<String, dynamic>),
            );
    }
    if (data.containsKey('requiresReservation')) {
      final l$requiresReservation = data['requiresReservation'];
      result$data['requiresReservation'] = (l$requiresReservation as bool?);
    }
    return Input$CreateRestaurantInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String? get description => (_$data['description'] as String?);

  List<String> get cuisine => (_$data['cuisine'] as List<String>);

  String? get dressCode => (_$data['dressCode'] as String?);

  int get capacity => (_$data['capacity'] as int);

  List<String>? get images => (_$data['images'] as List<String>?);

  dynamic? get openingHours => (_$data['openingHours'] as dynamic?);

  String? get menuURL => (_$data['menuURL'] as String?);

  String? get contactPhone => (_$data['contactPhone'] as String?);

  String? get contactEmail => (_$data['contactEmail'] as String?);

  Input$ReservationRulesInput? get reservationRules =>
      (_$data['reservationRules'] as Input$ReservationRulesInput?);

  bool? get requiresReservation => (_$data['requiresReservation'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    final l$cuisine = cuisine;
    result$data['cuisine'] = l$cuisine.map((e) => e).toList();
    if (_$data.containsKey('dressCode')) {
      final l$dressCode = dressCode;
      result$data['dressCode'] = l$dressCode;
    }
    final l$capacity = capacity;
    result$data['capacity'] = l$capacity;
    if (_$data.containsKey('images')) {
      final l$images = images;
      result$data['images'] = l$images?.map((e) => e).toList();
    }
    if (_$data.containsKey('openingHours')) {
      final l$openingHours = openingHours;
      result$data['openingHours'] = l$openingHours;
    }
    if (_$data.containsKey('menuURL')) {
      final l$menuURL = menuURL;
      result$data['menuURL'] = l$menuURL;
    }
    if (_$data.containsKey('contactPhone')) {
      final l$contactPhone = contactPhone;
      result$data['contactPhone'] = l$contactPhone;
    }
    if (_$data.containsKey('contactEmail')) {
      final l$contactEmail = contactEmail;
      result$data['contactEmail'] = l$contactEmail;
    }
    if (_$data.containsKey('reservationRules')) {
      final l$reservationRules = reservationRules;
      result$data['reservationRules'] = l$reservationRules?.toJson();
    }
    if (_$data.containsKey('requiresReservation')) {
      final l$requiresReservation = requiresReservation;
      result$data['requiresReservation'] = l$requiresReservation;
    }
    return result$data;
  }

  CopyWith$Input$CreateRestaurantInput<Input$CreateRestaurantInput>
  get copyWith => CopyWith$Input$CreateRestaurantInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateRestaurantInput ||
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
    final l$cuisine = cuisine;
    final lOther$cuisine = other.cuisine;
    if (l$cuisine.length != lOther$cuisine.length) {
      return false;
    }
    for (int i = 0; i < l$cuisine.length; i++) {
      final l$cuisine$entry = l$cuisine[i];
      final lOther$cuisine$entry = lOther$cuisine[i];
      if (l$cuisine$entry != lOther$cuisine$entry) {
        return false;
      }
    }
    final l$dressCode = dressCode;
    final lOther$dressCode = other.dressCode;
    if (_$data.containsKey('dressCode') !=
        other._$data.containsKey('dressCode')) {
      return false;
    }
    if (l$dressCode != lOther$dressCode) {
      return false;
    }
    final l$capacity = capacity;
    final lOther$capacity = other.capacity;
    if (l$capacity != lOther$capacity) {
      return false;
    }
    final l$images = images;
    final lOther$images = other.images;
    if (_$data.containsKey('images') != other._$data.containsKey('images')) {
      return false;
    }
    if (l$images != null && lOther$images != null) {
      if (l$images.length != lOther$images.length) {
        return false;
      }
      for (int i = 0; i < l$images.length; i++) {
        final l$images$entry = l$images[i];
        final lOther$images$entry = lOther$images[i];
        if (l$images$entry != lOther$images$entry) {
          return false;
        }
      }
    } else if (l$images != lOther$images) {
      return false;
    }
    final l$openingHours = openingHours;
    final lOther$openingHours = other.openingHours;
    if (_$data.containsKey('openingHours') !=
        other._$data.containsKey('openingHours')) {
      return false;
    }
    if (l$openingHours != lOther$openingHours) {
      return false;
    }
    final l$menuURL = menuURL;
    final lOther$menuURL = other.menuURL;
    if (_$data.containsKey('menuURL') != other._$data.containsKey('menuURL')) {
      return false;
    }
    if (l$menuURL != lOther$menuURL) {
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
    final l$contactEmail = contactEmail;
    final lOther$contactEmail = other.contactEmail;
    if (_$data.containsKey('contactEmail') !=
        other._$data.containsKey('contactEmail')) {
      return false;
    }
    if (l$contactEmail != lOther$contactEmail) {
      return false;
    }
    final l$reservationRules = reservationRules;
    final lOther$reservationRules = other.reservationRules;
    if (_$data.containsKey('reservationRules') !=
        other._$data.containsKey('reservationRules')) {
      return false;
    }
    if (l$reservationRules != lOther$reservationRules) {
      return false;
    }
    final l$requiresReservation = requiresReservation;
    final lOther$requiresReservation = other.requiresReservation;
    if (_$data.containsKey('requiresReservation') !=
        other._$data.containsKey('requiresReservation')) {
      return false;
    }
    if (l$requiresReservation != lOther$requiresReservation) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$cuisine = cuisine;
    final l$dressCode = dressCode;
    final l$capacity = capacity;
    final l$images = images;
    final l$openingHours = openingHours;
    final l$menuURL = menuURL;
    final l$contactPhone = contactPhone;
    final l$contactEmail = contactEmail;
    final l$reservationRules = reservationRules;
    final l$requiresReservation = requiresReservation;
    return Object.hashAll([
      l$name,
      _$data.containsKey('description') ? l$description : const {},
      Object.hashAll(l$cuisine.map((v) => v)),
      _$data.containsKey('dressCode') ? l$dressCode : const {},
      l$capacity,
      _$data.containsKey('images')
          ? l$images == null
                ? null
                : Object.hashAll(l$images.map((v) => v))
          : const {},
      _$data.containsKey('openingHours') ? l$openingHours : const {},
      _$data.containsKey('menuURL') ? l$menuURL : const {},
      _$data.containsKey('contactPhone') ? l$contactPhone : const {},
      _$data.containsKey('contactEmail') ? l$contactEmail : const {},
      _$data.containsKey('reservationRules') ? l$reservationRules : const {},
      _$data.containsKey('requiresReservation')
          ? l$requiresReservation
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateRestaurantInput<TRes> {
  factory CopyWith$Input$CreateRestaurantInput(
    Input$CreateRestaurantInput instance,
    TRes Function(Input$CreateRestaurantInput) then,
  ) = _CopyWithImpl$Input$CreateRestaurantInput;

  factory CopyWith$Input$CreateRestaurantInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateRestaurantInput;

  TRes call({
    String? name,
    String? description,
    List<String>? cuisine,
    String? dressCode,
    int? capacity,
    List<String>? images,
    dynamic? openingHours,
    String? menuURL,
    String? contactPhone,
    String? contactEmail,
    Input$ReservationRulesInput? reservationRules,
    bool? requiresReservation,
  });
  CopyWith$Input$ReservationRulesInput<TRes> get reservationRules;
}

class _CopyWithImpl$Input$CreateRestaurantInput<TRes>
    implements CopyWith$Input$CreateRestaurantInput<TRes> {
  _CopyWithImpl$Input$CreateRestaurantInput(this._instance, this._then);

  final Input$CreateRestaurantInput _instance;

  final TRes Function(Input$CreateRestaurantInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? cuisine = _undefined,
    Object? dressCode = _undefined,
    Object? capacity = _undefined,
    Object? images = _undefined,
    Object? openingHours = _undefined,
    Object? menuURL = _undefined,
    Object? contactPhone = _undefined,
    Object? contactEmail = _undefined,
    Object? reservationRules = _undefined,
    Object? requiresReservation = _undefined,
  }) => _then(
    Input$CreateRestaurantInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (description != _undefined) 'description': (description as String?),
      if (cuisine != _undefined && cuisine != null)
        'cuisine': (cuisine as List<String>),
      if (dressCode != _undefined) 'dressCode': (dressCode as String?),
      if (capacity != _undefined && capacity != null)
        'capacity': (capacity as int),
      if (images != _undefined) 'images': (images as List<String>?),
      if (openingHours != _undefined)
        'openingHours': (openingHours as dynamic?),
      if (menuURL != _undefined) 'menuURL': (menuURL as String?),
      if (contactPhone != _undefined) 'contactPhone': (contactPhone as String?),
      if (contactEmail != _undefined) 'contactEmail': (contactEmail as String?),
      if (reservationRules != _undefined)
        'reservationRules': (reservationRules as Input$ReservationRulesInput?),
      if (requiresReservation != _undefined)
        'requiresReservation': (requiresReservation as bool?),
    }),
  );

  CopyWith$Input$ReservationRulesInput<TRes> get reservationRules {
    final local$reservationRules = _instance.reservationRules;
    return local$reservationRules == null
        ? CopyWith$Input$ReservationRulesInput.stub(_then(_instance))
        : CopyWith$Input$ReservationRulesInput(
            local$reservationRules,
            (e) => call(reservationRules: e),
          );
  }
}

class _CopyWithStubImpl$Input$CreateRestaurantInput<TRes>
    implements CopyWith$Input$CreateRestaurantInput<TRes> {
  _CopyWithStubImpl$Input$CreateRestaurantInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    List<String>? cuisine,
    String? dressCode,
    int? capacity,
    List<String>? images,
    dynamic? openingHours,
    String? menuURL,
    String? contactPhone,
    String? contactEmail,
    Input$ReservationRulesInput? reservationRules,
    bool? requiresReservation,
  }) => _res;

  CopyWith$Input$ReservationRulesInput<TRes> get reservationRules =>
      CopyWith$Input$ReservationRulesInput.stub(_res);
}

class Input$UpdateRestaurantInput {
  factory Input$UpdateRestaurantInput({
    String? name,
    String? description,
    List<String>? cuisine,
    String? dressCode,
    int? capacity,
    List<String>? images,
    dynamic? openingHours,
    String? menuURL,
    String? contactPhone,
    String? contactEmail,
    Input$ReservationRulesInput? reservationRules,
    bool? isActive,
    bool? requiresReservation,
  }) => Input$UpdateRestaurantInput._({
    if (name != null) r'name': name,
    if (description != null) r'description': description,
    if (cuisine != null) r'cuisine': cuisine,
    if (dressCode != null) r'dressCode': dressCode,
    if (capacity != null) r'capacity': capacity,
    if (images != null) r'images': images,
    if (openingHours != null) r'openingHours': openingHours,
    if (menuURL != null) r'menuURL': menuURL,
    if (contactPhone != null) r'contactPhone': contactPhone,
    if (contactEmail != null) r'contactEmail': contactEmail,
    if (reservationRules != null) r'reservationRules': reservationRules,
    if (isActive != null) r'isActive': isActive,
    if (requiresReservation != null)
      r'requiresReservation': requiresReservation,
  });

  Input$UpdateRestaurantInput._(this._$data);

  factory Input$UpdateRestaurantInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('cuisine')) {
      final l$cuisine = data['cuisine'];
      result$data['cuisine'] = (l$cuisine as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('dressCode')) {
      final l$dressCode = data['dressCode'];
      result$data['dressCode'] = (l$dressCode as String?);
    }
    if (data.containsKey('capacity')) {
      final l$capacity = data['capacity'];
      result$data['capacity'] = (l$capacity as int?);
    }
    if (data.containsKey('images')) {
      final l$images = data['images'];
      result$data['images'] = (l$images as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('openingHours')) {
      final l$openingHours = data['openingHours'];
      result$data['openingHours'] = (l$openingHours as dynamic?);
    }
    if (data.containsKey('menuURL')) {
      final l$menuURL = data['menuURL'];
      result$data['menuURL'] = (l$menuURL as String?);
    }
    if (data.containsKey('contactPhone')) {
      final l$contactPhone = data['contactPhone'];
      result$data['contactPhone'] = (l$contactPhone as String?);
    }
    if (data.containsKey('contactEmail')) {
      final l$contactEmail = data['contactEmail'];
      result$data['contactEmail'] = (l$contactEmail as String?);
    }
    if (data.containsKey('reservationRules')) {
      final l$reservationRules = data['reservationRules'];
      result$data['reservationRules'] = l$reservationRules == null
          ? null
          : Input$ReservationRulesInput.fromJson(
              (l$reservationRules as Map<String, dynamic>),
            );
    }
    if (data.containsKey('isActive')) {
      final l$isActive = data['isActive'];
      result$data['isActive'] = (l$isActive as bool?);
    }
    if (data.containsKey('requiresReservation')) {
      final l$requiresReservation = data['requiresReservation'];
      result$data['requiresReservation'] = (l$requiresReservation as bool?);
    }
    return Input$UpdateRestaurantInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get description => (_$data['description'] as String?);

  List<String>? get cuisine => (_$data['cuisine'] as List<String>?);

  String? get dressCode => (_$data['dressCode'] as String?);

  int? get capacity => (_$data['capacity'] as int?);

  List<String>? get images => (_$data['images'] as List<String>?);

  dynamic? get openingHours => (_$data['openingHours'] as dynamic?);

  String? get menuURL => (_$data['menuURL'] as String?);

  String? get contactPhone => (_$data['contactPhone'] as String?);

  String? get contactEmail => (_$data['contactEmail'] as String?);

  Input$ReservationRulesInput? get reservationRules =>
      (_$data['reservationRules'] as Input$ReservationRulesInput?);

  bool? get isActive => (_$data['isActive'] as bool?);

  bool? get requiresReservation => (_$data['requiresReservation'] as bool?);

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
    if (_$data.containsKey('cuisine')) {
      final l$cuisine = cuisine;
      result$data['cuisine'] = l$cuisine?.map((e) => e).toList();
    }
    if (_$data.containsKey('dressCode')) {
      final l$dressCode = dressCode;
      result$data['dressCode'] = l$dressCode;
    }
    if (_$data.containsKey('capacity')) {
      final l$capacity = capacity;
      result$data['capacity'] = l$capacity;
    }
    if (_$data.containsKey('images')) {
      final l$images = images;
      result$data['images'] = l$images?.map((e) => e).toList();
    }
    if (_$data.containsKey('openingHours')) {
      final l$openingHours = openingHours;
      result$data['openingHours'] = l$openingHours;
    }
    if (_$data.containsKey('menuURL')) {
      final l$menuURL = menuURL;
      result$data['menuURL'] = l$menuURL;
    }
    if (_$data.containsKey('contactPhone')) {
      final l$contactPhone = contactPhone;
      result$data['contactPhone'] = l$contactPhone;
    }
    if (_$data.containsKey('contactEmail')) {
      final l$contactEmail = contactEmail;
      result$data['contactEmail'] = l$contactEmail;
    }
    if (_$data.containsKey('reservationRules')) {
      final l$reservationRules = reservationRules;
      result$data['reservationRules'] = l$reservationRules?.toJson();
    }
    if (_$data.containsKey('isActive')) {
      final l$isActive = isActive;
      result$data['isActive'] = l$isActive;
    }
    if (_$data.containsKey('requiresReservation')) {
      final l$requiresReservation = requiresReservation;
      result$data['requiresReservation'] = l$requiresReservation;
    }
    return result$data;
  }

  CopyWith$Input$UpdateRestaurantInput<Input$UpdateRestaurantInput>
  get copyWith => CopyWith$Input$UpdateRestaurantInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateRestaurantInput ||
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
    final l$cuisine = cuisine;
    final lOther$cuisine = other.cuisine;
    if (_$data.containsKey('cuisine') != other._$data.containsKey('cuisine')) {
      return false;
    }
    if (l$cuisine != null && lOther$cuisine != null) {
      if (l$cuisine.length != lOther$cuisine.length) {
        return false;
      }
      for (int i = 0; i < l$cuisine.length; i++) {
        final l$cuisine$entry = l$cuisine[i];
        final lOther$cuisine$entry = lOther$cuisine[i];
        if (l$cuisine$entry != lOther$cuisine$entry) {
          return false;
        }
      }
    } else if (l$cuisine != lOther$cuisine) {
      return false;
    }
    final l$dressCode = dressCode;
    final lOther$dressCode = other.dressCode;
    if (_$data.containsKey('dressCode') !=
        other._$data.containsKey('dressCode')) {
      return false;
    }
    if (l$dressCode != lOther$dressCode) {
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
    final l$images = images;
    final lOther$images = other.images;
    if (_$data.containsKey('images') != other._$data.containsKey('images')) {
      return false;
    }
    if (l$images != null && lOther$images != null) {
      if (l$images.length != lOther$images.length) {
        return false;
      }
      for (int i = 0; i < l$images.length; i++) {
        final l$images$entry = l$images[i];
        final lOther$images$entry = lOther$images[i];
        if (l$images$entry != lOther$images$entry) {
          return false;
        }
      }
    } else if (l$images != lOther$images) {
      return false;
    }
    final l$openingHours = openingHours;
    final lOther$openingHours = other.openingHours;
    if (_$data.containsKey('openingHours') !=
        other._$data.containsKey('openingHours')) {
      return false;
    }
    if (l$openingHours != lOther$openingHours) {
      return false;
    }
    final l$menuURL = menuURL;
    final lOther$menuURL = other.menuURL;
    if (_$data.containsKey('menuURL') != other._$data.containsKey('menuURL')) {
      return false;
    }
    if (l$menuURL != lOther$menuURL) {
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
    final l$contactEmail = contactEmail;
    final lOther$contactEmail = other.contactEmail;
    if (_$data.containsKey('contactEmail') !=
        other._$data.containsKey('contactEmail')) {
      return false;
    }
    if (l$contactEmail != lOther$contactEmail) {
      return false;
    }
    final l$reservationRules = reservationRules;
    final lOther$reservationRules = other.reservationRules;
    if (_$data.containsKey('reservationRules') !=
        other._$data.containsKey('reservationRules')) {
      return false;
    }
    if (l$reservationRules != lOther$reservationRules) {
      return false;
    }
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (_$data.containsKey('isActive') !=
        other._$data.containsKey('isActive')) {
      return false;
    }
    if (l$isActive != lOther$isActive) {
      return false;
    }
    final l$requiresReservation = requiresReservation;
    final lOther$requiresReservation = other.requiresReservation;
    if (_$data.containsKey('requiresReservation') !=
        other._$data.containsKey('requiresReservation')) {
      return false;
    }
    if (l$requiresReservation != lOther$requiresReservation) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$cuisine = cuisine;
    final l$dressCode = dressCode;
    final l$capacity = capacity;
    final l$images = images;
    final l$openingHours = openingHours;
    final l$menuURL = menuURL;
    final l$contactPhone = contactPhone;
    final l$contactEmail = contactEmail;
    final l$reservationRules = reservationRules;
    final l$isActive = isActive;
    final l$requiresReservation = requiresReservation;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('cuisine')
          ? l$cuisine == null
                ? null
                : Object.hashAll(l$cuisine.map((v) => v))
          : const {},
      _$data.containsKey('dressCode') ? l$dressCode : const {},
      _$data.containsKey('capacity') ? l$capacity : const {},
      _$data.containsKey('images')
          ? l$images == null
                ? null
                : Object.hashAll(l$images.map((v) => v))
          : const {},
      _$data.containsKey('openingHours') ? l$openingHours : const {},
      _$data.containsKey('menuURL') ? l$menuURL : const {},
      _$data.containsKey('contactPhone') ? l$contactPhone : const {},
      _$data.containsKey('contactEmail') ? l$contactEmail : const {},
      _$data.containsKey('reservationRules') ? l$reservationRules : const {},
      _$data.containsKey('isActive') ? l$isActive : const {},
      _$data.containsKey('requiresReservation')
          ? l$requiresReservation
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateRestaurantInput<TRes> {
  factory CopyWith$Input$UpdateRestaurantInput(
    Input$UpdateRestaurantInput instance,
    TRes Function(Input$UpdateRestaurantInput) then,
  ) = _CopyWithImpl$Input$UpdateRestaurantInput;

  factory CopyWith$Input$UpdateRestaurantInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateRestaurantInput;

  TRes call({
    String? name,
    String? description,
    List<String>? cuisine,
    String? dressCode,
    int? capacity,
    List<String>? images,
    dynamic? openingHours,
    String? menuURL,
    String? contactPhone,
    String? contactEmail,
    Input$ReservationRulesInput? reservationRules,
    bool? isActive,
    bool? requiresReservation,
  });
  CopyWith$Input$ReservationRulesInput<TRes> get reservationRules;
}

class _CopyWithImpl$Input$UpdateRestaurantInput<TRes>
    implements CopyWith$Input$UpdateRestaurantInput<TRes> {
  _CopyWithImpl$Input$UpdateRestaurantInput(this._instance, this._then);

  final Input$UpdateRestaurantInput _instance;

  final TRes Function(Input$UpdateRestaurantInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? cuisine = _undefined,
    Object? dressCode = _undefined,
    Object? capacity = _undefined,
    Object? images = _undefined,
    Object? openingHours = _undefined,
    Object? menuURL = _undefined,
    Object? contactPhone = _undefined,
    Object? contactEmail = _undefined,
    Object? reservationRules = _undefined,
    Object? isActive = _undefined,
    Object? requiresReservation = _undefined,
  }) => _then(
    Input$UpdateRestaurantInput._({
      ..._instance._$data,
      if (name != _undefined) 'name': (name as String?),
      if (description != _undefined) 'description': (description as String?),
      if (cuisine != _undefined) 'cuisine': (cuisine as List<String>?),
      if (dressCode != _undefined) 'dressCode': (dressCode as String?),
      if (capacity != _undefined) 'capacity': (capacity as int?),
      if (images != _undefined) 'images': (images as List<String>?),
      if (openingHours != _undefined)
        'openingHours': (openingHours as dynamic?),
      if (menuURL != _undefined) 'menuURL': (menuURL as String?),
      if (contactPhone != _undefined) 'contactPhone': (contactPhone as String?),
      if (contactEmail != _undefined) 'contactEmail': (contactEmail as String?),
      if (reservationRules != _undefined)
        'reservationRules': (reservationRules as Input$ReservationRulesInput?),
      if (isActive != _undefined) 'isActive': (isActive as bool?),
      if (requiresReservation != _undefined)
        'requiresReservation': (requiresReservation as bool?),
    }),
  );

  CopyWith$Input$ReservationRulesInput<TRes> get reservationRules {
    final local$reservationRules = _instance.reservationRules;
    return local$reservationRules == null
        ? CopyWith$Input$ReservationRulesInput.stub(_then(_instance))
        : CopyWith$Input$ReservationRulesInput(
            local$reservationRules,
            (e) => call(reservationRules: e),
          );
  }
}

class _CopyWithStubImpl$Input$UpdateRestaurantInput<TRes>
    implements CopyWith$Input$UpdateRestaurantInput<TRes> {
  _CopyWithStubImpl$Input$UpdateRestaurantInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    List<String>? cuisine,
    String? dressCode,
    int? capacity,
    List<String>? images,
    dynamic? openingHours,
    String? menuURL,
    String? contactPhone,
    String? contactEmail,
    Input$ReservationRulesInput? reservationRules,
    bool? isActive,
    bool? requiresReservation,
  }) => _res;

  CopyWith$Input$ReservationRulesInput<TRes> get reservationRules =>
      CopyWith$Input$ReservationRulesInput.stub(_res);
}

class Input$CreateReservationInput {
  factory Input$CreateReservationInput({
    required String restaurantId,
    required DateTime reservationTime,
    required int partySize,
    String? specialRequests,
    List<String>? dietaryRestrictions,
    String? seatingPreference,
  }) => Input$CreateReservationInput._({
    r'restaurantId': restaurantId,
    r'reservationTime': reservationTime,
    r'partySize': partySize,
    if (specialRequests != null) r'specialRequests': specialRequests,
    if (dietaryRestrictions != null)
      r'dietaryRestrictions': dietaryRestrictions,
    if (seatingPreference != null) r'seatingPreference': seatingPreference,
  });

  Input$CreateReservationInput._(this._$data);

  factory Input$CreateReservationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurantId = data['restaurantId'];
    result$data['restaurantId'] = (l$restaurantId as String);
    final l$reservationTime = data['reservationTime'];
    result$data['reservationTime'] = DateTime.parse(
      (l$reservationTime as String),
    );
    final l$partySize = data['partySize'];
    result$data['partySize'] = (l$partySize as int);
    if (data.containsKey('specialRequests')) {
      final l$specialRequests = data['specialRequests'];
      result$data['specialRequests'] = (l$specialRequests as String?);
    }
    if (data.containsKey('dietaryRestrictions')) {
      final l$dietaryRestrictions = data['dietaryRestrictions'];
      result$data['dietaryRestrictions'] =
          (l$dietaryRestrictions as List<dynamic>?)
              ?.map((e) => (e as String))
              .toList();
    }
    if (data.containsKey('seatingPreference')) {
      final l$seatingPreference = data['seatingPreference'];
      result$data['seatingPreference'] = (l$seatingPreference as String?);
    }
    return Input$CreateReservationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get restaurantId => (_$data['restaurantId'] as String);

  DateTime get reservationTime => (_$data['reservationTime'] as DateTime);

  int get partySize => (_$data['partySize'] as int);

  String? get specialRequests => (_$data['specialRequests'] as String?);

  List<String>? get dietaryRestrictions =>
      (_$data['dietaryRestrictions'] as List<String>?);

  String? get seatingPreference => (_$data['seatingPreference'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurantId = restaurantId;
    result$data['restaurantId'] = l$restaurantId;
    final l$reservationTime = reservationTime;
    result$data['reservationTime'] = l$reservationTime.toIso8601String();
    final l$partySize = partySize;
    result$data['partySize'] = l$partySize;
    if (_$data.containsKey('specialRequests')) {
      final l$specialRequests = specialRequests;
      result$data['specialRequests'] = l$specialRequests;
    }
    if (_$data.containsKey('dietaryRestrictions')) {
      final l$dietaryRestrictions = dietaryRestrictions;
      result$data['dietaryRestrictions'] = l$dietaryRestrictions
          ?.map((e) => e)
          .toList();
    }
    if (_$data.containsKey('seatingPreference')) {
      final l$seatingPreference = seatingPreference;
      result$data['seatingPreference'] = l$seatingPreference;
    }
    return result$data;
  }

  CopyWith$Input$CreateReservationInput<Input$CreateReservationInput>
  get copyWith => CopyWith$Input$CreateReservationInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateReservationInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurantId = restaurantId;
    final lOther$restaurantId = other.restaurantId;
    if (l$restaurantId != lOther$restaurantId) {
      return false;
    }
    final l$reservationTime = reservationTime;
    final lOther$reservationTime = other.reservationTime;
    if (l$reservationTime != lOther$reservationTime) {
      return false;
    }
    final l$partySize = partySize;
    final lOther$partySize = other.partySize;
    if (l$partySize != lOther$partySize) {
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
    final l$seatingPreference = seatingPreference;
    final lOther$seatingPreference = other.seatingPreference;
    if (_$data.containsKey('seatingPreference') !=
        other._$data.containsKey('seatingPreference')) {
      return false;
    }
    if (l$seatingPreference != lOther$seatingPreference) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restaurantId = restaurantId;
    final l$reservationTime = reservationTime;
    final l$partySize = partySize;
    final l$specialRequests = specialRequests;
    final l$dietaryRestrictions = dietaryRestrictions;
    final l$seatingPreference = seatingPreference;
    return Object.hashAll([
      l$restaurantId,
      l$reservationTime,
      l$partySize,
      _$data.containsKey('specialRequests') ? l$specialRequests : const {},
      _$data.containsKey('dietaryRestrictions')
          ? l$dietaryRestrictions == null
                ? null
                : Object.hashAll(l$dietaryRestrictions.map((v) => v))
          : const {},
      _$data.containsKey('seatingPreference') ? l$seatingPreference : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateReservationInput<TRes> {
  factory CopyWith$Input$CreateReservationInput(
    Input$CreateReservationInput instance,
    TRes Function(Input$CreateReservationInput) then,
  ) = _CopyWithImpl$Input$CreateReservationInput;

  factory CopyWith$Input$CreateReservationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateReservationInput;

  TRes call({
    String? restaurantId,
    DateTime? reservationTime,
    int? partySize,
    String? specialRequests,
    List<String>? dietaryRestrictions,
    String? seatingPreference,
  });
}

class _CopyWithImpl$Input$CreateReservationInput<TRes>
    implements CopyWith$Input$CreateReservationInput<TRes> {
  _CopyWithImpl$Input$CreateReservationInput(this._instance, this._then);

  final Input$CreateReservationInput _instance;

  final TRes Function(Input$CreateReservationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurantId = _undefined,
    Object? reservationTime = _undefined,
    Object? partySize = _undefined,
    Object? specialRequests = _undefined,
    Object? dietaryRestrictions = _undefined,
    Object? seatingPreference = _undefined,
  }) => _then(
    Input$CreateReservationInput._({
      ..._instance._$data,
      if (restaurantId != _undefined && restaurantId != null)
        'restaurantId': (restaurantId as String),
      if (reservationTime != _undefined && reservationTime != null)
        'reservationTime': (reservationTime as DateTime),
      if (partySize != _undefined && partySize != null)
        'partySize': (partySize as int),
      if (specialRequests != _undefined)
        'specialRequests': (specialRequests as String?),
      if (dietaryRestrictions != _undefined)
        'dietaryRestrictions': (dietaryRestrictions as List<String>?),
      if (seatingPreference != _undefined)
        'seatingPreference': (seatingPreference as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateReservationInput<TRes>
    implements CopyWith$Input$CreateReservationInput<TRes> {
  _CopyWithStubImpl$Input$CreateReservationInput(this._res);

  TRes _res;

  call({
    String? restaurantId,
    DateTime? reservationTime,
    int? partySize,
    String? specialRequests,
    List<String>? dietaryRestrictions,
    String? seatingPreference,
  }) => _res;
}

class Input$UpdateReservationInput {
  factory Input$UpdateReservationInput({
    DateTime? reservationTime,
    int? partySize,
    String? specialRequests,
    List<String>? dietaryRestrictions,
    String? seatingPreference,
  }) => Input$UpdateReservationInput._({
    if (reservationTime != null) r'reservationTime': reservationTime,
    if (partySize != null) r'partySize': partySize,
    if (specialRequests != null) r'specialRequests': specialRequests,
    if (dietaryRestrictions != null)
      r'dietaryRestrictions': dietaryRestrictions,
    if (seatingPreference != null) r'seatingPreference': seatingPreference,
  });

  Input$UpdateReservationInput._(this._$data);

  factory Input$UpdateReservationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('reservationTime')) {
      final l$reservationTime = data['reservationTime'];
      result$data['reservationTime'] = l$reservationTime == null
          ? null
          : DateTime.parse((l$reservationTime as String));
    }
    if (data.containsKey('partySize')) {
      final l$partySize = data['partySize'];
      result$data['partySize'] = (l$partySize as int?);
    }
    if (data.containsKey('specialRequests')) {
      final l$specialRequests = data['specialRequests'];
      result$data['specialRequests'] = (l$specialRequests as String?);
    }
    if (data.containsKey('dietaryRestrictions')) {
      final l$dietaryRestrictions = data['dietaryRestrictions'];
      result$data['dietaryRestrictions'] =
          (l$dietaryRestrictions as List<dynamic>?)
              ?.map((e) => (e as String))
              .toList();
    }
    if (data.containsKey('seatingPreference')) {
      final l$seatingPreference = data['seatingPreference'];
      result$data['seatingPreference'] = (l$seatingPreference as String?);
    }
    return Input$UpdateReservationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime? get reservationTime => (_$data['reservationTime'] as DateTime?);

  int? get partySize => (_$data['partySize'] as int?);

  String? get specialRequests => (_$data['specialRequests'] as String?);

  List<String>? get dietaryRestrictions =>
      (_$data['dietaryRestrictions'] as List<String>?);

  String? get seatingPreference => (_$data['seatingPreference'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('reservationTime')) {
      final l$reservationTime = reservationTime;
      result$data['reservationTime'] = l$reservationTime?.toIso8601String();
    }
    if (_$data.containsKey('partySize')) {
      final l$partySize = partySize;
      result$data['partySize'] = l$partySize;
    }
    if (_$data.containsKey('specialRequests')) {
      final l$specialRequests = specialRequests;
      result$data['specialRequests'] = l$specialRequests;
    }
    if (_$data.containsKey('dietaryRestrictions')) {
      final l$dietaryRestrictions = dietaryRestrictions;
      result$data['dietaryRestrictions'] = l$dietaryRestrictions
          ?.map((e) => e)
          .toList();
    }
    if (_$data.containsKey('seatingPreference')) {
      final l$seatingPreference = seatingPreference;
      result$data['seatingPreference'] = l$seatingPreference;
    }
    return result$data;
  }

  CopyWith$Input$UpdateReservationInput<Input$UpdateReservationInput>
  get copyWith => CopyWith$Input$UpdateReservationInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateReservationInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reservationTime = reservationTime;
    final lOther$reservationTime = other.reservationTime;
    if (_$data.containsKey('reservationTime') !=
        other._$data.containsKey('reservationTime')) {
      return false;
    }
    if (l$reservationTime != lOther$reservationTime) {
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
    final l$specialRequests = specialRequests;
    final lOther$specialRequests = other.specialRequests;
    if (_$data.containsKey('specialRequests') !=
        other._$data.containsKey('specialRequests')) {
      return false;
    }
    if (l$specialRequests != lOther$specialRequests) {
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
    final l$seatingPreference = seatingPreference;
    final lOther$seatingPreference = other.seatingPreference;
    if (_$data.containsKey('seatingPreference') !=
        other._$data.containsKey('seatingPreference')) {
      return false;
    }
    if (l$seatingPreference != lOther$seatingPreference) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$reservationTime = reservationTime;
    final l$partySize = partySize;
    final l$specialRequests = specialRequests;
    final l$dietaryRestrictions = dietaryRestrictions;
    final l$seatingPreference = seatingPreference;
    return Object.hashAll([
      _$data.containsKey('reservationTime') ? l$reservationTime : const {},
      _$data.containsKey('partySize') ? l$partySize : const {},
      _$data.containsKey('specialRequests') ? l$specialRequests : const {},
      _$data.containsKey('dietaryRestrictions')
          ? l$dietaryRestrictions == null
                ? null
                : Object.hashAll(l$dietaryRestrictions.map((v) => v))
          : const {},
      _$data.containsKey('seatingPreference') ? l$seatingPreference : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateReservationInput<TRes> {
  factory CopyWith$Input$UpdateReservationInput(
    Input$UpdateReservationInput instance,
    TRes Function(Input$UpdateReservationInput) then,
  ) = _CopyWithImpl$Input$UpdateReservationInput;

  factory CopyWith$Input$UpdateReservationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateReservationInput;

  TRes call({
    DateTime? reservationTime,
    int? partySize,
    String? specialRequests,
    List<String>? dietaryRestrictions,
    String? seatingPreference,
  });
}

class _CopyWithImpl$Input$UpdateReservationInput<TRes>
    implements CopyWith$Input$UpdateReservationInput<TRes> {
  _CopyWithImpl$Input$UpdateReservationInput(this._instance, this._then);

  final Input$UpdateReservationInput _instance;

  final TRes Function(Input$UpdateReservationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? reservationTime = _undefined,
    Object? partySize = _undefined,
    Object? specialRequests = _undefined,
    Object? dietaryRestrictions = _undefined,
    Object? seatingPreference = _undefined,
  }) => _then(
    Input$UpdateReservationInput._({
      ..._instance._$data,
      if (reservationTime != _undefined)
        'reservationTime': (reservationTime as DateTime?),
      if (partySize != _undefined) 'partySize': (partySize as int?),
      if (specialRequests != _undefined)
        'specialRequests': (specialRequests as String?),
      if (dietaryRestrictions != _undefined)
        'dietaryRestrictions': (dietaryRestrictions as List<String>?),
      if (seatingPreference != _undefined)
        'seatingPreference': (seatingPreference as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateReservationInput<TRes>
    implements CopyWith$Input$UpdateReservationInput<TRes> {
  _CopyWithStubImpl$Input$UpdateReservationInput(this._res);

  TRes _res;

  call({
    DateTime? reservationTime,
    int? partySize,
    String? specialRequests,
    List<String>? dietaryRestrictions,
    String? seatingPreference,
  }) => _res;
}

class Input$CreateEventInput {
  factory Input$CreateEventInput({
    required String name,
    String? description,
    required Enum$ClubEventType type,
    required DateTime startTime,
    required DateTime endTime,
    String? location,
    required int capacity,
    List<String>? images,
    DateTime? registrationDeadline,
    double? registrationFee,
    String? currency,
    bool? isPublic,
    bool? requiresApproval,
    String? dressCode,
    String? agenda,
    String? organizer,
    String? contactEmail,
  }) => Input$CreateEventInput._({
    r'name': name,
    if (description != null) r'description': description,
    r'type': type,
    r'startTime': startTime,
    r'endTime': endTime,
    if (location != null) r'location': location,
    r'capacity': capacity,
    if (images != null) r'images': images,
    if (registrationDeadline != null)
      r'registrationDeadline': registrationDeadline,
    if (registrationFee != null) r'registrationFee': registrationFee,
    if (currency != null) r'currency': currency,
    if (isPublic != null) r'isPublic': isPublic,
    if (requiresApproval != null) r'requiresApproval': requiresApproval,
    if (dressCode != null) r'dressCode': dressCode,
    if (agenda != null) r'agenda': agenda,
    if (organizer != null) r'organizer': organizer,
    if (contactEmail != null) r'contactEmail': contactEmail,
  });

  Input$CreateEventInput._(this._$data);

  factory Input$CreateEventInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    final l$type = data['type'];
    result$data['type'] = fromJson$Enum$ClubEventType((l$type as String));
    final l$startTime = data['startTime'];
    result$data['startTime'] = DateTime.parse((l$startTime as String));
    final l$endTime = data['endTime'];
    result$data['endTime'] = DateTime.parse((l$endTime as String));
    if (data.containsKey('location')) {
      final l$location = data['location'];
      result$data['location'] = (l$location as String?);
    }
    final l$capacity = data['capacity'];
    result$data['capacity'] = (l$capacity as int);
    if (data.containsKey('images')) {
      final l$images = data['images'];
      result$data['images'] = (l$images as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('registrationDeadline')) {
      final l$registrationDeadline = data['registrationDeadline'];
      result$data['registrationDeadline'] = l$registrationDeadline == null
          ? null
          : DateTime.parse((l$registrationDeadline as String));
    }
    if (data.containsKey('registrationFee')) {
      final l$registrationFee = data['registrationFee'];
      result$data['registrationFee'] = (l$registrationFee as num?)?.toDouble();
    }
    if (data.containsKey('currency')) {
      final l$currency = data['currency'];
      result$data['currency'] = (l$currency as String?);
    }
    if (data.containsKey('isPublic')) {
      final l$isPublic = data['isPublic'];
      result$data['isPublic'] = (l$isPublic as bool?);
    }
    if (data.containsKey('requiresApproval')) {
      final l$requiresApproval = data['requiresApproval'];
      result$data['requiresApproval'] = (l$requiresApproval as bool?);
    }
    if (data.containsKey('dressCode')) {
      final l$dressCode = data['dressCode'];
      result$data['dressCode'] = (l$dressCode as String?);
    }
    if (data.containsKey('agenda')) {
      final l$agenda = data['agenda'];
      result$data['agenda'] = (l$agenda as String?);
    }
    if (data.containsKey('organizer')) {
      final l$organizer = data['organizer'];
      result$data['organizer'] = (l$organizer as String?);
    }
    if (data.containsKey('contactEmail')) {
      final l$contactEmail = data['contactEmail'];
      result$data['contactEmail'] = (l$contactEmail as String?);
    }
    return Input$CreateEventInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String? get description => (_$data['description'] as String?);

  Enum$ClubEventType get type => (_$data['type'] as Enum$ClubEventType);

  DateTime get startTime => (_$data['startTime'] as DateTime);

  DateTime get endTime => (_$data['endTime'] as DateTime);

  String? get location => (_$data['location'] as String?);

  int get capacity => (_$data['capacity'] as int);

  List<String>? get images => (_$data['images'] as List<String>?);

  DateTime? get registrationDeadline =>
      (_$data['registrationDeadline'] as DateTime?);

  double? get registrationFee => (_$data['registrationFee'] as double?);

  String? get currency => (_$data['currency'] as String?);

  bool? get isPublic => (_$data['isPublic'] as bool?);

  bool? get requiresApproval => (_$data['requiresApproval'] as bool?);

  String? get dressCode => (_$data['dressCode'] as String?);

  String? get agenda => (_$data['agenda'] as String?);

  String? get organizer => (_$data['organizer'] as String?);

  String? get contactEmail => (_$data['contactEmail'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    final l$type = type;
    result$data['type'] = toJson$Enum$ClubEventType(l$type);
    final l$startTime = startTime;
    result$data['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    result$data['endTime'] = l$endTime.toIso8601String();
    if (_$data.containsKey('location')) {
      final l$location = location;
      result$data['location'] = l$location;
    }
    final l$capacity = capacity;
    result$data['capacity'] = l$capacity;
    if (_$data.containsKey('images')) {
      final l$images = images;
      result$data['images'] = l$images?.map((e) => e).toList();
    }
    if (_$data.containsKey('registrationDeadline')) {
      final l$registrationDeadline = registrationDeadline;
      result$data['registrationDeadline'] = l$registrationDeadline
          ?.toIso8601String();
    }
    if (_$data.containsKey('registrationFee')) {
      final l$registrationFee = registrationFee;
      result$data['registrationFee'] = l$registrationFee;
    }
    if (_$data.containsKey('currency')) {
      final l$currency = currency;
      result$data['currency'] = l$currency;
    }
    if (_$data.containsKey('isPublic')) {
      final l$isPublic = isPublic;
      result$data['isPublic'] = l$isPublic;
    }
    if (_$data.containsKey('requiresApproval')) {
      final l$requiresApproval = requiresApproval;
      result$data['requiresApproval'] = l$requiresApproval;
    }
    if (_$data.containsKey('dressCode')) {
      final l$dressCode = dressCode;
      result$data['dressCode'] = l$dressCode;
    }
    if (_$data.containsKey('agenda')) {
      final l$agenda = agenda;
      result$data['agenda'] = l$agenda;
    }
    if (_$data.containsKey('organizer')) {
      final l$organizer = organizer;
      result$data['organizer'] = l$organizer;
    }
    if (_$data.containsKey('contactEmail')) {
      final l$contactEmail = contactEmail;
      result$data['contactEmail'] = l$contactEmail;
    }
    return result$data;
  }

  CopyWith$Input$CreateEventInput<Input$CreateEventInput> get copyWith =>
      CopyWith$Input$CreateEventInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateEventInput || runtimeType != other.runtimeType) {
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
    final l$location = location;
    final lOther$location = other.location;
    if (_$data.containsKey('location') !=
        other._$data.containsKey('location')) {
      return false;
    }
    if (l$location != lOther$location) {
      return false;
    }
    final l$capacity = capacity;
    final lOther$capacity = other.capacity;
    if (l$capacity != lOther$capacity) {
      return false;
    }
    final l$images = images;
    final lOther$images = other.images;
    if (_$data.containsKey('images') != other._$data.containsKey('images')) {
      return false;
    }
    if (l$images != null && lOther$images != null) {
      if (l$images.length != lOther$images.length) {
        return false;
      }
      for (int i = 0; i < l$images.length; i++) {
        final l$images$entry = l$images[i];
        final lOther$images$entry = lOther$images[i];
        if (l$images$entry != lOther$images$entry) {
          return false;
        }
      }
    } else if (l$images != lOther$images) {
      return false;
    }
    final l$registrationDeadline = registrationDeadline;
    final lOther$registrationDeadline = other.registrationDeadline;
    if (_$data.containsKey('registrationDeadline') !=
        other._$data.containsKey('registrationDeadline')) {
      return false;
    }
    if (l$registrationDeadline != lOther$registrationDeadline) {
      return false;
    }
    final l$registrationFee = registrationFee;
    final lOther$registrationFee = other.registrationFee;
    if (_$data.containsKey('registrationFee') !=
        other._$data.containsKey('registrationFee')) {
      return false;
    }
    if (l$registrationFee != lOther$registrationFee) {
      return false;
    }
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (_$data.containsKey('currency') !=
        other._$data.containsKey('currency')) {
      return false;
    }
    if (l$currency != lOther$currency) {
      return false;
    }
    final l$isPublic = isPublic;
    final lOther$isPublic = other.isPublic;
    if (_$data.containsKey('isPublic') !=
        other._$data.containsKey('isPublic')) {
      return false;
    }
    if (l$isPublic != lOther$isPublic) {
      return false;
    }
    final l$requiresApproval = requiresApproval;
    final lOther$requiresApproval = other.requiresApproval;
    if (_$data.containsKey('requiresApproval') !=
        other._$data.containsKey('requiresApproval')) {
      return false;
    }
    if (l$requiresApproval != lOther$requiresApproval) {
      return false;
    }
    final l$dressCode = dressCode;
    final lOther$dressCode = other.dressCode;
    if (_$data.containsKey('dressCode') !=
        other._$data.containsKey('dressCode')) {
      return false;
    }
    if (l$dressCode != lOther$dressCode) {
      return false;
    }
    final l$agenda = agenda;
    final lOther$agenda = other.agenda;
    if (_$data.containsKey('agenda') != other._$data.containsKey('agenda')) {
      return false;
    }
    if (l$agenda != lOther$agenda) {
      return false;
    }
    final l$organizer = organizer;
    final lOther$organizer = other.organizer;
    if (_$data.containsKey('organizer') !=
        other._$data.containsKey('organizer')) {
      return false;
    }
    if (l$organizer != lOther$organizer) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$type = type;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$location = location;
    final l$capacity = capacity;
    final l$images = images;
    final l$registrationDeadline = registrationDeadline;
    final l$registrationFee = registrationFee;
    final l$currency = currency;
    final l$isPublic = isPublic;
    final l$requiresApproval = requiresApproval;
    final l$dressCode = dressCode;
    final l$agenda = agenda;
    final l$organizer = organizer;
    final l$contactEmail = contactEmail;
    return Object.hashAll([
      l$name,
      _$data.containsKey('description') ? l$description : const {},
      l$type,
      l$startTime,
      l$endTime,
      _$data.containsKey('location') ? l$location : const {},
      l$capacity,
      _$data.containsKey('images')
          ? l$images == null
                ? null
                : Object.hashAll(l$images.map((v) => v))
          : const {},
      _$data.containsKey('registrationDeadline')
          ? l$registrationDeadline
          : const {},
      _$data.containsKey('registrationFee') ? l$registrationFee : const {},
      _$data.containsKey('currency') ? l$currency : const {},
      _$data.containsKey('isPublic') ? l$isPublic : const {},
      _$data.containsKey('requiresApproval') ? l$requiresApproval : const {},
      _$data.containsKey('dressCode') ? l$dressCode : const {},
      _$data.containsKey('agenda') ? l$agenda : const {},
      _$data.containsKey('organizer') ? l$organizer : const {},
      _$data.containsKey('contactEmail') ? l$contactEmail : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateEventInput<TRes> {
  factory CopyWith$Input$CreateEventInput(
    Input$CreateEventInput instance,
    TRes Function(Input$CreateEventInput) then,
  ) = _CopyWithImpl$Input$CreateEventInput;

  factory CopyWith$Input$CreateEventInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateEventInput;

  TRes call({
    String? name,
    String? description,
    Enum$ClubEventType? type,
    DateTime? startTime,
    DateTime? endTime,
    String? location,
    int? capacity,
    List<String>? images,
    DateTime? registrationDeadline,
    double? registrationFee,
    String? currency,
    bool? isPublic,
    bool? requiresApproval,
    String? dressCode,
    String? agenda,
    String? organizer,
    String? contactEmail,
  });
}

class _CopyWithImpl$Input$CreateEventInput<TRes>
    implements CopyWith$Input$CreateEventInput<TRes> {
  _CopyWithImpl$Input$CreateEventInput(this._instance, this._then);

  final Input$CreateEventInput _instance;

  final TRes Function(Input$CreateEventInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? type = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? location = _undefined,
    Object? capacity = _undefined,
    Object? images = _undefined,
    Object? registrationDeadline = _undefined,
    Object? registrationFee = _undefined,
    Object? currency = _undefined,
    Object? isPublic = _undefined,
    Object? requiresApproval = _undefined,
    Object? dressCode = _undefined,
    Object? agenda = _undefined,
    Object? organizer = _undefined,
    Object? contactEmail = _undefined,
  }) => _then(
    Input$CreateEventInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (description != _undefined) 'description': (description as String?),
      if (type != _undefined && type != null)
        'type': (type as Enum$ClubEventType),
      if (startTime != _undefined && startTime != null)
        'startTime': (startTime as DateTime),
      if (endTime != _undefined && endTime != null)
        'endTime': (endTime as DateTime),
      if (location != _undefined) 'location': (location as String?),
      if (capacity != _undefined && capacity != null)
        'capacity': (capacity as int),
      if (images != _undefined) 'images': (images as List<String>?),
      if (registrationDeadline != _undefined)
        'registrationDeadline': (registrationDeadline as DateTime?),
      if (registrationFee != _undefined)
        'registrationFee': (registrationFee as double?),
      if (currency != _undefined) 'currency': (currency as String?),
      if (isPublic != _undefined) 'isPublic': (isPublic as bool?),
      if (requiresApproval != _undefined)
        'requiresApproval': (requiresApproval as bool?),
      if (dressCode != _undefined) 'dressCode': (dressCode as String?),
      if (agenda != _undefined) 'agenda': (agenda as String?),
      if (organizer != _undefined) 'organizer': (organizer as String?),
      if (contactEmail != _undefined) 'contactEmail': (contactEmail as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateEventInput<TRes>
    implements CopyWith$Input$CreateEventInput<TRes> {
  _CopyWithStubImpl$Input$CreateEventInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    Enum$ClubEventType? type,
    DateTime? startTime,
    DateTime? endTime,
    String? location,
    int? capacity,
    List<String>? images,
    DateTime? registrationDeadline,
    double? registrationFee,
    String? currency,
    bool? isPublic,
    bool? requiresApproval,
    String? dressCode,
    String? agenda,
    String? organizer,
    String? contactEmail,
  }) => _res;
}

class Input$UpdateEventInput {
  factory Input$UpdateEventInput({
    String? name,
    String? description,
    Enum$EventType? type,
    DateTime? startTime,
    DateTime? endTime,
    String? location,
    int? capacity,
    List<String>? images,
    DateTime? registrationDeadline,
    double? registrationFee,
    String? currency,
    bool? isPublic,
    bool? requiresApproval,
    String? dressCode,
    String? agenda,
    String? organizer,
    String? contactEmail,
    Enum$EventStatus? status,
  }) => Input$UpdateEventInput._({
    if (name != null) r'name': name,
    if (description != null) r'description': description,
    if (type != null) r'type': type,
    if (startTime != null) r'startTime': startTime,
    if (endTime != null) r'endTime': endTime,
    if (location != null) r'location': location,
    if (capacity != null) r'capacity': capacity,
    if (images != null) r'images': images,
    if (registrationDeadline != null)
      r'registrationDeadline': registrationDeadline,
    if (registrationFee != null) r'registrationFee': registrationFee,
    if (currency != null) r'currency': currency,
    if (isPublic != null) r'isPublic': isPublic,
    if (requiresApproval != null) r'requiresApproval': requiresApproval,
    if (dressCode != null) r'dressCode': dressCode,
    if (agenda != null) r'agenda': agenda,
    if (organizer != null) r'organizer': organizer,
    if (contactEmail != null) r'contactEmail': contactEmail,
    if (status != null) r'status': status,
  });

  Input$UpdateEventInput._(this._$data);

  factory Input$UpdateEventInput.fromJson(Map<String, dynamic> data) {
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
      result$data['type'] = l$type == null
          ? null
          : fromJson$Enum$EventType((l$type as String));
    }
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
    if (data.containsKey('location')) {
      final l$location = data['location'];
      result$data['location'] = (l$location as String?);
    }
    if (data.containsKey('capacity')) {
      final l$capacity = data['capacity'];
      result$data['capacity'] = (l$capacity as int?);
    }
    if (data.containsKey('images')) {
      final l$images = data['images'];
      result$data['images'] = (l$images as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('registrationDeadline')) {
      final l$registrationDeadline = data['registrationDeadline'];
      result$data['registrationDeadline'] = l$registrationDeadline == null
          ? null
          : DateTime.parse((l$registrationDeadline as String));
    }
    if (data.containsKey('registrationFee')) {
      final l$registrationFee = data['registrationFee'];
      result$data['registrationFee'] = (l$registrationFee as num?)?.toDouble();
    }
    if (data.containsKey('currency')) {
      final l$currency = data['currency'];
      result$data['currency'] = (l$currency as String?);
    }
    if (data.containsKey('isPublic')) {
      final l$isPublic = data['isPublic'];
      result$data['isPublic'] = (l$isPublic as bool?);
    }
    if (data.containsKey('requiresApproval')) {
      final l$requiresApproval = data['requiresApproval'];
      result$data['requiresApproval'] = (l$requiresApproval as bool?);
    }
    if (data.containsKey('dressCode')) {
      final l$dressCode = data['dressCode'];
      result$data['dressCode'] = (l$dressCode as String?);
    }
    if (data.containsKey('agenda')) {
      final l$agenda = data['agenda'];
      result$data['agenda'] = (l$agenda as String?);
    }
    if (data.containsKey('organizer')) {
      final l$organizer = data['organizer'];
      result$data['organizer'] = (l$organizer as String?);
    }
    if (data.containsKey('contactEmail')) {
      final l$contactEmail = data['contactEmail'];
      result$data['contactEmail'] = (l$contactEmail as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$EventStatus((l$status as String));
    }
    return Input$UpdateEventInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get description => (_$data['description'] as String?);

  Enum$EventType? get type => (_$data['type'] as Enum$EventType?);

  DateTime? get startTime => (_$data['startTime'] as DateTime?);

  DateTime? get endTime => (_$data['endTime'] as DateTime?);

  String? get location => (_$data['location'] as String?);

  int? get capacity => (_$data['capacity'] as int?);

  List<String>? get images => (_$data['images'] as List<String>?);

  DateTime? get registrationDeadline =>
      (_$data['registrationDeadline'] as DateTime?);

  double? get registrationFee => (_$data['registrationFee'] as double?);

  String? get currency => (_$data['currency'] as String?);

  bool? get isPublic => (_$data['isPublic'] as bool?);

  bool? get requiresApproval => (_$data['requiresApproval'] as bool?);

  String? get dressCode => (_$data['dressCode'] as String?);

  String? get agenda => (_$data['agenda'] as String?);

  String? get organizer => (_$data['organizer'] as String?);

  String? get contactEmail => (_$data['contactEmail'] as String?);

  Enum$EventStatus? get status => (_$data['status'] as Enum$EventStatus?);

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
      result$data['type'] = l$type == null
          ? null
          : toJson$Enum$EventType(l$type);
    }
    if (_$data.containsKey('startTime')) {
      final l$startTime = startTime;
      result$data['startTime'] = l$startTime?.toIso8601String();
    }
    if (_$data.containsKey('endTime')) {
      final l$endTime = endTime;
      result$data['endTime'] = l$endTime?.toIso8601String();
    }
    if (_$data.containsKey('location')) {
      final l$location = location;
      result$data['location'] = l$location;
    }
    if (_$data.containsKey('capacity')) {
      final l$capacity = capacity;
      result$data['capacity'] = l$capacity;
    }
    if (_$data.containsKey('images')) {
      final l$images = images;
      result$data['images'] = l$images?.map((e) => e).toList();
    }
    if (_$data.containsKey('registrationDeadline')) {
      final l$registrationDeadline = registrationDeadline;
      result$data['registrationDeadline'] = l$registrationDeadline
          ?.toIso8601String();
    }
    if (_$data.containsKey('registrationFee')) {
      final l$registrationFee = registrationFee;
      result$data['registrationFee'] = l$registrationFee;
    }
    if (_$data.containsKey('currency')) {
      final l$currency = currency;
      result$data['currency'] = l$currency;
    }
    if (_$data.containsKey('isPublic')) {
      final l$isPublic = isPublic;
      result$data['isPublic'] = l$isPublic;
    }
    if (_$data.containsKey('requiresApproval')) {
      final l$requiresApproval = requiresApproval;
      result$data['requiresApproval'] = l$requiresApproval;
    }
    if (_$data.containsKey('dressCode')) {
      final l$dressCode = dressCode;
      result$data['dressCode'] = l$dressCode;
    }
    if (_$data.containsKey('agenda')) {
      final l$agenda = agenda;
      result$data['agenda'] = l$agenda;
    }
    if (_$data.containsKey('organizer')) {
      final l$organizer = organizer;
      result$data['organizer'] = l$organizer;
    }
    if (_$data.containsKey('contactEmail')) {
      final l$contactEmail = contactEmail;
      result$data['contactEmail'] = l$contactEmail;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$EventStatus(l$status);
    }
    return result$data;
  }

  CopyWith$Input$UpdateEventInput<Input$UpdateEventInput> get copyWith =>
      CopyWith$Input$UpdateEventInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateEventInput || runtimeType != other.runtimeType) {
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
    final l$location = location;
    final lOther$location = other.location;
    if (_$data.containsKey('location') !=
        other._$data.containsKey('location')) {
      return false;
    }
    if (l$location != lOther$location) {
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
    final l$images = images;
    final lOther$images = other.images;
    if (_$data.containsKey('images') != other._$data.containsKey('images')) {
      return false;
    }
    if (l$images != null && lOther$images != null) {
      if (l$images.length != lOther$images.length) {
        return false;
      }
      for (int i = 0; i < l$images.length; i++) {
        final l$images$entry = l$images[i];
        final lOther$images$entry = lOther$images[i];
        if (l$images$entry != lOther$images$entry) {
          return false;
        }
      }
    } else if (l$images != lOther$images) {
      return false;
    }
    final l$registrationDeadline = registrationDeadline;
    final lOther$registrationDeadline = other.registrationDeadline;
    if (_$data.containsKey('registrationDeadline') !=
        other._$data.containsKey('registrationDeadline')) {
      return false;
    }
    if (l$registrationDeadline != lOther$registrationDeadline) {
      return false;
    }
    final l$registrationFee = registrationFee;
    final lOther$registrationFee = other.registrationFee;
    if (_$data.containsKey('registrationFee') !=
        other._$data.containsKey('registrationFee')) {
      return false;
    }
    if (l$registrationFee != lOther$registrationFee) {
      return false;
    }
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (_$data.containsKey('currency') !=
        other._$data.containsKey('currency')) {
      return false;
    }
    if (l$currency != lOther$currency) {
      return false;
    }
    final l$isPublic = isPublic;
    final lOther$isPublic = other.isPublic;
    if (_$data.containsKey('isPublic') !=
        other._$data.containsKey('isPublic')) {
      return false;
    }
    if (l$isPublic != lOther$isPublic) {
      return false;
    }
    final l$requiresApproval = requiresApproval;
    final lOther$requiresApproval = other.requiresApproval;
    if (_$data.containsKey('requiresApproval') !=
        other._$data.containsKey('requiresApproval')) {
      return false;
    }
    if (l$requiresApproval != lOther$requiresApproval) {
      return false;
    }
    final l$dressCode = dressCode;
    final lOther$dressCode = other.dressCode;
    if (_$data.containsKey('dressCode') !=
        other._$data.containsKey('dressCode')) {
      return false;
    }
    if (l$dressCode != lOther$dressCode) {
      return false;
    }
    final l$agenda = agenda;
    final lOther$agenda = other.agenda;
    if (_$data.containsKey('agenda') != other._$data.containsKey('agenda')) {
      return false;
    }
    if (l$agenda != lOther$agenda) {
      return false;
    }
    final l$organizer = organizer;
    final lOther$organizer = other.organizer;
    if (_$data.containsKey('organizer') !=
        other._$data.containsKey('organizer')) {
      return false;
    }
    if (l$organizer != lOther$organizer) {
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
    final l$type = type;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$location = location;
    final l$capacity = capacity;
    final l$images = images;
    final l$registrationDeadline = registrationDeadline;
    final l$registrationFee = registrationFee;
    final l$currency = currency;
    final l$isPublic = isPublic;
    final l$requiresApproval = requiresApproval;
    final l$dressCode = dressCode;
    final l$agenda = agenda;
    final l$organizer = organizer;
    final l$contactEmail = contactEmail;
    final l$status = status;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('startTime') ? l$startTime : const {},
      _$data.containsKey('endTime') ? l$endTime : const {},
      _$data.containsKey('location') ? l$location : const {},
      _$data.containsKey('capacity') ? l$capacity : const {},
      _$data.containsKey('images')
          ? l$images == null
                ? null
                : Object.hashAll(l$images.map((v) => v))
          : const {},
      _$data.containsKey('registrationDeadline')
          ? l$registrationDeadline
          : const {},
      _$data.containsKey('registrationFee') ? l$registrationFee : const {},
      _$data.containsKey('currency') ? l$currency : const {},
      _$data.containsKey('isPublic') ? l$isPublic : const {},
      _$data.containsKey('requiresApproval') ? l$requiresApproval : const {},
      _$data.containsKey('dressCode') ? l$dressCode : const {},
      _$data.containsKey('agenda') ? l$agenda : const {},
      _$data.containsKey('organizer') ? l$organizer : const {},
      _$data.containsKey('contactEmail') ? l$contactEmail : const {},
      _$data.containsKey('status') ? l$status : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateEventInput<TRes> {
  factory CopyWith$Input$UpdateEventInput(
    Input$UpdateEventInput instance,
    TRes Function(Input$UpdateEventInput) then,
  ) = _CopyWithImpl$Input$UpdateEventInput;

  factory CopyWith$Input$UpdateEventInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateEventInput;

  TRes call({
    String? name,
    String? description,
    Enum$EventType? type,
    DateTime? startTime,
    DateTime? endTime,
    String? location,
    int? capacity,
    List<String>? images,
    DateTime? registrationDeadline,
    double? registrationFee,
    String? currency,
    bool? isPublic,
    bool? requiresApproval,
    String? dressCode,
    String? agenda,
    String? organizer,
    String? contactEmail,
    Enum$EventStatus? status,
  });
}

class _CopyWithImpl$Input$UpdateEventInput<TRes>
    implements CopyWith$Input$UpdateEventInput<TRes> {
  _CopyWithImpl$Input$UpdateEventInput(this._instance, this._then);

  final Input$UpdateEventInput _instance;

  final TRes Function(Input$UpdateEventInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? type = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? location = _undefined,
    Object? capacity = _undefined,
    Object? images = _undefined,
    Object? registrationDeadline = _undefined,
    Object? registrationFee = _undefined,
    Object? currency = _undefined,
    Object? isPublic = _undefined,
    Object? requiresApproval = _undefined,
    Object? dressCode = _undefined,
    Object? agenda = _undefined,
    Object? organizer = _undefined,
    Object? contactEmail = _undefined,
    Object? status = _undefined,
  }) => _then(
    Input$UpdateEventInput._({
      ..._instance._$data,
      if (name != _undefined) 'name': (name as String?),
      if (description != _undefined) 'description': (description as String?),
      if (type != _undefined) 'type': (type as Enum$EventType?),
      if (startTime != _undefined) 'startTime': (startTime as DateTime?),
      if (endTime != _undefined) 'endTime': (endTime as DateTime?),
      if (location != _undefined) 'location': (location as String?),
      if (capacity != _undefined) 'capacity': (capacity as int?),
      if (images != _undefined) 'images': (images as List<String>?),
      if (registrationDeadline != _undefined)
        'registrationDeadline': (registrationDeadline as DateTime?),
      if (registrationFee != _undefined)
        'registrationFee': (registrationFee as double?),
      if (currency != _undefined) 'currency': (currency as String?),
      if (isPublic != _undefined) 'isPublic': (isPublic as bool?),
      if (requiresApproval != _undefined)
        'requiresApproval': (requiresApproval as bool?),
      if (dressCode != _undefined) 'dressCode': (dressCode as String?),
      if (agenda != _undefined) 'agenda': (agenda as String?),
      if (organizer != _undefined) 'organizer': (organizer as String?),
      if (contactEmail != _undefined) 'contactEmail': (contactEmail as String?),
      if (status != _undefined) 'status': (status as Enum$EventStatus?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateEventInput<TRes>
    implements CopyWith$Input$UpdateEventInput<TRes> {
  _CopyWithStubImpl$Input$UpdateEventInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    Enum$EventType? type,
    DateTime? startTime,
    DateTime? endTime,
    String? location,
    int? capacity,
    List<String>? images,
    DateTime? registrationDeadline,
    double? registrationFee,
    String? currency,
    bool? isPublic,
    bool? requiresApproval,
    String? dressCode,
    String? agenda,
    String? organizer,
    String? contactEmail,
    Enum$EventStatus? status,
  }) => _res;
}

class Input$CreateRSVPInput {
  factory Input$CreateRSVPInput({
    required String eventId,
    int? guestCount,
    List<String>? dietaryRestrictions,
    String? specialRequests,
  }) => Input$CreateRSVPInput._({
    r'eventId': eventId,
    if (guestCount != null) r'guestCount': guestCount,
    if (dietaryRestrictions != null)
      r'dietaryRestrictions': dietaryRestrictions,
    if (specialRequests != null) r'specialRequests': specialRequests,
  });

  Input$CreateRSVPInput._(this._$data);

  factory Input$CreateRSVPInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$eventId = data['eventId'];
    result$data['eventId'] = (l$eventId as String);
    if (data.containsKey('guestCount')) {
      final l$guestCount = data['guestCount'];
      result$data['guestCount'] = (l$guestCount as int?);
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
    return Input$CreateRSVPInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get eventId => (_$data['eventId'] as String);

  int? get guestCount => (_$data['guestCount'] as int?);

  List<String>? get dietaryRestrictions =>
      (_$data['dietaryRestrictions'] as List<String>?);

  String? get specialRequests => (_$data['specialRequests'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$eventId = eventId;
    result$data['eventId'] = l$eventId;
    if (_$data.containsKey('guestCount')) {
      final l$guestCount = guestCount;
      result$data['guestCount'] = l$guestCount;
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
    final l$eventId = eventId;
    final lOther$eventId = other.eventId;
    if (l$eventId != lOther$eventId) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$eventId = eventId;
    final l$guestCount = guestCount;
    final l$dietaryRestrictions = dietaryRestrictions;
    final l$specialRequests = specialRequests;
    return Object.hashAll([
      l$eventId,
      _$data.containsKey('guestCount') ? l$guestCount : const {},
      _$data.containsKey('dietaryRestrictions')
          ? l$dietaryRestrictions == null
                ? null
                : Object.hashAll(l$dietaryRestrictions.map((v) => v))
          : const {},
      _$data.containsKey('specialRequests') ? l$specialRequests : const {},
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

  TRes call({
    String? eventId,
    int? guestCount,
    List<String>? dietaryRestrictions,
    String? specialRequests,
  });
}

class _CopyWithImpl$Input$CreateRSVPInput<TRes>
    implements CopyWith$Input$CreateRSVPInput<TRes> {
  _CopyWithImpl$Input$CreateRSVPInput(this._instance, this._then);

  final Input$CreateRSVPInput _instance;

  final TRes Function(Input$CreateRSVPInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? eventId = _undefined,
    Object? guestCount = _undefined,
    Object? dietaryRestrictions = _undefined,
    Object? specialRequests = _undefined,
  }) => _then(
    Input$CreateRSVPInput._({
      ..._instance._$data,
      if (eventId != _undefined && eventId != null)
        'eventId': (eventId as String),
      if (guestCount != _undefined) 'guestCount': (guestCount as int?),
      if (dietaryRestrictions != _undefined)
        'dietaryRestrictions': (dietaryRestrictions as List<String>?),
      if (specialRequests != _undefined)
        'specialRequests': (specialRequests as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateRSVPInput<TRes>
    implements CopyWith$Input$CreateRSVPInput<TRes> {
  _CopyWithStubImpl$Input$CreateRSVPInput(this._res);

  TRes _res;

  call({
    String? eventId,
    int? guestCount,
    List<String>? dietaryRestrictions,
    String? specialRequests,
  }) => _res;
}

class Input$UpdateRSVPInput {
  factory Input$UpdateRSVPInput({
    int? guestCount,
    List<String>? dietaryRestrictions,
    String? specialRequests,
  }) => Input$UpdateRSVPInput._({
    if (guestCount != null) r'guestCount': guestCount,
    if (dietaryRestrictions != null)
      r'dietaryRestrictions': dietaryRestrictions,
    if (specialRequests != null) r'specialRequests': specialRequests,
  });

  Input$UpdateRSVPInput._(this._$data);

  factory Input$UpdateRSVPInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('guestCount')) {
      final l$guestCount = data['guestCount'];
      result$data['guestCount'] = (l$guestCount as int?);
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
    return Input$UpdateRSVPInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get guestCount => (_$data['guestCount'] as int?);

  List<String>? get dietaryRestrictions =>
      (_$data['dietaryRestrictions'] as List<String>?);

  String? get specialRequests => (_$data['specialRequests'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('guestCount')) {
      final l$guestCount = guestCount;
      result$data['guestCount'] = l$guestCount;
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
    final l$guestCount = guestCount;
    final lOther$guestCount = other.guestCount;
    if (_$data.containsKey('guestCount') !=
        other._$data.containsKey('guestCount')) {
      return false;
    }
    if (l$guestCount != lOther$guestCount) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$guestCount = guestCount;
    final l$dietaryRestrictions = dietaryRestrictions;
    final l$specialRequests = specialRequests;
    return Object.hashAll([
      _$data.containsKey('guestCount') ? l$guestCount : const {},
      _$data.containsKey('dietaryRestrictions')
          ? l$dietaryRestrictions == null
                ? null
                : Object.hashAll(l$dietaryRestrictions.map((v) => v))
          : const {},
      _$data.containsKey('specialRequests') ? l$specialRequests : const {},
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

  TRes call({
    int? guestCount,
    List<String>? dietaryRestrictions,
    String? specialRequests,
  });
}

class _CopyWithImpl$Input$UpdateRSVPInput<TRes>
    implements CopyWith$Input$UpdateRSVPInput<TRes> {
  _CopyWithImpl$Input$UpdateRSVPInput(this._instance, this._then);

  final Input$UpdateRSVPInput _instance;

  final TRes Function(Input$UpdateRSVPInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? guestCount = _undefined,
    Object? dietaryRestrictions = _undefined,
    Object? specialRequests = _undefined,
  }) => _then(
    Input$UpdateRSVPInput._({
      ..._instance._$data,
      if (guestCount != _undefined) 'guestCount': (guestCount as int?),
      if (dietaryRestrictions != _undefined)
        'dietaryRestrictions': (dietaryRestrictions as List<String>?),
      if (specialRequests != _undefined)
        'specialRequests': (specialRequests as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateRSVPInput<TRes>
    implements CopyWith$Input$UpdateRSVPInput<TRes> {
  _CopyWithStubImpl$Input$UpdateRSVPInput(this._res);

  TRes _res;

  call({
    int? guestCount,
    List<String>? dietaryRestrictions,
    String? specialRequests,
  }) => _res;
}

class Input$ClubFilterInput {
  factory Input$ClubFilterInput({
    Enum$ClubStatus? status,
    String? search,
    bool? isFeatured,
  }) => Input$ClubFilterInput._({
    if (status != null) r'status': status,
    if (search != null) r'search': search,
    if (isFeatured != null) r'isFeatured': isFeatured,
  });

  Input$ClubFilterInput._(this._$data);

  factory Input$ClubFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$ClubStatus((l$status as String));
    }
    if (data.containsKey('search')) {
      final l$search = data['search'];
      result$data['search'] = (l$search as String?);
    }
    if (data.containsKey('isFeatured')) {
      final l$isFeatured = data['isFeatured'];
      result$data['isFeatured'] = (l$isFeatured as bool?);
    }
    return Input$ClubFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$ClubStatus? get status => (_$data['status'] as Enum$ClubStatus?);

  String? get search => (_$data['search'] as String?);

  bool? get isFeatured => (_$data['isFeatured'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$ClubStatus(l$status);
    }
    if (_$data.containsKey('search')) {
      final l$search = search;
      result$data['search'] = l$search;
    }
    if (_$data.containsKey('isFeatured')) {
      final l$isFeatured = isFeatured;
      result$data['isFeatured'] = l$isFeatured;
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
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
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
    final l$isFeatured = isFeatured;
    final lOther$isFeatured = other.isFeatured;
    if (_$data.containsKey('isFeatured') !=
        other._$data.containsKey('isFeatured')) {
      return false;
    }
    if (l$isFeatured != lOther$isFeatured) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$status = status;
    final l$search = search;
    final l$isFeatured = isFeatured;
    return Object.hashAll([
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('search') ? l$search : const {},
      _$data.containsKey('isFeatured') ? l$isFeatured : const {},
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

  TRes call({Enum$ClubStatus? status, String? search, bool? isFeatured});
}

class _CopyWithImpl$Input$ClubFilterInput<TRes>
    implements CopyWith$Input$ClubFilterInput<TRes> {
  _CopyWithImpl$Input$ClubFilterInput(this._instance, this._then);

  final Input$ClubFilterInput _instance;

  final TRes Function(Input$ClubFilterInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? status = _undefined,
    Object? search = _undefined,
    Object? isFeatured = _undefined,
  }) => _then(
    Input$ClubFilterInput._({
      ..._instance._$data,
      if (status != _undefined) 'status': (status as Enum$ClubStatus?),
      if (search != _undefined) 'search': (search as String?),
      if (isFeatured != _undefined) 'isFeatured': (isFeatured as bool?),
    }),
  );
}

class _CopyWithStubImpl$Input$ClubFilterInput<TRes>
    implements CopyWith$Input$ClubFilterInput<TRes> {
  _CopyWithStubImpl$Input$ClubFilterInput(this._res);

  TRes _res;

  call({Enum$ClubStatus? status, String? search, bool? isFeatured}) => _res;
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

class Input$RecordVisitInput {
  factory Input$RecordVisitInput({
    required String memberId,
    required String visitingClubId,
    String? agreementId,
    String? purpose,
    List<String>? services,
    double? cost,
  }) => Input$RecordVisitInput._({
    r'memberId': memberId,
    r'visitingClubId': visitingClubId,
    if (agreementId != null) r'agreementId': agreementId,
    if (purpose != null) r'purpose': purpose,
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
    if (data.containsKey('agreementId')) {
      final l$agreementId = data['agreementId'];
      result$data['agreementId'] = (l$agreementId as String?);
    }
    if (data.containsKey('purpose')) {
      final l$purpose = data['purpose'];
      result$data['purpose'] = (l$purpose as String?);
    }
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

  String? get agreementId => (_$data['agreementId'] as String?);

  String? get purpose => (_$data['purpose'] as String?);

  List<String>? get services => (_$data['services'] as List<String>?);

  double? get cost => (_$data['cost'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$memberId = memberId;
    result$data['memberId'] = l$memberId;
    final l$visitingClubId = visitingClubId;
    result$data['visitingClubId'] = l$visitingClubId;
    if (_$data.containsKey('agreementId')) {
      final l$agreementId = agreementId;
      result$data['agreementId'] = l$agreementId;
    }
    if (_$data.containsKey('purpose')) {
      final l$purpose = purpose;
      result$data['purpose'] = l$purpose;
    }
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
    final l$agreementId = agreementId;
    final lOther$agreementId = other.agreementId;
    if (_$data.containsKey('agreementId') !=
        other._$data.containsKey('agreementId')) {
      return false;
    }
    if (l$agreementId != lOther$agreementId) {
      return false;
    }
    final l$purpose = purpose;
    final lOther$purpose = other.purpose;
    if (_$data.containsKey('purpose') != other._$data.containsKey('purpose')) {
      return false;
    }
    if (l$purpose != lOther$purpose) {
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
    final l$agreementId = agreementId;
    final l$purpose = purpose;
    final l$services = services;
    final l$cost = cost;
    return Object.hashAll([
      l$memberId,
      l$visitingClubId,
      _$data.containsKey('agreementId') ? l$agreementId : const {},
      _$data.containsKey('purpose') ? l$purpose : const {},
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
    String? agreementId,
    String? purpose,
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
    Object? agreementId = _undefined,
    Object? purpose = _undefined,
    Object? services = _undefined,
    Object? cost = _undefined,
  }) => _then(
    Input$RecordVisitInput._({
      ..._instance._$data,
      if (memberId != _undefined && memberId != null)
        'memberId': (memberId as String),
      if (visitingClubId != _undefined && visitingClubId != null)
        'visitingClubId': (visitingClubId as String),
      if (agreementId != _undefined) 'agreementId': (agreementId as String?),
      if (purpose != _undefined) 'purpose': (purpose as String?),
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
    String? agreementId,
    String? purpose,
    List<String>? services,
    double? cost,
  }) => _res;
}

class Input$CheckOutVisitInput {
  factory Input$CheckOutVisitInput({
    required String visitId,
    List<String>? facilitiesUsed,
    String? notes,
    List<String>? services,
    double? cost,
  }) => Input$CheckOutVisitInput._({
    r'visitId': visitId,
    if (facilitiesUsed != null) r'facilitiesUsed': facilitiesUsed,
    if (notes != null) r'notes': notes,
    if (services != null) r'services': services,
    if (cost != null) r'cost': cost,
  });

  Input$CheckOutVisitInput._(this._$data);

  factory Input$CheckOutVisitInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$visitId = data['visitId'];
    result$data['visitId'] = (l$visitId as String);
    if (data.containsKey('facilitiesUsed')) {
      final l$facilitiesUsed = data['facilitiesUsed'];
      result$data['facilitiesUsed'] = (l$facilitiesUsed as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
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

  List<String>? get facilitiesUsed =>
      (_$data['facilitiesUsed'] as List<String>?);

  String? get notes => (_$data['notes'] as String?);

  List<String>? get services => (_$data['services'] as List<String>?);

  double? get cost => (_$data['cost'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$visitId = visitId;
    result$data['visitId'] = l$visitId;
    if (_$data.containsKey('facilitiesUsed')) {
      final l$facilitiesUsed = facilitiesUsed;
      result$data['facilitiesUsed'] = l$facilitiesUsed?.map((e) => e).toList();
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
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
    final l$facilitiesUsed = facilitiesUsed;
    final lOther$facilitiesUsed = other.facilitiesUsed;
    if (_$data.containsKey('facilitiesUsed') !=
        other._$data.containsKey('facilitiesUsed')) {
      return false;
    }
    if (l$facilitiesUsed != null && lOther$facilitiesUsed != null) {
      if (l$facilitiesUsed.length != lOther$facilitiesUsed.length) {
        return false;
      }
      for (int i = 0; i < l$facilitiesUsed.length; i++) {
        final l$facilitiesUsed$entry = l$facilitiesUsed[i];
        final lOther$facilitiesUsed$entry = lOther$facilitiesUsed[i];
        if (l$facilitiesUsed$entry != lOther$facilitiesUsed$entry) {
          return false;
        }
      }
    } else if (l$facilitiesUsed != lOther$facilitiesUsed) {
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
    final l$facilitiesUsed = facilitiesUsed;
    final l$notes = notes;
    final l$services = services;
    final l$cost = cost;
    return Object.hashAll([
      l$visitId,
      _$data.containsKey('facilitiesUsed')
          ? l$facilitiesUsed == null
                ? null
                : Object.hashAll(l$facilitiesUsed.map((v) => v))
          : const {},
      _$data.containsKey('notes') ? l$notes : const {},
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

  TRes call({
    String? visitId,
    List<String>? facilitiesUsed,
    String? notes,
    List<String>? services,
    double? cost,
  });
}

class _CopyWithImpl$Input$CheckOutVisitInput<TRes>
    implements CopyWith$Input$CheckOutVisitInput<TRes> {
  _CopyWithImpl$Input$CheckOutVisitInput(this._instance, this._then);

  final Input$CheckOutVisitInput _instance;

  final TRes Function(Input$CheckOutVisitInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? visitId = _undefined,
    Object? facilitiesUsed = _undefined,
    Object? notes = _undefined,
    Object? services = _undefined,
    Object? cost = _undefined,
  }) => _then(
    Input$CheckOutVisitInput._({
      ..._instance._$data,
      if (visitId != _undefined && visitId != null)
        'visitId': (visitId as String),
      if (facilitiesUsed != _undefined)
        'facilitiesUsed': (facilitiesUsed as List<String>?),
      if (notes != _undefined) 'notes': (notes as String?),
      if (services != _undefined) 'services': (services as List<String>?),
      if (cost != _undefined) 'cost': (cost as double?),
    }),
  );
}

class _CopyWithStubImpl$Input$CheckOutVisitInput<TRes>
    implements CopyWith$Input$CheckOutVisitInput<TRes> {
  _CopyWithStubImpl$Input$CheckOutVisitInput(this._res);

  TRes _res;

  call({
    String? visitId,
    List<String>? facilitiesUsed,
    String? notes,
    List<String>? services,
    double? cost,
  }) => _res;
}

class Input$FacilityFilterInput {
  factory Input$FacilityFilterInput({
    Enum$FacilityType? type,
    bool? isActive,
    Enum$FacilityStatus? status,
    String? search,
  }) => Input$FacilityFilterInput._({
    if (type != null) r'type': type,
    if (isActive != null) r'isActive': isActive,
    if (status != null) r'status': status,
    if (search != null) r'search': search,
  });

  Input$FacilityFilterInput._(this._$data);

  factory Input$FacilityFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = l$type == null
          ? null
          : fromJson$Enum$FacilityType((l$type as String));
    }
    if (data.containsKey('isActive')) {
      final l$isActive = data['isActive'];
      result$data['isActive'] = (l$isActive as bool?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$FacilityStatus((l$status as String));
    }
    if (data.containsKey('search')) {
      final l$search = data['search'];
      result$data['search'] = (l$search as String?);
    }
    return Input$FacilityFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$FacilityType? get type => (_$data['type'] as Enum$FacilityType?);

  bool? get isActive => (_$data['isActive'] as bool?);

  Enum$FacilityStatus? get status => (_$data['status'] as Enum$FacilityStatus?);

  String? get search => (_$data['search'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type == null
          ? null
          : toJson$Enum$FacilityType(l$type);
    }
    if (_$data.containsKey('isActive')) {
      final l$isActive = isActive;
      result$data['isActive'] = l$isActive;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$FacilityStatus(l$status);
    }
    if (_$data.containsKey('search')) {
      final l$search = search;
      result$data['search'] = l$search;
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
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (_$data.containsKey('isActive') !=
        other._$data.containsKey('isActive')) {
      return false;
    }
    if (l$isActive != lOther$isActive) {
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
    final l$search = search;
    final lOther$search = other.search;
    if (_$data.containsKey('search') != other._$data.containsKey('search')) {
      return false;
    }
    if (l$search != lOther$search) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$isActive = isActive;
    final l$status = status;
    final l$search = search;
    return Object.hashAll([
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('isActive') ? l$isActive : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('search') ? l$search : const {},
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

  TRes call({
    Enum$FacilityType? type,
    bool? isActive,
    Enum$FacilityStatus? status,
    String? search,
  });
}

class _CopyWithImpl$Input$FacilityFilterInput<TRes>
    implements CopyWith$Input$FacilityFilterInput<TRes> {
  _CopyWithImpl$Input$FacilityFilterInput(this._instance, this._then);

  final Input$FacilityFilterInput _instance;

  final TRes Function(Input$FacilityFilterInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? isActive = _undefined,
    Object? status = _undefined,
    Object? search = _undefined,
  }) => _then(
    Input$FacilityFilterInput._({
      ..._instance._$data,
      if (type != _undefined) 'type': (type as Enum$FacilityType?),
      if (isActive != _undefined) 'isActive': (isActive as bool?),
      if (status != _undefined) 'status': (status as Enum$FacilityStatus?),
      if (search != _undefined) 'search': (search as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$FacilityFilterInput<TRes>
    implements CopyWith$Input$FacilityFilterInput<TRes> {
  _CopyWithStubImpl$Input$FacilityFilterInput(this._res);

  TRes _res;

  call({
    Enum$FacilityType? type,
    bool? isActive,
    Enum$FacilityStatus? status,
    String? search,
  }) => _res;
}

class Input$EventFilters {
  factory Input$EventFilters({
    Enum$EventStatus? status,
    Enum$ClubEventType? type,
    DateTime? startDate,
    DateTime? endDate,
  }) => Input$EventFilters._({
    if (status != null) r'status': status,
    if (type != null) r'type': type,
    if (startDate != null) r'startDate': startDate,
    if (endDate != null) r'endDate': endDate,
  });

  Input$EventFilters._(this._$data);

  factory Input$EventFilters.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$EventStatus((l$status as String));
    }
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = l$type == null
          ? null
          : fromJson$Enum$ClubEventType((l$type as String));
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
    return Input$EventFilters._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$EventStatus? get status => (_$data['status'] as Enum$EventStatus?);

  Enum$ClubEventType? get type => (_$data['type'] as Enum$ClubEventType?);

  DateTime? get startDate => (_$data['startDate'] as DateTime?);

  DateTime? get endDate => (_$data['endDate'] as DateTime?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$EventStatus(l$status);
    }
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type == null
          ? null
          : toJson$Enum$ClubEventType(l$type);
    }
    if (_$data.containsKey('startDate')) {
      final l$startDate = startDate;
      result$data['startDate'] = l$startDate?.toIso8601String();
    }
    if (_$data.containsKey('endDate')) {
      final l$endDate = endDate;
      result$data['endDate'] = l$endDate?.toIso8601String();
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
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$status = status;
    final l$type = type;
    final l$startDate = startDate;
    final l$endDate = endDate;
    return Object.hashAll([
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('startDate') ? l$startDate : const {},
      _$data.containsKey('endDate') ? l$endDate : const {},
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

  TRes call({
    Enum$EventStatus? status,
    Enum$ClubEventType? type,
    DateTime? startDate,
    DateTime? endDate,
  });
}

class _CopyWithImpl$Input$EventFilters<TRes>
    implements CopyWith$Input$EventFilters<TRes> {
  _CopyWithImpl$Input$EventFilters(this._instance, this._then);

  final Input$EventFilters _instance;

  final TRes Function(Input$EventFilters) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? status = _undefined,
    Object? type = _undefined,
    Object? startDate = _undefined,
    Object? endDate = _undefined,
  }) => _then(
    Input$EventFilters._({
      ..._instance._$data,
      if (status != _undefined) 'status': (status as Enum$EventStatus?),
      if (type != _undefined) 'type': (type as Enum$ClubEventType?),
      if (startDate != _undefined) 'startDate': (startDate as DateTime?),
      if (endDate != _undefined) 'endDate': (endDate as DateTime?),
    }),
  );
}

class _CopyWithStubImpl$Input$EventFilters<TRes>
    implements CopyWith$Input$EventFilters<TRes> {
  _CopyWithStubImpl$Input$EventFilters(this._res);

  TRes _res;

  call({
    Enum$EventStatus? status,
    Enum$ClubEventType? type,
    DateTime? startDate,
    DateTime? endDate,
  }) => _res;
}

class Input$CreateReciprocalAgreementInput {
  factory Input$CreateReciprocalAgreementInput({
    required String partnerClubId,
    required Enum$AgreementType agreementType,
    DateTime? effectiveDate,
    DateTime? expirationDate,
    Input$AgreementTermsInput? terms,
    String? notes,
  }) => Input$CreateReciprocalAgreementInput._({
    r'partnerClubId': partnerClubId,
    r'agreementType': agreementType,
    if (effectiveDate != null) r'effectiveDate': effectiveDate,
    if (expirationDate != null) r'expirationDate': expirationDate,
    if (terms != null) r'terms': terms,
    if (notes != null) r'notes': notes,
  });

  Input$CreateReciprocalAgreementInput._(this._$data);

  factory Input$CreateReciprocalAgreementInput.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$partnerClubId = data['partnerClubId'];
    result$data['partnerClubId'] = (l$partnerClubId as String);
    final l$agreementType = data['agreementType'];
    result$data['agreementType'] = fromJson$Enum$AgreementType(
      (l$agreementType as String),
    );
    if (data.containsKey('effectiveDate')) {
      final l$effectiveDate = data['effectiveDate'];
      result$data['effectiveDate'] = l$effectiveDate == null
          ? null
          : DateTime.parse((l$effectiveDate as String));
    }
    if (data.containsKey('expirationDate')) {
      final l$expirationDate = data['expirationDate'];
      result$data['expirationDate'] = l$expirationDate == null
          ? null
          : DateTime.parse((l$expirationDate as String));
    }
    if (data.containsKey('terms')) {
      final l$terms = data['terms'];
      result$data['terms'] = l$terms == null
          ? null
          : Input$AgreementTermsInput.fromJson(
              (l$terms as Map<String, dynamic>),
            );
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Input$CreateReciprocalAgreementInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get partnerClubId => (_$data['partnerClubId'] as String);

  Enum$AgreementType get agreementType =>
      (_$data['agreementType'] as Enum$AgreementType);

  DateTime? get effectiveDate => (_$data['effectiveDate'] as DateTime?);

  DateTime? get expirationDate => (_$data['expirationDate'] as DateTime?);

  Input$AgreementTermsInput? get terms =>
      (_$data['terms'] as Input$AgreementTermsInput?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$partnerClubId = partnerClubId;
    result$data['partnerClubId'] = l$partnerClubId;
    final l$agreementType = agreementType;
    result$data['agreementType'] = toJson$Enum$AgreementType(l$agreementType);
    if (_$data.containsKey('effectiveDate')) {
      final l$effectiveDate = effectiveDate;
      result$data['effectiveDate'] = l$effectiveDate?.toIso8601String();
    }
    if (_$data.containsKey('expirationDate')) {
      final l$expirationDate = expirationDate;
      result$data['expirationDate'] = l$expirationDate?.toIso8601String();
    }
    if (_$data.containsKey('terms')) {
      final l$terms = terms;
      result$data['terms'] = l$terms?.toJson();
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
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
    final l$agreementType = agreementType;
    final lOther$agreementType = other.agreementType;
    if (l$agreementType != lOther$agreementType) {
      return false;
    }
    final l$effectiveDate = effectiveDate;
    final lOther$effectiveDate = other.effectiveDate;
    if (_$data.containsKey('effectiveDate') !=
        other._$data.containsKey('effectiveDate')) {
      return false;
    }
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
    final l$terms = terms;
    final lOther$terms = other.terms;
    if (_$data.containsKey('terms') != other._$data.containsKey('terms')) {
      return false;
    }
    if (l$terms != lOther$terms) {
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
    final l$partnerClubId = partnerClubId;
    final l$agreementType = agreementType;
    final l$effectiveDate = effectiveDate;
    final l$expirationDate = expirationDate;
    final l$terms = terms;
    final l$notes = notes;
    return Object.hashAll([
      l$partnerClubId,
      l$agreementType,
      _$data.containsKey('effectiveDate') ? l$effectiveDate : const {},
      _$data.containsKey('expirationDate') ? l$expirationDate : const {},
      _$data.containsKey('terms') ? l$terms : const {},
      _$data.containsKey('notes') ? l$notes : const {},
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
    Enum$AgreementType? agreementType,
    DateTime? effectiveDate,
    DateTime? expirationDate,
    Input$AgreementTermsInput? terms,
    String? notes,
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
    Object? agreementType = _undefined,
    Object? effectiveDate = _undefined,
    Object? expirationDate = _undefined,
    Object? terms = _undefined,
    Object? notes = _undefined,
  }) => _then(
    Input$CreateReciprocalAgreementInput._({
      ..._instance._$data,
      if (partnerClubId != _undefined && partnerClubId != null)
        'partnerClubId': (partnerClubId as String),
      if (agreementType != _undefined && agreementType != null)
        'agreementType': (agreementType as Enum$AgreementType),
      if (effectiveDate != _undefined)
        'effectiveDate': (effectiveDate as DateTime?),
      if (expirationDate != _undefined)
        'expirationDate': (expirationDate as DateTime?),
      if (terms != _undefined) 'terms': (terms as Input$AgreementTermsInput?),
      if (notes != _undefined) 'notes': (notes as String?),
    }),
  );

  CopyWith$Input$AgreementTermsInput<TRes> get terms {
    final local$terms = _instance.terms;
    return local$terms == null
        ? CopyWith$Input$AgreementTermsInput.stub(_then(_instance))
        : CopyWith$Input$AgreementTermsInput(
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
    Enum$AgreementType? agreementType,
    DateTime? effectiveDate,
    DateTime? expirationDate,
    Input$AgreementTermsInput? terms,
    String? notes,
  }) => _res;

  CopyWith$Input$AgreementTermsInput<TRes> get terms =>
      CopyWith$Input$AgreementTermsInput.stub(_res);
}

class Input$AgreementTermsInput {
  factory Input$AgreementTermsInput({
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    List<String>? blackoutDates,
    String? specialConditions,
  }) => Input$AgreementTermsInput._({
    if (maxVisitsPerMonth != null) r'maxVisitsPerMonth': maxVisitsPerMonth,
    if (reciprocalFee != null) r'reciprocalFee': reciprocalFee,
    if (blackoutDates != null) r'blackoutDates': blackoutDates,
    if (specialConditions != null) r'specialConditions': specialConditions,
  });

  Input$AgreementTermsInput._(this._$data);

  factory Input$AgreementTermsInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('maxVisitsPerMonth')) {
      final l$maxVisitsPerMonth = data['maxVisitsPerMonth'];
      result$data['maxVisitsPerMonth'] = (l$maxVisitsPerMonth as int?);
    }
    if (data.containsKey('reciprocalFee')) {
      final l$reciprocalFee = data['reciprocalFee'];
      result$data['reciprocalFee'] = (l$reciprocalFee as num?)?.toDouble();
    }
    if (data.containsKey('blackoutDates')) {
      final l$blackoutDates = data['blackoutDates'];
      result$data['blackoutDates'] = (l$blackoutDates as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('specialConditions')) {
      final l$specialConditions = data['specialConditions'];
      result$data['specialConditions'] = (l$specialConditions as String?);
    }
    return Input$AgreementTermsInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get maxVisitsPerMonth => (_$data['maxVisitsPerMonth'] as int?);

  double? get reciprocalFee => (_$data['reciprocalFee'] as double?);

  List<String>? get blackoutDates => (_$data['blackoutDates'] as List<String>?);

  String? get specialConditions => (_$data['specialConditions'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('maxVisitsPerMonth')) {
      final l$maxVisitsPerMonth = maxVisitsPerMonth;
      result$data['maxVisitsPerMonth'] = l$maxVisitsPerMonth;
    }
    if (_$data.containsKey('reciprocalFee')) {
      final l$reciprocalFee = reciprocalFee;
      result$data['reciprocalFee'] = l$reciprocalFee;
    }
    if (_$data.containsKey('blackoutDates')) {
      final l$blackoutDates = blackoutDates;
      result$data['blackoutDates'] = l$blackoutDates?.map((e) => e).toList();
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
      _$data.containsKey('maxVisitsPerMonth') ? l$maxVisitsPerMonth : const {},
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
    List<String>? blackoutDates,
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
      if (maxVisitsPerMonth != _undefined)
        'maxVisitsPerMonth': (maxVisitsPerMonth as int?),
      if (reciprocalFee != _undefined)
        'reciprocalFee': (reciprocalFee as double?),
      if (blackoutDates != _undefined)
        'blackoutDates': (blackoutDates as List<String>?),
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
    List<String>? blackoutDates,
    String? specialConditions,
  }) => _res;
}

class Input$CreateProposalInput {
  factory Input$CreateProposalInput({
    required String title,
    required String description,
    required Enum$ProposalType type,
    String? category,
    required DateTime votingStartTime,
    required DateTime votingEndTime,
    Enum$VotingMethod? votingMethod,
    required int quorumRequired,
    double? approvalThreshold,
    List<String>? attachments,
    String? notes,
  }) => Input$CreateProposalInput._({
    r'title': title,
    r'description': description,
    r'type': type,
    if (category != null) r'category': category,
    r'votingStartTime': votingStartTime,
    r'votingEndTime': votingEndTime,
    if (votingMethod != null) r'votingMethod': votingMethod,
    r'quorumRequired': quorumRequired,
    if (approvalThreshold != null) r'approvalThreshold': approvalThreshold,
    if (attachments != null) r'attachments': attachments,
    if (notes != null) r'notes': notes,
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
    if (data.containsKey('category')) {
      final l$category = data['category'];
      result$data['category'] = (l$category as String?);
    }
    final l$votingStartTime = data['votingStartTime'];
    result$data['votingStartTime'] = DateTime.parse(
      (l$votingStartTime as String),
    );
    final l$votingEndTime = data['votingEndTime'];
    result$data['votingEndTime'] = DateTime.parse((l$votingEndTime as String));
    if (data.containsKey('votingMethod')) {
      final l$votingMethod = data['votingMethod'];
      result$data['votingMethod'] = l$votingMethod == null
          ? null
          : fromJson$Enum$VotingMethod((l$votingMethod as String));
    }
    final l$quorumRequired = data['quorumRequired'];
    result$data['quorumRequired'] = (l$quorumRequired as int);
    if (data.containsKey('approvalThreshold')) {
      final l$approvalThreshold = data['approvalThreshold'];
      result$data['approvalThreshold'] = (l$approvalThreshold as num?)
          ?.toDouble();
    }
    if (data.containsKey('attachments')) {
      final l$attachments = data['attachments'];
      result$data['attachments'] = (l$attachments as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Input$CreateProposalInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get title => (_$data['title'] as String);

  String get description => (_$data['description'] as String);

  Enum$ProposalType get type => (_$data['type'] as Enum$ProposalType);

  String? get category => (_$data['category'] as String?);

  DateTime get votingStartTime => (_$data['votingStartTime'] as DateTime);

  DateTime get votingEndTime => (_$data['votingEndTime'] as DateTime);

  Enum$VotingMethod? get votingMethod =>
      (_$data['votingMethod'] as Enum$VotingMethod?);

  int get quorumRequired => (_$data['quorumRequired'] as int);

  double? get approvalThreshold => (_$data['approvalThreshold'] as double?);

  List<String>? get attachments => (_$data['attachments'] as List<String>?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$title = title;
    result$data['title'] = l$title;
    final l$description = description;
    result$data['description'] = l$description;
    final l$type = type;
    result$data['type'] = toJson$Enum$ProposalType(l$type);
    if (_$data.containsKey('category')) {
      final l$category = category;
      result$data['category'] = l$category;
    }
    final l$votingStartTime = votingStartTime;
    result$data['votingStartTime'] = l$votingStartTime.toIso8601String();
    final l$votingEndTime = votingEndTime;
    result$data['votingEndTime'] = l$votingEndTime.toIso8601String();
    if (_$data.containsKey('votingMethod')) {
      final l$votingMethod = votingMethod;
      result$data['votingMethod'] = l$votingMethod == null
          ? null
          : toJson$Enum$VotingMethod(l$votingMethod);
    }
    final l$quorumRequired = quorumRequired;
    result$data['quorumRequired'] = l$quorumRequired;
    if (_$data.containsKey('approvalThreshold')) {
      final l$approvalThreshold = approvalThreshold;
      result$data['approvalThreshold'] = l$approvalThreshold;
    }
    if (_$data.containsKey('attachments')) {
      final l$attachments = attachments;
      result$data['attachments'] = l$attachments?.map((e) => e).toList();
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
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
    final l$category = category;
    final lOther$category = other.category;
    if (_$data.containsKey('category') !=
        other._$data.containsKey('category')) {
      return false;
    }
    if (l$category != lOther$category) {
      return false;
    }
    final l$votingStartTime = votingStartTime;
    final lOther$votingStartTime = other.votingStartTime;
    if (l$votingStartTime != lOther$votingStartTime) {
      return false;
    }
    final l$votingEndTime = votingEndTime;
    final lOther$votingEndTime = other.votingEndTime;
    if (l$votingEndTime != lOther$votingEndTime) {
      return false;
    }
    final l$votingMethod = votingMethod;
    final lOther$votingMethod = other.votingMethod;
    if (_$data.containsKey('votingMethod') !=
        other._$data.containsKey('votingMethod')) {
      return false;
    }
    if (l$votingMethod != lOther$votingMethod) {
      return false;
    }
    final l$quorumRequired = quorumRequired;
    final lOther$quorumRequired = other.quorumRequired;
    if (l$quorumRequired != lOther$quorumRequired) {
      return false;
    }
    final l$approvalThreshold = approvalThreshold;
    final lOther$approvalThreshold = other.approvalThreshold;
    if (_$data.containsKey('approvalThreshold') !=
        other._$data.containsKey('approvalThreshold')) {
      return false;
    }
    if (l$approvalThreshold != lOther$approvalThreshold) {
      return false;
    }
    final l$attachments = attachments;
    final lOther$attachments = other.attachments;
    if (_$data.containsKey('attachments') !=
        other._$data.containsKey('attachments')) {
      return false;
    }
    if (l$attachments != null && lOther$attachments != null) {
      if (l$attachments.length != lOther$attachments.length) {
        return false;
      }
      for (int i = 0; i < l$attachments.length; i++) {
        final l$attachments$entry = l$attachments[i];
        final lOther$attachments$entry = lOther$attachments[i];
        if (l$attachments$entry != lOther$attachments$entry) {
          return false;
        }
      }
    } else if (l$attachments != lOther$attachments) {
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
    final l$title = title;
    final l$description = description;
    final l$type = type;
    final l$category = category;
    final l$votingStartTime = votingStartTime;
    final l$votingEndTime = votingEndTime;
    final l$votingMethod = votingMethod;
    final l$quorumRequired = quorumRequired;
    final l$approvalThreshold = approvalThreshold;
    final l$attachments = attachments;
    final l$notes = notes;
    return Object.hashAll([
      l$title,
      l$description,
      l$type,
      _$data.containsKey('category') ? l$category : const {},
      l$votingStartTime,
      l$votingEndTime,
      _$data.containsKey('votingMethod') ? l$votingMethod : const {},
      l$quorumRequired,
      _$data.containsKey('approvalThreshold') ? l$approvalThreshold : const {},
      _$data.containsKey('attachments')
          ? l$attachments == null
                ? null
                : Object.hashAll(l$attachments.map((v) => v))
          : const {},
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
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
    String? category,
    DateTime? votingStartTime,
    DateTime? votingEndTime,
    Enum$VotingMethod? votingMethod,
    int? quorumRequired,
    double? approvalThreshold,
    List<String>? attachments,
    String? notes,
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
    Object? category = _undefined,
    Object? votingStartTime = _undefined,
    Object? votingEndTime = _undefined,
    Object? votingMethod = _undefined,
    Object? quorumRequired = _undefined,
    Object? approvalThreshold = _undefined,
    Object? attachments = _undefined,
    Object? notes = _undefined,
  }) => _then(
    Input$CreateProposalInput._({
      ..._instance._$data,
      if (title != _undefined && title != null) 'title': (title as String),
      if (description != _undefined && description != null)
        'description': (description as String),
      if (type != _undefined && type != null)
        'type': (type as Enum$ProposalType),
      if (category != _undefined) 'category': (category as String?),
      if (votingStartTime != _undefined && votingStartTime != null)
        'votingStartTime': (votingStartTime as DateTime),
      if (votingEndTime != _undefined && votingEndTime != null)
        'votingEndTime': (votingEndTime as DateTime),
      if (votingMethod != _undefined)
        'votingMethod': (votingMethod as Enum$VotingMethod?),
      if (quorumRequired != _undefined && quorumRequired != null)
        'quorumRequired': (quorumRequired as int),
      if (approvalThreshold != _undefined)
        'approvalThreshold': (approvalThreshold as double?),
      if (attachments != _undefined)
        'attachments': (attachments as List<String>?),
      if (notes != _undefined) 'notes': (notes as String?),
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
    String? category,
    DateTime? votingStartTime,
    DateTime? votingEndTime,
    Enum$VotingMethod? votingMethod,
    int? quorumRequired,
    double? approvalThreshold,
    List<String>? attachments,
    String? notes,
  }) => _res;
}

class Input$UpdateProposalInput {
  factory Input$UpdateProposalInput({
    String? title,
    String? description,
    String? category,
    DateTime? votingStartTime,
    DateTime? votingEndTime,
    Enum$VotingMethod? votingMethod,
    int? quorumRequired,
    double? approvalThreshold,
    List<String>? attachments,
    String? notes,
    String? resolutionNotes,
  }) => Input$UpdateProposalInput._({
    if (title != null) r'title': title,
    if (description != null) r'description': description,
    if (category != null) r'category': category,
    if (votingStartTime != null) r'votingStartTime': votingStartTime,
    if (votingEndTime != null) r'votingEndTime': votingEndTime,
    if (votingMethod != null) r'votingMethod': votingMethod,
    if (quorumRequired != null) r'quorumRequired': quorumRequired,
    if (approvalThreshold != null) r'approvalThreshold': approvalThreshold,
    if (attachments != null) r'attachments': attachments,
    if (notes != null) r'notes': notes,
    if (resolutionNotes != null) r'resolutionNotes': resolutionNotes,
  });

  Input$UpdateProposalInput._(this._$data);

  factory Input$UpdateProposalInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('category')) {
      final l$category = data['category'];
      result$data['category'] = (l$category as String?);
    }
    if (data.containsKey('votingStartTime')) {
      final l$votingStartTime = data['votingStartTime'];
      result$data['votingStartTime'] = l$votingStartTime == null
          ? null
          : DateTime.parse((l$votingStartTime as String));
    }
    if (data.containsKey('votingEndTime')) {
      final l$votingEndTime = data['votingEndTime'];
      result$data['votingEndTime'] = l$votingEndTime == null
          ? null
          : DateTime.parse((l$votingEndTime as String));
    }
    if (data.containsKey('votingMethod')) {
      final l$votingMethod = data['votingMethod'];
      result$data['votingMethod'] = l$votingMethod == null
          ? null
          : fromJson$Enum$VotingMethod((l$votingMethod as String));
    }
    if (data.containsKey('quorumRequired')) {
      final l$quorumRequired = data['quorumRequired'];
      result$data['quorumRequired'] = (l$quorumRequired as int?);
    }
    if (data.containsKey('approvalThreshold')) {
      final l$approvalThreshold = data['approvalThreshold'];
      result$data['approvalThreshold'] = (l$approvalThreshold as num?)
          ?.toDouble();
    }
    if (data.containsKey('attachments')) {
      final l$attachments = data['attachments'];
      result$data['attachments'] = (l$attachments as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    if (data.containsKey('resolutionNotes')) {
      final l$resolutionNotes = data['resolutionNotes'];
      result$data['resolutionNotes'] = (l$resolutionNotes as String?);
    }
    return Input$UpdateProposalInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get title => (_$data['title'] as String?);

  String? get description => (_$data['description'] as String?);

  String? get category => (_$data['category'] as String?);

  DateTime? get votingStartTime => (_$data['votingStartTime'] as DateTime?);

  DateTime? get votingEndTime => (_$data['votingEndTime'] as DateTime?);

  Enum$VotingMethod? get votingMethod =>
      (_$data['votingMethod'] as Enum$VotingMethod?);

  int? get quorumRequired => (_$data['quorumRequired'] as int?);

  double? get approvalThreshold => (_$data['approvalThreshold'] as double?);

  List<String>? get attachments => (_$data['attachments'] as List<String>?);

  String? get notes => (_$data['notes'] as String?);

  String? get resolutionNotes => (_$data['resolutionNotes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('category')) {
      final l$category = category;
      result$data['category'] = l$category;
    }
    if (_$data.containsKey('votingStartTime')) {
      final l$votingStartTime = votingStartTime;
      result$data['votingStartTime'] = l$votingStartTime?.toIso8601String();
    }
    if (_$data.containsKey('votingEndTime')) {
      final l$votingEndTime = votingEndTime;
      result$data['votingEndTime'] = l$votingEndTime?.toIso8601String();
    }
    if (_$data.containsKey('votingMethod')) {
      final l$votingMethod = votingMethod;
      result$data['votingMethod'] = l$votingMethod == null
          ? null
          : toJson$Enum$VotingMethod(l$votingMethod);
    }
    if (_$data.containsKey('quorumRequired')) {
      final l$quorumRequired = quorumRequired;
      result$data['quorumRequired'] = l$quorumRequired;
    }
    if (_$data.containsKey('approvalThreshold')) {
      final l$approvalThreshold = approvalThreshold;
      result$data['approvalThreshold'] = l$approvalThreshold;
    }
    if (_$data.containsKey('attachments')) {
      final l$attachments = attachments;
      result$data['attachments'] = l$attachments?.map((e) => e).toList();
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    if (_$data.containsKey('resolutionNotes')) {
      final l$resolutionNotes = resolutionNotes;
      result$data['resolutionNotes'] = l$resolutionNotes;
    }
    return result$data;
  }

  CopyWith$Input$UpdateProposalInput<Input$UpdateProposalInput> get copyWith =>
      CopyWith$Input$UpdateProposalInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateProposalInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
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
    final l$category = category;
    final lOther$category = other.category;
    if (_$data.containsKey('category') !=
        other._$data.containsKey('category')) {
      return false;
    }
    if (l$category != lOther$category) {
      return false;
    }
    final l$votingStartTime = votingStartTime;
    final lOther$votingStartTime = other.votingStartTime;
    if (_$data.containsKey('votingStartTime') !=
        other._$data.containsKey('votingStartTime')) {
      return false;
    }
    if (l$votingStartTime != lOther$votingStartTime) {
      return false;
    }
    final l$votingEndTime = votingEndTime;
    final lOther$votingEndTime = other.votingEndTime;
    if (_$data.containsKey('votingEndTime') !=
        other._$data.containsKey('votingEndTime')) {
      return false;
    }
    if (l$votingEndTime != lOther$votingEndTime) {
      return false;
    }
    final l$votingMethod = votingMethod;
    final lOther$votingMethod = other.votingMethod;
    if (_$data.containsKey('votingMethod') !=
        other._$data.containsKey('votingMethod')) {
      return false;
    }
    if (l$votingMethod != lOther$votingMethod) {
      return false;
    }
    final l$quorumRequired = quorumRequired;
    final lOther$quorumRequired = other.quorumRequired;
    if (_$data.containsKey('quorumRequired') !=
        other._$data.containsKey('quorumRequired')) {
      return false;
    }
    if (l$quorumRequired != lOther$quorumRequired) {
      return false;
    }
    final l$approvalThreshold = approvalThreshold;
    final lOther$approvalThreshold = other.approvalThreshold;
    if (_$data.containsKey('approvalThreshold') !=
        other._$data.containsKey('approvalThreshold')) {
      return false;
    }
    if (l$approvalThreshold != lOther$approvalThreshold) {
      return false;
    }
    final l$attachments = attachments;
    final lOther$attachments = other.attachments;
    if (_$data.containsKey('attachments') !=
        other._$data.containsKey('attachments')) {
      return false;
    }
    if (l$attachments != null && lOther$attachments != null) {
      if (l$attachments.length != lOther$attachments.length) {
        return false;
      }
      for (int i = 0; i < l$attachments.length; i++) {
        final l$attachments$entry = l$attachments[i];
        final lOther$attachments$entry = lOther$attachments[i];
        if (l$attachments$entry != lOther$attachments$entry) {
          return false;
        }
      }
    } else if (l$attachments != lOther$attachments) {
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
    final l$resolutionNotes = resolutionNotes;
    final lOther$resolutionNotes = other.resolutionNotes;
    if (_$data.containsKey('resolutionNotes') !=
        other._$data.containsKey('resolutionNotes')) {
      return false;
    }
    if (l$resolutionNotes != lOther$resolutionNotes) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$description = description;
    final l$category = category;
    final l$votingStartTime = votingStartTime;
    final l$votingEndTime = votingEndTime;
    final l$votingMethod = votingMethod;
    final l$quorumRequired = quorumRequired;
    final l$approvalThreshold = approvalThreshold;
    final l$attachments = attachments;
    final l$notes = notes;
    final l$resolutionNotes = resolutionNotes;
    return Object.hashAll([
      _$data.containsKey('title') ? l$title : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('category') ? l$category : const {},
      _$data.containsKey('votingStartTime') ? l$votingStartTime : const {},
      _$data.containsKey('votingEndTime') ? l$votingEndTime : const {},
      _$data.containsKey('votingMethod') ? l$votingMethod : const {},
      _$data.containsKey('quorumRequired') ? l$quorumRequired : const {},
      _$data.containsKey('approvalThreshold') ? l$approvalThreshold : const {},
      _$data.containsKey('attachments')
          ? l$attachments == null
                ? null
                : Object.hashAll(l$attachments.map((v) => v))
          : const {},
      _$data.containsKey('notes') ? l$notes : const {},
      _$data.containsKey('resolutionNotes') ? l$resolutionNotes : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateProposalInput<TRes> {
  factory CopyWith$Input$UpdateProposalInput(
    Input$UpdateProposalInput instance,
    TRes Function(Input$UpdateProposalInput) then,
  ) = _CopyWithImpl$Input$UpdateProposalInput;

  factory CopyWith$Input$UpdateProposalInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateProposalInput;

  TRes call({
    String? title,
    String? description,
    String? category,
    DateTime? votingStartTime,
    DateTime? votingEndTime,
    Enum$VotingMethod? votingMethod,
    int? quorumRequired,
    double? approvalThreshold,
    List<String>? attachments,
    String? notes,
    String? resolutionNotes,
  });
}

class _CopyWithImpl$Input$UpdateProposalInput<TRes>
    implements CopyWith$Input$UpdateProposalInput<TRes> {
  _CopyWithImpl$Input$UpdateProposalInput(this._instance, this._then);

  final Input$UpdateProposalInput _instance;

  final TRes Function(Input$UpdateProposalInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? description = _undefined,
    Object? category = _undefined,
    Object? votingStartTime = _undefined,
    Object? votingEndTime = _undefined,
    Object? votingMethod = _undefined,
    Object? quorumRequired = _undefined,
    Object? approvalThreshold = _undefined,
    Object? attachments = _undefined,
    Object? notes = _undefined,
    Object? resolutionNotes = _undefined,
  }) => _then(
    Input$UpdateProposalInput._({
      ..._instance._$data,
      if (title != _undefined) 'title': (title as String?),
      if (description != _undefined) 'description': (description as String?),
      if (category != _undefined) 'category': (category as String?),
      if (votingStartTime != _undefined)
        'votingStartTime': (votingStartTime as DateTime?),
      if (votingEndTime != _undefined)
        'votingEndTime': (votingEndTime as DateTime?),
      if (votingMethod != _undefined)
        'votingMethod': (votingMethod as Enum$VotingMethod?),
      if (quorumRequired != _undefined)
        'quorumRequired': (quorumRequired as int?),
      if (approvalThreshold != _undefined)
        'approvalThreshold': (approvalThreshold as double?),
      if (attachments != _undefined)
        'attachments': (attachments as List<String>?),
      if (notes != _undefined) 'notes': (notes as String?),
      if (resolutionNotes != _undefined)
        'resolutionNotes': (resolutionNotes as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateProposalInput<TRes>
    implements CopyWith$Input$UpdateProposalInput<TRes> {
  _CopyWithStubImpl$Input$UpdateProposalInput(this._res);

  TRes _res;

  call({
    String? title,
    String? description,
    String? category,
    DateTime? votingStartTime,
    DateTime? votingEndTime,
    Enum$VotingMethod? votingMethod,
    int? quorumRequired,
    double? approvalThreshold,
    List<String>? attachments,
    String? notes,
    String? resolutionNotes,
  }) => _res;
}

class Input$CastVoteInput {
  factory Input$CastVoteInput({
    required String proposalId,
    required Enum$VoteChoice voteValue,
    String? comments,
    bool? isAnonymous,
  }) => Input$CastVoteInput._({
    r'proposalId': proposalId,
    r'voteValue': voteValue,
    if (comments != null) r'comments': comments,
    if (isAnonymous != null) r'isAnonymous': isAnonymous,
  });

  Input$CastVoteInput._(this._$data);

  factory Input$CastVoteInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$proposalId = data['proposalId'];
    result$data['proposalId'] = (l$proposalId as String);
    final l$voteValue = data['voteValue'];
    result$data['voteValue'] = fromJson$Enum$VoteChoice(
      (l$voteValue as String),
    );
    if (data.containsKey('comments')) {
      final l$comments = data['comments'];
      result$data['comments'] = (l$comments as String?);
    }
    if (data.containsKey('isAnonymous')) {
      final l$isAnonymous = data['isAnonymous'];
      result$data['isAnonymous'] = (l$isAnonymous as bool?);
    }
    return Input$CastVoteInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get proposalId => (_$data['proposalId'] as String);

  Enum$VoteChoice get voteValue => (_$data['voteValue'] as Enum$VoteChoice);

  String? get comments => (_$data['comments'] as String?);

  bool? get isAnonymous => (_$data['isAnonymous'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$proposalId = proposalId;
    result$data['proposalId'] = l$proposalId;
    final l$voteValue = voteValue;
    result$data['voteValue'] = toJson$Enum$VoteChoice(l$voteValue);
    if (_$data.containsKey('comments')) {
      final l$comments = comments;
      result$data['comments'] = l$comments;
    }
    if (_$data.containsKey('isAnonymous')) {
      final l$isAnonymous = isAnonymous;
      result$data['isAnonymous'] = l$isAnonymous;
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
    final l$voteValue = voteValue;
    final lOther$voteValue = other.voteValue;
    if (l$voteValue != lOther$voteValue) {
      return false;
    }
    final l$comments = comments;
    final lOther$comments = other.comments;
    if (_$data.containsKey('comments') !=
        other._$data.containsKey('comments')) {
      return false;
    }
    if (l$comments != lOther$comments) {
      return false;
    }
    final l$isAnonymous = isAnonymous;
    final lOther$isAnonymous = other.isAnonymous;
    if (_$data.containsKey('isAnonymous') !=
        other._$data.containsKey('isAnonymous')) {
      return false;
    }
    if (l$isAnonymous != lOther$isAnonymous) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$proposalId = proposalId;
    final l$voteValue = voteValue;
    final l$comments = comments;
    final l$isAnonymous = isAnonymous;
    return Object.hashAll([
      l$proposalId,
      l$voteValue,
      _$data.containsKey('comments') ? l$comments : const {},
      _$data.containsKey('isAnonymous') ? l$isAnonymous : const {},
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

  TRes call({
    String? proposalId,
    Enum$VoteChoice? voteValue,
    String? comments,
    bool? isAnonymous,
  });
}

class _CopyWithImpl$Input$CastVoteInput<TRes>
    implements CopyWith$Input$CastVoteInput<TRes> {
  _CopyWithImpl$Input$CastVoteInput(this._instance, this._then);

  final Input$CastVoteInput _instance;

  final TRes Function(Input$CastVoteInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? proposalId = _undefined,
    Object? voteValue = _undefined,
    Object? comments = _undefined,
    Object? isAnonymous = _undefined,
  }) => _then(
    Input$CastVoteInput._({
      ..._instance._$data,
      if (proposalId != _undefined && proposalId != null)
        'proposalId': (proposalId as String),
      if (voteValue != _undefined && voteValue != null)
        'voteValue': (voteValue as Enum$VoteChoice),
      if (comments != _undefined) 'comments': (comments as String?),
      if (isAnonymous != _undefined) 'isAnonymous': (isAnonymous as bool?),
    }),
  );
}

class _CopyWithStubImpl$Input$CastVoteInput<TRes>
    implements CopyWith$Input$CastVoteInput<TRes> {
  _CopyWithStubImpl$Input$CastVoteInput(this._res);

  TRes _res;

  call({
    String? proposalId,
    Enum$VoteChoice? voteValue,
    String? comments,
    bool? isAnonymous,
  }) => _res;
}

class Input$CreatePolicyInput {
  factory Input$CreatePolicyInput({
    required String name,
    String? description,
    required Enum$PolicyCategory category,
    required String content,
    required String version,
    required DateTime effectiveDate,
    DateTime? expiryDate,
    bool? requiresAcknowledgment,
    List<String>? attachments,
  }) => Input$CreatePolicyInput._({
    r'name': name,
    if (description != null) r'description': description,
    r'category': category,
    r'content': content,
    r'version': version,
    r'effectiveDate': effectiveDate,
    if (expiryDate != null) r'expiryDate': expiryDate,
    if (requiresAcknowledgment != null)
      r'requiresAcknowledgment': requiresAcknowledgment,
    if (attachments != null) r'attachments': attachments,
  });

  Input$CreatePolicyInput._(this._$data);

  factory Input$CreatePolicyInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    final l$category = data['category'];
    result$data['category'] = fromJson$Enum$PolicyCategory(
      (l$category as String),
    );
    final l$content = data['content'];
    result$data['content'] = (l$content as String);
    final l$version = data['version'];
    result$data['version'] = (l$version as String);
    final l$effectiveDate = data['effectiveDate'];
    result$data['effectiveDate'] = DateTime.parse((l$effectiveDate as String));
    if (data.containsKey('expiryDate')) {
      final l$expiryDate = data['expiryDate'];
      result$data['expiryDate'] = l$expiryDate == null
          ? null
          : DateTime.parse((l$expiryDate as String));
    }
    if (data.containsKey('requiresAcknowledgment')) {
      final l$requiresAcknowledgment = data['requiresAcknowledgment'];
      result$data['requiresAcknowledgment'] =
          (l$requiresAcknowledgment as bool?);
    }
    if (data.containsKey('attachments')) {
      final l$attachments = data['attachments'];
      result$data['attachments'] = (l$attachments as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    return Input$CreatePolicyInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String? get description => (_$data['description'] as String?);

  Enum$PolicyCategory get category =>
      (_$data['category'] as Enum$PolicyCategory);

  String get content => (_$data['content'] as String);

  String get version => (_$data['version'] as String);

  DateTime get effectiveDate => (_$data['effectiveDate'] as DateTime);

  DateTime? get expiryDate => (_$data['expiryDate'] as DateTime?);

  bool? get requiresAcknowledgment =>
      (_$data['requiresAcknowledgment'] as bool?);

  List<String>? get attachments => (_$data['attachments'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    final l$category = category;
    result$data['category'] = toJson$Enum$PolicyCategory(l$category);
    final l$content = content;
    result$data['content'] = l$content;
    final l$version = version;
    result$data['version'] = l$version;
    final l$effectiveDate = effectiveDate;
    result$data['effectiveDate'] = l$effectiveDate.toIso8601String();
    if (_$data.containsKey('expiryDate')) {
      final l$expiryDate = expiryDate;
      result$data['expiryDate'] = l$expiryDate?.toIso8601String();
    }
    if (_$data.containsKey('requiresAcknowledgment')) {
      final l$requiresAcknowledgment = requiresAcknowledgment;
      result$data['requiresAcknowledgment'] = l$requiresAcknowledgment;
    }
    if (_$data.containsKey('attachments')) {
      final l$attachments = attachments;
      result$data['attachments'] = l$attachments?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$CreatePolicyInput<Input$CreatePolicyInput> get copyWith =>
      CopyWith$Input$CreatePolicyInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreatePolicyInput || runtimeType != other.runtimeType) {
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
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$version = version;
    final lOther$version = other.version;
    if (l$version != lOther$version) {
      return false;
    }
    final l$effectiveDate = effectiveDate;
    final lOther$effectiveDate = other.effectiveDate;
    if (l$effectiveDate != lOther$effectiveDate) {
      return false;
    }
    final l$expiryDate = expiryDate;
    final lOther$expiryDate = other.expiryDate;
    if (_$data.containsKey('expiryDate') !=
        other._$data.containsKey('expiryDate')) {
      return false;
    }
    if (l$expiryDate != lOther$expiryDate) {
      return false;
    }
    final l$requiresAcknowledgment = requiresAcknowledgment;
    final lOther$requiresAcknowledgment = other.requiresAcknowledgment;
    if (_$data.containsKey('requiresAcknowledgment') !=
        other._$data.containsKey('requiresAcknowledgment')) {
      return false;
    }
    if (l$requiresAcknowledgment != lOther$requiresAcknowledgment) {
      return false;
    }
    final l$attachments = attachments;
    final lOther$attachments = other.attachments;
    if (_$data.containsKey('attachments') !=
        other._$data.containsKey('attachments')) {
      return false;
    }
    if (l$attachments != null && lOther$attachments != null) {
      if (l$attachments.length != lOther$attachments.length) {
        return false;
      }
      for (int i = 0; i < l$attachments.length; i++) {
        final l$attachments$entry = l$attachments[i];
        final lOther$attachments$entry = lOther$attachments[i];
        if (l$attachments$entry != lOther$attachments$entry) {
          return false;
        }
      }
    } else if (l$attachments != lOther$attachments) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$category = category;
    final l$content = content;
    final l$version = version;
    final l$effectiveDate = effectiveDate;
    final l$expiryDate = expiryDate;
    final l$requiresAcknowledgment = requiresAcknowledgment;
    final l$attachments = attachments;
    return Object.hashAll([
      l$name,
      _$data.containsKey('description') ? l$description : const {},
      l$category,
      l$content,
      l$version,
      l$effectiveDate,
      _$data.containsKey('expiryDate') ? l$expiryDate : const {},
      _$data.containsKey('requiresAcknowledgment')
          ? l$requiresAcknowledgment
          : const {},
      _$data.containsKey('attachments')
          ? l$attachments == null
                ? null
                : Object.hashAll(l$attachments.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreatePolicyInput<TRes> {
  factory CopyWith$Input$CreatePolicyInput(
    Input$CreatePolicyInput instance,
    TRes Function(Input$CreatePolicyInput) then,
  ) = _CopyWithImpl$Input$CreatePolicyInput;

  factory CopyWith$Input$CreatePolicyInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreatePolicyInput;

  TRes call({
    String? name,
    String? description,
    Enum$PolicyCategory? category,
    String? content,
    String? version,
    DateTime? effectiveDate,
    DateTime? expiryDate,
    bool? requiresAcknowledgment,
    List<String>? attachments,
  });
}

class _CopyWithImpl$Input$CreatePolicyInput<TRes>
    implements CopyWith$Input$CreatePolicyInput<TRes> {
  _CopyWithImpl$Input$CreatePolicyInput(this._instance, this._then);

  final Input$CreatePolicyInput _instance;

  final TRes Function(Input$CreatePolicyInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? category = _undefined,
    Object? content = _undefined,
    Object? version = _undefined,
    Object? effectiveDate = _undefined,
    Object? expiryDate = _undefined,
    Object? requiresAcknowledgment = _undefined,
    Object? attachments = _undefined,
  }) => _then(
    Input$CreatePolicyInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (description != _undefined) 'description': (description as String?),
      if (category != _undefined && category != null)
        'category': (category as Enum$PolicyCategory),
      if (content != _undefined && content != null)
        'content': (content as String),
      if (version != _undefined && version != null)
        'version': (version as String),
      if (effectiveDate != _undefined && effectiveDate != null)
        'effectiveDate': (effectiveDate as DateTime),
      if (expiryDate != _undefined) 'expiryDate': (expiryDate as DateTime?),
      if (requiresAcknowledgment != _undefined)
        'requiresAcknowledgment': (requiresAcknowledgment as bool?),
      if (attachments != _undefined)
        'attachments': (attachments as List<String>?),
    }),
  );
}

class _CopyWithStubImpl$Input$CreatePolicyInput<TRes>
    implements CopyWith$Input$CreatePolicyInput<TRes> {
  _CopyWithStubImpl$Input$CreatePolicyInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    Enum$PolicyCategory? category,
    String? content,
    String? version,
    DateTime? effectiveDate,
    DateTime? expiryDate,
    bool? requiresAcknowledgment,
    List<String>? attachments,
  }) => _res;
}

class Input$UpdatePolicyInput {
  factory Input$UpdatePolicyInput({
    String? name,
    String? description,
    Enum$PolicyCategory? category,
    String? content,
    String? version,
    DateTime? effectiveDate,
    DateTime? expiryDate,
    bool? isActive,
    bool? requiresAcknowledgment,
    List<String>? attachments,
  }) => Input$UpdatePolicyInput._({
    if (name != null) r'name': name,
    if (description != null) r'description': description,
    if (category != null) r'category': category,
    if (content != null) r'content': content,
    if (version != null) r'version': version,
    if (effectiveDate != null) r'effectiveDate': effectiveDate,
    if (expiryDate != null) r'expiryDate': expiryDate,
    if (isActive != null) r'isActive': isActive,
    if (requiresAcknowledgment != null)
      r'requiresAcknowledgment': requiresAcknowledgment,
    if (attachments != null) r'attachments': attachments,
  });

  Input$UpdatePolicyInput._(this._$data);

  factory Input$UpdatePolicyInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('category')) {
      final l$category = data['category'];
      result$data['category'] = l$category == null
          ? null
          : fromJson$Enum$PolicyCategory((l$category as String));
    }
    if (data.containsKey('content')) {
      final l$content = data['content'];
      result$data['content'] = (l$content as String?);
    }
    if (data.containsKey('version')) {
      final l$version = data['version'];
      result$data['version'] = (l$version as String?);
    }
    if (data.containsKey('effectiveDate')) {
      final l$effectiveDate = data['effectiveDate'];
      result$data['effectiveDate'] = l$effectiveDate == null
          ? null
          : DateTime.parse((l$effectiveDate as String));
    }
    if (data.containsKey('expiryDate')) {
      final l$expiryDate = data['expiryDate'];
      result$data['expiryDate'] = l$expiryDate == null
          ? null
          : DateTime.parse((l$expiryDate as String));
    }
    if (data.containsKey('isActive')) {
      final l$isActive = data['isActive'];
      result$data['isActive'] = (l$isActive as bool?);
    }
    if (data.containsKey('requiresAcknowledgment')) {
      final l$requiresAcknowledgment = data['requiresAcknowledgment'];
      result$data['requiresAcknowledgment'] =
          (l$requiresAcknowledgment as bool?);
    }
    if (data.containsKey('attachments')) {
      final l$attachments = data['attachments'];
      result$data['attachments'] = (l$attachments as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    return Input$UpdatePolicyInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get description => (_$data['description'] as String?);

  Enum$PolicyCategory? get category =>
      (_$data['category'] as Enum$PolicyCategory?);

  String? get content => (_$data['content'] as String?);

  String? get version => (_$data['version'] as String?);

  DateTime? get effectiveDate => (_$data['effectiveDate'] as DateTime?);

  DateTime? get expiryDate => (_$data['expiryDate'] as DateTime?);

  bool? get isActive => (_$data['isActive'] as bool?);

  bool? get requiresAcknowledgment =>
      (_$data['requiresAcknowledgment'] as bool?);

  List<String>? get attachments => (_$data['attachments'] as List<String>?);

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
    if (_$data.containsKey('category')) {
      final l$category = category;
      result$data['category'] = l$category == null
          ? null
          : toJson$Enum$PolicyCategory(l$category);
    }
    if (_$data.containsKey('content')) {
      final l$content = content;
      result$data['content'] = l$content;
    }
    if (_$data.containsKey('version')) {
      final l$version = version;
      result$data['version'] = l$version;
    }
    if (_$data.containsKey('effectiveDate')) {
      final l$effectiveDate = effectiveDate;
      result$data['effectiveDate'] = l$effectiveDate?.toIso8601String();
    }
    if (_$data.containsKey('expiryDate')) {
      final l$expiryDate = expiryDate;
      result$data['expiryDate'] = l$expiryDate?.toIso8601String();
    }
    if (_$data.containsKey('isActive')) {
      final l$isActive = isActive;
      result$data['isActive'] = l$isActive;
    }
    if (_$data.containsKey('requiresAcknowledgment')) {
      final l$requiresAcknowledgment = requiresAcknowledgment;
      result$data['requiresAcknowledgment'] = l$requiresAcknowledgment;
    }
    if (_$data.containsKey('attachments')) {
      final l$attachments = attachments;
      result$data['attachments'] = l$attachments?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$UpdatePolicyInput<Input$UpdatePolicyInput> get copyWith =>
      CopyWith$Input$UpdatePolicyInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdatePolicyInput || runtimeType != other.runtimeType) {
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
    final l$category = category;
    final lOther$category = other.category;
    if (_$data.containsKey('category') !=
        other._$data.containsKey('category')) {
      return false;
    }
    if (l$category != lOther$category) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (_$data.containsKey('content') != other._$data.containsKey('content')) {
      return false;
    }
    if (l$content != lOther$content) {
      return false;
    }
    final l$version = version;
    final lOther$version = other.version;
    if (_$data.containsKey('version') != other._$data.containsKey('version')) {
      return false;
    }
    if (l$version != lOther$version) {
      return false;
    }
    final l$effectiveDate = effectiveDate;
    final lOther$effectiveDate = other.effectiveDate;
    if (_$data.containsKey('effectiveDate') !=
        other._$data.containsKey('effectiveDate')) {
      return false;
    }
    if (l$effectiveDate != lOther$effectiveDate) {
      return false;
    }
    final l$expiryDate = expiryDate;
    final lOther$expiryDate = other.expiryDate;
    if (_$data.containsKey('expiryDate') !=
        other._$data.containsKey('expiryDate')) {
      return false;
    }
    if (l$expiryDate != lOther$expiryDate) {
      return false;
    }
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (_$data.containsKey('isActive') !=
        other._$data.containsKey('isActive')) {
      return false;
    }
    if (l$isActive != lOther$isActive) {
      return false;
    }
    final l$requiresAcknowledgment = requiresAcknowledgment;
    final lOther$requiresAcknowledgment = other.requiresAcknowledgment;
    if (_$data.containsKey('requiresAcknowledgment') !=
        other._$data.containsKey('requiresAcknowledgment')) {
      return false;
    }
    if (l$requiresAcknowledgment != lOther$requiresAcknowledgment) {
      return false;
    }
    final l$attachments = attachments;
    final lOther$attachments = other.attachments;
    if (_$data.containsKey('attachments') !=
        other._$data.containsKey('attachments')) {
      return false;
    }
    if (l$attachments != null && lOther$attachments != null) {
      if (l$attachments.length != lOther$attachments.length) {
        return false;
      }
      for (int i = 0; i < l$attachments.length; i++) {
        final l$attachments$entry = l$attachments[i];
        final lOther$attachments$entry = lOther$attachments[i];
        if (l$attachments$entry != lOther$attachments$entry) {
          return false;
        }
      }
    } else if (l$attachments != lOther$attachments) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$category = category;
    final l$content = content;
    final l$version = version;
    final l$effectiveDate = effectiveDate;
    final l$expiryDate = expiryDate;
    final l$isActive = isActive;
    final l$requiresAcknowledgment = requiresAcknowledgment;
    final l$attachments = attachments;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('category') ? l$category : const {},
      _$data.containsKey('content') ? l$content : const {},
      _$data.containsKey('version') ? l$version : const {},
      _$data.containsKey('effectiveDate') ? l$effectiveDate : const {},
      _$data.containsKey('expiryDate') ? l$expiryDate : const {},
      _$data.containsKey('isActive') ? l$isActive : const {},
      _$data.containsKey('requiresAcknowledgment')
          ? l$requiresAcknowledgment
          : const {},
      _$data.containsKey('attachments')
          ? l$attachments == null
                ? null
                : Object.hashAll(l$attachments.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdatePolicyInput<TRes> {
  factory CopyWith$Input$UpdatePolicyInput(
    Input$UpdatePolicyInput instance,
    TRes Function(Input$UpdatePolicyInput) then,
  ) = _CopyWithImpl$Input$UpdatePolicyInput;

  factory CopyWith$Input$UpdatePolicyInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdatePolicyInput;

  TRes call({
    String? name,
    String? description,
    Enum$PolicyCategory? category,
    String? content,
    String? version,
    DateTime? effectiveDate,
    DateTime? expiryDate,
    bool? isActive,
    bool? requiresAcknowledgment,
    List<String>? attachments,
  });
}

class _CopyWithImpl$Input$UpdatePolicyInput<TRes>
    implements CopyWith$Input$UpdatePolicyInput<TRes> {
  _CopyWithImpl$Input$UpdatePolicyInput(this._instance, this._then);

  final Input$UpdatePolicyInput _instance;

  final TRes Function(Input$UpdatePolicyInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? category = _undefined,
    Object? content = _undefined,
    Object? version = _undefined,
    Object? effectiveDate = _undefined,
    Object? expiryDate = _undefined,
    Object? isActive = _undefined,
    Object? requiresAcknowledgment = _undefined,
    Object? attachments = _undefined,
  }) => _then(
    Input$UpdatePolicyInput._({
      ..._instance._$data,
      if (name != _undefined) 'name': (name as String?),
      if (description != _undefined) 'description': (description as String?),
      if (category != _undefined)
        'category': (category as Enum$PolicyCategory?),
      if (content != _undefined) 'content': (content as String?),
      if (version != _undefined) 'version': (version as String?),
      if (effectiveDate != _undefined)
        'effectiveDate': (effectiveDate as DateTime?),
      if (expiryDate != _undefined) 'expiryDate': (expiryDate as DateTime?),
      if (isActive != _undefined) 'isActive': (isActive as bool?),
      if (requiresAcknowledgment != _undefined)
        'requiresAcknowledgment': (requiresAcknowledgment as bool?),
      if (attachments != _undefined)
        'attachments': (attachments as List<String>?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdatePolicyInput<TRes>
    implements CopyWith$Input$UpdatePolicyInput<TRes> {
  _CopyWithStubImpl$Input$UpdatePolicyInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    Enum$PolicyCategory? category,
    String? content,
    String? version,
    DateTime? effectiveDate,
    DateTime? expiryDate,
    bool? isActive,
    bool? requiresAcknowledgment,
    List<String>? attachments,
  }) => _res;
}

class Input$EmergencyContactInput {
  factory Input$EmergencyContactInput({
    required String name,
    required String relationship,
    required String phone,
    String? email,
  }) => Input$EmergencyContactInput._({
    r'name': name,
    r'relationship': relationship,
    r'phone': phone,
    if (email != null) r'email': email,
  });

  Input$EmergencyContactInput._(this._$data);

  factory Input$EmergencyContactInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$relationship = data['relationship'];
    result$data['relationship'] = (l$relationship as String);
    final l$phone = data['phone'];
    result$data['phone'] = (l$phone as String);
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    return Input$EmergencyContactInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String get relationship => (_$data['relationship'] as String);

  String get phone => (_$data['phone'] as String);

  String? get email => (_$data['email'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$relationship = relationship;
    result$data['relationship'] = l$relationship;
    final l$phone = phone;
    result$data['phone'] = l$phone;
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
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
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$relationship = relationship;
    final l$phone = phone;
    final l$email = email;
    return Object.hashAll([
      l$name,
      l$relationship,
      l$phone,
      _$data.containsKey('email') ? l$email : const {},
    ]);
  }
}

abstract class CopyWith$Input$EmergencyContactInput<TRes> {
  factory CopyWith$Input$EmergencyContactInput(
    Input$EmergencyContactInput instance,
    TRes Function(Input$EmergencyContactInput) then,
  ) = _CopyWithImpl$Input$EmergencyContactInput;

  factory CopyWith$Input$EmergencyContactInput.stub(TRes res) =
      _CopyWithStubImpl$Input$EmergencyContactInput;

  TRes call({String? name, String? relationship, String? phone, String? email});
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
    Object? phone = _undefined,
    Object? email = _undefined,
  }) => _then(
    Input$EmergencyContactInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (relationship != _undefined && relationship != null)
        'relationship': (relationship as String),
      if (phone != _undefined && phone != null) 'phone': (phone as String),
      if (email != _undefined) 'email': (email as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$EmergencyContactInput<TRes>
    implements CopyWith$Input$EmergencyContactInput<TRes> {
  _CopyWithStubImpl$Input$EmergencyContactInput(this._res);

  TRes _res;

  call({String? name, String? relationship, String? phone, String? email}) =>
      _res;
}

class Input$MemberPreferencesInput {
  factory Input$MemberPreferencesInput({
    bool? receiveNewsletter,
    bool? receivePromotions,
    bool? allowDataSharing,
    String? preferredLanguage,
    List<String>? dietaryRestrictions,
    List<String>? interests,
  }) => Input$MemberPreferencesInput._({
    if (receiveNewsletter != null) r'receiveNewsletter': receiveNewsletter,
    if (receivePromotions != null) r'receivePromotions': receivePromotions,
    if (allowDataSharing != null) r'allowDataSharing': allowDataSharing,
    if (preferredLanguage != null) r'preferredLanguage': preferredLanguage,
    if (dietaryRestrictions != null)
      r'dietaryRestrictions': dietaryRestrictions,
    if (interests != null) r'interests': interests,
  });

  Input$MemberPreferencesInput._(this._$data);

  factory Input$MemberPreferencesInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('receiveNewsletter')) {
      final l$receiveNewsletter = data['receiveNewsletter'];
      result$data['receiveNewsletter'] = (l$receiveNewsletter as bool?);
    }
    if (data.containsKey('receivePromotions')) {
      final l$receivePromotions = data['receivePromotions'];
      result$data['receivePromotions'] = (l$receivePromotions as bool?);
    }
    if (data.containsKey('allowDataSharing')) {
      final l$allowDataSharing = data['allowDataSharing'];
      result$data['allowDataSharing'] = (l$allowDataSharing as bool?);
    }
    if (data.containsKey('preferredLanguage')) {
      final l$preferredLanguage = data['preferredLanguage'];
      result$data['preferredLanguage'] = (l$preferredLanguage as String?);
    }
    if (data.containsKey('dietaryRestrictions')) {
      final l$dietaryRestrictions = data['dietaryRestrictions'];
      result$data['dietaryRestrictions'] =
          (l$dietaryRestrictions as List<dynamic>?)
              ?.map((e) => (e as String))
              .toList();
    }
    if (data.containsKey('interests')) {
      final l$interests = data['interests'];
      result$data['interests'] = (l$interests as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    return Input$MemberPreferencesInput._(result$data);
  }

  Map<String, dynamic> _$data;

  bool? get receiveNewsletter => (_$data['receiveNewsletter'] as bool?);

  bool? get receivePromotions => (_$data['receivePromotions'] as bool?);

  bool? get allowDataSharing => (_$data['allowDataSharing'] as bool?);

  String? get preferredLanguage => (_$data['preferredLanguage'] as String?);

  List<String>? get dietaryRestrictions =>
      (_$data['dietaryRestrictions'] as List<String>?);

  List<String>? get interests => (_$data['interests'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('receiveNewsletter')) {
      final l$receiveNewsletter = receiveNewsletter;
      result$data['receiveNewsletter'] = l$receiveNewsletter;
    }
    if (_$data.containsKey('receivePromotions')) {
      final l$receivePromotions = receivePromotions;
      result$data['receivePromotions'] = l$receivePromotions;
    }
    if (_$data.containsKey('allowDataSharing')) {
      final l$allowDataSharing = allowDataSharing;
      result$data['allowDataSharing'] = l$allowDataSharing;
    }
    if (_$data.containsKey('preferredLanguage')) {
      final l$preferredLanguage = preferredLanguage;
      result$data['preferredLanguage'] = l$preferredLanguage;
    }
    if (_$data.containsKey('dietaryRestrictions')) {
      final l$dietaryRestrictions = dietaryRestrictions;
      result$data['dietaryRestrictions'] = l$dietaryRestrictions
          ?.map((e) => e)
          .toList();
    }
    if (_$data.containsKey('interests')) {
      final l$interests = interests;
      result$data['interests'] = l$interests?.map((e) => e).toList();
    }
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
    final l$receiveNewsletter = receiveNewsletter;
    final lOther$receiveNewsletter = other.receiveNewsletter;
    if (_$data.containsKey('receiveNewsletter') !=
        other._$data.containsKey('receiveNewsletter')) {
      return false;
    }
    if (l$receiveNewsletter != lOther$receiveNewsletter) {
      return false;
    }
    final l$receivePromotions = receivePromotions;
    final lOther$receivePromotions = other.receivePromotions;
    if (_$data.containsKey('receivePromotions') !=
        other._$data.containsKey('receivePromotions')) {
      return false;
    }
    if (l$receivePromotions != lOther$receivePromotions) {
      return false;
    }
    final l$allowDataSharing = allowDataSharing;
    final lOther$allowDataSharing = other.allowDataSharing;
    if (_$data.containsKey('allowDataSharing') !=
        other._$data.containsKey('allowDataSharing')) {
      return false;
    }
    if (l$allowDataSharing != lOther$allowDataSharing) {
      return false;
    }
    final l$preferredLanguage = preferredLanguage;
    final lOther$preferredLanguage = other.preferredLanguage;
    if (_$data.containsKey('preferredLanguage') !=
        other._$data.containsKey('preferredLanguage')) {
      return false;
    }
    if (l$preferredLanguage != lOther$preferredLanguage) {
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
    final l$interests = interests;
    final lOther$interests = other.interests;
    if (_$data.containsKey('interests') !=
        other._$data.containsKey('interests')) {
      return false;
    }
    if (l$interests != null && lOther$interests != null) {
      if (l$interests.length != lOther$interests.length) {
        return false;
      }
      for (int i = 0; i < l$interests.length; i++) {
        final l$interests$entry = l$interests[i];
        final lOther$interests$entry = lOther$interests[i];
        if (l$interests$entry != lOther$interests$entry) {
          return false;
        }
      }
    } else if (l$interests != lOther$interests) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$receiveNewsletter = receiveNewsletter;
    final l$receivePromotions = receivePromotions;
    final l$allowDataSharing = allowDataSharing;
    final l$preferredLanguage = preferredLanguage;
    final l$dietaryRestrictions = dietaryRestrictions;
    final l$interests = interests;
    return Object.hashAll([
      _$data.containsKey('receiveNewsletter') ? l$receiveNewsletter : const {},
      _$data.containsKey('receivePromotions') ? l$receivePromotions : const {},
      _$data.containsKey('allowDataSharing') ? l$allowDataSharing : const {},
      _$data.containsKey('preferredLanguage') ? l$preferredLanguage : const {},
      _$data.containsKey('dietaryRestrictions')
          ? l$dietaryRestrictions == null
                ? null
                : Object.hashAll(l$dietaryRestrictions.map((v) => v))
          : const {},
      _$data.containsKey('interests')
          ? l$interests == null
                ? null
                : Object.hashAll(l$interests.map((v) => v))
          : const {},
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
    bool? receiveNewsletter,
    bool? receivePromotions,
    bool? allowDataSharing,
    String? preferredLanguage,
    List<String>? dietaryRestrictions,
    List<String>? interests,
  });
}

class _CopyWithImpl$Input$MemberPreferencesInput<TRes>
    implements CopyWith$Input$MemberPreferencesInput<TRes> {
  _CopyWithImpl$Input$MemberPreferencesInput(this._instance, this._then);

  final Input$MemberPreferencesInput _instance;

  final TRes Function(Input$MemberPreferencesInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? receiveNewsletter = _undefined,
    Object? receivePromotions = _undefined,
    Object? allowDataSharing = _undefined,
    Object? preferredLanguage = _undefined,
    Object? dietaryRestrictions = _undefined,
    Object? interests = _undefined,
  }) => _then(
    Input$MemberPreferencesInput._({
      ..._instance._$data,
      if (receiveNewsletter != _undefined)
        'receiveNewsletter': (receiveNewsletter as bool?),
      if (receivePromotions != _undefined)
        'receivePromotions': (receivePromotions as bool?),
      if (allowDataSharing != _undefined)
        'allowDataSharing': (allowDataSharing as bool?),
      if (preferredLanguage != _undefined)
        'preferredLanguage': (preferredLanguage as String?),
      if (dietaryRestrictions != _undefined)
        'dietaryRestrictions': (dietaryRestrictions as List<String>?),
      if (interests != _undefined) 'interests': (interests as List<String>?),
    }),
  );
}

class _CopyWithStubImpl$Input$MemberPreferencesInput<TRes>
    implements CopyWith$Input$MemberPreferencesInput<TRes> {
  _CopyWithStubImpl$Input$MemberPreferencesInput(this._res);

  TRes _res;

  call({
    bool? receiveNewsletter,
    bool? receivePromotions,
    bool? allowDataSharing,
    String? preferredLanguage,
    List<String>? dietaryRestrictions,
    List<String>? interests,
  }) => _res;
}

class Input$CostSharingInput {
  factory Input$CostSharingInput({
    required bool guestFeeCovered,
    required bool facilityFeesCovered,
    required bool foodBeverageCovered,
    int? percentageCovered,
    double? maxAmountCovered,
    required String currency,
  }) => Input$CostSharingInput._({
    r'guestFeeCovered': guestFeeCovered,
    r'facilityFeesCovered': facilityFeesCovered,
    r'foodBeverageCovered': foodBeverageCovered,
    if (percentageCovered != null) r'percentageCovered': percentageCovered,
    if (maxAmountCovered != null) r'maxAmountCovered': maxAmountCovered,
    r'currency': currency,
  });

  Input$CostSharingInput._(this._$data);

  factory Input$CostSharingInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$guestFeeCovered = data['guestFeeCovered'];
    result$data['guestFeeCovered'] = (l$guestFeeCovered as bool);
    final l$facilityFeesCovered = data['facilityFeesCovered'];
    result$data['facilityFeesCovered'] = (l$facilityFeesCovered as bool);
    final l$foodBeverageCovered = data['foodBeverageCovered'];
    result$data['foodBeverageCovered'] = (l$foodBeverageCovered as bool);
    if (data.containsKey('percentageCovered')) {
      final l$percentageCovered = data['percentageCovered'];
      result$data['percentageCovered'] = (l$percentageCovered as int?);
    }
    if (data.containsKey('maxAmountCovered')) {
      final l$maxAmountCovered = data['maxAmountCovered'];
      result$data['maxAmountCovered'] = (l$maxAmountCovered as num?)
          ?.toDouble();
    }
    final l$currency = data['currency'];
    result$data['currency'] = (l$currency as String);
    return Input$CostSharingInput._(result$data);
  }

  Map<String, dynamic> _$data;

  bool get guestFeeCovered => (_$data['guestFeeCovered'] as bool);

  bool get facilityFeesCovered => (_$data['facilityFeesCovered'] as bool);

  bool get foodBeverageCovered => (_$data['foodBeverageCovered'] as bool);

  int? get percentageCovered => (_$data['percentageCovered'] as int?);

  double? get maxAmountCovered => (_$data['maxAmountCovered'] as double?);

  String get currency => (_$data['currency'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$guestFeeCovered = guestFeeCovered;
    result$data['guestFeeCovered'] = l$guestFeeCovered;
    final l$facilityFeesCovered = facilityFeesCovered;
    result$data['facilityFeesCovered'] = l$facilityFeesCovered;
    final l$foodBeverageCovered = foodBeverageCovered;
    result$data['foodBeverageCovered'] = l$foodBeverageCovered;
    if (_$data.containsKey('percentageCovered')) {
      final l$percentageCovered = percentageCovered;
      result$data['percentageCovered'] = l$percentageCovered;
    }
    if (_$data.containsKey('maxAmountCovered')) {
      final l$maxAmountCovered = maxAmountCovered;
      result$data['maxAmountCovered'] = l$maxAmountCovered;
    }
    final l$currency = currency;
    result$data['currency'] = l$currency;
    return result$data;
  }

  CopyWith$Input$CostSharingInput<Input$CostSharingInput> get copyWith =>
      CopyWith$Input$CostSharingInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CostSharingInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$guestFeeCovered = guestFeeCovered;
    final lOther$guestFeeCovered = other.guestFeeCovered;
    if (l$guestFeeCovered != lOther$guestFeeCovered) {
      return false;
    }
    final l$facilityFeesCovered = facilityFeesCovered;
    final lOther$facilityFeesCovered = other.facilityFeesCovered;
    if (l$facilityFeesCovered != lOther$facilityFeesCovered) {
      return false;
    }
    final l$foodBeverageCovered = foodBeverageCovered;
    final lOther$foodBeverageCovered = other.foodBeverageCovered;
    if (l$foodBeverageCovered != lOther$foodBeverageCovered) {
      return false;
    }
    final l$percentageCovered = percentageCovered;
    final lOther$percentageCovered = other.percentageCovered;
    if (_$data.containsKey('percentageCovered') !=
        other._$data.containsKey('percentageCovered')) {
      return false;
    }
    if (l$percentageCovered != lOther$percentageCovered) {
      return false;
    }
    final l$maxAmountCovered = maxAmountCovered;
    final lOther$maxAmountCovered = other.maxAmountCovered;
    if (_$data.containsKey('maxAmountCovered') !=
        other._$data.containsKey('maxAmountCovered')) {
      return false;
    }
    if (l$maxAmountCovered != lOther$maxAmountCovered) {
      return false;
    }
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$guestFeeCovered = guestFeeCovered;
    final l$facilityFeesCovered = facilityFeesCovered;
    final l$foodBeverageCovered = foodBeverageCovered;
    final l$percentageCovered = percentageCovered;
    final l$maxAmountCovered = maxAmountCovered;
    final l$currency = currency;
    return Object.hashAll([
      l$guestFeeCovered,
      l$facilityFeesCovered,
      l$foodBeverageCovered,
      _$data.containsKey('percentageCovered') ? l$percentageCovered : const {},
      _$data.containsKey('maxAmountCovered') ? l$maxAmountCovered : const {},
      l$currency,
    ]);
  }
}

abstract class CopyWith$Input$CostSharingInput<TRes> {
  factory CopyWith$Input$CostSharingInput(
    Input$CostSharingInput instance,
    TRes Function(Input$CostSharingInput) then,
  ) = _CopyWithImpl$Input$CostSharingInput;

  factory CopyWith$Input$CostSharingInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CostSharingInput;

  TRes call({
    bool? guestFeeCovered,
    bool? facilityFeesCovered,
    bool? foodBeverageCovered,
    int? percentageCovered,
    double? maxAmountCovered,
    String? currency,
  });
}

class _CopyWithImpl$Input$CostSharingInput<TRes>
    implements CopyWith$Input$CostSharingInput<TRes> {
  _CopyWithImpl$Input$CostSharingInput(this._instance, this._then);

  final Input$CostSharingInput _instance;

  final TRes Function(Input$CostSharingInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? guestFeeCovered = _undefined,
    Object? facilityFeesCovered = _undefined,
    Object? foodBeverageCovered = _undefined,
    Object? percentageCovered = _undefined,
    Object? maxAmountCovered = _undefined,
    Object? currency = _undefined,
  }) => _then(
    Input$CostSharingInput._({
      ..._instance._$data,
      if (guestFeeCovered != _undefined && guestFeeCovered != null)
        'guestFeeCovered': (guestFeeCovered as bool),
      if (facilityFeesCovered != _undefined && facilityFeesCovered != null)
        'facilityFeesCovered': (facilityFeesCovered as bool),
      if (foodBeverageCovered != _undefined && foodBeverageCovered != null)
        'foodBeverageCovered': (foodBeverageCovered as bool),
      if (percentageCovered != _undefined)
        'percentageCovered': (percentageCovered as int?),
      if (maxAmountCovered != _undefined)
        'maxAmountCovered': (maxAmountCovered as double?),
      if (currency != _undefined && currency != null)
        'currency': (currency as String),
    }),
  );
}

class _CopyWithStubImpl$Input$CostSharingInput<TRes>
    implements CopyWith$Input$CostSharingInput<TRes> {
  _CopyWithStubImpl$Input$CostSharingInput(this._res);

  TRes _res;

  call({
    bool? guestFeeCovered,
    bool? facilityFeesCovered,
    bool? foodBeverageCovered,
    int? percentageCovered,
    double? maxAmountCovered,
    String? currency,
  }) => _res;
}

class Input$VisitCostsInput {
  factory Input$VisitCostsInput({
    double? guestFee,
    double? facilityFees,
    double? foodBeverage,
    double? other,
    required double total,
    required String currency,
    String? paidBy,
    DateTime? paidAt,
  }) => Input$VisitCostsInput._({
    if (guestFee != null) r'guestFee': guestFee,
    if (facilityFees != null) r'facilityFees': facilityFees,
    if (foodBeverage != null) r'foodBeverage': foodBeverage,
    if (other != null) r'other': other,
    r'total': total,
    r'currency': currency,
    if (paidBy != null) r'paidBy': paidBy,
    if (paidAt != null) r'paidAt': paidAt,
  });

  Input$VisitCostsInput._(this._$data);

  factory Input$VisitCostsInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('guestFee')) {
      final l$guestFee = data['guestFee'];
      result$data['guestFee'] = (l$guestFee as num?)?.toDouble();
    }
    if (data.containsKey('facilityFees')) {
      final l$facilityFees = data['facilityFees'];
      result$data['facilityFees'] = (l$facilityFees as num?)?.toDouble();
    }
    if (data.containsKey('foodBeverage')) {
      final l$foodBeverage = data['foodBeverage'];
      result$data['foodBeverage'] = (l$foodBeverage as num?)?.toDouble();
    }
    if (data.containsKey('other')) {
      final l$other = data['other'];
      result$data['other'] = (l$other as num?)?.toDouble();
    }
    final l$total = data['total'];
    result$data['total'] = (l$total as num).toDouble();
    final l$currency = data['currency'];
    result$data['currency'] = (l$currency as String);
    if (data.containsKey('paidBy')) {
      final l$paidBy = data['paidBy'];
      result$data['paidBy'] = (l$paidBy as String?);
    }
    if (data.containsKey('paidAt')) {
      final l$paidAt = data['paidAt'];
      result$data['paidAt'] = l$paidAt == null
          ? null
          : DateTime.parse((l$paidAt as String));
    }
    return Input$VisitCostsInput._(result$data);
  }

  Map<String, dynamic> _$data;

  double? get guestFee => (_$data['guestFee'] as double?);

  double? get facilityFees => (_$data['facilityFees'] as double?);

  double? get foodBeverage => (_$data['foodBeverage'] as double?);

  double? get other => (_$data['other'] as double?);

  double get total => (_$data['total'] as double);

  String get currency => (_$data['currency'] as String);

  String? get paidBy => (_$data['paidBy'] as String?);

  DateTime? get paidAt => (_$data['paidAt'] as DateTime?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('guestFee')) {
      final l$guestFee = guestFee;
      result$data['guestFee'] = l$guestFee;
    }
    if (_$data.containsKey('facilityFees')) {
      final l$facilityFees = facilityFees;
      result$data['facilityFees'] = l$facilityFees;
    }
    if (_$data.containsKey('foodBeverage')) {
      final l$foodBeverage = foodBeverage;
      result$data['foodBeverage'] = l$foodBeverage;
    }
    if (_$data.containsKey('other')) {
      final l$other = other;
      result$data['other'] = l$other;
    }
    final l$total = total;
    result$data['total'] = l$total;
    final l$currency = currency;
    result$data['currency'] = l$currency;
    if (_$data.containsKey('paidBy')) {
      final l$paidBy = paidBy;
      result$data['paidBy'] = l$paidBy;
    }
    if (_$data.containsKey('paidAt')) {
      final l$paidAt = paidAt;
      result$data['paidAt'] = l$paidAt?.toIso8601String();
    }
    return result$data;
  }

  CopyWith$Input$VisitCostsInput<Input$VisitCostsInput> get copyWith =>
      CopyWith$Input$VisitCostsInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$VisitCostsInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$guestFee = guestFee;
    final lOther$guestFee = other.guestFee;
    if (_$data.containsKey('guestFee') !=
        other._$data.containsKey('guestFee')) {
      return false;
    }
    if (l$guestFee != lOther$guestFee) {
      return false;
    }
    final l$facilityFees = facilityFees;
    final lOther$facilityFees = other.facilityFees;
    if (_$data.containsKey('facilityFees') !=
        other._$data.containsKey('facilityFees')) {
      return false;
    }
    if (l$facilityFees != lOther$facilityFees) {
      return false;
    }
    final l$foodBeverage = foodBeverage;
    final lOther$foodBeverage = other.foodBeverage;
    if (_$data.containsKey('foodBeverage') !=
        other._$data.containsKey('foodBeverage')) {
      return false;
    }
    if (l$foodBeverage != lOther$foodBeverage) {
      return false;
    }
    final l$other = other;
    final lOther$other = other.other;
    if (_$data.containsKey('other') != other._$data.containsKey('other')) {
      return false;
    }
    if (l$other != lOther$other) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
      return false;
    }
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
      return false;
    }
    final l$paidBy = paidBy;
    final lOther$paidBy = other.paidBy;
    if (_$data.containsKey('paidBy') != other._$data.containsKey('paidBy')) {
      return false;
    }
    if (l$paidBy != lOther$paidBy) {
      return false;
    }
    final l$paidAt = paidAt;
    final lOther$paidAt = other.paidAt;
    if (_$data.containsKey('paidAt') != other._$data.containsKey('paidAt')) {
      return false;
    }
    if (l$paidAt != lOther$paidAt) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$guestFee = guestFee;
    final l$facilityFees = facilityFees;
    final l$foodBeverage = foodBeverage;
    final l$other = other;
    final l$total = total;
    final l$currency = currency;
    final l$paidBy = paidBy;
    final l$paidAt = paidAt;
    return Object.hashAll([
      _$data.containsKey('guestFee') ? l$guestFee : const {},
      _$data.containsKey('facilityFees') ? l$facilityFees : const {},
      _$data.containsKey('foodBeverage') ? l$foodBeverage : const {},
      _$data.containsKey('other') ? l$other : const {},
      l$total,
      l$currency,
      _$data.containsKey('paidBy') ? l$paidBy : const {},
      _$data.containsKey('paidAt') ? l$paidAt : const {},
    ]);
  }
}

abstract class CopyWith$Input$VisitCostsInput<TRes> {
  factory CopyWith$Input$VisitCostsInput(
    Input$VisitCostsInput instance,
    TRes Function(Input$VisitCostsInput) then,
  ) = _CopyWithImpl$Input$VisitCostsInput;

  factory CopyWith$Input$VisitCostsInput.stub(TRes res) =
      _CopyWithStubImpl$Input$VisitCostsInput;

  TRes call({
    double? guestFee,
    double? facilityFees,
    double? foodBeverage,
    double? other,
    double? total,
    String? currency,
    String? paidBy,
    DateTime? paidAt,
  });
}

class _CopyWithImpl$Input$VisitCostsInput<TRes>
    implements CopyWith$Input$VisitCostsInput<TRes> {
  _CopyWithImpl$Input$VisitCostsInput(this._instance, this._then);

  final Input$VisitCostsInput _instance;

  final TRes Function(Input$VisitCostsInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? guestFee = _undefined,
    Object? facilityFees = _undefined,
    Object? foodBeverage = _undefined,
    Object? other = _undefined,
    Object? total = _undefined,
    Object? currency = _undefined,
    Object? paidBy = _undefined,
    Object? paidAt = _undefined,
  }) => _then(
    Input$VisitCostsInput._({
      ..._instance._$data,
      if (guestFee != _undefined) 'guestFee': (guestFee as double?),
      if (facilityFees != _undefined) 'facilityFees': (facilityFees as double?),
      if (foodBeverage != _undefined) 'foodBeverage': (foodBeverage as double?),
      if (other != _undefined) 'other': (other as double?),
      if (total != _undefined && total != null) 'total': (total as double),
      if (currency != _undefined && currency != null)
        'currency': (currency as String),
      if (paidBy != _undefined) 'paidBy': (paidBy as String?),
      if (paidAt != _undefined) 'paidAt': (paidAt as DateTime?),
    }),
  );
}

class _CopyWithStubImpl$Input$VisitCostsInput<TRes>
    implements CopyWith$Input$VisitCostsInput<TRes> {
  _CopyWithStubImpl$Input$VisitCostsInput(this._res);

  TRes _res;

  call({
    double? guestFee,
    double? facilityFees,
    double? foodBeverage,
    double? other,
    double? total,
    String? currency,
    String? paidBy,
    DateTime? paidAt,
  }) => _res;
}

class Input$CreateMemberInput {
  factory Input$CreateMemberInput({
    required String memberNumber,
    String? userId,
    required String firstName,
    required String lastName,
    required String email,
    String? phone,
    DateTime? dateOfBirth,
    Input$AddressInput? address,
    Input$EmergencyContactInput? emergencyContact,
    required String membershipType,
    DateTime? expiryDate,
    Input$MemberPreferencesInput? preferences,
    String? notes,
  }) => Input$CreateMemberInput._({
    r'memberNumber': memberNumber,
    if (userId != null) r'userId': userId,
    r'firstName': firstName,
    r'lastName': lastName,
    r'email': email,
    if (phone != null) r'phone': phone,
    if (dateOfBirth != null) r'dateOfBirth': dateOfBirth,
    if (address != null) r'address': address,
    if (emergencyContact != null) r'emergencyContact': emergencyContact,
    r'membershipType': membershipType,
    if (expiryDate != null) r'expiryDate': expiryDate,
    if (preferences != null) r'preferences': preferences,
    if (notes != null) r'notes': notes,
  });

  Input$CreateMemberInput._(this._$data);

  factory Input$CreateMemberInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$memberNumber = data['memberNumber'];
    result$data['memberNumber'] = (l$memberNumber as String);
    if (data.containsKey('userId')) {
      final l$userId = data['userId'];
      result$data['userId'] = (l$userId as String?);
    }
    final l$firstName = data['firstName'];
    result$data['firstName'] = (l$firstName as String);
    final l$lastName = data['lastName'];
    result$data['lastName'] = (l$lastName as String);
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    if (data.containsKey('phone')) {
      final l$phone = data['phone'];
      result$data['phone'] = (l$phone as String?);
    }
    if (data.containsKey('dateOfBirth')) {
      final l$dateOfBirth = data['dateOfBirth'];
      result$data['dateOfBirth'] = l$dateOfBirth == null
          ? null
          : DateTime.parse((l$dateOfBirth as String));
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
    final l$membershipType = data['membershipType'];
    result$data['membershipType'] = (l$membershipType as String);
    if (data.containsKey('expiryDate')) {
      final l$expiryDate = data['expiryDate'];
      result$data['expiryDate'] = l$expiryDate == null
          ? null
          : DateTime.parse((l$expiryDate as String));
    }
    if (data.containsKey('preferences')) {
      final l$preferences = data['preferences'];
      result$data['preferences'] = l$preferences == null
          ? null
          : Input$MemberPreferencesInput.fromJson(
              (l$preferences as Map<String, dynamic>),
            );
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Input$CreateMemberInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get memberNumber => (_$data['memberNumber'] as String);

  String? get userId => (_$data['userId'] as String?);

  String get firstName => (_$data['firstName'] as String);

  String get lastName => (_$data['lastName'] as String);

  String get email => (_$data['email'] as String);

  String? get phone => (_$data['phone'] as String?);

  DateTime? get dateOfBirth => (_$data['dateOfBirth'] as DateTime?);

  Input$AddressInput? get address => (_$data['address'] as Input$AddressInput?);

  Input$EmergencyContactInput? get emergencyContact =>
      (_$data['emergencyContact'] as Input$EmergencyContactInput?);

  String get membershipType => (_$data['membershipType'] as String);

  DateTime? get expiryDate => (_$data['expiryDate'] as DateTime?);

  Input$MemberPreferencesInput? get preferences =>
      (_$data['preferences'] as Input$MemberPreferencesInput?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$memberNumber = memberNumber;
    result$data['memberNumber'] = l$memberNumber;
    if (_$data.containsKey('userId')) {
      final l$userId = userId;
      result$data['userId'] = l$userId;
    }
    final l$firstName = firstName;
    result$data['firstName'] = l$firstName;
    final l$lastName = lastName;
    result$data['lastName'] = l$lastName;
    final l$email = email;
    result$data['email'] = l$email;
    if (_$data.containsKey('phone')) {
      final l$phone = phone;
      result$data['phone'] = l$phone;
    }
    if (_$data.containsKey('dateOfBirth')) {
      final l$dateOfBirth = dateOfBirth;
      result$data['dateOfBirth'] = l$dateOfBirth?.toIso8601String();
    }
    if (_$data.containsKey('address')) {
      final l$address = address;
      result$data['address'] = l$address?.toJson();
    }
    if (_$data.containsKey('emergencyContact')) {
      final l$emergencyContact = emergencyContact;
      result$data['emergencyContact'] = l$emergencyContact?.toJson();
    }
    final l$membershipType = membershipType;
    result$data['membershipType'] = l$membershipType;
    if (_$data.containsKey('expiryDate')) {
      final l$expiryDate = expiryDate;
      result$data['expiryDate'] = l$expiryDate?.toIso8601String();
    }
    if (_$data.containsKey('preferences')) {
      final l$preferences = preferences;
      result$data['preferences'] = l$preferences?.toJson();
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
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
    final l$memberNumber = memberNumber;
    final lOther$memberNumber = other.memberNumber;
    if (l$memberNumber != lOther$memberNumber) {
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
    if (_$data.containsKey('phone') != other._$data.containsKey('phone')) {
      return false;
    }
    if (l$phone != lOther$phone) {
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
    final l$membershipType = membershipType;
    final lOther$membershipType = other.membershipType;
    if (l$membershipType != lOther$membershipType) {
      return false;
    }
    final l$expiryDate = expiryDate;
    final lOther$expiryDate = other.expiryDate;
    if (_$data.containsKey('expiryDate') !=
        other._$data.containsKey('expiryDate')) {
      return false;
    }
    if (l$expiryDate != lOther$expiryDate) {
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
    final l$memberNumber = memberNumber;
    final l$userId = userId;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$email = email;
    final l$phone = phone;
    final l$dateOfBirth = dateOfBirth;
    final l$address = address;
    final l$emergencyContact = emergencyContact;
    final l$membershipType = membershipType;
    final l$expiryDate = expiryDate;
    final l$preferences = preferences;
    final l$notes = notes;
    return Object.hashAll([
      l$memberNumber,
      _$data.containsKey('userId') ? l$userId : const {},
      l$firstName,
      l$lastName,
      l$email,
      _$data.containsKey('phone') ? l$phone : const {},
      _$data.containsKey('dateOfBirth') ? l$dateOfBirth : const {},
      _$data.containsKey('address') ? l$address : const {},
      _$data.containsKey('emergencyContact') ? l$emergencyContact : const {},
      l$membershipType,
      _$data.containsKey('expiryDate') ? l$expiryDate : const {},
      _$data.containsKey('preferences') ? l$preferences : const {},
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
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
    String? memberNumber,
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    DateTime? dateOfBirth,
    Input$AddressInput? address,
    Input$EmergencyContactInput? emergencyContact,
    String? membershipType,
    DateTime? expiryDate,
    Input$MemberPreferencesInput? preferences,
    String? notes,
  });
  CopyWith$Input$AddressInput<TRes> get address;
  CopyWith$Input$EmergencyContactInput<TRes> get emergencyContact;
  CopyWith$Input$MemberPreferencesInput<TRes> get preferences;
}

class _CopyWithImpl$Input$CreateMemberInput<TRes>
    implements CopyWith$Input$CreateMemberInput<TRes> {
  _CopyWithImpl$Input$CreateMemberInput(this._instance, this._then);

  final Input$CreateMemberInput _instance;

  final TRes Function(Input$CreateMemberInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? memberNumber = _undefined,
    Object? userId = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? phone = _undefined,
    Object? dateOfBirth = _undefined,
    Object? address = _undefined,
    Object? emergencyContact = _undefined,
    Object? membershipType = _undefined,
    Object? expiryDate = _undefined,
    Object? preferences = _undefined,
    Object? notes = _undefined,
  }) => _then(
    Input$CreateMemberInput._({
      ..._instance._$data,
      if (memberNumber != _undefined && memberNumber != null)
        'memberNumber': (memberNumber as String),
      if (userId != _undefined) 'userId': (userId as String?),
      if (firstName != _undefined && firstName != null)
        'firstName': (firstName as String),
      if (lastName != _undefined && lastName != null)
        'lastName': (lastName as String),
      if (email != _undefined && email != null) 'email': (email as String),
      if (phone != _undefined) 'phone': (phone as String?),
      if (dateOfBirth != _undefined) 'dateOfBirth': (dateOfBirth as DateTime?),
      if (address != _undefined) 'address': (address as Input$AddressInput?),
      if (emergencyContact != _undefined)
        'emergencyContact': (emergencyContact as Input$EmergencyContactInput?),
      if (membershipType != _undefined && membershipType != null)
        'membershipType': (membershipType as String),
      if (expiryDate != _undefined) 'expiryDate': (expiryDate as DateTime?),
      if (preferences != _undefined)
        'preferences': (preferences as Input$MemberPreferencesInput?),
      if (notes != _undefined) 'notes': (notes as String?),
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

class _CopyWithStubImpl$Input$CreateMemberInput<TRes>
    implements CopyWith$Input$CreateMemberInput<TRes> {
  _CopyWithStubImpl$Input$CreateMemberInput(this._res);

  TRes _res;

  call({
    String? memberNumber,
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    DateTime? dateOfBirth,
    Input$AddressInput? address,
    Input$EmergencyContactInput? emergencyContact,
    String? membershipType,
    DateTime? expiryDate,
    Input$MemberPreferencesInput? preferences,
    String? notes,
  }) => _res;

  CopyWith$Input$AddressInput<TRes> get address =>
      CopyWith$Input$AddressInput.stub(_res);

  CopyWith$Input$EmergencyContactInput<TRes> get emergencyContact =>
      CopyWith$Input$EmergencyContactInput.stub(_res);

  CopyWith$Input$MemberPreferencesInput<TRes> get preferences =>
      CopyWith$Input$MemberPreferencesInput.stub(_res);
}

class Input$UpdateMemberInput {
  factory Input$UpdateMemberInput({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    DateTime? dateOfBirth,
    Input$AddressInput? address,
    Input$EmergencyContactInput? emergencyContact,
    String? membershipType,
    DateTime? expiryDate,
    Input$MemberPreferencesInput? preferences,
    String? notes,
  }) => Input$UpdateMemberInput._({
    if (firstName != null) r'firstName': firstName,
    if (lastName != null) r'lastName': lastName,
    if (email != null) r'email': email,
    if (phone != null) r'phone': phone,
    if (dateOfBirth != null) r'dateOfBirth': dateOfBirth,
    if (address != null) r'address': address,
    if (emergencyContact != null) r'emergencyContact': emergencyContact,
    if (membershipType != null) r'membershipType': membershipType,
    if (expiryDate != null) r'expiryDate': expiryDate,
    if (preferences != null) r'preferences': preferences,
    if (notes != null) r'notes': notes,
  });

  Input$UpdateMemberInput._(this._$data);

  factory Input$UpdateMemberInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('firstName')) {
      final l$firstName = data['firstName'];
      result$data['firstName'] = (l$firstName as String?);
    }
    if (data.containsKey('lastName')) {
      final l$lastName = data['lastName'];
      result$data['lastName'] = (l$lastName as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('phone')) {
      final l$phone = data['phone'];
      result$data['phone'] = (l$phone as String?);
    }
    if (data.containsKey('dateOfBirth')) {
      final l$dateOfBirth = data['dateOfBirth'];
      result$data['dateOfBirth'] = l$dateOfBirth == null
          ? null
          : DateTime.parse((l$dateOfBirth as String));
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
    if (data.containsKey('membershipType')) {
      final l$membershipType = data['membershipType'];
      result$data['membershipType'] = (l$membershipType as String?);
    }
    if (data.containsKey('expiryDate')) {
      final l$expiryDate = data['expiryDate'];
      result$data['expiryDate'] = l$expiryDate == null
          ? null
          : DateTime.parse((l$expiryDate as String));
    }
    if (data.containsKey('preferences')) {
      final l$preferences = data['preferences'];
      result$data['preferences'] = l$preferences == null
          ? null
          : Input$MemberPreferencesInput.fromJson(
              (l$preferences as Map<String, dynamic>),
            );
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Input$UpdateMemberInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get firstName => (_$data['firstName'] as String?);

  String? get lastName => (_$data['lastName'] as String?);

  String? get email => (_$data['email'] as String?);

  String? get phone => (_$data['phone'] as String?);

  DateTime? get dateOfBirth => (_$data['dateOfBirth'] as DateTime?);

  Input$AddressInput? get address => (_$data['address'] as Input$AddressInput?);

  Input$EmergencyContactInput? get emergencyContact =>
      (_$data['emergencyContact'] as Input$EmergencyContactInput?);

  String? get membershipType => (_$data['membershipType'] as String?);

  DateTime? get expiryDate => (_$data['expiryDate'] as DateTime?);

  Input$MemberPreferencesInput? get preferences =>
      (_$data['preferences'] as Input$MemberPreferencesInput?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('firstName')) {
      final l$firstName = firstName;
      result$data['firstName'] = l$firstName;
    }
    if (_$data.containsKey('lastName')) {
      final l$lastName = lastName;
      result$data['lastName'] = l$lastName;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('phone')) {
      final l$phone = phone;
      result$data['phone'] = l$phone;
    }
    if (_$data.containsKey('dateOfBirth')) {
      final l$dateOfBirth = dateOfBirth;
      result$data['dateOfBirth'] = l$dateOfBirth?.toIso8601String();
    }
    if (_$data.containsKey('address')) {
      final l$address = address;
      result$data['address'] = l$address?.toJson();
    }
    if (_$data.containsKey('emergencyContact')) {
      final l$emergencyContact = emergencyContact;
      result$data['emergencyContact'] = l$emergencyContact?.toJson();
    }
    if (_$data.containsKey('membershipType')) {
      final l$membershipType = membershipType;
      result$data['membershipType'] = l$membershipType;
    }
    if (_$data.containsKey('expiryDate')) {
      final l$expiryDate = expiryDate;
      result$data['expiryDate'] = l$expiryDate?.toIso8601String();
    }
    if (_$data.containsKey('preferences')) {
      final l$preferences = preferences;
      result$data['preferences'] = l$preferences?.toJson();
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    return result$data;
  }

  CopyWith$Input$UpdateMemberInput<Input$UpdateMemberInput> get copyWith =>
      CopyWith$Input$UpdateMemberInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateMemberInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (_$data.containsKey('firstName') !=
        other._$data.containsKey('firstName')) {
      return false;
    }
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (_$data.containsKey('lastName') !=
        other._$data.containsKey('lastName')) {
      return false;
    }
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (_$data.containsKey('phone') != other._$data.containsKey('phone')) {
      return false;
    }
    if (l$phone != lOther$phone) {
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
    final l$membershipType = membershipType;
    final lOther$membershipType = other.membershipType;
    if (_$data.containsKey('membershipType') !=
        other._$data.containsKey('membershipType')) {
      return false;
    }
    if (l$membershipType != lOther$membershipType) {
      return false;
    }
    final l$expiryDate = expiryDate;
    final lOther$expiryDate = other.expiryDate;
    if (_$data.containsKey('expiryDate') !=
        other._$data.containsKey('expiryDate')) {
      return false;
    }
    if (l$expiryDate != lOther$expiryDate) {
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
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$email = email;
    final l$phone = phone;
    final l$dateOfBirth = dateOfBirth;
    final l$address = address;
    final l$emergencyContact = emergencyContact;
    final l$membershipType = membershipType;
    final l$expiryDate = expiryDate;
    final l$preferences = preferences;
    final l$notes = notes;
    return Object.hashAll([
      _$data.containsKey('firstName') ? l$firstName : const {},
      _$data.containsKey('lastName') ? l$lastName : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('phone') ? l$phone : const {},
      _$data.containsKey('dateOfBirth') ? l$dateOfBirth : const {},
      _$data.containsKey('address') ? l$address : const {},
      _$data.containsKey('emergencyContact') ? l$emergencyContact : const {},
      _$data.containsKey('membershipType') ? l$membershipType : const {},
      _$data.containsKey('expiryDate') ? l$expiryDate : const {},
      _$data.containsKey('preferences') ? l$preferences : const {},
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateMemberInput<TRes> {
  factory CopyWith$Input$UpdateMemberInput(
    Input$UpdateMemberInput instance,
    TRes Function(Input$UpdateMemberInput) then,
  ) = _CopyWithImpl$Input$UpdateMemberInput;

  factory CopyWith$Input$UpdateMemberInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateMemberInput;

  TRes call({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    DateTime? dateOfBirth,
    Input$AddressInput? address,
    Input$EmergencyContactInput? emergencyContact,
    String? membershipType,
    DateTime? expiryDate,
    Input$MemberPreferencesInput? preferences,
    String? notes,
  });
  CopyWith$Input$AddressInput<TRes> get address;
  CopyWith$Input$EmergencyContactInput<TRes> get emergencyContact;
  CopyWith$Input$MemberPreferencesInput<TRes> get preferences;
}

class _CopyWithImpl$Input$UpdateMemberInput<TRes>
    implements CopyWith$Input$UpdateMemberInput<TRes> {
  _CopyWithImpl$Input$UpdateMemberInput(this._instance, this._then);

  final Input$UpdateMemberInput _instance;

  final TRes Function(Input$UpdateMemberInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? phone = _undefined,
    Object? dateOfBirth = _undefined,
    Object? address = _undefined,
    Object? emergencyContact = _undefined,
    Object? membershipType = _undefined,
    Object? expiryDate = _undefined,
    Object? preferences = _undefined,
    Object? notes = _undefined,
  }) => _then(
    Input$UpdateMemberInput._({
      ..._instance._$data,
      if (firstName != _undefined) 'firstName': (firstName as String?),
      if (lastName != _undefined) 'lastName': (lastName as String?),
      if (email != _undefined) 'email': (email as String?),
      if (phone != _undefined) 'phone': (phone as String?),
      if (dateOfBirth != _undefined) 'dateOfBirth': (dateOfBirth as DateTime?),
      if (address != _undefined) 'address': (address as Input$AddressInput?),
      if (emergencyContact != _undefined)
        'emergencyContact': (emergencyContact as Input$EmergencyContactInput?),
      if (membershipType != _undefined)
        'membershipType': (membershipType as String?),
      if (expiryDate != _undefined) 'expiryDate': (expiryDate as DateTime?),
      if (preferences != _undefined)
        'preferences': (preferences as Input$MemberPreferencesInput?),
      if (notes != _undefined) 'notes': (notes as String?),
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

class _CopyWithStubImpl$Input$UpdateMemberInput<TRes>
    implements CopyWith$Input$UpdateMemberInput<TRes> {
  _CopyWithStubImpl$Input$UpdateMemberInput(this._res);

  TRes _res;

  call({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    DateTime? dateOfBirth,
    Input$AddressInput? address,
    Input$EmergencyContactInput? emergencyContact,
    String? membershipType,
    DateTime? expiryDate,
    Input$MemberPreferencesInput? preferences,
    String? notes,
  }) => _res;

  CopyWith$Input$AddressInput<TRes> get address =>
      CopyWith$Input$AddressInput.stub(_res);

  CopyWith$Input$EmergencyContactInput<TRes> get emergencyContact =>
      CopyWith$Input$EmergencyContactInput.stub(_res);

  CopyWith$Input$MemberPreferencesInput<TRes> get preferences =>
      CopyWith$Input$MemberPreferencesInput.stub(_res);
}

class Input$CreateAgreementInput {
  factory Input$CreateAgreementInput({
    required String reciprocatingClubId,
    required Enum$AgreementType agreementType,
    required DateTime startDate,
    DateTime? endDate,
    String? terms,
    int? maxVisitsPerYear,
    int? maxVisitDuration,
    List<String>? allowedFacilities,
    Input$CostSharingInput? costSharing,
    bool? requiresPreApproval,
    String? notes,
  }) => Input$CreateAgreementInput._({
    r'reciprocatingClubId': reciprocatingClubId,
    r'agreementType': agreementType,
    r'startDate': startDate,
    if (endDate != null) r'endDate': endDate,
    if (terms != null) r'terms': terms,
    if (maxVisitsPerYear != null) r'maxVisitsPerYear': maxVisitsPerYear,
    if (maxVisitDuration != null) r'maxVisitDuration': maxVisitDuration,
    if (allowedFacilities != null) r'allowedFacilities': allowedFacilities,
    if (costSharing != null) r'costSharing': costSharing,
    if (requiresPreApproval != null)
      r'requiresPreApproval': requiresPreApproval,
    if (notes != null) r'notes': notes,
  });

  Input$CreateAgreementInput._(this._$data);

  factory Input$CreateAgreementInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$reciprocatingClubId = data['reciprocatingClubId'];
    result$data['reciprocatingClubId'] = (l$reciprocatingClubId as String);
    final l$agreementType = data['agreementType'];
    result$data['agreementType'] = fromJson$Enum$AgreementType(
      (l$agreementType as String),
    );
    final l$startDate = data['startDate'];
    result$data['startDate'] = DateTime.parse((l$startDate as String));
    if (data.containsKey('endDate')) {
      final l$endDate = data['endDate'];
      result$data['endDate'] = l$endDate == null
          ? null
          : DateTime.parse((l$endDate as String));
    }
    if (data.containsKey('terms')) {
      final l$terms = data['terms'];
      result$data['terms'] = (l$terms as String?);
    }
    if (data.containsKey('maxVisitsPerYear')) {
      final l$maxVisitsPerYear = data['maxVisitsPerYear'];
      result$data['maxVisitsPerYear'] = (l$maxVisitsPerYear as int?);
    }
    if (data.containsKey('maxVisitDuration')) {
      final l$maxVisitDuration = data['maxVisitDuration'];
      result$data['maxVisitDuration'] = (l$maxVisitDuration as int?);
    }
    if (data.containsKey('allowedFacilities')) {
      final l$allowedFacilities = data['allowedFacilities'];
      result$data['allowedFacilities'] = (l$allowedFacilities as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('costSharing')) {
      final l$costSharing = data['costSharing'];
      result$data['costSharing'] = l$costSharing == null
          ? null
          : Input$CostSharingInput.fromJson(
              (l$costSharing as Map<String, dynamic>),
            );
    }
    if (data.containsKey('requiresPreApproval')) {
      final l$requiresPreApproval = data['requiresPreApproval'];
      result$data['requiresPreApproval'] = (l$requiresPreApproval as bool?);
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Input$CreateAgreementInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get reciprocatingClubId => (_$data['reciprocatingClubId'] as String);

  Enum$AgreementType get agreementType =>
      (_$data['agreementType'] as Enum$AgreementType);

  DateTime get startDate => (_$data['startDate'] as DateTime);

  DateTime? get endDate => (_$data['endDate'] as DateTime?);

  String? get terms => (_$data['terms'] as String?);

  int? get maxVisitsPerYear => (_$data['maxVisitsPerYear'] as int?);

  int? get maxVisitDuration => (_$data['maxVisitDuration'] as int?);

  List<String>? get allowedFacilities =>
      (_$data['allowedFacilities'] as List<String>?);

  Input$CostSharingInput? get costSharing =>
      (_$data['costSharing'] as Input$CostSharingInput?);

  bool? get requiresPreApproval => (_$data['requiresPreApproval'] as bool?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$reciprocatingClubId = reciprocatingClubId;
    result$data['reciprocatingClubId'] = l$reciprocatingClubId;
    final l$agreementType = agreementType;
    result$data['agreementType'] = toJson$Enum$AgreementType(l$agreementType);
    final l$startDate = startDate;
    result$data['startDate'] = l$startDate.toIso8601String();
    if (_$data.containsKey('endDate')) {
      final l$endDate = endDate;
      result$data['endDate'] = l$endDate?.toIso8601String();
    }
    if (_$data.containsKey('terms')) {
      final l$terms = terms;
      result$data['terms'] = l$terms;
    }
    if (_$data.containsKey('maxVisitsPerYear')) {
      final l$maxVisitsPerYear = maxVisitsPerYear;
      result$data['maxVisitsPerYear'] = l$maxVisitsPerYear;
    }
    if (_$data.containsKey('maxVisitDuration')) {
      final l$maxVisitDuration = maxVisitDuration;
      result$data['maxVisitDuration'] = l$maxVisitDuration;
    }
    if (_$data.containsKey('allowedFacilities')) {
      final l$allowedFacilities = allowedFacilities;
      result$data['allowedFacilities'] = l$allowedFacilities
          ?.map((e) => e)
          .toList();
    }
    if (_$data.containsKey('costSharing')) {
      final l$costSharing = costSharing;
      result$data['costSharing'] = l$costSharing?.toJson();
    }
    if (_$data.containsKey('requiresPreApproval')) {
      final l$requiresPreApproval = requiresPreApproval;
      result$data['requiresPreApproval'] = l$requiresPreApproval;
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    return result$data;
  }

  CopyWith$Input$CreateAgreementInput<Input$CreateAgreementInput>
  get copyWith => CopyWith$Input$CreateAgreementInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateAgreementInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reciprocatingClubId = reciprocatingClubId;
    final lOther$reciprocatingClubId = other.reciprocatingClubId;
    if (l$reciprocatingClubId != lOther$reciprocatingClubId) {
      return false;
    }
    final l$agreementType = agreementType;
    final lOther$agreementType = other.agreementType;
    if (l$agreementType != lOther$agreementType) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
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
    final l$terms = terms;
    final lOther$terms = other.terms;
    if (_$data.containsKey('terms') != other._$data.containsKey('terms')) {
      return false;
    }
    if (l$terms != lOther$terms) {
      return false;
    }
    final l$maxVisitsPerYear = maxVisitsPerYear;
    final lOther$maxVisitsPerYear = other.maxVisitsPerYear;
    if (_$data.containsKey('maxVisitsPerYear') !=
        other._$data.containsKey('maxVisitsPerYear')) {
      return false;
    }
    if (l$maxVisitsPerYear != lOther$maxVisitsPerYear) {
      return false;
    }
    final l$maxVisitDuration = maxVisitDuration;
    final lOther$maxVisitDuration = other.maxVisitDuration;
    if (_$data.containsKey('maxVisitDuration') !=
        other._$data.containsKey('maxVisitDuration')) {
      return false;
    }
    if (l$maxVisitDuration != lOther$maxVisitDuration) {
      return false;
    }
    final l$allowedFacilities = allowedFacilities;
    final lOther$allowedFacilities = other.allowedFacilities;
    if (_$data.containsKey('allowedFacilities') !=
        other._$data.containsKey('allowedFacilities')) {
      return false;
    }
    if (l$allowedFacilities != null && lOther$allowedFacilities != null) {
      if (l$allowedFacilities.length != lOther$allowedFacilities.length) {
        return false;
      }
      for (int i = 0; i < l$allowedFacilities.length; i++) {
        final l$allowedFacilities$entry = l$allowedFacilities[i];
        final lOther$allowedFacilities$entry = lOther$allowedFacilities[i];
        if (l$allowedFacilities$entry != lOther$allowedFacilities$entry) {
          return false;
        }
      }
    } else if (l$allowedFacilities != lOther$allowedFacilities) {
      return false;
    }
    final l$costSharing = costSharing;
    final lOther$costSharing = other.costSharing;
    if (_$data.containsKey('costSharing') !=
        other._$data.containsKey('costSharing')) {
      return false;
    }
    if (l$costSharing != lOther$costSharing) {
      return false;
    }
    final l$requiresPreApproval = requiresPreApproval;
    final lOther$requiresPreApproval = other.requiresPreApproval;
    if (_$data.containsKey('requiresPreApproval') !=
        other._$data.containsKey('requiresPreApproval')) {
      return false;
    }
    if (l$requiresPreApproval != lOther$requiresPreApproval) {
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
    final l$reciprocatingClubId = reciprocatingClubId;
    final l$agreementType = agreementType;
    final l$startDate = startDate;
    final l$endDate = endDate;
    final l$terms = terms;
    final l$maxVisitsPerYear = maxVisitsPerYear;
    final l$maxVisitDuration = maxVisitDuration;
    final l$allowedFacilities = allowedFacilities;
    final l$costSharing = costSharing;
    final l$requiresPreApproval = requiresPreApproval;
    final l$notes = notes;
    return Object.hashAll([
      l$reciprocatingClubId,
      l$agreementType,
      l$startDate,
      _$data.containsKey('endDate') ? l$endDate : const {},
      _$data.containsKey('terms') ? l$terms : const {},
      _$data.containsKey('maxVisitsPerYear') ? l$maxVisitsPerYear : const {},
      _$data.containsKey('maxVisitDuration') ? l$maxVisitDuration : const {},
      _$data.containsKey('allowedFacilities')
          ? l$allowedFacilities == null
                ? null
                : Object.hashAll(l$allowedFacilities.map((v) => v))
          : const {},
      _$data.containsKey('costSharing') ? l$costSharing : const {},
      _$data.containsKey('requiresPreApproval')
          ? l$requiresPreApproval
          : const {},
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateAgreementInput<TRes> {
  factory CopyWith$Input$CreateAgreementInput(
    Input$CreateAgreementInput instance,
    TRes Function(Input$CreateAgreementInput) then,
  ) = _CopyWithImpl$Input$CreateAgreementInput;

  factory CopyWith$Input$CreateAgreementInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateAgreementInput;

  TRes call({
    String? reciprocatingClubId,
    Enum$AgreementType? agreementType,
    DateTime? startDate,
    DateTime? endDate,
    String? terms,
    int? maxVisitsPerYear,
    int? maxVisitDuration,
    List<String>? allowedFacilities,
    Input$CostSharingInput? costSharing,
    bool? requiresPreApproval,
    String? notes,
  });
  CopyWith$Input$CostSharingInput<TRes> get costSharing;
}

class _CopyWithImpl$Input$CreateAgreementInput<TRes>
    implements CopyWith$Input$CreateAgreementInput<TRes> {
  _CopyWithImpl$Input$CreateAgreementInput(this._instance, this._then);

  final Input$CreateAgreementInput _instance;

  final TRes Function(Input$CreateAgreementInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? reciprocatingClubId = _undefined,
    Object? agreementType = _undefined,
    Object? startDate = _undefined,
    Object? endDate = _undefined,
    Object? terms = _undefined,
    Object? maxVisitsPerYear = _undefined,
    Object? maxVisitDuration = _undefined,
    Object? allowedFacilities = _undefined,
    Object? costSharing = _undefined,
    Object? requiresPreApproval = _undefined,
    Object? notes = _undefined,
  }) => _then(
    Input$CreateAgreementInput._({
      ..._instance._$data,
      if (reciprocatingClubId != _undefined && reciprocatingClubId != null)
        'reciprocatingClubId': (reciprocatingClubId as String),
      if (agreementType != _undefined && agreementType != null)
        'agreementType': (agreementType as Enum$AgreementType),
      if (startDate != _undefined && startDate != null)
        'startDate': (startDate as DateTime),
      if (endDate != _undefined) 'endDate': (endDate as DateTime?),
      if (terms != _undefined) 'terms': (terms as String?),
      if (maxVisitsPerYear != _undefined)
        'maxVisitsPerYear': (maxVisitsPerYear as int?),
      if (maxVisitDuration != _undefined)
        'maxVisitDuration': (maxVisitDuration as int?),
      if (allowedFacilities != _undefined)
        'allowedFacilities': (allowedFacilities as List<String>?),
      if (costSharing != _undefined)
        'costSharing': (costSharing as Input$CostSharingInput?),
      if (requiresPreApproval != _undefined)
        'requiresPreApproval': (requiresPreApproval as bool?),
      if (notes != _undefined) 'notes': (notes as String?),
    }),
  );

  CopyWith$Input$CostSharingInput<TRes> get costSharing {
    final local$costSharing = _instance.costSharing;
    return local$costSharing == null
        ? CopyWith$Input$CostSharingInput.stub(_then(_instance))
        : CopyWith$Input$CostSharingInput(
            local$costSharing,
            (e) => call(costSharing: e),
          );
  }
}

class _CopyWithStubImpl$Input$CreateAgreementInput<TRes>
    implements CopyWith$Input$CreateAgreementInput<TRes> {
  _CopyWithStubImpl$Input$CreateAgreementInput(this._res);

  TRes _res;

  call({
    String? reciprocatingClubId,
    Enum$AgreementType? agreementType,
    DateTime? startDate,
    DateTime? endDate,
    String? terms,
    int? maxVisitsPerYear,
    int? maxVisitDuration,
    List<String>? allowedFacilities,
    Input$CostSharingInput? costSharing,
    bool? requiresPreApproval,
    String? notes,
  }) => _res;

  CopyWith$Input$CostSharingInput<TRes> get costSharing =>
      CopyWith$Input$CostSharingInput.stub(_res);
}

class Input$UpdateAgreementInput {
  factory Input$UpdateAgreementInput({
    Enum$AgreementStatus? status,
    DateTime? endDate,
    String? terms,
    int? maxVisitsPerYear,
    int? maxVisitDuration,
    List<String>? allowedFacilities,
    Input$CostSharingInput? costSharing,
    bool? requiresPreApproval,
    String? notes,
  }) => Input$UpdateAgreementInput._({
    if (status != null) r'status': status,
    if (endDate != null) r'endDate': endDate,
    if (terms != null) r'terms': terms,
    if (maxVisitsPerYear != null) r'maxVisitsPerYear': maxVisitsPerYear,
    if (maxVisitDuration != null) r'maxVisitDuration': maxVisitDuration,
    if (allowedFacilities != null) r'allowedFacilities': allowedFacilities,
    if (costSharing != null) r'costSharing': costSharing,
    if (requiresPreApproval != null)
      r'requiresPreApproval': requiresPreApproval,
    if (notes != null) r'notes': notes,
  });

  Input$UpdateAgreementInput._(this._$data);

  factory Input$UpdateAgreementInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$AgreementStatus((l$status as String));
    }
    if (data.containsKey('endDate')) {
      final l$endDate = data['endDate'];
      result$data['endDate'] = l$endDate == null
          ? null
          : DateTime.parse((l$endDate as String));
    }
    if (data.containsKey('terms')) {
      final l$terms = data['terms'];
      result$data['terms'] = (l$terms as String?);
    }
    if (data.containsKey('maxVisitsPerYear')) {
      final l$maxVisitsPerYear = data['maxVisitsPerYear'];
      result$data['maxVisitsPerYear'] = (l$maxVisitsPerYear as int?);
    }
    if (data.containsKey('maxVisitDuration')) {
      final l$maxVisitDuration = data['maxVisitDuration'];
      result$data['maxVisitDuration'] = (l$maxVisitDuration as int?);
    }
    if (data.containsKey('allowedFacilities')) {
      final l$allowedFacilities = data['allowedFacilities'];
      result$data['allowedFacilities'] = (l$allowedFacilities as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('costSharing')) {
      final l$costSharing = data['costSharing'];
      result$data['costSharing'] = l$costSharing == null
          ? null
          : Input$CostSharingInput.fromJson(
              (l$costSharing as Map<String, dynamic>),
            );
    }
    if (data.containsKey('requiresPreApproval')) {
      final l$requiresPreApproval = data['requiresPreApproval'];
      result$data['requiresPreApproval'] = (l$requiresPreApproval as bool?);
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Input$UpdateAgreementInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$AgreementStatus? get status =>
      (_$data['status'] as Enum$AgreementStatus?);

  DateTime? get endDate => (_$data['endDate'] as DateTime?);

  String? get terms => (_$data['terms'] as String?);

  int? get maxVisitsPerYear => (_$data['maxVisitsPerYear'] as int?);

  int? get maxVisitDuration => (_$data['maxVisitDuration'] as int?);

  List<String>? get allowedFacilities =>
      (_$data['allowedFacilities'] as List<String>?);

  Input$CostSharingInput? get costSharing =>
      (_$data['costSharing'] as Input$CostSharingInput?);

  bool? get requiresPreApproval => (_$data['requiresPreApproval'] as bool?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$AgreementStatus(l$status);
    }
    if (_$data.containsKey('endDate')) {
      final l$endDate = endDate;
      result$data['endDate'] = l$endDate?.toIso8601String();
    }
    if (_$data.containsKey('terms')) {
      final l$terms = terms;
      result$data['terms'] = l$terms;
    }
    if (_$data.containsKey('maxVisitsPerYear')) {
      final l$maxVisitsPerYear = maxVisitsPerYear;
      result$data['maxVisitsPerYear'] = l$maxVisitsPerYear;
    }
    if (_$data.containsKey('maxVisitDuration')) {
      final l$maxVisitDuration = maxVisitDuration;
      result$data['maxVisitDuration'] = l$maxVisitDuration;
    }
    if (_$data.containsKey('allowedFacilities')) {
      final l$allowedFacilities = allowedFacilities;
      result$data['allowedFacilities'] = l$allowedFacilities
          ?.map((e) => e)
          .toList();
    }
    if (_$data.containsKey('costSharing')) {
      final l$costSharing = costSharing;
      result$data['costSharing'] = l$costSharing?.toJson();
    }
    if (_$data.containsKey('requiresPreApproval')) {
      final l$requiresPreApproval = requiresPreApproval;
      result$data['requiresPreApproval'] = l$requiresPreApproval;
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    return result$data;
  }

  CopyWith$Input$UpdateAgreementInput<Input$UpdateAgreementInput>
  get copyWith => CopyWith$Input$UpdateAgreementInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateAgreementInput ||
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
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (_$data.containsKey('endDate') != other._$data.containsKey('endDate')) {
      return false;
    }
    if (l$endDate != lOther$endDate) {
      return false;
    }
    final l$terms = terms;
    final lOther$terms = other.terms;
    if (_$data.containsKey('terms') != other._$data.containsKey('terms')) {
      return false;
    }
    if (l$terms != lOther$terms) {
      return false;
    }
    final l$maxVisitsPerYear = maxVisitsPerYear;
    final lOther$maxVisitsPerYear = other.maxVisitsPerYear;
    if (_$data.containsKey('maxVisitsPerYear') !=
        other._$data.containsKey('maxVisitsPerYear')) {
      return false;
    }
    if (l$maxVisitsPerYear != lOther$maxVisitsPerYear) {
      return false;
    }
    final l$maxVisitDuration = maxVisitDuration;
    final lOther$maxVisitDuration = other.maxVisitDuration;
    if (_$data.containsKey('maxVisitDuration') !=
        other._$data.containsKey('maxVisitDuration')) {
      return false;
    }
    if (l$maxVisitDuration != lOther$maxVisitDuration) {
      return false;
    }
    final l$allowedFacilities = allowedFacilities;
    final lOther$allowedFacilities = other.allowedFacilities;
    if (_$data.containsKey('allowedFacilities') !=
        other._$data.containsKey('allowedFacilities')) {
      return false;
    }
    if (l$allowedFacilities != null && lOther$allowedFacilities != null) {
      if (l$allowedFacilities.length != lOther$allowedFacilities.length) {
        return false;
      }
      for (int i = 0; i < l$allowedFacilities.length; i++) {
        final l$allowedFacilities$entry = l$allowedFacilities[i];
        final lOther$allowedFacilities$entry = lOther$allowedFacilities[i];
        if (l$allowedFacilities$entry != lOther$allowedFacilities$entry) {
          return false;
        }
      }
    } else if (l$allowedFacilities != lOther$allowedFacilities) {
      return false;
    }
    final l$costSharing = costSharing;
    final lOther$costSharing = other.costSharing;
    if (_$data.containsKey('costSharing') !=
        other._$data.containsKey('costSharing')) {
      return false;
    }
    if (l$costSharing != lOther$costSharing) {
      return false;
    }
    final l$requiresPreApproval = requiresPreApproval;
    final lOther$requiresPreApproval = other.requiresPreApproval;
    if (_$data.containsKey('requiresPreApproval') !=
        other._$data.containsKey('requiresPreApproval')) {
      return false;
    }
    if (l$requiresPreApproval != lOther$requiresPreApproval) {
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
    final l$endDate = endDate;
    final l$terms = terms;
    final l$maxVisitsPerYear = maxVisitsPerYear;
    final l$maxVisitDuration = maxVisitDuration;
    final l$allowedFacilities = allowedFacilities;
    final l$costSharing = costSharing;
    final l$requiresPreApproval = requiresPreApproval;
    final l$notes = notes;
    return Object.hashAll([
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('endDate') ? l$endDate : const {},
      _$data.containsKey('terms') ? l$terms : const {},
      _$data.containsKey('maxVisitsPerYear') ? l$maxVisitsPerYear : const {},
      _$data.containsKey('maxVisitDuration') ? l$maxVisitDuration : const {},
      _$data.containsKey('allowedFacilities')
          ? l$allowedFacilities == null
                ? null
                : Object.hashAll(l$allowedFacilities.map((v) => v))
          : const {},
      _$data.containsKey('costSharing') ? l$costSharing : const {},
      _$data.containsKey('requiresPreApproval')
          ? l$requiresPreApproval
          : const {},
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateAgreementInput<TRes> {
  factory CopyWith$Input$UpdateAgreementInput(
    Input$UpdateAgreementInput instance,
    TRes Function(Input$UpdateAgreementInput) then,
  ) = _CopyWithImpl$Input$UpdateAgreementInput;

  factory CopyWith$Input$UpdateAgreementInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateAgreementInput;

  TRes call({
    Enum$AgreementStatus? status,
    DateTime? endDate,
    String? terms,
    int? maxVisitsPerYear,
    int? maxVisitDuration,
    List<String>? allowedFacilities,
    Input$CostSharingInput? costSharing,
    bool? requiresPreApproval,
    String? notes,
  });
  CopyWith$Input$CostSharingInput<TRes> get costSharing;
}

class _CopyWithImpl$Input$UpdateAgreementInput<TRes>
    implements CopyWith$Input$UpdateAgreementInput<TRes> {
  _CopyWithImpl$Input$UpdateAgreementInput(this._instance, this._then);

  final Input$UpdateAgreementInput _instance;

  final TRes Function(Input$UpdateAgreementInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? status = _undefined,
    Object? endDate = _undefined,
    Object? terms = _undefined,
    Object? maxVisitsPerYear = _undefined,
    Object? maxVisitDuration = _undefined,
    Object? allowedFacilities = _undefined,
    Object? costSharing = _undefined,
    Object? requiresPreApproval = _undefined,
    Object? notes = _undefined,
  }) => _then(
    Input$UpdateAgreementInput._({
      ..._instance._$data,
      if (status != _undefined) 'status': (status as Enum$AgreementStatus?),
      if (endDate != _undefined) 'endDate': (endDate as DateTime?),
      if (terms != _undefined) 'terms': (terms as String?),
      if (maxVisitsPerYear != _undefined)
        'maxVisitsPerYear': (maxVisitsPerYear as int?),
      if (maxVisitDuration != _undefined)
        'maxVisitDuration': (maxVisitDuration as int?),
      if (allowedFacilities != _undefined)
        'allowedFacilities': (allowedFacilities as List<String>?),
      if (costSharing != _undefined)
        'costSharing': (costSharing as Input$CostSharingInput?),
      if (requiresPreApproval != _undefined)
        'requiresPreApproval': (requiresPreApproval as bool?),
      if (notes != _undefined) 'notes': (notes as String?),
    }),
  );

  CopyWith$Input$CostSharingInput<TRes> get costSharing {
    final local$costSharing = _instance.costSharing;
    return local$costSharing == null
        ? CopyWith$Input$CostSharingInput.stub(_then(_instance))
        : CopyWith$Input$CostSharingInput(
            local$costSharing,
            (e) => call(costSharing: e),
          );
  }
}

class _CopyWithStubImpl$Input$UpdateAgreementInput<TRes>
    implements CopyWith$Input$UpdateAgreementInput<TRes> {
  _CopyWithStubImpl$Input$UpdateAgreementInput(this._res);

  TRes _res;

  call({
    Enum$AgreementStatus? status,
    DateTime? endDate,
    String? terms,
    int? maxVisitsPerYear,
    int? maxVisitDuration,
    List<String>? allowedFacilities,
    Input$CostSharingInput? costSharing,
    bool? requiresPreApproval,
    String? notes,
  }) => _res;

  CopyWith$Input$CostSharingInput<TRes> get costSharing =>
      CopyWith$Input$CostSharingInput.stub(_res);
}

class Input$CheckInInput {
  factory Input$CheckInInput({
    required String hostClubId,
    String? agreementId,
    int? guestCount,
    String? purpose,
    String? notes,
  }) => Input$CheckInInput._({
    r'hostClubId': hostClubId,
    if (agreementId != null) r'agreementId': agreementId,
    if (guestCount != null) r'guestCount': guestCount,
    if (purpose != null) r'purpose': purpose,
    if (notes != null) r'notes': notes,
  });

  Input$CheckInInput._(this._$data);

  factory Input$CheckInInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$hostClubId = data['hostClubId'];
    result$data['hostClubId'] = (l$hostClubId as String);
    if (data.containsKey('agreementId')) {
      final l$agreementId = data['agreementId'];
      result$data['agreementId'] = (l$agreementId as String?);
    }
    if (data.containsKey('guestCount')) {
      final l$guestCount = data['guestCount'];
      result$data['guestCount'] = (l$guestCount as int?);
    }
    if (data.containsKey('purpose')) {
      final l$purpose = data['purpose'];
      result$data['purpose'] = (l$purpose as String?);
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Input$CheckInInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get hostClubId => (_$data['hostClubId'] as String);

  String? get agreementId => (_$data['agreementId'] as String?);

  int? get guestCount => (_$data['guestCount'] as int?);

  String? get purpose => (_$data['purpose'] as String?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$hostClubId = hostClubId;
    result$data['hostClubId'] = l$hostClubId;
    if (_$data.containsKey('agreementId')) {
      final l$agreementId = agreementId;
      result$data['agreementId'] = l$agreementId;
    }
    if (_$data.containsKey('guestCount')) {
      final l$guestCount = guestCount;
      result$data['guestCount'] = l$guestCount;
    }
    if (_$data.containsKey('purpose')) {
      final l$purpose = purpose;
      result$data['purpose'] = l$purpose;
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    return result$data;
  }

  CopyWith$Input$CheckInInput<Input$CheckInInput> get copyWith =>
      CopyWith$Input$CheckInInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CheckInInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$hostClubId = hostClubId;
    final lOther$hostClubId = other.hostClubId;
    if (l$hostClubId != lOther$hostClubId) {
      return false;
    }
    final l$agreementId = agreementId;
    final lOther$agreementId = other.agreementId;
    if (_$data.containsKey('agreementId') !=
        other._$data.containsKey('agreementId')) {
      return false;
    }
    if (l$agreementId != lOther$agreementId) {
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
    final l$purpose = purpose;
    final lOther$purpose = other.purpose;
    if (_$data.containsKey('purpose') != other._$data.containsKey('purpose')) {
      return false;
    }
    if (l$purpose != lOther$purpose) {
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
    final l$hostClubId = hostClubId;
    final l$agreementId = agreementId;
    final l$guestCount = guestCount;
    final l$purpose = purpose;
    final l$notes = notes;
    return Object.hashAll([
      l$hostClubId,
      _$data.containsKey('agreementId') ? l$agreementId : const {},
      _$data.containsKey('guestCount') ? l$guestCount : const {},
      _$data.containsKey('purpose') ? l$purpose : const {},
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
  }
}

abstract class CopyWith$Input$CheckInInput<TRes> {
  factory CopyWith$Input$CheckInInput(
    Input$CheckInInput instance,
    TRes Function(Input$CheckInInput) then,
  ) = _CopyWithImpl$Input$CheckInInput;

  factory CopyWith$Input$CheckInInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CheckInInput;

  TRes call({
    String? hostClubId,
    String? agreementId,
    int? guestCount,
    String? purpose,
    String? notes,
  });
}

class _CopyWithImpl$Input$CheckInInput<TRes>
    implements CopyWith$Input$CheckInInput<TRes> {
  _CopyWithImpl$Input$CheckInInput(this._instance, this._then);

  final Input$CheckInInput _instance;

  final TRes Function(Input$CheckInInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hostClubId = _undefined,
    Object? agreementId = _undefined,
    Object? guestCount = _undefined,
    Object? purpose = _undefined,
    Object? notes = _undefined,
  }) => _then(
    Input$CheckInInput._({
      ..._instance._$data,
      if (hostClubId != _undefined && hostClubId != null)
        'hostClubId': (hostClubId as String),
      if (agreementId != _undefined) 'agreementId': (agreementId as String?),
      if (guestCount != _undefined) 'guestCount': (guestCount as int?),
      if (purpose != _undefined) 'purpose': (purpose as String?),
      if (notes != _undefined) 'notes': (notes as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$CheckInInput<TRes>
    implements CopyWith$Input$CheckInInput<TRes> {
  _CopyWithStubImpl$Input$CheckInInput(this._res);

  TRes _res;

  call({
    String? hostClubId,
    String? agreementId,
    int? guestCount,
    String? purpose,
    String? notes,
  }) => _res;
}

class Input$CheckOutInput {
  factory Input$CheckOutInput({
    Input$VisitCostsInput? costs,
    List<String>? facilitiesUsed,
    String? notes,
  }) => Input$CheckOutInput._({
    if (costs != null) r'costs': costs,
    if (facilitiesUsed != null) r'facilitiesUsed': facilitiesUsed,
    if (notes != null) r'notes': notes,
  });

  Input$CheckOutInput._(this._$data);

  factory Input$CheckOutInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('costs')) {
      final l$costs = data['costs'];
      result$data['costs'] = l$costs == null
          ? null
          : Input$VisitCostsInput.fromJson((l$costs as Map<String, dynamic>));
    }
    if (data.containsKey('facilitiesUsed')) {
      final l$facilitiesUsed = data['facilitiesUsed'];
      result$data['facilitiesUsed'] = (l$facilitiesUsed as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Input$CheckOutInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$VisitCostsInput? get costs =>
      (_$data['costs'] as Input$VisitCostsInput?);

  List<String>? get facilitiesUsed =>
      (_$data['facilitiesUsed'] as List<String>?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('costs')) {
      final l$costs = costs;
      result$data['costs'] = l$costs?.toJson();
    }
    if (_$data.containsKey('facilitiesUsed')) {
      final l$facilitiesUsed = facilitiesUsed;
      result$data['facilitiesUsed'] = l$facilitiesUsed?.map((e) => e).toList();
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    return result$data;
  }

  CopyWith$Input$CheckOutInput<Input$CheckOutInput> get copyWith =>
      CopyWith$Input$CheckOutInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CheckOutInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$costs = costs;
    final lOther$costs = other.costs;
    if (_$data.containsKey('costs') != other._$data.containsKey('costs')) {
      return false;
    }
    if (l$costs != lOther$costs) {
      return false;
    }
    final l$facilitiesUsed = facilitiesUsed;
    final lOther$facilitiesUsed = other.facilitiesUsed;
    if (_$data.containsKey('facilitiesUsed') !=
        other._$data.containsKey('facilitiesUsed')) {
      return false;
    }
    if (l$facilitiesUsed != null && lOther$facilitiesUsed != null) {
      if (l$facilitiesUsed.length != lOther$facilitiesUsed.length) {
        return false;
      }
      for (int i = 0; i < l$facilitiesUsed.length; i++) {
        final l$facilitiesUsed$entry = l$facilitiesUsed[i];
        final lOther$facilitiesUsed$entry = lOther$facilitiesUsed[i];
        if (l$facilitiesUsed$entry != lOther$facilitiesUsed$entry) {
          return false;
        }
      }
    } else if (l$facilitiesUsed != lOther$facilitiesUsed) {
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
    final l$costs = costs;
    final l$facilitiesUsed = facilitiesUsed;
    final l$notes = notes;
    return Object.hashAll([
      _$data.containsKey('costs') ? l$costs : const {},
      _$data.containsKey('facilitiesUsed')
          ? l$facilitiesUsed == null
                ? null
                : Object.hashAll(l$facilitiesUsed.map((v) => v))
          : const {},
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
  }
}

abstract class CopyWith$Input$CheckOutInput<TRes> {
  factory CopyWith$Input$CheckOutInput(
    Input$CheckOutInput instance,
    TRes Function(Input$CheckOutInput) then,
  ) = _CopyWithImpl$Input$CheckOutInput;

  factory CopyWith$Input$CheckOutInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CheckOutInput;

  TRes call({
    Input$VisitCostsInput? costs,
    List<String>? facilitiesUsed,
    String? notes,
  });
  CopyWith$Input$VisitCostsInput<TRes> get costs;
}

class _CopyWithImpl$Input$CheckOutInput<TRes>
    implements CopyWith$Input$CheckOutInput<TRes> {
  _CopyWithImpl$Input$CheckOutInput(this._instance, this._then);

  final Input$CheckOutInput _instance;

  final TRes Function(Input$CheckOutInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? costs = _undefined,
    Object? facilitiesUsed = _undefined,
    Object? notes = _undefined,
  }) => _then(
    Input$CheckOutInput._({
      ..._instance._$data,
      if (costs != _undefined) 'costs': (costs as Input$VisitCostsInput?),
      if (facilitiesUsed != _undefined)
        'facilitiesUsed': (facilitiesUsed as List<String>?),
      if (notes != _undefined) 'notes': (notes as String?),
    }),
  );

  CopyWith$Input$VisitCostsInput<TRes> get costs {
    final local$costs = _instance.costs;
    return local$costs == null
        ? CopyWith$Input$VisitCostsInput.stub(_then(_instance))
        : CopyWith$Input$VisitCostsInput(local$costs, (e) => call(costs: e));
  }
}

class _CopyWithStubImpl$Input$CheckOutInput<TRes>
    implements CopyWith$Input$CheckOutInput<TRes> {
  _CopyWithStubImpl$Input$CheckOutInput(this._res);

  TRes _res;

  call({
    Input$VisitCostsInput? costs,
    List<String>? facilitiesUsed,
    String? notes,
  }) => _res;

  CopyWith$Input$VisitCostsInput<TRes> get costs =>
      CopyWith$Input$VisitCostsInput.stub(_res);
}

class Input$CreateNotificationTemplateInput {
  factory Input$CreateNotificationTemplateInput({
    required String name,
    required Enum$NotificationChannel channel,
    required String bodyTemplate,
    String? htmlTemplate,
    required List<String> variables,
  }) => Input$CreateNotificationTemplateInput._({
    r'name': name,
    r'channel': channel,
    r'bodyTemplate': bodyTemplate,
    if (htmlTemplate != null) r'htmlTemplate': htmlTemplate,
    r'variables': variables,
  });

  Input$CreateNotificationTemplateInput._(this._$data);

  factory Input$CreateNotificationTemplateInput.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$channel = data['channel'];
    result$data['channel'] = fromJson$Enum$NotificationChannel(
      (l$channel as String),
    );
    final l$bodyTemplate = data['bodyTemplate'];
    result$data['bodyTemplate'] = (l$bodyTemplate as String);
    if (data.containsKey('htmlTemplate')) {
      final l$htmlTemplate = data['htmlTemplate'];
      result$data['htmlTemplate'] = (l$htmlTemplate as String?);
    }
    final l$variables = data['variables'];
    result$data['variables'] = (l$variables as List<dynamic>)
        .map((e) => (e as String))
        .toList();
    return Input$CreateNotificationTemplateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  Enum$NotificationChannel get channel =>
      (_$data['channel'] as Enum$NotificationChannel);

  String get bodyTemplate => (_$data['bodyTemplate'] as String);

  String? get htmlTemplate => (_$data['htmlTemplate'] as String?);

  List<String> get variables => (_$data['variables'] as List<String>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$channel = channel;
    result$data['channel'] = toJson$Enum$NotificationChannel(l$channel);
    final l$bodyTemplate = bodyTemplate;
    result$data['bodyTemplate'] = l$bodyTemplate;
    if (_$data.containsKey('htmlTemplate')) {
      final l$htmlTemplate = htmlTemplate;
      result$data['htmlTemplate'] = l$htmlTemplate;
    }
    final l$variables = variables;
    result$data['variables'] = l$variables.map((e) => e).toList();
    return result$data;
  }

  CopyWith$Input$CreateNotificationTemplateInput<
    Input$CreateNotificationTemplateInput
  >
  get copyWith =>
      CopyWith$Input$CreateNotificationTemplateInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateNotificationTemplateInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$channel = channel;
    final lOther$channel = other.channel;
    if (l$channel != lOther$channel) {
      return false;
    }
    final l$bodyTemplate = bodyTemplate;
    final lOther$bodyTemplate = other.bodyTemplate;
    if (l$bodyTemplate != lOther$bodyTemplate) {
      return false;
    }
    final l$htmlTemplate = htmlTemplate;
    final lOther$htmlTemplate = other.htmlTemplate;
    if (_$data.containsKey('htmlTemplate') !=
        other._$data.containsKey('htmlTemplate')) {
      return false;
    }
    if (l$htmlTemplate != lOther$htmlTemplate) {
      return false;
    }
    final l$variables = variables;
    final lOther$variables = other.variables;
    if (l$variables.length != lOther$variables.length) {
      return false;
    }
    for (int i = 0; i < l$variables.length; i++) {
      final l$variables$entry = l$variables[i];
      final lOther$variables$entry = lOther$variables[i];
      if (l$variables$entry != lOther$variables$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$channel = channel;
    final l$bodyTemplate = bodyTemplate;
    final l$htmlTemplate = htmlTemplate;
    final l$variables = variables;
    return Object.hashAll([
      l$name,
      l$channel,
      l$bodyTemplate,
      _$data.containsKey('htmlTemplate') ? l$htmlTemplate : const {},
      Object.hashAll(l$variables.map((v) => v)),
    ]);
  }
}

abstract class CopyWith$Input$CreateNotificationTemplateInput<TRes> {
  factory CopyWith$Input$CreateNotificationTemplateInput(
    Input$CreateNotificationTemplateInput instance,
    TRes Function(Input$CreateNotificationTemplateInput) then,
  ) = _CopyWithImpl$Input$CreateNotificationTemplateInput;

  factory CopyWith$Input$CreateNotificationTemplateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateNotificationTemplateInput;

  TRes call({
    String? name,
    Enum$NotificationChannel? channel,
    String? bodyTemplate,
    String? htmlTemplate,
    List<String>? variables,
  });
}

class _CopyWithImpl$Input$CreateNotificationTemplateInput<TRes>
    implements CopyWith$Input$CreateNotificationTemplateInput<TRes> {
  _CopyWithImpl$Input$CreateNotificationTemplateInput(
    this._instance,
    this._then,
  );

  final Input$CreateNotificationTemplateInput _instance;

  final TRes Function(Input$CreateNotificationTemplateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? channel = _undefined,
    Object? bodyTemplate = _undefined,
    Object? htmlTemplate = _undefined,
    Object? variables = _undefined,
  }) => _then(
    Input$CreateNotificationTemplateInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (channel != _undefined && channel != null)
        'channel': (channel as Enum$NotificationChannel),
      if (bodyTemplate != _undefined && bodyTemplate != null)
        'bodyTemplate': (bodyTemplate as String),
      if (htmlTemplate != _undefined) 'htmlTemplate': (htmlTemplate as String?),
      if (variables != _undefined && variables != null)
        'variables': (variables as List<String>),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateNotificationTemplateInput<TRes>
    implements CopyWith$Input$CreateNotificationTemplateInput<TRes> {
  _CopyWithStubImpl$Input$CreateNotificationTemplateInput(this._res);

  TRes _res;

  call({
    String? name,
    Enum$NotificationChannel? channel,
    String? bodyTemplate,
    String? htmlTemplate,
    List<String>? variables,
  }) => _res;
}

class Input$UpdateNotificationTemplateInput {
  factory Input$UpdateNotificationTemplateInput({
    String? name,
    String? bodyTemplate,
    String? htmlTemplate,
    List<String>? variables,
    bool? isActive,
  }) => Input$UpdateNotificationTemplateInput._({
    if (name != null) r'name': name,
    if (bodyTemplate != null) r'bodyTemplate': bodyTemplate,
    if (htmlTemplate != null) r'htmlTemplate': htmlTemplate,
    if (variables != null) r'variables': variables,
    if (isActive != null) r'isActive': isActive,
  });

  Input$UpdateNotificationTemplateInput._(this._$data);

  factory Input$UpdateNotificationTemplateInput.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('bodyTemplate')) {
      final l$bodyTemplate = data['bodyTemplate'];
      result$data['bodyTemplate'] = (l$bodyTemplate as String?);
    }
    if (data.containsKey('htmlTemplate')) {
      final l$htmlTemplate = data['htmlTemplate'];
      result$data['htmlTemplate'] = (l$htmlTemplate as String?);
    }
    if (data.containsKey('variables')) {
      final l$variables = data['variables'];
      result$data['variables'] = (l$variables as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('isActive')) {
      final l$isActive = data['isActive'];
      result$data['isActive'] = (l$isActive as bool?);
    }
    return Input$UpdateNotificationTemplateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get bodyTemplate => (_$data['bodyTemplate'] as String?);

  String? get htmlTemplate => (_$data['htmlTemplate'] as String?);

  List<String>? get variables => (_$data['variables'] as List<String>?);

  bool? get isActive => (_$data['isActive'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('bodyTemplate')) {
      final l$bodyTemplate = bodyTemplate;
      result$data['bodyTemplate'] = l$bodyTemplate;
    }
    if (_$data.containsKey('htmlTemplate')) {
      final l$htmlTemplate = htmlTemplate;
      result$data['htmlTemplate'] = l$htmlTemplate;
    }
    if (_$data.containsKey('variables')) {
      final l$variables = variables;
      result$data['variables'] = l$variables?.map((e) => e).toList();
    }
    if (_$data.containsKey('isActive')) {
      final l$isActive = isActive;
      result$data['isActive'] = l$isActive;
    }
    return result$data;
  }

  CopyWith$Input$UpdateNotificationTemplateInput<
    Input$UpdateNotificationTemplateInput
  >
  get copyWith =>
      CopyWith$Input$UpdateNotificationTemplateInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateNotificationTemplateInput ||
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
    final l$bodyTemplate = bodyTemplate;
    final lOther$bodyTemplate = other.bodyTemplate;
    if (_$data.containsKey('bodyTemplate') !=
        other._$data.containsKey('bodyTemplate')) {
      return false;
    }
    if (l$bodyTemplate != lOther$bodyTemplate) {
      return false;
    }
    final l$htmlTemplate = htmlTemplate;
    final lOther$htmlTemplate = other.htmlTemplate;
    if (_$data.containsKey('htmlTemplate') !=
        other._$data.containsKey('htmlTemplate')) {
      return false;
    }
    if (l$htmlTemplate != lOther$htmlTemplate) {
      return false;
    }
    final l$variables = variables;
    final lOther$variables = other.variables;
    if (_$data.containsKey('variables') !=
        other._$data.containsKey('variables')) {
      return false;
    }
    if (l$variables != null && lOther$variables != null) {
      if (l$variables.length != lOther$variables.length) {
        return false;
      }
      for (int i = 0; i < l$variables.length; i++) {
        final l$variables$entry = l$variables[i];
        final lOther$variables$entry = lOther$variables[i];
        if (l$variables$entry != lOther$variables$entry) {
          return false;
        }
      }
    } else if (l$variables != lOther$variables) {
      return false;
    }
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (_$data.containsKey('isActive') !=
        other._$data.containsKey('isActive')) {
      return false;
    }
    if (l$isActive != lOther$isActive) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$bodyTemplate = bodyTemplate;
    final l$htmlTemplate = htmlTemplate;
    final l$variables = variables;
    final l$isActive = isActive;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('bodyTemplate') ? l$bodyTemplate : const {},
      _$data.containsKey('htmlTemplate') ? l$htmlTemplate : const {},
      _$data.containsKey('variables')
          ? l$variables == null
                ? null
                : Object.hashAll(l$variables.map((v) => v))
          : const {},
      _$data.containsKey('isActive') ? l$isActive : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateNotificationTemplateInput<TRes> {
  factory CopyWith$Input$UpdateNotificationTemplateInput(
    Input$UpdateNotificationTemplateInput instance,
    TRes Function(Input$UpdateNotificationTemplateInput) then,
  ) = _CopyWithImpl$Input$UpdateNotificationTemplateInput;

  factory CopyWith$Input$UpdateNotificationTemplateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateNotificationTemplateInput;

  TRes call({
    String? name,
    String? bodyTemplate,
    String? htmlTemplate,
    List<String>? variables,
    bool? isActive,
  });
}

class _CopyWithImpl$Input$UpdateNotificationTemplateInput<TRes>
    implements CopyWith$Input$UpdateNotificationTemplateInput<TRes> {
  _CopyWithImpl$Input$UpdateNotificationTemplateInput(
    this._instance,
    this._then,
  );

  final Input$UpdateNotificationTemplateInput _instance;

  final TRes Function(Input$UpdateNotificationTemplateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? bodyTemplate = _undefined,
    Object? htmlTemplate = _undefined,
    Object? variables = _undefined,
    Object? isActive = _undefined,
  }) => _then(
    Input$UpdateNotificationTemplateInput._({
      ..._instance._$data,
      if (name != _undefined) 'name': (name as String?),
      if (bodyTemplate != _undefined) 'bodyTemplate': (bodyTemplate as String?),
      if (htmlTemplate != _undefined) 'htmlTemplate': (htmlTemplate as String?),
      if (variables != _undefined) 'variables': (variables as List<String>?),
      if (isActive != _undefined) 'isActive': (isActive as bool?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateNotificationTemplateInput<TRes>
    implements CopyWith$Input$UpdateNotificationTemplateInput<TRes> {
  _CopyWithStubImpl$Input$UpdateNotificationTemplateInput(this._res);

  TRes _res;

  call({
    String? name,
    String? bodyTemplate,
    String? htmlTemplate,
    List<String>? variables,
    bool? isActive,
  }) => _res;
}

class Input$UpdateNotificationPreferenceInput {
  factory Input$UpdateNotificationPreferenceInput({
    bool? emailEnabled,
    bool? smsEnabled,
    bool? pushEnabled,
    bool? inAppEnabled,
    bool? quietHoursEnabled,
    String? quietHoursStart,
    String? quietHoursEnd,
    bool? digestEnabled,
    String? digestFrequency,
  }) => Input$UpdateNotificationPreferenceInput._({
    if (emailEnabled != null) r'emailEnabled': emailEnabled,
    if (smsEnabled != null) r'smsEnabled': smsEnabled,
    if (pushEnabled != null) r'pushEnabled': pushEnabled,
    if (inAppEnabled != null) r'inAppEnabled': inAppEnabled,
    if (quietHoursEnabled != null) r'quietHoursEnabled': quietHoursEnabled,
    if (quietHoursStart != null) r'quietHoursStart': quietHoursStart,
    if (quietHoursEnd != null) r'quietHoursEnd': quietHoursEnd,
    if (digestEnabled != null) r'digestEnabled': digestEnabled,
    if (digestFrequency != null) r'digestFrequency': digestFrequency,
  });

  Input$UpdateNotificationPreferenceInput._(this._$data);

  factory Input$UpdateNotificationPreferenceInput.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('emailEnabled')) {
      final l$emailEnabled = data['emailEnabled'];
      result$data['emailEnabled'] = (l$emailEnabled as bool?);
    }
    if (data.containsKey('smsEnabled')) {
      final l$smsEnabled = data['smsEnabled'];
      result$data['smsEnabled'] = (l$smsEnabled as bool?);
    }
    if (data.containsKey('pushEnabled')) {
      final l$pushEnabled = data['pushEnabled'];
      result$data['pushEnabled'] = (l$pushEnabled as bool?);
    }
    if (data.containsKey('inAppEnabled')) {
      final l$inAppEnabled = data['inAppEnabled'];
      result$data['inAppEnabled'] = (l$inAppEnabled as bool?);
    }
    if (data.containsKey('quietHoursEnabled')) {
      final l$quietHoursEnabled = data['quietHoursEnabled'];
      result$data['quietHoursEnabled'] = (l$quietHoursEnabled as bool?);
    }
    if (data.containsKey('quietHoursStart')) {
      final l$quietHoursStart = data['quietHoursStart'];
      result$data['quietHoursStart'] = (l$quietHoursStart as String?);
    }
    if (data.containsKey('quietHoursEnd')) {
      final l$quietHoursEnd = data['quietHoursEnd'];
      result$data['quietHoursEnd'] = (l$quietHoursEnd as String?);
    }
    if (data.containsKey('digestEnabled')) {
      final l$digestEnabled = data['digestEnabled'];
      result$data['digestEnabled'] = (l$digestEnabled as bool?);
    }
    if (data.containsKey('digestFrequency')) {
      final l$digestFrequency = data['digestFrequency'];
      result$data['digestFrequency'] = (l$digestFrequency as String?);
    }
    return Input$UpdateNotificationPreferenceInput._(result$data);
  }

  Map<String, dynamic> _$data;

  bool? get emailEnabled => (_$data['emailEnabled'] as bool?);

  bool? get smsEnabled => (_$data['smsEnabled'] as bool?);

  bool? get pushEnabled => (_$data['pushEnabled'] as bool?);

  bool? get inAppEnabled => (_$data['inAppEnabled'] as bool?);

  bool? get quietHoursEnabled => (_$data['quietHoursEnabled'] as bool?);

  String? get quietHoursStart => (_$data['quietHoursStart'] as String?);

  String? get quietHoursEnd => (_$data['quietHoursEnd'] as String?);

  bool? get digestEnabled => (_$data['digestEnabled'] as bool?);

  String? get digestFrequency => (_$data['digestFrequency'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('emailEnabled')) {
      final l$emailEnabled = emailEnabled;
      result$data['emailEnabled'] = l$emailEnabled;
    }
    if (_$data.containsKey('smsEnabled')) {
      final l$smsEnabled = smsEnabled;
      result$data['smsEnabled'] = l$smsEnabled;
    }
    if (_$data.containsKey('pushEnabled')) {
      final l$pushEnabled = pushEnabled;
      result$data['pushEnabled'] = l$pushEnabled;
    }
    if (_$data.containsKey('inAppEnabled')) {
      final l$inAppEnabled = inAppEnabled;
      result$data['inAppEnabled'] = l$inAppEnabled;
    }
    if (_$data.containsKey('quietHoursEnabled')) {
      final l$quietHoursEnabled = quietHoursEnabled;
      result$data['quietHoursEnabled'] = l$quietHoursEnabled;
    }
    if (_$data.containsKey('quietHoursStart')) {
      final l$quietHoursStart = quietHoursStart;
      result$data['quietHoursStart'] = l$quietHoursStart;
    }
    if (_$data.containsKey('quietHoursEnd')) {
      final l$quietHoursEnd = quietHoursEnd;
      result$data['quietHoursEnd'] = l$quietHoursEnd;
    }
    if (_$data.containsKey('digestEnabled')) {
      final l$digestEnabled = digestEnabled;
      result$data['digestEnabled'] = l$digestEnabled;
    }
    if (_$data.containsKey('digestFrequency')) {
      final l$digestFrequency = digestFrequency;
      result$data['digestFrequency'] = l$digestFrequency;
    }
    return result$data;
  }

  CopyWith$Input$UpdateNotificationPreferenceInput<
    Input$UpdateNotificationPreferenceInput
  >
  get copyWith =>
      CopyWith$Input$UpdateNotificationPreferenceInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateNotificationPreferenceInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$emailEnabled = emailEnabled;
    final lOther$emailEnabled = other.emailEnabled;
    if (_$data.containsKey('emailEnabled') !=
        other._$data.containsKey('emailEnabled')) {
      return false;
    }
    if (l$emailEnabled != lOther$emailEnabled) {
      return false;
    }
    final l$smsEnabled = smsEnabled;
    final lOther$smsEnabled = other.smsEnabled;
    if (_$data.containsKey('smsEnabled') !=
        other._$data.containsKey('smsEnabled')) {
      return false;
    }
    if (l$smsEnabled != lOther$smsEnabled) {
      return false;
    }
    final l$pushEnabled = pushEnabled;
    final lOther$pushEnabled = other.pushEnabled;
    if (_$data.containsKey('pushEnabled') !=
        other._$data.containsKey('pushEnabled')) {
      return false;
    }
    if (l$pushEnabled != lOther$pushEnabled) {
      return false;
    }
    final l$inAppEnabled = inAppEnabled;
    final lOther$inAppEnabled = other.inAppEnabled;
    if (_$data.containsKey('inAppEnabled') !=
        other._$data.containsKey('inAppEnabled')) {
      return false;
    }
    if (l$inAppEnabled != lOther$inAppEnabled) {
      return false;
    }
    final l$quietHoursEnabled = quietHoursEnabled;
    final lOther$quietHoursEnabled = other.quietHoursEnabled;
    if (_$data.containsKey('quietHoursEnabled') !=
        other._$data.containsKey('quietHoursEnabled')) {
      return false;
    }
    if (l$quietHoursEnabled != lOther$quietHoursEnabled) {
      return false;
    }
    final l$quietHoursStart = quietHoursStart;
    final lOther$quietHoursStart = other.quietHoursStart;
    if (_$data.containsKey('quietHoursStart') !=
        other._$data.containsKey('quietHoursStart')) {
      return false;
    }
    if (l$quietHoursStart != lOther$quietHoursStart) {
      return false;
    }
    final l$quietHoursEnd = quietHoursEnd;
    final lOther$quietHoursEnd = other.quietHoursEnd;
    if (_$data.containsKey('quietHoursEnd') !=
        other._$data.containsKey('quietHoursEnd')) {
      return false;
    }
    if (l$quietHoursEnd != lOther$quietHoursEnd) {
      return false;
    }
    final l$digestEnabled = digestEnabled;
    final lOther$digestEnabled = other.digestEnabled;
    if (_$data.containsKey('digestEnabled') !=
        other._$data.containsKey('digestEnabled')) {
      return false;
    }
    if (l$digestEnabled != lOther$digestEnabled) {
      return false;
    }
    final l$digestFrequency = digestFrequency;
    final lOther$digestFrequency = other.digestFrequency;
    if (_$data.containsKey('digestFrequency') !=
        other._$data.containsKey('digestFrequency')) {
      return false;
    }
    if (l$digestFrequency != lOther$digestFrequency) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$emailEnabled = emailEnabled;
    final l$smsEnabled = smsEnabled;
    final l$pushEnabled = pushEnabled;
    final l$inAppEnabled = inAppEnabled;
    final l$quietHoursEnabled = quietHoursEnabled;
    final l$quietHoursStart = quietHoursStart;
    final l$quietHoursEnd = quietHoursEnd;
    final l$digestEnabled = digestEnabled;
    final l$digestFrequency = digestFrequency;
    return Object.hashAll([
      _$data.containsKey('emailEnabled') ? l$emailEnabled : const {},
      _$data.containsKey('smsEnabled') ? l$smsEnabled : const {},
      _$data.containsKey('pushEnabled') ? l$pushEnabled : const {},
      _$data.containsKey('inAppEnabled') ? l$inAppEnabled : const {},
      _$data.containsKey('quietHoursEnabled') ? l$quietHoursEnabled : const {},
      _$data.containsKey('quietHoursStart') ? l$quietHoursStart : const {},
      _$data.containsKey('quietHoursEnd') ? l$quietHoursEnd : const {},
      _$data.containsKey('digestEnabled') ? l$digestEnabled : const {},
      _$data.containsKey('digestFrequency') ? l$digestFrequency : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateNotificationPreferenceInput<TRes> {
  factory CopyWith$Input$UpdateNotificationPreferenceInput(
    Input$UpdateNotificationPreferenceInput instance,
    TRes Function(Input$UpdateNotificationPreferenceInput) then,
  ) = _CopyWithImpl$Input$UpdateNotificationPreferenceInput;

  factory CopyWith$Input$UpdateNotificationPreferenceInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateNotificationPreferenceInput;

  TRes call({
    bool? emailEnabled,
    bool? smsEnabled,
    bool? pushEnabled,
    bool? inAppEnabled,
    bool? quietHoursEnabled,
    String? quietHoursStart,
    String? quietHoursEnd,
    bool? digestEnabled,
    String? digestFrequency,
  });
}

class _CopyWithImpl$Input$UpdateNotificationPreferenceInput<TRes>
    implements CopyWith$Input$UpdateNotificationPreferenceInput<TRes> {
  _CopyWithImpl$Input$UpdateNotificationPreferenceInput(
    this._instance,
    this._then,
  );

  final Input$UpdateNotificationPreferenceInput _instance;

  final TRes Function(Input$UpdateNotificationPreferenceInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? emailEnabled = _undefined,
    Object? smsEnabled = _undefined,
    Object? pushEnabled = _undefined,
    Object? inAppEnabled = _undefined,
    Object? quietHoursEnabled = _undefined,
    Object? quietHoursStart = _undefined,
    Object? quietHoursEnd = _undefined,
    Object? digestEnabled = _undefined,
    Object? digestFrequency = _undefined,
  }) => _then(
    Input$UpdateNotificationPreferenceInput._({
      ..._instance._$data,
      if (emailEnabled != _undefined) 'emailEnabled': (emailEnabled as bool?),
      if (smsEnabled != _undefined) 'smsEnabled': (smsEnabled as bool?),
      if (pushEnabled != _undefined) 'pushEnabled': (pushEnabled as bool?),
      if (inAppEnabled != _undefined) 'inAppEnabled': (inAppEnabled as bool?),
      if (quietHoursEnabled != _undefined)
        'quietHoursEnabled': (quietHoursEnabled as bool?),
      if (quietHoursStart != _undefined)
        'quietHoursStart': (quietHoursStart as String?),
      if (quietHoursEnd != _undefined)
        'quietHoursEnd': (quietHoursEnd as String?),
      if (digestEnabled != _undefined)
        'digestEnabled': (digestEnabled as bool?),
      if (digestFrequency != _undefined)
        'digestFrequency': (digestFrequency as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateNotificationPreferenceInput<TRes>
    implements CopyWith$Input$UpdateNotificationPreferenceInput<TRes> {
  _CopyWithStubImpl$Input$UpdateNotificationPreferenceInput(this._res);

  TRes _res;

  call({
    bool? emailEnabled,
    bool? smsEnabled,
    bool? pushEnabled,
    bool? inAppEnabled,
    bool? quietHoursEnabled,
    String? quietHoursStart,
    String? quietHoursEnd,
    bool? digestEnabled,
    String? digestFrequency,
  }) => _res;
}

class Input$SendNotificationInput {
  factory Input$SendNotificationInput({
    required String userId,
    required Enum$NotificationChannel channel,
    Enum$NotificationPriority? priority,
    required String title,
    required String body,
    String? templateId,
    dynamic? templateData,
    DateTime? scheduledFor,
    DateTime? expiresAt,
  }) => Input$SendNotificationInput._({
    r'userId': userId,
    r'channel': channel,
    if (priority != null) r'priority': priority,
    r'title': title,
    r'body': body,
    if (templateId != null) r'templateId': templateId,
    if (templateData != null) r'templateData': templateData,
    if (scheduledFor != null) r'scheduledFor': scheduledFor,
    if (expiresAt != null) r'expiresAt': expiresAt,
  });

  Input$SendNotificationInput._(this._$data);

  factory Input$SendNotificationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    final l$channel = data['channel'];
    result$data['channel'] = fromJson$Enum$NotificationChannel(
      (l$channel as String),
    );
    if (data.containsKey('priority')) {
      final l$priority = data['priority'];
      result$data['priority'] = l$priority == null
          ? null
          : fromJson$Enum$NotificationPriority((l$priority as String));
    }
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    if (data.containsKey('templateId')) {
      final l$templateId = data['templateId'];
      result$data['templateId'] = (l$templateId as String?);
    }
    if (data.containsKey('templateData')) {
      final l$templateData = data['templateData'];
      result$data['templateData'] = (l$templateData as dynamic?);
    }
    if (data.containsKey('scheduledFor')) {
      final l$scheduledFor = data['scheduledFor'];
      result$data['scheduledFor'] = l$scheduledFor == null
          ? null
          : DateTime.parse((l$scheduledFor as String));
    }
    if (data.containsKey('expiresAt')) {
      final l$expiresAt = data['expiresAt'];
      result$data['expiresAt'] = l$expiresAt == null
          ? null
          : DateTime.parse((l$expiresAt as String));
    }
    return Input$SendNotificationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);

  Enum$NotificationChannel get channel =>
      (_$data['channel'] as Enum$NotificationChannel);

  Enum$NotificationPriority? get priority =>
      (_$data['priority'] as Enum$NotificationPriority?);

  String get title => (_$data['title'] as String);

  String get body => (_$data['body'] as String);

  String? get templateId => (_$data['templateId'] as String?);

  dynamic? get templateData => (_$data['templateData'] as dynamic?);

  DateTime? get scheduledFor => (_$data['scheduledFor'] as DateTime?);

  DateTime? get expiresAt => (_$data['expiresAt'] as DateTime?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    final l$channel = channel;
    result$data['channel'] = toJson$Enum$NotificationChannel(l$channel);
    if (_$data.containsKey('priority')) {
      final l$priority = priority;
      result$data['priority'] = l$priority == null
          ? null
          : toJson$Enum$NotificationPriority(l$priority);
    }
    final l$title = title;
    result$data['title'] = l$title;
    final l$body = body;
    result$data['body'] = l$body;
    if (_$data.containsKey('templateId')) {
      final l$templateId = templateId;
      result$data['templateId'] = l$templateId;
    }
    if (_$data.containsKey('templateData')) {
      final l$templateData = templateData;
      result$data['templateData'] = l$templateData;
    }
    if (_$data.containsKey('scheduledFor')) {
      final l$scheduledFor = scheduledFor;
      result$data['scheduledFor'] = l$scheduledFor?.toIso8601String();
    }
    if (_$data.containsKey('expiresAt')) {
      final l$expiresAt = expiresAt;
      result$data['expiresAt'] = l$expiresAt?.toIso8601String();
    }
    return result$data;
  }

  CopyWith$Input$SendNotificationInput<Input$SendNotificationInput>
  get copyWith => CopyWith$Input$SendNotificationInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SendNotificationInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$channel = channel;
    final lOther$channel = other.channel;
    if (l$channel != lOther$channel) {
      return false;
    }
    final l$priority = priority;
    final lOther$priority = other.priority;
    if (_$data.containsKey('priority') !=
        other._$data.containsKey('priority')) {
      return false;
    }
    if (l$priority != lOther$priority) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$templateId = templateId;
    final lOther$templateId = other.templateId;
    if (_$data.containsKey('templateId') !=
        other._$data.containsKey('templateId')) {
      return false;
    }
    if (l$templateId != lOther$templateId) {
      return false;
    }
    final l$templateData = templateData;
    final lOther$templateData = other.templateData;
    if (_$data.containsKey('templateData') !=
        other._$data.containsKey('templateData')) {
      return false;
    }
    if (l$templateData != lOther$templateData) {
      return false;
    }
    final l$scheduledFor = scheduledFor;
    final lOther$scheduledFor = other.scheduledFor;
    if (_$data.containsKey('scheduledFor') !=
        other._$data.containsKey('scheduledFor')) {
      return false;
    }
    if (l$scheduledFor != lOther$scheduledFor) {
      return false;
    }
    final l$expiresAt = expiresAt;
    final lOther$expiresAt = other.expiresAt;
    if (_$data.containsKey('expiresAt') !=
        other._$data.containsKey('expiresAt')) {
      return false;
    }
    if (l$expiresAt != lOther$expiresAt) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    final l$channel = channel;
    final l$priority = priority;
    final l$title = title;
    final l$body = body;
    final l$templateId = templateId;
    final l$templateData = templateData;
    final l$scheduledFor = scheduledFor;
    final l$expiresAt = expiresAt;
    return Object.hashAll([
      l$userId,
      l$channel,
      _$data.containsKey('priority') ? l$priority : const {},
      l$title,
      l$body,
      _$data.containsKey('templateId') ? l$templateId : const {},
      _$data.containsKey('templateData') ? l$templateData : const {},
      _$data.containsKey('scheduledFor') ? l$scheduledFor : const {},
      _$data.containsKey('expiresAt') ? l$expiresAt : const {},
    ]);
  }
}

abstract class CopyWith$Input$SendNotificationInput<TRes> {
  factory CopyWith$Input$SendNotificationInput(
    Input$SendNotificationInput instance,
    TRes Function(Input$SendNotificationInput) then,
  ) = _CopyWithImpl$Input$SendNotificationInput;

  factory CopyWith$Input$SendNotificationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$SendNotificationInput;

  TRes call({
    String? userId,
    Enum$NotificationChannel? channel,
    Enum$NotificationPriority? priority,
    String? title,
    String? body,
    String? templateId,
    dynamic? templateData,
    DateTime? scheduledFor,
    DateTime? expiresAt,
  });
}

class _CopyWithImpl$Input$SendNotificationInput<TRes>
    implements CopyWith$Input$SendNotificationInput<TRes> {
  _CopyWithImpl$Input$SendNotificationInput(this._instance, this._then);

  final Input$SendNotificationInput _instance;

  final TRes Function(Input$SendNotificationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userId = _undefined,
    Object? channel = _undefined,
    Object? priority = _undefined,
    Object? title = _undefined,
    Object? body = _undefined,
    Object? templateId = _undefined,
    Object? templateData = _undefined,
    Object? scheduledFor = _undefined,
    Object? expiresAt = _undefined,
  }) => _then(
    Input$SendNotificationInput._({
      ..._instance._$data,
      if (userId != _undefined && userId != null) 'userId': (userId as String),
      if (channel != _undefined && channel != null)
        'channel': (channel as Enum$NotificationChannel),
      if (priority != _undefined)
        'priority': (priority as Enum$NotificationPriority?),
      if (title != _undefined && title != null) 'title': (title as String),
      if (body != _undefined && body != null) 'body': (body as String),
      if (templateId != _undefined) 'templateId': (templateId as String?),
      if (templateData != _undefined)
        'templateData': (templateData as dynamic?),
      if (scheduledFor != _undefined)
        'scheduledFor': (scheduledFor as DateTime?),
      if (expiresAt != _undefined) 'expiresAt': (expiresAt as DateTime?),
    }),
  );
}

class _CopyWithStubImpl$Input$SendNotificationInput<TRes>
    implements CopyWith$Input$SendNotificationInput<TRes> {
  _CopyWithStubImpl$Input$SendNotificationInput(this._res);

  TRes _res;

  call({
    String? userId,
    Enum$NotificationChannel? channel,
    Enum$NotificationPriority? priority,
    String? title,
    String? body,
    String? templateId,
    dynamic? templateData,
    DateTime? scheduledFor,
    DateTime? expiresAt,
  }) => _res;
}

class Input$BulkNotificationInput {
  factory Input$BulkNotificationInput({
    required List<String> userIds,
    required Enum$NotificationChannel channel,
    Enum$NotificationPriority? priority,
    required String title,
    required String body,
    String? templateId,
    dynamic? templateData,
  }) => Input$BulkNotificationInput._({
    r'userIds': userIds,
    r'channel': channel,
    if (priority != null) r'priority': priority,
    r'title': title,
    r'body': body,
    if (templateId != null) r'templateId': templateId,
    if (templateData != null) r'templateData': templateData,
  });

  Input$BulkNotificationInput._(this._$data);

  factory Input$BulkNotificationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userIds = data['userIds'];
    result$data['userIds'] = (l$userIds as List<dynamic>)
        .map((e) => (e as String))
        .toList();
    final l$channel = data['channel'];
    result$data['channel'] = fromJson$Enum$NotificationChannel(
      (l$channel as String),
    );
    if (data.containsKey('priority')) {
      final l$priority = data['priority'];
      result$data['priority'] = l$priority == null
          ? null
          : fromJson$Enum$NotificationPriority((l$priority as String));
    }
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    if (data.containsKey('templateId')) {
      final l$templateId = data['templateId'];
      result$data['templateId'] = (l$templateId as String?);
    }
    if (data.containsKey('templateData')) {
      final l$templateData = data['templateData'];
      result$data['templateData'] = (l$templateData as dynamic?);
    }
    return Input$BulkNotificationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String> get userIds => (_$data['userIds'] as List<String>);

  Enum$NotificationChannel get channel =>
      (_$data['channel'] as Enum$NotificationChannel);

  Enum$NotificationPriority? get priority =>
      (_$data['priority'] as Enum$NotificationPriority?);

  String get title => (_$data['title'] as String);

  String get body => (_$data['body'] as String);

  String? get templateId => (_$data['templateId'] as String?);

  dynamic? get templateData => (_$data['templateData'] as dynamic?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userIds = userIds;
    result$data['userIds'] = l$userIds.map((e) => e).toList();
    final l$channel = channel;
    result$data['channel'] = toJson$Enum$NotificationChannel(l$channel);
    if (_$data.containsKey('priority')) {
      final l$priority = priority;
      result$data['priority'] = l$priority == null
          ? null
          : toJson$Enum$NotificationPriority(l$priority);
    }
    final l$title = title;
    result$data['title'] = l$title;
    final l$body = body;
    result$data['body'] = l$body;
    if (_$data.containsKey('templateId')) {
      final l$templateId = templateId;
      result$data['templateId'] = l$templateId;
    }
    if (_$data.containsKey('templateData')) {
      final l$templateData = templateData;
      result$data['templateData'] = l$templateData;
    }
    return result$data;
  }

  CopyWith$Input$BulkNotificationInput<Input$BulkNotificationInput>
  get copyWith => CopyWith$Input$BulkNotificationInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$BulkNotificationInput ||
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
    final l$channel = channel;
    final lOther$channel = other.channel;
    if (l$channel != lOther$channel) {
      return false;
    }
    final l$priority = priority;
    final lOther$priority = other.priority;
    if (_$data.containsKey('priority') !=
        other._$data.containsKey('priority')) {
      return false;
    }
    if (l$priority != lOther$priority) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$templateId = templateId;
    final lOther$templateId = other.templateId;
    if (_$data.containsKey('templateId') !=
        other._$data.containsKey('templateId')) {
      return false;
    }
    if (l$templateId != lOther$templateId) {
      return false;
    }
    final l$templateData = templateData;
    final lOther$templateData = other.templateData;
    if (_$data.containsKey('templateData') !=
        other._$data.containsKey('templateData')) {
      return false;
    }
    if (l$templateData != lOther$templateData) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userIds = userIds;
    final l$channel = channel;
    final l$priority = priority;
    final l$title = title;
    final l$body = body;
    final l$templateId = templateId;
    final l$templateData = templateData;
    return Object.hashAll([
      Object.hashAll(l$userIds.map((v) => v)),
      l$channel,
      _$data.containsKey('priority') ? l$priority : const {},
      l$title,
      l$body,
      _$data.containsKey('templateId') ? l$templateId : const {},
      _$data.containsKey('templateData') ? l$templateData : const {},
    ]);
  }
}

abstract class CopyWith$Input$BulkNotificationInput<TRes> {
  factory CopyWith$Input$BulkNotificationInput(
    Input$BulkNotificationInput instance,
    TRes Function(Input$BulkNotificationInput) then,
  ) = _CopyWithImpl$Input$BulkNotificationInput;

  factory CopyWith$Input$BulkNotificationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$BulkNotificationInput;

  TRes call({
    List<String>? userIds,
    Enum$NotificationChannel? channel,
    Enum$NotificationPriority? priority,
    String? title,
    String? body,
    String? templateId,
    dynamic? templateData,
  });
}

class _CopyWithImpl$Input$BulkNotificationInput<TRes>
    implements CopyWith$Input$BulkNotificationInput<TRes> {
  _CopyWithImpl$Input$BulkNotificationInput(this._instance, this._then);

  final Input$BulkNotificationInput _instance;

  final TRes Function(Input$BulkNotificationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userIds = _undefined,
    Object? channel = _undefined,
    Object? priority = _undefined,
    Object? title = _undefined,
    Object? body = _undefined,
    Object? templateId = _undefined,
    Object? templateData = _undefined,
  }) => _then(
    Input$BulkNotificationInput._({
      ..._instance._$data,
      if (userIds != _undefined && userIds != null)
        'userIds': (userIds as List<String>),
      if (channel != _undefined && channel != null)
        'channel': (channel as Enum$NotificationChannel),
      if (priority != _undefined)
        'priority': (priority as Enum$NotificationPriority?),
      if (title != _undefined && title != null) 'title': (title as String),
      if (body != _undefined && body != null) 'body': (body as String),
      if (templateId != _undefined) 'templateId': (templateId as String?),
      if (templateData != _undefined)
        'templateData': (templateData as dynamic?),
    }),
  );
}

class _CopyWithStubImpl$Input$BulkNotificationInput<TRes>
    implements CopyWith$Input$BulkNotificationInput<TRes> {
  _CopyWithStubImpl$Input$BulkNotificationInput(this._res);

  TRes _res;

  call({
    List<String>? userIds,
    Enum$NotificationChannel? channel,
    Enum$NotificationPriority? priority,
    String? title,
    String? body,
    String? templateId,
    dynamic? templateData,
  }) => _res;
}

enum Enum$EventType {
  USER_LOGIN,
  USER_REGISTERED,
  BOOKING_CREATED,
  VISIT_CHECKED_IN,
  VISIT_CHECKED_OUT,
  PROPOSAL_CREATED,
  VOTE_CAST,
  CUSTOM,
  $unknown;

  factory Enum$EventType.fromJson(String value) =>
      fromJson$Enum$EventType(value);

  String toJson() => toJson$Enum$EventType(this);
}

String toJson$Enum$EventType(Enum$EventType e) {
  switch (e) {
    case Enum$EventType.USER_LOGIN:
      return r'USER_LOGIN';
    case Enum$EventType.USER_REGISTERED:
      return r'USER_REGISTERED';
    case Enum$EventType.BOOKING_CREATED:
      return r'BOOKING_CREATED';
    case Enum$EventType.VISIT_CHECKED_IN:
      return r'VISIT_CHECKED_IN';
    case Enum$EventType.VISIT_CHECKED_OUT:
      return r'VISIT_CHECKED_OUT';
    case Enum$EventType.PROPOSAL_CREATED:
      return r'PROPOSAL_CREATED';
    case Enum$EventType.VOTE_CAST:
      return r'VOTE_CAST';
    case Enum$EventType.CUSTOM:
      return r'CUSTOM';
    case Enum$EventType.$unknown:
      return r'$unknown';
  }
}

Enum$EventType fromJson$Enum$EventType(String value) {
  switch (value) {
    case r'USER_LOGIN':
      return Enum$EventType.USER_LOGIN;
    case r'USER_REGISTERED':
      return Enum$EventType.USER_REGISTERED;
    case r'BOOKING_CREATED':
      return Enum$EventType.BOOKING_CREATED;
    case r'VISIT_CHECKED_IN':
      return Enum$EventType.VISIT_CHECKED_IN;
    case r'VISIT_CHECKED_OUT':
      return Enum$EventType.VISIT_CHECKED_OUT;
    case r'PROPOSAL_CREATED':
      return Enum$EventType.PROPOSAL_CREATED;
    case r'VOTE_CAST':
      return Enum$EventType.VOTE_CAST;
    case r'CUSTOM':
      return Enum$EventType.CUSTOM;
    default:
      return Enum$EventType.$unknown;
  }
}

enum Enum$AggregationType {
  GAUGE,
  COUNTER,
  HISTOGRAM,
  $unknown;

  factory Enum$AggregationType.fromJson(String value) =>
      fromJson$Enum$AggregationType(value);

  String toJson() => toJson$Enum$AggregationType(this);
}

String toJson$Enum$AggregationType(Enum$AggregationType e) {
  switch (e) {
    case Enum$AggregationType.GAUGE:
      return r'GAUGE';
    case Enum$AggregationType.COUNTER:
      return r'COUNTER';
    case Enum$AggregationType.HISTOGRAM:
      return r'HISTOGRAM';
    case Enum$AggregationType.$unknown:
      return r'$unknown';
  }
}

Enum$AggregationType fromJson$Enum$AggregationType(String value) {
  switch (value) {
    case r'GAUGE':
      return Enum$AggregationType.GAUGE;
    case r'COUNTER':
      return Enum$AggregationType.COUNTER;
    case r'HISTOGRAM':
      return Enum$AggregationType.HISTOGRAM;
    default:
      return Enum$AggregationType.$unknown;
  }
}

enum Enum$ReportType {
  USAGE,
  ENGAGEMENT,
  FINANCIAL,
  MEMBERSHIP,
  OPERATIONAL,
  CUSTOM,
  $unknown;

  factory Enum$ReportType.fromJson(String value) =>
      fromJson$Enum$ReportType(value);

  String toJson() => toJson$Enum$ReportType(this);
}

String toJson$Enum$ReportType(Enum$ReportType e) {
  switch (e) {
    case Enum$ReportType.USAGE:
      return r'USAGE';
    case Enum$ReportType.ENGAGEMENT:
      return r'ENGAGEMENT';
    case Enum$ReportType.FINANCIAL:
      return r'FINANCIAL';
    case Enum$ReportType.MEMBERSHIP:
      return r'MEMBERSHIP';
    case Enum$ReportType.OPERATIONAL:
      return r'OPERATIONAL';
    case Enum$ReportType.CUSTOM:
      return r'CUSTOM';
    case Enum$ReportType.$unknown:
      return r'$unknown';
  }
}

Enum$ReportType fromJson$Enum$ReportType(String value) {
  switch (value) {
    case r'USAGE':
      return Enum$ReportType.USAGE;
    case r'ENGAGEMENT':
      return Enum$ReportType.ENGAGEMENT;
    case r'FINANCIAL':
      return Enum$ReportType.FINANCIAL;
    case r'MEMBERSHIP':
      return Enum$ReportType.MEMBERSHIP;
    case r'OPERATIONAL':
      return Enum$ReportType.OPERATIONAL;
    case r'CUSTOM':
      return Enum$ReportType.CUSTOM;
    default:
      return Enum$ReportType.$unknown;
  }
}

enum Enum$ReportStatus {
  PENDING,
  RUNNING,
  COMPLETED,
  FAILED,
  $unknown;

  factory Enum$ReportStatus.fromJson(String value) =>
      fromJson$Enum$ReportStatus(value);

  String toJson() => toJson$Enum$ReportStatus(this);
}

String toJson$Enum$ReportStatus(Enum$ReportStatus e) {
  switch (e) {
    case Enum$ReportStatus.PENDING:
      return r'PENDING';
    case Enum$ReportStatus.RUNNING:
      return r'RUNNING';
    case Enum$ReportStatus.COMPLETED:
      return r'COMPLETED';
    case Enum$ReportStatus.FAILED:
      return r'FAILED';
    case Enum$ReportStatus.$unknown:
      return r'$unknown';
  }
}

Enum$ReportStatus fromJson$Enum$ReportStatus(String value) {
  switch (value) {
    case r'PENDING':
      return Enum$ReportStatus.PENDING;
    case r'RUNNING':
      return Enum$ReportStatus.RUNNING;
    case r'COMPLETED':
      return Enum$ReportStatus.COMPLETED;
    case r'FAILED':
      return Enum$ReportStatus.FAILED;
    default:
      return Enum$ReportStatus.$unknown;
  }
}

enum Enum$ExportFormat {
  JSON,
  CSV,
  EXCEL,
  PDF,
  $unknown;

  factory Enum$ExportFormat.fromJson(String value) =>
      fromJson$Enum$ExportFormat(value);

  String toJson() => toJson$Enum$ExportFormat(this);
}

String toJson$Enum$ExportFormat(Enum$ExportFormat e) {
  switch (e) {
    case Enum$ExportFormat.JSON:
      return r'JSON';
    case Enum$ExportFormat.CSV:
      return r'CSV';
    case Enum$ExportFormat.EXCEL:
      return r'EXCEL';
    case Enum$ExportFormat.PDF:
      return r'PDF';
    case Enum$ExportFormat.$unknown:
      return r'$unknown';
  }
}

Enum$ExportFormat fromJson$Enum$ExportFormat(String value) {
  switch (value) {
    case r'JSON':
      return Enum$ExportFormat.JSON;
    case r'CSV':
      return Enum$ExportFormat.CSV;
    case r'EXCEL':
      return Enum$ExportFormat.EXCEL;
    case r'PDF':
      return Enum$ExportFormat.PDF;
    default:
      return Enum$ExportFormat.$unknown;
  }
}

enum Enum$IntegrationProvider {
  GOOGLE_ANALYTICS,
  MIXPANEL,
  SEGMENT,
  AMPLITUDE,
  CUSTOM,
  $unknown;

  factory Enum$IntegrationProvider.fromJson(String value) =>
      fromJson$Enum$IntegrationProvider(value);

  String toJson() => toJson$Enum$IntegrationProvider(this);
}

String toJson$Enum$IntegrationProvider(Enum$IntegrationProvider e) {
  switch (e) {
    case Enum$IntegrationProvider.GOOGLE_ANALYTICS:
      return r'GOOGLE_ANALYTICS';
    case Enum$IntegrationProvider.MIXPANEL:
      return r'MIXPANEL';
    case Enum$IntegrationProvider.SEGMENT:
      return r'SEGMENT';
    case Enum$IntegrationProvider.AMPLITUDE:
      return r'AMPLITUDE';
    case Enum$IntegrationProvider.CUSTOM:
      return r'CUSTOM';
    case Enum$IntegrationProvider.$unknown:
      return r'$unknown';
  }
}

Enum$IntegrationProvider fromJson$Enum$IntegrationProvider(String value) {
  switch (value) {
    case r'GOOGLE_ANALYTICS':
      return Enum$IntegrationProvider.GOOGLE_ANALYTICS;
    case r'MIXPANEL':
      return Enum$IntegrationProvider.MIXPANEL;
    case r'SEGMENT':
      return Enum$IntegrationProvider.SEGMENT;
    case r'AMPLITUDE':
      return Enum$IntegrationProvider.AMPLITUDE;
    case r'CUSTOM':
      return Enum$IntegrationProvider.CUSTOM;
    default:
      return Enum$IntegrationProvider.$unknown;
  }
}

enum Enum$UserStatus {
  ACTIVE,
  INACTIVE,
  SUSPENDED,
  LOCKED,
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
    case Enum$UserStatus.LOCKED:
      return r'LOCKED';
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
    case r'LOCKED':
      return Enum$UserStatus.LOCKED;
    case r'PENDING_VERIFICATION':
      return Enum$UserStatus.PENDING_VERIFICATION;
    default:
      return Enum$UserStatus.$unknown;
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

enum Enum$LOIStatus {
  PENDING,
  APPROVED,
  ACTIVE,
  USED,
  EXPIRED,
  DECLINED,
  $unknown;

  factory Enum$LOIStatus.fromJson(String value) =>
      fromJson$Enum$LOIStatus(value);

  String toJson() => toJson$Enum$LOIStatus(this);
}

String toJson$Enum$LOIStatus(Enum$LOIStatus e) {
  switch (e) {
    case Enum$LOIStatus.PENDING:
      return r'PENDING';
    case Enum$LOIStatus.APPROVED:
      return r'APPROVED';
    case Enum$LOIStatus.ACTIVE:
      return r'ACTIVE';
    case Enum$LOIStatus.USED:
      return r'USED';
    case Enum$LOIStatus.EXPIRED:
      return r'EXPIRED';
    case Enum$LOIStatus.DECLINED:
      return r'DECLINED';
    case Enum$LOIStatus.$unknown:
      return r'$unknown';
  }
}

Enum$LOIStatus fromJson$Enum$LOIStatus(String value) {
  switch (value) {
    case r'PENDING':
      return Enum$LOIStatus.PENDING;
    case r'APPROVED':
      return Enum$LOIStatus.APPROVED;
    case r'ACTIVE':
      return Enum$LOIStatus.ACTIVE;
    case r'USED':
      return Enum$LOIStatus.USED;
    case r'EXPIRED':
      return Enum$LOIStatus.EXPIRED;
    case r'DECLINED':
      return Enum$LOIStatus.DECLINED;
    default:
      return Enum$LOIStatus.$unknown;
  }
}

enum Enum$DeliveryMethod {
  EMAIL,
  API,
  QR_CODE,
  ALL,
  $unknown;

  factory Enum$DeliveryMethod.fromJson(String value) =>
      fromJson$Enum$DeliveryMethod(value);

  String toJson() => toJson$Enum$DeliveryMethod(this);
}

String toJson$Enum$DeliveryMethod(Enum$DeliveryMethod e) {
  switch (e) {
    case Enum$DeliveryMethod.EMAIL:
      return r'EMAIL';
    case Enum$DeliveryMethod.API:
      return r'API';
    case Enum$DeliveryMethod.QR_CODE:
      return r'QR_CODE';
    case Enum$DeliveryMethod.ALL:
      return r'ALL';
    case Enum$DeliveryMethod.$unknown:
      return r'$unknown';
  }
}

Enum$DeliveryMethod fromJson$Enum$DeliveryMethod(String value) {
  switch (value) {
    case r'EMAIL':
      return Enum$DeliveryMethod.EMAIL;
    case r'API':
      return Enum$DeliveryMethod.API;
    case r'QR_CODE':
      return Enum$DeliveryMethod.QR_CODE;
    case r'ALL':
      return Enum$DeliveryMethod.ALL;
    default:
      return Enum$DeliveryMethod.$unknown;
  }
}

enum Enum$FacilityType {
  CONFERENCE_ROOM,
  BANQUET_HALL,
  TENNIS_COURT,
  GOLF_COURSE,
  POOL,
  GYM,
  SPA,
  LIBRARY,
  LOUNGE,
  OTHER,
  $unknown;

  factory Enum$FacilityType.fromJson(String value) =>
      fromJson$Enum$FacilityType(value);

  String toJson() => toJson$Enum$FacilityType(this);
}

String toJson$Enum$FacilityType(Enum$FacilityType e) {
  switch (e) {
    case Enum$FacilityType.CONFERENCE_ROOM:
      return r'CONFERENCE_ROOM';
    case Enum$FacilityType.BANQUET_HALL:
      return r'BANQUET_HALL';
    case Enum$FacilityType.TENNIS_COURT:
      return r'TENNIS_COURT';
    case Enum$FacilityType.GOLF_COURSE:
      return r'GOLF_COURSE';
    case Enum$FacilityType.POOL:
      return r'POOL';
    case Enum$FacilityType.GYM:
      return r'GYM';
    case Enum$FacilityType.SPA:
      return r'SPA';
    case Enum$FacilityType.LIBRARY:
      return r'LIBRARY';
    case Enum$FacilityType.LOUNGE:
      return r'LOUNGE';
    case Enum$FacilityType.OTHER:
      return r'OTHER';
    case Enum$FacilityType.$unknown:
      return r'$unknown';
  }
}

Enum$FacilityType fromJson$Enum$FacilityType(String value) {
  switch (value) {
    case r'CONFERENCE_ROOM':
      return Enum$FacilityType.CONFERENCE_ROOM;
    case r'BANQUET_HALL':
      return Enum$FacilityType.BANQUET_HALL;
    case r'TENNIS_COURT':
      return Enum$FacilityType.TENNIS_COURT;
    case r'GOLF_COURSE':
      return Enum$FacilityType.GOLF_COURSE;
    case r'POOL':
      return Enum$FacilityType.POOL;
    case r'GYM':
      return Enum$FacilityType.GYM;
    case r'SPA':
      return Enum$FacilityType.SPA;
    case r'LIBRARY':
      return Enum$FacilityType.LIBRARY;
    case r'LOUNGE':
      return Enum$FacilityType.LOUNGE;
    case r'OTHER':
      return Enum$FacilityType.OTHER;
    default:
      return Enum$FacilityType.$unknown;
  }
}

enum Enum$BookingStatus {
  PENDING,
  CONFIRMED,
  CHECKED_IN,
  CHECKED_OUT,
  CANCELLED,
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
    case Enum$BookingStatus.CHECKED_IN:
      return r'CHECKED_IN';
    case Enum$BookingStatus.CHECKED_OUT:
      return r'CHECKED_OUT';
    case Enum$BookingStatus.CANCELLED:
      return r'CANCELLED';
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
    case r'CHECKED_IN':
      return Enum$BookingStatus.CHECKED_IN;
    case r'CHECKED_OUT':
      return Enum$BookingStatus.CHECKED_OUT;
    case r'CANCELLED':
      return Enum$BookingStatus.CANCELLED;
    case r'NO_SHOW':
      return Enum$BookingStatus.NO_SHOW;
    default:
      return Enum$BookingStatus.$unknown;
  }
}

enum Enum$PaymentStatus {
  PENDING,
  PAID,
  REFUNDED,
  FAILED,
  $unknown;

  factory Enum$PaymentStatus.fromJson(String value) =>
      fromJson$Enum$PaymentStatus(value);

  String toJson() => toJson$Enum$PaymentStatus(this);
}

String toJson$Enum$PaymentStatus(Enum$PaymentStatus e) {
  switch (e) {
    case Enum$PaymentStatus.PENDING:
      return r'PENDING';
    case Enum$PaymentStatus.PAID:
      return r'PAID';
    case Enum$PaymentStatus.REFUNDED:
      return r'REFUNDED';
    case Enum$PaymentStatus.FAILED:
      return r'FAILED';
    case Enum$PaymentStatus.$unknown:
      return r'$unknown';
  }
}

Enum$PaymentStatus fromJson$Enum$PaymentStatus(String value) {
  switch (value) {
    case r'PENDING':
      return Enum$PaymentStatus.PENDING;
    case r'PAID':
      return Enum$PaymentStatus.PAID;
    case r'REFUNDED':
      return Enum$PaymentStatus.REFUNDED;
    case r'FAILED':
      return Enum$PaymentStatus.FAILED;
    default:
      return Enum$PaymentStatus.$unknown;
  }
}

enum Enum$ReservationStatus {
  PENDING,
  CONFIRMED,
  SEATED,
  COMPLETED,
  CANCELLED,
  NO_SHOW,
  $unknown;

  factory Enum$ReservationStatus.fromJson(String value) =>
      fromJson$Enum$ReservationStatus(value);

  String toJson() => toJson$Enum$ReservationStatus(this);
}

String toJson$Enum$ReservationStatus(Enum$ReservationStatus e) {
  switch (e) {
    case Enum$ReservationStatus.PENDING:
      return r'PENDING';
    case Enum$ReservationStatus.CONFIRMED:
      return r'CONFIRMED';
    case Enum$ReservationStatus.SEATED:
      return r'SEATED';
    case Enum$ReservationStatus.COMPLETED:
      return r'COMPLETED';
    case Enum$ReservationStatus.CANCELLED:
      return r'CANCELLED';
    case Enum$ReservationStatus.NO_SHOW:
      return r'NO_SHOW';
    case Enum$ReservationStatus.$unknown:
      return r'$unknown';
  }
}

Enum$ReservationStatus fromJson$Enum$ReservationStatus(String value) {
  switch (value) {
    case r'PENDING':
      return Enum$ReservationStatus.PENDING;
    case r'CONFIRMED':
      return Enum$ReservationStatus.CONFIRMED;
    case r'SEATED':
      return Enum$ReservationStatus.SEATED;
    case r'COMPLETED':
      return Enum$ReservationStatus.COMPLETED;
    case r'CANCELLED':
      return Enum$ReservationStatus.CANCELLED;
    case r'NO_SHOW':
      return Enum$ReservationStatus.NO_SHOW;
    default:
      return Enum$ReservationStatus.$unknown;
  }
}

enum Enum$ClubEventType {
  SOCIAL,
  NETWORKING,
  EDUCATIONAL,
  SPORTING,
  CULTURAL,
  FUNDRAISING,
  MEETING,
  OTHER,
  $unknown;

  factory Enum$ClubEventType.fromJson(String value) =>
      fromJson$Enum$ClubEventType(value);

  String toJson() => toJson$Enum$ClubEventType(this);
}

String toJson$Enum$ClubEventType(Enum$ClubEventType e) {
  switch (e) {
    case Enum$ClubEventType.SOCIAL:
      return r'SOCIAL';
    case Enum$ClubEventType.NETWORKING:
      return r'NETWORKING';
    case Enum$ClubEventType.EDUCATIONAL:
      return r'EDUCATIONAL';
    case Enum$ClubEventType.SPORTING:
      return r'SPORTING';
    case Enum$ClubEventType.CULTURAL:
      return r'CULTURAL';
    case Enum$ClubEventType.FUNDRAISING:
      return r'FUNDRAISING';
    case Enum$ClubEventType.MEETING:
      return r'MEETING';
    case Enum$ClubEventType.OTHER:
      return r'OTHER';
    case Enum$ClubEventType.$unknown:
      return r'$unknown';
  }
}

Enum$ClubEventType fromJson$Enum$ClubEventType(String value) {
  switch (value) {
    case r'SOCIAL':
      return Enum$ClubEventType.SOCIAL;
    case r'NETWORKING':
      return Enum$ClubEventType.NETWORKING;
    case r'EDUCATIONAL':
      return Enum$ClubEventType.EDUCATIONAL;
    case r'SPORTING':
      return Enum$ClubEventType.SPORTING;
    case r'CULTURAL':
      return Enum$ClubEventType.CULTURAL;
    case r'FUNDRAISING':
      return Enum$ClubEventType.FUNDRAISING;
    case r'MEETING':
      return Enum$ClubEventType.MEETING;
    case r'OTHER':
      return Enum$ClubEventType.OTHER;
    default:
      return Enum$ClubEventType.$unknown;
  }
}

enum Enum$EventStatus {
  DRAFT,
  PUBLISHED,
  REGISTRATION_OPEN,
  REGISTRATION_CLOSED,
  IN_PROGRESS,
  COMPLETED,
  CANCELLED,
  $unknown;

  factory Enum$EventStatus.fromJson(String value) =>
      fromJson$Enum$EventStatus(value);

  String toJson() => toJson$Enum$EventStatus(this);
}

String toJson$Enum$EventStatus(Enum$EventStatus e) {
  switch (e) {
    case Enum$EventStatus.DRAFT:
      return r'DRAFT';
    case Enum$EventStatus.PUBLISHED:
      return r'PUBLISHED';
    case Enum$EventStatus.REGISTRATION_OPEN:
      return r'REGISTRATION_OPEN';
    case Enum$EventStatus.REGISTRATION_CLOSED:
      return r'REGISTRATION_CLOSED';
    case Enum$EventStatus.IN_PROGRESS:
      return r'IN_PROGRESS';
    case Enum$EventStatus.COMPLETED:
      return r'COMPLETED';
    case Enum$EventStatus.CANCELLED:
      return r'CANCELLED';
    case Enum$EventStatus.$unknown:
      return r'$unknown';
  }
}

Enum$EventStatus fromJson$Enum$EventStatus(String value) {
  switch (value) {
    case r'DRAFT':
      return Enum$EventStatus.DRAFT;
    case r'PUBLISHED':
      return Enum$EventStatus.PUBLISHED;
    case r'REGISTRATION_OPEN':
      return Enum$EventStatus.REGISTRATION_OPEN;
    case r'REGISTRATION_CLOSED':
      return Enum$EventStatus.REGISTRATION_CLOSED;
    case r'IN_PROGRESS':
      return Enum$EventStatus.IN_PROGRESS;
    case r'COMPLETED':
      return Enum$EventStatus.COMPLETED;
    case r'CANCELLED':
      return Enum$EventStatus.CANCELLED;
    default:
      return Enum$EventStatus.$unknown;
  }
}

enum Enum$RSVPStatus {
  PENDING,
  CONFIRMED,
  WAITLISTED,
  ATTENDED,
  NO_SHOW,
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
    case Enum$RSVPStatus.WAITLISTED:
      return r'WAITLISTED';
    case Enum$RSVPStatus.ATTENDED:
      return r'ATTENDED';
    case Enum$RSVPStatus.NO_SHOW:
      return r'NO_SHOW';
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
    case r'WAITLISTED':
      return Enum$RSVPStatus.WAITLISTED;
    case r'ATTENDED':
      return Enum$RSVPStatus.ATTENDED;
    case r'NO_SHOW':
      return Enum$RSVPStatus.NO_SHOW;
    case r'CANCELLED':
      return Enum$RSVPStatus.CANCELLED;
    default:
      return Enum$RSVPStatus.$unknown;
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
    default:
      return Enum$FacilityStatus.$unknown;
  }
}

enum Enum$ProposalType {
  POLICY_CHANGE,
  BUDGET_APPROVAL,
  MEMBERSHIP_RULE,
  FACILITY_MODIFICATION,
  EVENT_APPROVAL,
  BOARD_ELECTION,
  CONSTITUTIONAL_AMENDMENT,
  OTHER,
  $unknown;

  factory Enum$ProposalType.fromJson(String value) =>
      fromJson$Enum$ProposalType(value);

  String toJson() => toJson$Enum$ProposalType(this);
}

String toJson$Enum$ProposalType(Enum$ProposalType e) {
  switch (e) {
    case Enum$ProposalType.POLICY_CHANGE:
      return r'POLICY_CHANGE';
    case Enum$ProposalType.BUDGET_APPROVAL:
      return r'BUDGET_APPROVAL';
    case Enum$ProposalType.MEMBERSHIP_RULE:
      return r'MEMBERSHIP_RULE';
    case Enum$ProposalType.FACILITY_MODIFICATION:
      return r'FACILITY_MODIFICATION';
    case Enum$ProposalType.EVENT_APPROVAL:
      return r'EVENT_APPROVAL';
    case Enum$ProposalType.BOARD_ELECTION:
      return r'BOARD_ELECTION';
    case Enum$ProposalType.CONSTITUTIONAL_AMENDMENT:
      return r'CONSTITUTIONAL_AMENDMENT';
    case Enum$ProposalType.OTHER:
      return r'OTHER';
    case Enum$ProposalType.$unknown:
      return r'$unknown';
  }
}

Enum$ProposalType fromJson$Enum$ProposalType(String value) {
  switch (value) {
    case r'POLICY_CHANGE':
      return Enum$ProposalType.POLICY_CHANGE;
    case r'BUDGET_APPROVAL':
      return Enum$ProposalType.BUDGET_APPROVAL;
    case r'MEMBERSHIP_RULE':
      return Enum$ProposalType.MEMBERSHIP_RULE;
    case r'FACILITY_MODIFICATION':
      return Enum$ProposalType.FACILITY_MODIFICATION;
    case r'EVENT_APPROVAL':
      return Enum$ProposalType.EVENT_APPROVAL;
    case r'BOARD_ELECTION':
      return Enum$ProposalType.BOARD_ELECTION;
    case r'CONSTITUTIONAL_AMENDMENT':
      return Enum$ProposalType.CONSTITUTIONAL_AMENDMENT;
    case r'OTHER':
      return Enum$ProposalType.OTHER;
    default:
      return Enum$ProposalType.$unknown;
  }
}

enum Enum$ProposalStatus {
  DRAFT,
  SUBMITTED,
  UNDER_REVIEW,
  VOTING_OPEN,
  VOTING_CLOSED,
  APPROVED,
  REJECTED,
  WITHDRAWN,
  EXPIRED,
  $unknown;

  factory Enum$ProposalStatus.fromJson(String value) =>
      fromJson$Enum$ProposalStatus(value);

  String toJson() => toJson$Enum$ProposalStatus(this);
}

String toJson$Enum$ProposalStatus(Enum$ProposalStatus e) {
  switch (e) {
    case Enum$ProposalStatus.DRAFT:
      return r'DRAFT';
    case Enum$ProposalStatus.SUBMITTED:
      return r'SUBMITTED';
    case Enum$ProposalStatus.UNDER_REVIEW:
      return r'UNDER_REVIEW';
    case Enum$ProposalStatus.VOTING_OPEN:
      return r'VOTING_OPEN';
    case Enum$ProposalStatus.VOTING_CLOSED:
      return r'VOTING_CLOSED';
    case Enum$ProposalStatus.APPROVED:
      return r'APPROVED';
    case Enum$ProposalStatus.REJECTED:
      return r'REJECTED';
    case Enum$ProposalStatus.WITHDRAWN:
      return r'WITHDRAWN';
    case Enum$ProposalStatus.EXPIRED:
      return r'EXPIRED';
    case Enum$ProposalStatus.$unknown:
      return r'$unknown';
  }
}

Enum$ProposalStatus fromJson$Enum$ProposalStatus(String value) {
  switch (value) {
    case r'DRAFT':
      return Enum$ProposalStatus.DRAFT;
    case r'SUBMITTED':
      return Enum$ProposalStatus.SUBMITTED;
    case r'UNDER_REVIEW':
      return Enum$ProposalStatus.UNDER_REVIEW;
    case r'VOTING_OPEN':
      return Enum$ProposalStatus.VOTING_OPEN;
    case r'VOTING_CLOSED':
      return Enum$ProposalStatus.VOTING_CLOSED;
    case r'APPROVED':
      return Enum$ProposalStatus.APPROVED;
    case r'REJECTED':
      return Enum$ProposalStatus.REJECTED;
    case r'WITHDRAWN':
      return Enum$ProposalStatus.WITHDRAWN;
    case r'EXPIRED':
      return Enum$ProposalStatus.EXPIRED;
    default:
      return Enum$ProposalStatus.$unknown;
  }
}

enum Enum$VotingMethod {
  SIMPLE_MAJORITY,
  ABSOLUTE_MAJORITY,
  TWO_THIRDS_MAJORITY,
  THREE_QUARTERS,
  UNANIMOUS,
  WEIGHTED,
  RANKED_CHOICE,
  $unknown;

  factory Enum$VotingMethod.fromJson(String value) =>
      fromJson$Enum$VotingMethod(value);

  String toJson() => toJson$Enum$VotingMethod(this);
}

String toJson$Enum$VotingMethod(Enum$VotingMethod e) {
  switch (e) {
    case Enum$VotingMethod.SIMPLE_MAJORITY:
      return r'SIMPLE_MAJORITY';
    case Enum$VotingMethod.ABSOLUTE_MAJORITY:
      return r'ABSOLUTE_MAJORITY';
    case Enum$VotingMethod.TWO_THIRDS_MAJORITY:
      return r'TWO_THIRDS_MAJORITY';
    case Enum$VotingMethod.THREE_QUARTERS:
      return r'THREE_QUARTERS';
    case Enum$VotingMethod.UNANIMOUS:
      return r'UNANIMOUS';
    case Enum$VotingMethod.WEIGHTED:
      return r'WEIGHTED';
    case Enum$VotingMethod.RANKED_CHOICE:
      return r'RANKED_CHOICE';
    case Enum$VotingMethod.$unknown:
      return r'$unknown';
  }
}

Enum$VotingMethod fromJson$Enum$VotingMethod(String value) {
  switch (value) {
    case r'SIMPLE_MAJORITY':
      return Enum$VotingMethod.SIMPLE_MAJORITY;
    case r'ABSOLUTE_MAJORITY':
      return Enum$VotingMethod.ABSOLUTE_MAJORITY;
    case r'TWO_THIRDS_MAJORITY':
      return Enum$VotingMethod.TWO_THIRDS_MAJORITY;
    case r'THREE_QUARTERS':
      return Enum$VotingMethod.THREE_QUARTERS;
    case r'UNANIMOUS':
      return Enum$VotingMethod.UNANIMOUS;
    case r'WEIGHTED':
      return Enum$VotingMethod.WEIGHTED;
    case r'RANKED_CHOICE':
      return Enum$VotingMethod.RANKED_CHOICE;
    default:
      return Enum$VotingMethod.$unknown;
  }
}

enum Enum$VoteChoice {
  YAY,
  NAY,
  ABSTAIN,
  $unknown;

  factory Enum$VoteChoice.fromJson(String value) =>
      fromJson$Enum$VoteChoice(value);

  String toJson() => toJson$Enum$VoteChoice(this);
}

String toJson$Enum$VoteChoice(Enum$VoteChoice e) {
  switch (e) {
    case Enum$VoteChoice.YAY:
      return r'YAY';
    case Enum$VoteChoice.NAY:
      return r'NAY';
    case Enum$VoteChoice.ABSTAIN:
      return r'ABSTAIN';
    case Enum$VoteChoice.$unknown:
      return r'$unknown';
  }
}

Enum$VoteChoice fromJson$Enum$VoteChoice(String value) {
  switch (value) {
    case r'YAY':
      return Enum$VoteChoice.YAY;
    case r'NAY':
      return Enum$VoteChoice.NAY;
    case r'ABSTAIN':
      return Enum$VoteChoice.ABSTAIN;
    default:
      return Enum$VoteChoice.$unknown;
  }
}

enum Enum$PolicyCategory {
  MEMBERSHIP,
  CONDUCT,
  FACILITY_USAGE,
  FINANCIAL,
  GOVERNANCE,
  PRIVACY,
  SAFETY,
  OTHER,
  $unknown;

  factory Enum$PolicyCategory.fromJson(String value) =>
      fromJson$Enum$PolicyCategory(value);

  String toJson() => toJson$Enum$PolicyCategory(this);
}

String toJson$Enum$PolicyCategory(Enum$PolicyCategory e) {
  switch (e) {
    case Enum$PolicyCategory.MEMBERSHIP:
      return r'MEMBERSHIP';
    case Enum$PolicyCategory.CONDUCT:
      return r'CONDUCT';
    case Enum$PolicyCategory.FACILITY_USAGE:
      return r'FACILITY_USAGE';
    case Enum$PolicyCategory.FINANCIAL:
      return r'FINANCIAL';
    case Enum$PolicyCategory.GOVERNANCE:
      return r'GOVERNANCE';
    case Enum$PolicyCategory.PRIVACY:
      return r'PRIVACY';
    case Enum$PolicyCategory.SAFETY:
      return r'SAFETY';
    case Enum$PolicyCategory.OTHER:
      return r'OTHER';
    case Enum$PolicyCategory.$unknown:
      return r'$unknown';
  }
}

Enum$PolicyCategory fromJson$Enum$PolicyCategory(String value) {
  switch (value) {
    case r'MEMBERSHIP':
      return Enum$PolicyCategory.MEMBERSHIP;
    case r'CONDUCT':
      return Enum$PolicyCategory.CONDUCT;
    case r'FACILITY_USAGE':
      return Enum$PolicyCategory.FACILITY_USAGE;
    case r'FINANCIAL':
      return Enum$PolicyCategory.FINANCIAL;
    case r'GOVERNANCE':
      return Enum$PolicyCategory.GOVERNANCE;
    case r'PRIVACY':
      return Enum$PolicyCategory.PRIVACY;
    case r'SAFETY':
      return Enum$PolicyCategory.SAFETY;
    case r'OTHER':
      return Enum$PolicyCategory.OTHER;
    default:
      return Enum$PolicyCategory.$unknown;
  }
}

enum Enum$MemberStatus {
  ACTIVE,
  INACTIVE,
  SUSPENDED,
  EXPIRED,
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
    case Enum$MemberStatus.EXPIRED:
      return r'EXPIRED';
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
    case r'EXPIRED':
      return Enum$MemberStatus.EXPIRED;
    case r'PENDING':
      return Enum$MemberStatus.PENDING;
    default:
      return Enum$MemberStatus.$unknown;
  }
}

enum Enum$AgreementStatus {
  PENDING,
  APPROVED,
  REJECTED,
  ACTIVE,
  SUSPENDED,
  EXPIRED,
  CANCELLED,
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
    case Enum$AgreementStatus.REJECTED:
      return r'REJECTED';
    case Enum$AgreementStatus.ACTIVE:
      return r'ACTIVE';
    case Enum$AgreementStatus.SUSPENDED:
      return r'SUSPENDED';
    case Enum$AgreementStatus.EXPIRED:
      return r'EXPIRED';
    case Enum$AgreementStatus.CANCELLED:
      return r'CANCELLED';
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
    case r'REJECTED':
      return Enum$AgreementStatus.REJECTED;
    case r'ACTIVE':
      return Enum$AgreementStatus.ACTIVE;
    case r'SUSPENDED':
      return Enum$AgreementStatus.SUSPENDED;
    case r'EXPIRED':
      return Enum$AgreementStatus.EXPIRED;
    case r'CANCELLED':
      return Enum$AgreementStatus.CANCELLED;
    default:
      return Enum$AgreementStatus.$unknown;
  }
}

enum Enum$AgreementType {
  BILATERAL,
  MULTILATERAL,
  NETWORK,
  TEMPORARY,
  $unknown;

  factory Enum$AgreementType.fromJson(String value) =>
      fromJson$Enum$AgreementType(value);

  String toJson() => toJson$Enum$AgreementType(this);
}

String toJson$Enum$AgreementType(Enum$AgreementType e) {
  switch (e) {
    case Enum$AgreementType.BILATERAL:
      return r'BILATERAL';
    case Enum$AgreementType.MULTILATERAL:
      return r'MULTILATERAL';
    case Enum$AgreementType.NETWORK:
      return r'NETWORK';
    case Enum$AgreementType.TEMPORARY:
      return r'TEMPORARY';
    case Enum$AgreementType.$unknown:
      return r'$unknown';
  }
}

Enum$AgreementType fromJson$Enum$AgreementType(String value) {
  switch (value) {
    case r'BILATERAL':
      return Enum$AgreementType.BILATERAL;
    case r'MULTILATERAL':
      return Enum$AgreementType.MULTILATERAL;
    case r'NETWORK':
      return Enum$AgreementType.NETWORK;
    case r'TEMPORARY':
      return Enum$AgreementType.TEMPORARY;
    default:
      return Enum$AgreementType.$unknown;
  }
}

enum Enum$VisitStatus {
  PLANNED,
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
    case Enum$VisitStatus.PLANNED:
      return r'PLANNED';
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
    case r'PLANNED':
      return Enum$VisitStatus.PLANNED;
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

enum Enum$NotificationChannel {
  EMAIL,
  SMS,
  PUSH,
  IN_APP,
  WEBHOOK,
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
    case Enum$NotificationChannel.WEBHOOK:
      return r'WEBHOOK';
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
    case r'WEBHOOK':
      return Enum$NotificationChannel.WEBHOOK;
    default:
      return Enum$NotificationChannel.$unknown;
  }
}

enum Enum$NotificationPriority {
  LOW,
  NORMAL,
  HIGH,
  CRITICAL,
  $unknown;

  factory Enum$NotificationPriority.fromJson(String value) =>
      fromJson$Enum$NotificationPriority(value);

  String toJson() => toJson$Enum$NotificationPriority(this);
}

String toJson$Enum$NotificationPriority(Enum$NotificationPriority e) {
  switch (e) {
    case Enum$NotificationPriority.LOW:
      return r'LOW';
    case Enum$NotificationPriority.NORMAL:
      return r'NORMAL';
    case Enum$NotificationPriority.HIGH:
      return r'HIGH';
    case Enum$NotificationPriority.CRITICAL:
      return r'CRITICAL';
    case Enum$NotificationPriority.$unknown:
      return r'$unknown';
  }
}

Enum$NotificationPriority fromJson$Enum$NotificationPriority(String value) {
  switch (value) {
    case r'LOW':
      return Enum$NotificationPriority.LOW;
    case r'NORMAL':
      return Enum$NotificationPriority.NORMAL;
    case r'HIGH':
      return Enum$NotificationPriority.HIGH;
    case r'CRITICAL':
      return Enum$NotificationPriority.CRITICAL;
    default:
      return Enum$NotificationPriority.$unknown;
  }
}

enum Enum$NotificationStatus {
  PENDING,
  SENT,
  DELIVERED,
  FAILED,
  READ,
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
    case Enum$NotificationStatus.FAILED:
      return r'FAILED';
    case Enum$NotificationStatus.READ:
      return r'READ';
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
    case r'FAILED':
      return Enum$NotificationStatus.FAILED;
    case r'READ':
      return Enum$NotificationStatus.READ;
    default:
      return Enum$NotificationStatus.$unknown;
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
