import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Subscription$VoteReceived {
  factory Variables$Subscription$VoteReceived({String? proposalId}) =>
      Variables$Subscription$VoteReceived._({
        if (proposalId != null) r'proposalId': proposalId,
      });

  Variables$Subscription$VoteReceived._(this._$data);

  factory Variables$Subscription$VoteReceived.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('proposalId')) {
      final l$proposalId = data['proposalId'];
      result$data['proposalId'] = (l$proposalId as String?);
    }
    return Variables$Subscription$VoteReceived._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get proposalId => (_$data['proposalId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('proposalId')) {
      final l$proposalId = proposalId;
      result$data['proposalId'] = l$proposalId;
    }
    return result$data;
  }

  CopyWith$Variables$Subscription$VoteReceived<
    Variables$Subscription$VoteReceived
  >
  get copyWith => CopyWith$Variables$Subscription$VoteReceived(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$VoteReceived ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$proposalId = proposalId;
    final lOther$proposalId = other.proposalId;
    if (_$data.containsKey('proposalId') !=
        other._$data.containsKey('proposalId')) {
      return false;
    }
    if (l$proposalId != lOther$proposalId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$proposalId = proposalId;
    return Object.hashAll([
      _$data.containsKey('proposalId') ? l$proposalId : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Subscription$VoteReceived<TRes> {
  factory CopyWith$Variables$Subscription$VoteReceived(
    Variables$Subscription$VoteReceived instance,
    TRes Function(Variables$Subscription$VoteReceived) then,
  ) = _CopyWithImpl$Variables$Subscription$VoteReceived;

  factory CopyWith$Variables$Subscription$VoteReceived.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$VoteReceived;

  TRes call({String? proposalId});
}

class _CopyWithImpl$Variables$Subscription$VoteReceived<TRes>
    implements CopyWith$Variables$Subscription$VoteReceived<TRes> {
  _CopyWithImpl$Variables$Subscription$VoteReceived(this._instance, this._then);

  final Variables$Subscription$VoteReceived _instance;

  final TRes Function(Variables$Subscription$VoteReceived) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? proposalId = _undefined}) => _then(
    Variables$Subscription$VoteReceived._({
      ..._instance._$data,
      if (proposalId != _undefined) 'proposalId': (proposalId as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Subscription$VoteReceived<TRes>
    implements CopyWith$Variables$Subscription$VoteReceived<TRes> {
  _CopyWithStubImpl$Variables$Subscription$VoteReceived(this._res);

  TRes _res;

  call({String? proposalId}) => _res;
}

class Subscription$VoteReceived {
  Subscription$VoteReceived({
    required this.voteReceived,
    this.$__typename = 'Subscription',
  });

  factory Subscription$VoteReceived.fromJson(Map<String, dynamic> json) {
    final l$voteReceived = json['voteReceived'];
    final l$$__typename = json['__typename'];
    return Subscription$VoteReceived(
      voteReceived: Subscription$VoteReceived$voteReceived.fromJson(
        (l$voteReceived as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Subscription$VoteReceived$voteReceived voteReceived;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$voteReceived = voteReceived;
    _resultData['voteReceived'] = l$voteReceived.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$voteReceived = voteReceived;
    final l$$__typename = $__typename;
    return Object.hashAll([l$voteReceived, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$VoteReceived ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$voteReceived = voteReceived;
    final lOther$voteReceived = other.voteReceived;
    if (l$voteReceived != lOther$voteReceived) {
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

extension UtilityExtension$Subscription$VoteReceived
    on Subscription$VoteReceived {
  CopyWith$Subscription$VoteReceived<Subscription$VoteReceived> get copyWith =>
      CopyWith$Subscription$VoteReceived(this, (i) => i);
}

abstract class CopyWith$Subscription$VoteReceived<TRes> {
  factory CopyWith$Subscription$VoteReceived(
    Subscription$VoteReceived instance,
    TRes Function(Subscription$VoteReceived) then,
  ) = _CopyWithImpl$Subscription$VoteReceived;

  factory CopyWith$Subscription$VoteReceived.stub(TRes res) =
      _CopyWithStubImpl$Subscription$VoteReceived;

  TRes call({
    Subscription$VoteReceived$voteReceived? voteReceived,
    String? $__typename,
  });
  CopyWith$Subscription$VoteReceived$voteReceived<TRes> get voteReceived;
}

class _CopyWithImpl$Subscription$VoteReceived<TRes>
    implements CopyWith$Subscription$VoteReceived<TRes> {
  _CopyWithImpl$Subscription$VoteReceived(this._instance, this._then);

  final Subscription$VoteReceived _instance;

  final TRes Function(Subscription$VoteReceived) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? voteReceived = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Subscription$VoteReceived(
      voteReceived: voteReceived == _undefined || voteReceived == null
          ? _instance.voteReceived
          : (voteReceived as Subscription$VoteReceived$voteReceived),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Subscription$VoteReceived$voteReceived<TRes> get voteReceived {
    final local$voteReceived = _instance.voteReceived;
    return CopyWith$Subscription$VoteReceived$voteReceived(
      local$voteReceived,
      (e) => call(voteReceived: e),
    );
  }
}

class _CopyWithStubImpl$Subscription$VoteReceived<TRes>
    implements CopyWith$Subscription$VoteReceived<TRes> {
  _CopyWithStubImpl$Subscription$VoteReceived(this._res);

  TRes _res;

  call({
    Subscription$VoteReceived$voteReceived? voteReceived,
    String? $__typename,
  }) => _res;

  CopyWith$Subscription$VoteReceived$voteReceived<TRes> get voteReceived =>
      CopyWith$Subscription$VoteReceived$voteReceived.stub(_res);
}

const documentNodeSubscriptionVoteReceived = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'VoteReceived'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'proposalId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'voteReceived'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'proposalId'),
                value: VariableNode(name: NameNode(value: 'proposalId')),
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
                  name: NameNode(value: 'proposalId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'voter'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'username'),
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
                  name: NameNode(value: 'choice'),
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
Subscription$VoteReceived _parserFn$Subscription$VoteReceived(
  Map<String, dynamic> data,
) => Subscription$VoteReceived.fromJson(data);

class Options$Subscription$VoteReceived
    extends graphql.SubscriptionOptions<Subscription$VoteReceived> {
  Options$Subscription$VoteReceived({
    String? operationName,
    Variables$Subscription$VoteReceived? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$VoteReceived? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeSubscriptionVoteReceived,
         parserFn: _parserFn$Subscription$VoteReceived,
       );
}

class WatchOptions$Subscription$VoteReceived
    extends graphql.WatchQueryOptions<Subscription$VoteReceived> {
  WatchOptions$Subscription$VoteReceived({
    String? operationName,
    Variables$Subscription$VoteReceived? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$VoteReceived? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeSubscriptionVoteReceived,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Subscription$VoteReceived,
       );
}

class FetchMoreOptions$Subscription$VoteReceived
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$VoteReceived({
    required graphql.UpdateQuery updateQuery,
    Variables$Subscription$VoteReceived? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeSubscriptionVoteReceived,
       );
}

extension ClientExtension$Subscription$VoteReceived on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$VoteReceived>>
  subscribe$VoteReceived([Options$Subscription$VoteReceived? options]) =>
      this.subscribe(options ?? Options$Subscription$VoteReceived());

  graphql.ObservableQuery<Subscription$VoteReceived>
  watchSubscription$VoteReceived([
    WatchOptions$Subscription$VoteReceived? options,
  ]) => this.watchQuery(options ?? WatchOptions$Subscription$VoteReceived());
}

class Subscription$VoteReceived$voteReceived {
  Subscription$VoteReceived$voteReceived({
    required this.id,
    required this.proposalId,
    required this.voter,
    required this.choice,
    required this.createdAt,
    this.$__typename = 'Vote',
  });

  factory Subscription$VoteReceived$voteReceived.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$proposalId = json['proposalId'];
    final l$voter = json['voter'];
    final l$choice = json['choice'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Subscription$VoteReceived$voteReceived(
      id: (l$id as String),
      proposalId: (l$proposalId as String),
      voter: Subscription$VoteReceived$voteReceived$voter.fromJson(
        (l$voter as Map<String, dynamic>),
      ),
      choice: fromJson$Enum$VoteChoice((l$choice as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String proposalId;

  final Subscription$VoteReceived$voteReceived$voter voter;

  final Enum$VoteChoice choice;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$proposalId = proposalId;
    _resultData['proposalId'] = l$proposalId;
    final l$voter = voter;
    _resultData['voter'] = l$voter.toJson();
    final l$choice = choice;
    _resultData['choice'] = toJson$Enum$VoteChoice(l$choice);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$proposalId = proposalId;
    final l$voter = voter;
    final l$choice = choice;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$proposalId,
      l$voter,
      l$choice,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$VoteReceived$voteReceived ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$proposalId = proposalId;
    final lOther$proposalId = other.proposalId;
    if (l$proposalId != lOther$proposalId) {
      return false;
    }
    final l$voter = voter;
    final lOther$voter = other.voter;
    if (l$voter != lOther$voter) {
      return false;
    }
    final l$choice = choice;
    final lOther$choice = other.choice;
    if (l$choice != lOther$choice) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

extension UtilityExtension$Subscription$VoteReceived$voteReceived
    on Subscription$VoteReceived$voteReceived {
  CopyWith$Subscription$VoteReceived$voteReceived<
    Subscription$VoteReceived$voteReceived
  >
  get copyWith =>
      CopyWith$Subscription$VoteReceived$voteReceived(this, (i) => i);
}

abstract class CopyWith$Subscription$VoteReceived$voteReceived<TRes> {
  factory CopyWith$Subscription$VoteReceived$voteReceived(
    Subscription$VoteReceived$voteReceived instance,
    TRes Function(Subscription$VoteReceived$voteReceived) then,
  ) = _CopyWithImpl$Subscription$VoteReceived$voteReceived;

  factory CopyWith$Subscription$VoteReceived$voteReceived.stub(TRes res) =
      _CopyWithStubImpl$Subscription$VoteReceived$voteReceived;

  TRes call({
    String? id,
    String? proposalId,
    Subscription$VoteReceived$voteReceived$voter? voter,
    Enum$VoteChoice? choice,
    DateTime? createdAt,
    String? $__typename,
  });
  CopyWith$Subscription$VoteReceived$voteReceived$voter<TRes> get voter;
}

class _CopyWithImpl$Subscription$VoteReceived$voteReceived<TRes>
    implements CopyWith$Subscription$VoteReceived$voteReceived<TRes> {
  _CopyWithImpl$Subscription$VoteReceived$voteReceived(
    this._instance,
    this._then,
  );

  final Subscription$VoteReceived$voteReceived _instance;

  final TRes Function(Subscription$VoteReceived$voteReceived) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? proposalId = _undefined,
    Object? voter = _undefined,
    Object? choice = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Subscription$VoteReceived$voteReceived(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      proposalId: proposalId == _undefined || proposalId == null
          ? _instance.proposalId
          : (proposalId as String),
      voter: voter == _undefined || voter == null
          ? _instance.voter
          : (voter as Subscription$VoteReceived$voteReceived$voter),
      choice: choice == _undefined || choice == null
          ? _instance.choice
          : (choice as Enum$VoteChoice),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Subscription$VoteReceived$voteReceived$voter<TRes> get voter {
    final local$voter = _instance.voter;
    return CopyWith$Subscription$VoteReceived$voteReceived$voter(
      local$voter,
      (e) => call(voter: e),
    );
  }
}

class _CopyWithStubImpl$Subscription$VoteReceived$voteReceived<TRes>
    implements CopyWith$Subscription$VoteReceived$voteReceived<TRes> {
  _CopyWithStubImpl$Subscription$VoteReceived$voteReceived(this._res);

  TRes _res;

  call({
    String? id,
    String? proposalId,
    Subscription$VoteReceived$voteReceived$voter? voter,
    Enum$VoteChoice? choice,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;

  CopyWith$Subscription$VoteReceived$voteReceived$voter<TRes> get voter =>
      CopyWith$Subscription$VoteReceived$voteReceived$voter.stub(_res);
}

class Subscription$VoteReceived$voteReceived$voter {
  Subscription$VoteReceived$voteReceived$voter({
    required this.username,
    this.$__typename = 'User',
  });

  factory Subscription$VoteReceived$voteReceived$voter.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$username = json['username'];
    final l$$__typename = json['__typename'];
    return Subscription$VoteReceived$voteReceived$voter(
      username: (l$username as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String username;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$username = username;
    _resultData['username'] = l$username;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$username = username;
    final l$$__typename = $__typename;
    return Object.hashAll([l$username, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$VoteReceived$voteReceived$voter ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
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

extension UtilityExtension$Subscription$VoteReceived$voteReceived$voter
    on Subscription$VoteReceived$voteReceived$voter {
  CopyWith$Subscription$VoteReceived$voteReceived$voter<
    Subscription$VoteReceived$voteReceived$voter
  >
  get copyWith =>
      CopyWith$Subscription$VoteReceived$voteReceived$voter(this, (i) => i);
}

abstract class CopyWith$Subscription$VoteReceived$voteReceived$voter<TRes> {
  factory CopyWith$Subscription$VoteReceived$voteReceived$voter(
    Subscription$VoteReceived$voteReceived$voter instance,
    TRes Function(Subscription$VoteReceived$voteReceived$voter) then,
  ) = _CopyWithImpl$Subscription$VoteReceived$voteReceived$voter;

  factory CopyWith$Subscription$VoteReceived$voteReceived$voter.stub(TRes res) =
      _CopyWithStubImpl$Subscription$VoteReceived$voteReceived$voter;

  TRes call({String? username, String? $__typename});
}

class _CopyWithImpl$Subscription$VoteReceived$voteReceived$voter<TRes>
    implements CopyWith$Subscription$VoteReceived$voteReceived$voter<TRes> {
  _CopyWithImpl$Subscription$VoteReceived$voteReceived$voter(
    this._instance,
    this._then,
  );

  final Subscription$VoteReceived$voteReceived$voter _instance;

  final TRes Function(Subscription$VoteReceived$voteReceived$voter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? username = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Subscription$VoteReceived$voteReceived$voter(
      username: username == _undefined || username == null
          ? _instance.username
          : (username as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Subscription$VoteReceived$voteReceived$voter<TRes>
    implements CopyWith$Subscription$VoteReceived$voteReceived$voter<TRes> {
  _CopyWithStubImpl$Subscription$VoteReceived$voteReceived$voter(this._res);

  TRes _res;

  call({String? username, String? $__typename}) => _res;
}
