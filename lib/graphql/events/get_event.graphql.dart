import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$GetEvent {
  factory Variables$Query$GetEvent({required String id}) =>
      Variables$Query$GetEvent._({r'id': id});

  Variables$Query$GetEvent._(this._$data);

  factory Variables$Query$GetEvent.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetEvent._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetEvent<Variables$Query$GetEvent> get copyWith =>
      CopyWith$Variables$Query$GetEvent(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetEvent ||
        runtimeType != other.runtimeType) {
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

abstract class CopyWith$Variables$Query$GetEvent<TRes> {
  factory CopyWith$Variables$Query$GetEvent(
    Variables$Query$GetEvent instance,
    TRes Function(Variables$Query$GetEvent) then,
  ) = _CopyWithImpl$Variables$Query$GetEvent;

  factory CopyWith$Variables$Query$GetEvent.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetEvent;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetEvent<TRes>
    implements CopyWith$Variables$Query$GetEvent<TRes> {
  _CopyWithImpl$Variables$Query$GetEvent(this._instance, this._then);

  final Variables$Query$GetEvent _instance;

  final TRes Function(Variables$Query$GetEvent) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetEvent._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetEvent<TRes>
    implements CopyWith$Variables$Query$GetEvent<TRes> {
  _CopyWithStubImpl$Variables$Query$GetEvent(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetEvent {
  Query$GetEvent({this.event, this.$__typename = 'Query'});

  factory Query$GetEvent.fromJson(Map<String, dynamic> json) {
    final l$event = json['event'];
    final l$$__typename = json['__typename'];
    return Query$GetEvent(
      event: l$event == null
          ? null
          : Query$GetEvent$event.fromJson((l$event as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetEvent$event? event;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$event = event;
    _resultData['event'] = l$event?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$event = event;
    final l$$__typename = $__typename;
    return Object.hashAll([l$event, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetEvent || runtimeType != other.runtimeType) {
      return false;
    }
    final l$event = event;
    final lOther$event = other.event;
    if (l$event != lOther$event) {
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

extension UtilityExtension$Query$GetEvent on Query$GetEvent {
  CopyWith$Query$GetEvent<Query$GetEvent> get copyWith =>
      CopyWith$Query$GetEvent(this, (i) => i);
}

abstract class CopyWith$Query$GetEvent<TRes> {
  factory CopyWith$Query$GetEvent(
    Query$GetEvent instance,
    TRes Function(Query$GetEvent) then,
  ) = _CopyWithImpl$Query$GetEvent;

  factory CopyWith$Query$GetEvent.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEvent;

  TRes call({Query$GetEvent$event? event, String? $__typename});
  CopyWith$Query$GetEvent$event<TRes> get event;
}

class _CopyWithImpl$Query$GetEvent<TRes>
    implements CopyWith$Query$GetEvent<TRes> {
  _CopyWithImpl$Query$GetEvent(this._instance, this._then);

  final Query$GetEvent _instance;

  final TRes Function(Query$GetEvent) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? event = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetEvent(
          event: event == _undefined
              ? _instance.event
              : (event as Query$GetEvent$event?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetEvent$event<TRes> get event {
    final local$event = _instance.event;
    return local$event == null
        ? CopyWith$Query$GetEvent$event.stub(_then(_instance))
        : CopyWith$Query$GetEvent$event(local$event, (e) => call(event: e));
  }
}

class _CopyWithStubImpl$Query$GetEvent<TRes>
    implements CopyWith$Query$GetEvent<TRes> {
  _CopyWithStubImpl$Query$GetEvent(this._res);

  TRes _res;

  call({Query$GetEvent$event? event, String? $__typename}) => _res;

  CopyWith$Query$GetEvent$event<TRes> get event =>
      CopyWith$Query$GetEvent$event.stub(_res);
}

const documentNodeQueryGetEvent = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetEvent'),
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
            name: NameNode(value: 'event'),
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
                  name: NameNode(value: 'title'),
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
                  name: NameNode(value: 'eventType'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'startTime'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'endTime'),
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
                  name: NameNode(value: 'imageUrl'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'capacity'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'currentAttendees'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'availableSpots'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'tentativeCount'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'waitlistCount'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'guestPolicy'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'maxGuestsPerMember'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'requiresApproval'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'requiresPayment'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'price'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cancellationDeadline'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'freeCancellationDays'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cancellationFeePercentage'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'allowsSubgroupPriority'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'fullHouseExclusive'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'rsvpDeadline'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'subgroupId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'organizerName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'contactEmail'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'contactPhone'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'paymentInstructions'),
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
Query$GetEvent _parserFn$Query$GetEvent(Map<String, dynamic> data) =>
    Query$GetEvent.fromJson(data);
typedef OnQueryComplete$Query$GetEvent =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetEvent?);

class Options$Query$GetEvent extends graphql.QueryOptions<Query$GetEvent> {
  Options$Query$GetEvent({
    String? operationName,
    required Variables$Query$GetEvent variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEvent? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetEvent? onComplete,
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
                 data == null ? null : _parserFn$Query$GetEvent(data),
               ),
         onError: onError,
         document: documentNodeQueryGetEvent,
         parserFn: _parserFn$Query$GetEvent,
       );

  final OnQueryComplete$Query$GetEvent? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetEvent
    extends graphql.WatchQueryOptions<Query$GetEvent> {
  WatchOptions$Query$GetEvent({
    String? operationName,
    required Variables$Query$GetEvent variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEvent? typedOptimisticResult,
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
         document: documentNodeQueryGetEvent,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetEvent,
       );
}

class FetchMoreOptions$Query$GetEvent extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetEvent({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetEvent variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetEvent,
       );
}

extension ClientExtension$Query$GetEvent on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetEvent>> query$GetEvent(
    Options$Query$GetEvent options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetEvent> watchQuery$GetEvent(
    WatchOptions$Query$GetEvent options,
  ) => this.watchQuery(options);

  void writeQuery$GetEvent({
    required Query$GetEvent data,
    required Variables$Query$GetEvent variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetEvent),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetEvent? readQuery$GetEvent({
    required Variables$Query$GetEvent variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetEvent),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetEvent.fromJson(result);
  }
}

class Query$GetEvent$event {
  Query$GetEvent$event({
    required this.id,
    required this.clubId,
    required this.title,
    this.description,
    this.eventType,
    required this.startTime,
    required this.endTime,
    this.location,
    this.imageUrl,
    this.capacity,
    this.currentAttendees,
    this.availableSpots,
    this.tentativeCount,
    this.waitlistCount,
    this.guestPolicy,
    this.maxGuestsPerMember,
    this.requiresApproval,
    this.requiresPayment,
    this.price,
    this.cancellationDeadline,
    this.freeCancellationDays,
    this.cancellationFeePercentage,
    this.allowsSubgroupPriority,
    this.fullHouseExclusive,
    this.rsvpDeadline,
    this.subgroupId,
    this.organizerName,
    this.contactEmail,
    this.contactPhone,
    this.paymentInstructions,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Event',
  });

  factory Query$GetEvent$event.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$eventType = json['eventType'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$location = json['location'];
    final l$imageUrl = json['imageUrl'];
    final l$capacity = json['capacity'];
    final l$currentAttendees = json['currentAttendees'];
    final l$availableSpots = json['availableSpots'];
    final l$tentativeCount = json['tentativeCount'];
    final l$waitlistCount = json['waitlistCount'];
    final l$guestPolicy = json['guestPolicy'];
    final l$maxGuestsPerMember = json['maxGuestsPerMember'];
    final l$requiresApproval = json['requiresApproval'];
    final l$requiresPayment = json['requiresPayment'];
    final l$price = json['price'];
    final l$cancellationDeadline = json['cancellationDeadline'];
    final l$freeCancellationDays = json['freeCancellationDays'];
    final l$cancellationFeePercentage = json['cancellationFeePercentage'];
    final l$allowsSubgroupPriority = json['allowsSubgroupPriority'];
    final l$fullHouseExclusive = json['fullHouseExclusive'];
    final l$rsvpDeadline = json['rsvpDeadline'];
    final l$subgroupId = json['subgroupId'];
    final l$organizerName = json['organizerName'];
    final l$contactEmail = json['contactEmail'];
    final l$contactPhone = json['contactPhone'];
    final l$paymentInstructions = json['paymentInstructions'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$GetEvent$event(
      id: (l$id as String),
      clubId: (l$clubId as String),
      title: (l$title as String),
      description: (l$description as String?),
      eventType: (l$eventType as String?),
      startTime: DateTime.parse((l$startTime as String)),
      endTime: DateTime.parse((l$endTime as String)),
      location: (l$location as String?),
      imageUrl: (l$imageUrl as String?),
      capacity: (l$capacity as int?),
      currentAttendees: (l$currentAttendees as int?),
      availableSpots: (l$availableSpots as int?),
      tentativeCount: (l$tentativeCount as int?),
      waitlistCount: (l$waitlistCount as int?),
      guestPolicy: (l$guestPolicy as String?),
      maxGuestsPerMember: (l$maxGuestsPerMember as int?),
      requiresApproval: (l$requiresApproval as bool?),
      requiresPayment: (l$requiresPayment as bool?),
      price: (l$price as num?)?.toDouble(),
      cancellationDeadline: l$cancellationDeadline == null
          ? null
          : DateTime.parse((l$cancellationDeadline as String)),
      freeCancellationDays: (l$freeCancellationDays as int?),
      cancellationFeePercentage: (l$cancellationFeePercentage as num?)
          ?.toDouble(),
      allowsSubgroupPriority: (l$allowsSubgroupPriority as bool?),
      fullHouseExclusive: (l$fullHouseExclusive as bool?),
      rsvpDeadline: l$rsvpDeadline == null
          ? null
          : DateTime.parse((l$rsvpDeadline as String)),
      subgroupId: (l$subgroupId as String?),
      organizerName: (l$organizerName as String?),
      contactEmail: (l$contactEmail as String?),
      contactPhone: (l$contactPhone as String?),
      paymentInstructions: (l$paymentInstructions as String?),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String title;

  final String? description;

  final String? eventType;

  final DateTime startTime;

  final DateTime endTime;

  final String? location;

  final String? imageUrl;

  final int? capacity;

  final int? currentAttendees;

  final int? availableSpots;

  final int? tentativeCount;

  final int? waitlistCount;

  final String? guestPolicy;

  final int? maxGuestsPerMember;

  final bool? requiresApproval;

  final bool? requiresPayment;

  final double? price;

  final DateTime? cancellationDeadline;

  final int? freeCancellationDays;

  final double? cancellationFeePercentage;

  final bool? allowsSubgroupPriority;

  final bool? fullHouseExclusive;

  final DateTime? rsvpDeadline;

  final String? subgroupId;

  final String? organizerName;

  final String? contactEmail;

  final String? contactPhone;

  final String? paymentInstructions;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$eventType = eventType;
    _resultData['eventType'] = l$eventType;
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime.toIso8601String();
    final l$location = location;
    _resultData['location'] = l$location;
    final l$imageUrl = imageUrl;
    _resultData['imageUrl'] = l$imageUrl;
    final l$capacity = capacity;
    _resultData['capacity'] = l$capacity;
    final l$currentAttendees = currentAttendees;
    _resultData['currentAttendees'] = l$currentAttendees;
    final l$availableSpots = availableSpots;
    _resultData['availableSpots'] = l$availableSpots;
    final l$tentativeCount = tentativeCount;
    _resultData['tentativeCount'] = l$tentativeCount;
    final l$waitlistCount = waitlistCount;
    _resultData['waitlistCount'] = l$waitlistCount;
    final l$guestPolicy = guestPolicy;
    _resultData['guestPolicy'] = l$guestPolicy;
    final l$maxGuestsPerMember = maxGuestsPerMember;
    _resultData['maxGuestsPerMember'] = l$maxGuestsPerMember;
    final l$requiresApproval = requiresApproval;
    _resultData['requiresApproval'] = l$requiresApproval;
    final l$requiresPayment = requiresPayment;
    _resultData['requiresPayment'] = l$requiresPayment;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$cancellationDeadline = cancellationDeadline;
    _resultData['cancellationDeadline'] = l$cancellationDeadline
        ?.toIso8601String();
    final l$freeCancellationDays = freeCancellationDays;
    _resultData['freeCancellationDays'] = l$freeCancellationDays;
    final l$cancellationFeePercentage = cancellationFeePercentage;
    _resultData['cancellationFeePercentage'] = l$cancellationFeePercentage;
    final l$allowsSubgroupPriority = allowsSubgroupPriority;
    _resultData['allowsSubgroupPriority'] = l$allowsSubgroupPriority;
    final l$fullHouseExclusive = fullHouseExclusive;
    _resultData['fullHouseExclusive'] = l$fullHouseExclusive;
    final l$rsvpDeadline = rsvpDeadline;
    _resultData['rsvpDeadline'] = l$rsvpDeadline?.toIso8601String();
    final l$subgroupId = subgroupId;
    _resultData['subgroupId'] = l$subgroupId;
    final l$organizerName = organizerName;
    _resultData['organizerName'] = l$organizerName;
    final l$contactEmail = contactEmail;
    _resultData['contactEmail'] = l$contactEmail;
    final l$contactPhone = contactPhone;
    _resultData['contactPhone'] = l$contactPhone;
    final l$paymentInstructions = paymentInstructions;
    _resultData['paymentInstructions'] = l$paymentInstructions;
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
    final l$title = title;
    final l$description = description;
    final l$eventType = eventType;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$location = location;
    final l$imageUrl = imageUrl;
    final l$capacity = capacity;
    final l$currentAttendees = currentAttendees;
    final l$availableSpots = availableSpots;
    final l$tentativeCount = tentativeCount;
    final l$waitlistCount = waitlistCount;
    final l$guestPolicy = guestPolicy;
    final l$maxGuestsPerMember = maxGuestsPerMember;
    final l$requiresApproval = requiresApproval;
    final l$requiresPayment = requiresPayment;
    final l$price = price;
    final l$cancellationDeadline = cancellationDeadline;
    final l$freeCancellationDays = freeCancellationDays;
    final l$cancellationFeePercentage = cancellationFeePercentage;
    final l$allowsSubgroupPriority = allowsSubgroupPriority;
    final l$fullHouseExclusive = fullHouseExclusive;
    final l$rsvpDeadline = rsvpDeadline;
    final l$subgroupId = subgroupId;
    final l$organizerName = organizerName;
    final l$contactEmail = contactEmail;
    final l$contactPhone = contactPhone;
    final l$paymentInstructions = paymentInstructions;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$title,
      l$description,
      l$eventType,
      l$startTime,
      l$endTime,
      l$location,
      l$imageUrl,
      l$capacity,
      l$currentAttendees,
      l$availableSpots,
      l$tentativeCount,
      l$waitlistCount,
      l$guestPolicy,
      l$maxGuestsPerMember,
      l$requiresApproval,
      l$requiresPayment,
      l$price,
      l$cancellationDeadline,
      l$freeCancellationDays,
      l$cancellationFeePercentage,
      l$allowsSubgroupPriority,
      l$fullHouseExclusive,
      l$rsvpDeadline,
      l$subgroupId,
      l$organizerName,
      l$contactEmail,
      l$contactPhone,
      l$paymentInstructions,
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
    if (other is! Query$GetEvent$event || runtimeType != other.runtimeType) {
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
    final l$eventType = eventType;
    final lOther$eventType = other.eventType;
    if (l$eventType != lOther$eventType) {
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
    if (l$location != lOther$location) {
      return false;
    }
    final l$imageUrl = imageUrl;
    final lOther$imageUrl = other.imageUrl;
    if (l$imageUrl != lOther$imageUrl) {
      return false;
    }
    final l$capacity = capacity;
    final lOther$capacity = other.capacity;
    if (l$capacity != lOther$capacity) {
      return false;
    }
    final l$currentAttendees = currentAttendees;
    final lOther$currentAttendees = other.currentAttendees;
    if (l$currentAttendees != lOther$currentAttendees) {
      return false;
    }
    final l$availableSpots = availableSpots;
    final lOther$availableSpots = other.availableSpots;
    if (l$availableSpots != lOther$availableSpots) {
      return false;
    }
    final l$tentativeCount = tentativeCount;
    final lOther$tentativeCount = other.tentativeCount;
    if (l$tentativeCount != lOther$tentativeCount) {
      return false;
    }
    final l$waitlistCount = waitlistCount;
    final lOther$waitlistCount = other.waitlistCount;
    if (l$waitlistCount != lOther$waitlistCount) {
      return false;
    }
    final l$guestPolicy = guestPolicy;
    final lOther$guestPolicy = other.guestPolicy;
    if (l$guestPolicy != lOther$guestPolicy) {
      return false;
    }
    final l$maxGuestsPerMember = maxGuestsPerMember;
    final lOther$maxGuestsPerMember = other.maxGuestsPerMember;
    if (l$maxGuestsPerMember != lOther$maxGuestsPerMember) {
      return false;
    }
    final l$requiresApproval = requiresApproval;
    final lOther$requiresApproval = other.requiresApproval;
    if (l$requiresApproval != lOther$requiresApproval) {
      return false;
    }
    final l$requiresPayment = requiresPayment;
    final lOther$requiresPayment = other.requiresPayment;
    if (l$requiresPayment != lOther$requiresPayment) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$cancellationDeadline = cancellationDeadline;
    final lOther$cancellationDeadline = other.cancellationDeadline;
    if (l$cancellationDeadline != lOther$cancellationDeadline) {
      return false;
    }
    final l$freeCancellationDays = freeCancellationDays;
    final lOther$freeCancellationDays = other.freeCancellationDays;
    if (l$freeCancellationDays != lOther$freeCancellationDays) {
      return false;
    }
    final l$cancellationFeePercentage = cancellationFeePercentage;
    final lOther$cancellationFeePercentage = other.cancellationFeePercentage;
    if (l$cancellationFeePercentage != lOther$cancellationFeePercentage) {
      return false;
    }
    final l$allowsSubgroupPriority = allowsSubgroupPriority;
    final lOther$allowsSubgroupPriority = other.allowsSubgroupPriority;
    if (l$allowsSubgroupPriority != lOther$allowsSubgroupPriority) {
      return false;
    }
    final l$fullHouseExclusive = fullHouseExclusive;
    final lOther$fullHouseExclusive = other.fullHouseExclusive;
    if (l$fullHouseExclusive != lOther$fullHouseExclusive) {
      return false;
    }
    final l$rsvpDeadline = rsvpDeadline;
    final lOther$rsvpDeadline = other.rsvpDeadline;
    if (l$rsvpDeadline != lOther$rsvpDeadline) {
      return false;
    }
    final l$subgroupId = subgroupId;
    final lOther$subgroupId = other.subgroupId;
    if (l$subgroupId != lOther$subgroupId) {
      return false;
    }
    final l$organizerName = organizerName;
    final lOther$organizerName = other.organizerName;
    if (l$organizerName != lOther$organizerName) {
      return false;
    }
    final l$contactEmail = contactEmail;
    final lOther$contactEmail = other.contactEmail;
    if (l$contactEmail != lOther$contactEmail) {
      return false;
    }
    final l$contactPhone = contactPhone;
    final lOther$contactPhone = other.contactPhone;
    if (l$contactPhone != lOther$contactPhone) {
      return false;
    }
    final l$paymentInstructions = paymentInstructions;
    final lOther$paymentInstructions = other.paymentInstructions;
    if (l$paymentInstructions != lOther$paymentInstructions) {
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

extension UtilityExtension$Query$GetEvent$event on Query$GetEvent$event {
  CopyWith$Query$GetEvent$event<Query$GetEvent$event> get copyWith =>
      CopyWith$Query$GetEvent$event(this, (i) => i);
}

abstract class CopyWith$Query$GetEvent$event<TRes> {
  factory CopyWith$Query$GetEvent$event(
    Query$GetEvent$event instance,
    TRes Function(Query$GetEvent$event) then,
  ) = _CopyWithImpl$Query$GetEvent$event;

  factory CopyWith$Query$GetEvent$event.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEvent$event;

  TRes call({
    String? id,
    String? clubId,
    String? title,
    String? description,
    String? eventType,
    DateTime? startTime,
    DateTime? endTime,
    String? location,
    String? imageUrl,
    int? capacity,
    int? currentAttendees,
    int? availableSpots,
    int? tentativeCount,
    int? waitlistCount,
    String? guestPolicy,
    int? maxGuestsPerMember,
    bool? requiresApproval,
    bool? requiresPayment,
    double? price,
    DateTime? cancellationDeadline,
    int? freeCancellationDays,
    double? cancellationFeePercentage,
    bool? allowsSubgroupPriority,
    bool? fullHouseExclusive,
    DateTime? rsvpDeadline,
    String? subgroupId,
    String? organizerName,
    String? contactEmail,
    String? contactPhone,
    String? paymentInstructions,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetEvent$event<TRes>
    implements CopyWith$Query$GetEvent$event<TRes> {
  _CopyWithImpl$Query$GetEvent$event(this._instance, this._then);

  final Query$GetEvent$event _instance;

  final TRes Function(Query$GetEvent$event) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? eventType = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? location = _undefined,
    Object? imageUrl = _undefined,
    Object? capacity = _undefined,
    Object? currentAttendees = _undefined,
    Object? availableSpots = _undefined,
    Object? tentativeCount = _undefined,
    Object? waitlistCount = _undefined,
    Object? guestPolicy = _undefined,
    Object? maxGuestsPerMember = _undefined,
    Object? requiresApproval = _undefined,
    Object? requiresPayment = _undefined,
    Object? price = _undefined,
    Object? cancellationDeadline = _undefined,
    Object? freeCancellationDays = _undefined,
    Object? cancellationFeePercentage = _undefined,
    Object? allowsSubgroupPriority = _undefined,
    Object? fullHouseExclusive = _undefined,
    Object? rsvpDeadline = _undefined,
    Object? subgroupId = _undefined,
    Object? organizerName = _undefined,
    Object? contactEmail = _undefined,
    Object? contactPhone = _undefined,
    Object? paymentInstructions = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetEvent$event(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      title: title == _undefined || title == null
          ? _instance.title
          : (title as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      eventType: eventType == _undefined
          ? _instance.eventType
          : (eventType as String?),
      startTime: startTime == _undefined || startTime == null
          ? _instance.startTime
          : (startTime as DateTime),
      endTime: endTime == _undefined || endTime == null
          ? _instance.endTime
          : (endTime as DateTime),
      location: location == _undefined
          ? _instance.location
          : (location as String?),
      imageUrl: imageUrl == _undefined
          ? _instance.imageUrl
          : (imageUrl as String?),
      capacity: capacity == _undefined
          ? _instance.capacity
          : (capacity as int?),
      currentAttendees: currentAttendees == _undefined
          ? _instance.currentAttendees
          : (currentAttendees as int?),
      availableSpots: availableSpots == _undefined
          ? _instance.availableSpots
          : (availableSpots as int?),
      tentativeCount: tentativeCount == _undefined
          ? _instance.tentativeCount
          : (tentativeCount as int?),
      waitlistCount: waitlistCount == _undefined
          ? _instance.waitlistCount
          : (waitlistCount as int?),
      guestPolicy: guestPolicy == _undefined
          ? _instance.guestPolicy
          : (guestPolicy as String?),
      maxGuestsPerMember: maxGuestsPerMember == _undefined
          ? _instance.maxGuestsPerMember
          : (maxGuestsPerMember as int?),
      requiresApproval: requiresApproval == _undefined
          ? _instance.requiresApproval
          : (requiresApproval as bool?),
      requiresPayment: requiresPayment == _undefined
          ? _instance.requiresPayment
          : (requiresPayment as bool?),
      price: price == _undefined ? _instance.price : (price as double?),
      cancellationDeadline: cancellationDeadline == _undefined
          ? _instance.cancellationDeadline
          : (cancellationDeadline as DateTime?),
      freeCancellationDays: freeCancellationDays == _undefined
          ? _instance.freeCancellationDays
          : (freeCancellationDays as int?),
      cancellationFeePercentage: cancellationFeePercentage == _undefined
          ? _instance.cancellationFeePercentage
          : (cancellationFeePercentage as double?),
      allowsSubgroupPriority: allowsSubgroupPriority == _undefined
          ? _instance.allowsSubgroupPriority
          : (allowsSubgroupPriority as bool?),
      fullHouseExclusive: fullHouseExclusive == _undefined
          ? _instance.fullHouseExclusive
          : (fullHouseExclusive as bool?),
      rsvpDeadline: rsvpDeadline == _undefined
          ? _instance.rsvpDeadline
          : (rsvpDeadline as DateTime?),
      subgroupId: subgroupId == _undefined
          ? _instance.subgroupId
          : (subgroupId as String?),
      organizerName: organizerName == _undefined
          ? _instance.organizerName
          : (organizerName as String?),
      contactEmail: contactEmail == _undefined
          ? _instance.contactEmail
          : (contactEmail as String?),
      contactPhone: contactPhone == _undefined
          ? _instance.contactPhone
          : (contactPhone as String?),
      paymentInstructions: paymentInstructions == _undefined
          ? _instance.paymentInstructions
          : (paymentInstructions as String?),
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
}

class _CopyWithStubImpl$Query$GetEvent$event<TRes>
    implements CopyWith$Query$GetEvent$event<TRes> {
  _CopyWithStubImpl$Query$GetEvent$event(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? title,
    String? description,
    String? eventType,
    DateTime? startTime,
    DateTime? endTime,
    String? location,
    String? imageUrl,
    int? capacity,
    int? currentAttendees,
    int? availableSpots,
    int? tentativeCount,
    int? waitlistCount,
    String? guestPolicy,
    int? maxGuestsPerMember,
    bool? requiresApproval,
    bool? requiresPayment,
    double? price,
    DateTime? cancellationDeadline,
    int? freeCancellationDays,
    double? cancellationFeePercentage,
    bool? allowsSubgroupPriority,
    bool? fullHouseExclusive,
    DateTime? rsvpDeadline,
    String? subgroupId,
    String? organizerName,
    String? contactEmail,
    String? contactPhone,
    String? paymentInstructions,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;
}
