import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Subscription$ProposalUpdated {
  factory Variables$Subscription$ProposalUpdated({String? proposalId}) =>
      Variables$Subscription$ProposalUpdated._({
        if (proposalId != null) r'proposalId': proposalId,
      });

  Variables$Subscription$ProposalUpdated._(this._$data);

  factory Variables$Subscription$ProposalUpdated.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('proposalId')) {
      final l$proposalId = data['proposalId'];
      result$data['proposalId'] = (l$proposalId as String?);
    }
    return Variables$Subscription$ProposalUpdated._(result$data);
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

  CopyWith$Variables$Subscription$ProposalUpdated<
    Variables$Subscription$ProposalUpdated
  >
  get copyWith =>
      CopyWith$Variables$Subscription$ProposalUpdated(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$ProposalUpdated ||
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

abstract class CopyWith$Variables$Subscription$ProposalUpdated<TRes> {
  factory CopyWith$Variables$Subscription$ProposalUpdated(
    Variables$Subscription$ProposalUpdated instance,
    TRes Function(Variables$Subscription$ProposalUpdated) then,
  ) = _CopyWithImpl$Variables$Subscription$ProposalUpdated;

  factory CopyWith$Variables$Subscription$ProposalUpdated.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$ProposalUpdated;

  TRes call({String? proposalId});
}

class _CopyWithImpl$Variables$Subscription$ProposalUpdated<TRes>
    implements CopyWith$Variables$Subscription$ProposalUpdated<TRes> {
  _CopyWithImpl$Variables$Subscription$ProposalUpdated(
    this._instance,
    this._then,
  );

  final Variables$Subscription$ProposalUpdated _instance;

  final TRes Function(Variables$Subscription$ProposalUpdated) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? proposalId = _undefined}) => _then(
    Variables$Subscription$ProposalUpdated._({
      ..._instance._$data,
      if (proposalId != _undefined) 'proposalId': (proposalId as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Subscription$ProposalUpdated<TRes>
    implements CopyWith$Variables$Subscription$ProposalUpdated<TRes> {
  _CopyWithStubImpl$Variables$Subscription$ProposalUpdated(this._res);

  TRes _res;

  call({String? proposalId}) => _res;
}

class Subscription$ProposalUpdated {
  Subscription$ProposalUpdated({
    required this.proposalUpdated,
    this.$__typename = 'Subscription',
  });

  factory Subscription$ProposalUpdated.fromJson(Map<String, dynamic> json) {
    final l$proposalUpdated = json['proposalUpdated'];
    final l$$__typename = json['__typename'];
    return Subscription$ProposalUpdated(
      proposalUpdated: Subscription$ProposalUpdated$proposalUpdated.fromJson(
        (l$proposalUpdated as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Subscription$ProposalUpdated$proposalUpdated proposalUpdated;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$proposalUpdated = proposalUpdated;
    _resultData['proposalUpdated'] = l$proposalUpdated.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$proposalUpdated = proposalUpdated;
    final l$$__typename = $__typename;
    return Object.hashAll([l$proposalUpdated, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$ProposalUpdated ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$proposalUpdated = proposalUpdated;
    final lOther$proposalUpdated = other.proposalUpdated;
    if (l$proposalUpdated != lOther$proposalUpdated) {
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

extension UtilityExtension$Subscription$ProposalUpdated
    on Subscription$ProposalUpdated {
  CopyWith$Subscription$ProposalUpdated<Subscription$ProposalUpdated>
  get copyWith => CopyWith$Subscription$ProposalUpdated(this, (i) => i);
}

abstract class CopyWith$Subscription$ProposalUpdated<TRes> {
  factory CopyWith$Subscription$ProposalUpdated(
    Subscription$ProposalUpdated instance,
    TRes Function(Subscription$ProposalUpdated) then,
  ) = _CopyWithImpl$Subscription$ProposalUpdated;

  factory CopyWith$Subscription$ProposalUpdated.stub(TRes res) =
      _CopyWithStubImpl$Subscription$ProposalUpdated;

  TRes call({
    Subscription$ProposalUpdated$proposalUpdated? proposalUpdated,
    String? $__typename,
  });
  CopyWith$Subscription$ProposalUpdated$proposalUpdated<TRes>
  get proposalUpdated;
}

class _CopyWithImpl$Subscription$ProposalUpdated<TRes>
    implements CopyWith$Subscription$ProposalUpdated<TRes> {
  _CopyWithImpl$Subscription$ProposalUpdated(this._instance, this._then);

  final Subscription$ProposalUpdated _instance;

  final TRes Function(Subscription$ProposalUpdated) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? proposalUpdated = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Subscription$ProposalUpdated(
      proposalUpdated: proposalUpdated == _undefined || proposalUpdated == null
          ? _instance.proposalUpdated
          : (proposalUpdated as Subscription$ProposalUpdated$proposalUpdated),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Subscription$ProposalUpdated$proposalUpdated<TRes>
  get proposalUpdated {
    final local$proposalUpdated = _instance.proposalUpdated;
    return CopyWith$Subscription$ProposalUpdated$proposalUpdated(
      local$proposalUpdated,
      (e) => call(proposalUpdated: e),
    );
  }
}

class _CopyWithStubImpl$Subscription$ProposalUpdated<TRes>
    implements CopyWith$Subscription$ProposalUpdated<TRes> {
  _CopyWithStubImpl$Subscription$ProposalUpdated(this._res);

  TRes _res;

  call({
    Subscription$ProposalUpdated$proposalUpdated? proposalUpdated,
    String? $__typename,
  }) => _res;

  CopyWith$Subscription$ProposalUpdated$proposalUpdated<TRes>
  get proposalUpdated =>
      CopyWith$Subscription$ProposalUpdated$proposalUpdated.stub(_res);
}

const documentNodeSubscriptionProposalUpdated = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'ProposalUpdated'),
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
            name: NameNode(value: 'proposalUpdated'),
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
                  name: NameNode(value: 'title'),
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
                  name: NameNode(value: 'votes'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'choice'),
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
  ],
);
Subscription$ProposalUpdated _parserFn$Subscription$ProposalUpdated(
  Map<String, dynamic> data,
) => Subscription$ProposalUpdated.fromJson(data);

class Options$Subscription$ProposalUpdated
    extends graphql.SubscriptionOptions<Subscription$ProposalUpdated> {
  Options$Subscription$ProposalUpdated({
    String? operationName,
    Variables$Subscription$ProposalUpdated? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$ProposalUpdated? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeSubscriptionProposalUpdated,
         parserFn: _parserFn$Subscription$ProposalUpdated,
       );
}

class WatchOptions$Subscription$ProposalUpdated
    extends graphql.WatchQueryOptions<Subscription$ProposalUpdated> {
  WatchOptions$Subscription$ProposalUpdated({
    String? operationName,
    Variables$Subscription$ProposalUpdated? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$ProposalUpdated? typedOptimisticResult,
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
         document: documentNodeSubscriptionProposalUpdated,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Subscription$ProposalUpdated,
       );
}

class FetchMoreOptions$Subscription$ProposalUpdated
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$ProposalUpdated({
    required graphql.UpdateQuery updateQuery,
    Variables$Subscription$ProposalUpdated? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeSubscriptionProposalUpdated,
       );
}

extension ClientExtension$Subscription$ProposalUpdated
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$ProposalUpdated>>
  subscribe$ProposalUpdated([Options$Subscription$ProposalUpdated? options]) =>
      this.subscribe(options ?? Options$Subscription$ProposalUpdated());

  graphql.ObservableQuery<Subscription$ProposalUpdated>
  watchSubscription$ProposalUpdated([
    WatchOptions$Subscription$ProposalUpdated? options,
  ]) => this.watchQuery(options ?? WatchOptions$Subscription$ProposalUpdated());
}

class Subscription$ProposalUpdated$proposalUpdated {
  Subscription$ProposalUpdated$proposalUpdated({
    required this.id,
    required this.title,
    required this.status,
    required this.votes,
    this.$__typename = 'Proposal',
  });

  factory Subscription$ProposalUpdated$proposalUpdated.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$status = json['status'];
    final l$votes = json['votes'];
    final l$$__typename = json['__typename'];
    return Subscription$ProposalUpdated$proposalUpdated(
      id: (l$id as String),
      title: (l$title as String),
      status: fromJson$Enum$ProposalStatus((l$status as String)),
      votes: (l$votes as List<dynamic>)
          .map(
            (e) => Subscription$ProposalUpdated$proposalUpdated$votes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final Enum$ProposalStatus status;

  final List<Subscription$ProposalUpdated$proposalUpdated$votes> votes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$status = status;
    _resultData['status'] = toJson$Enum$ProposalStatus(l$status);
    final l$votes = votes;
    _resultData['votes'] = l$votes.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$status = status;
    final l$votes = votes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$status,
      Object.hashAll(l$votes.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$ProposalUpdated$proposalUpdated ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$votes = votes;
    final lOther$votes = other.votes;
    if (l$votes.length != lOther$votes.length) {
      return false;
    }
    for (int i = 0; i < l$votes.length; i++) {
      final l$votes$entry = l$votes[i];
      final lOther$votes$entry = lOther$votes[i];
      if (l$votes$entry != lOther$votes$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$ProposalUpdated$proposalUpdated
    on Subscription$ProposalUpdated$proposalUpdated {
  CopyWith$Subscription$ProposalUpdated$proposalUpdated<
    Subscription$ProposalUpdated$proposalUpdated
  >
  get copyWith =>
      CopyWith$Subscription$ProposalUpdated$proposalUpdated(this, (i) => i);
}

abstract class CopyWith$Subscription$ProposalUpdated$proposalUpdated<TRes> {
  factory CopyWith$Subscription$ProposalUpdated$proposalUpdated(
    Subscription$ProposalUpdated$proposalUpdated instance,
    TRes Function(Subscription$ProposalUpdated$proposalUpdated) then,
  ) = _CopyWithImpl$Subscription$ProposalUpdated$proposalUpdated;

  factory CopyWith$Subscription$ProposalUpdated$proposalUpdated.stub(TRes res) =
      _CopyWithStubImpl$Subscription$ProposalUpdated$proposalUpdated;

  TRes call({
    String? id,
    String? title,
    Enum$ProposalStatus? status,
    List<Subscription$ProposalUpdated$proposalUpdated$votes>? votes,
    String? $__typename,
  });
  TRes votes(
    Iterable<Subscription$ProposalUpdated$proposalUpdated$votes> Function(
      Iterable<
        CopyWith$Subscription$ProposalUpdated$proposalUpdated$votes<
          Subscription$ProposalUpdated$proposalUpdated$votes
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Subscription$ProposalUpdated$proposalUpdated<TRes>
    implements CopyWith$Subscription$ProposalUpdated$proposalUpdated<TRes> {
  _CopyWithImpl$Subscription$ProposalUpdated$proposalUpdated(
    this._instance,
    this._then,
  );

  final Subscription$ProposalUpdated$proposalUpdated _instance;

  final TRes Function(Subscription$ProposalUpdated$proposalUpdated) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? status = _undefined,
    Object? votes = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Subscription$ProposalUpdated$proposalUpdated(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      title: title == _undefined || title == null
          ? _instance.title
          : (title as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$ProposalStatus),
      votes: votes == _undefined || votes == null
          ? _instance.votes
          : (votes as List<Subscription$ProposalUpdated$proposalUpdated$votes>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes votes(
    Iterable<Subscription$ProposalUpdated$proposalUpdated$votes> Function(
      Iterable<
        CopyWith$Subscription$ProposalUpdated$proposalUpdated$votes<
          Subscription$ProposalUpdated$proposalUpdated$votes
        >
      >,
    )
    _fn,
  ) => call(
    votes: _fn(
      _instance.votes.map(
        (e) => CopyWith$Subscription$ProposalUpdated$proposalUpdated$votes(
          e,
          (i) => i,
        ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Subscription$ProposalUpdated$proposalUpdated<TRes>
    implements CopyWith$Subscription$ProposalUpdated$proposalUpdated<TRes> {
  _CopyWithStubImpl$Subscription$ProposalUpdated$proposalUpdated(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    Enum$ProposalStatus? status,
    List<Subscription$ProposalUpdated$proposalUpdated$votes>? votes,
    String? $__typename,
  }) => _res;

  votes(_fn) => _res;
}

class Subscription$ProposalUpdated$proposalUpdated$votes {
  Subscription$ProposalUpdated$proposalUpdated$votes({
    required this.choice,
    this.$__typename = 'Vote',
  });

  factory Subscription$ProposalUpdated$proposalUpdated$votes.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$choice = json['choice'];
    final l$$__typename = json['__typename'];
    return Subscription$ProposalUpdated$proposalUpdated$votes(
      choice: fromJson$Enum$VoteChoice((l$choice as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$VoteChoice choice;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$choice = choice;
    _resultData['choice'] = toJson$Enum$VoteChoice(l$choice);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$choice = choice;
    final l$$__typename = $__typename;
    return Object.hashAll([l$choice, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$ProposalUpdated$proposalUpdated$votes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$choice = choice;
    final lOther$choice = other.choice;
    if (l$choice != lOther$choice) {
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

extension UtilityExtension$Subscription$ProposalUpdated$proposalUpdated$votes
    on Subscription$ProposalUpdated$proposalUpdated$votes {
  CopyWith$Subscription$ProposalUpdated$proposalUpdated$votes<
    Subscription$ProposalUpdated$proposalUpdated$votes
  >
  get copyWith => CopyWith$Subscription$ProposalUpdated$proposalUpdated$votes(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Subscription$ProposalUpdated$proposalUpdated$votes<
  TRes
> {
  factory CopyWith$Subscription$ProposalUpdated$proposalUpdated$votes(
    Subscription$ProposalUpdated$proposalUpdated$votes instance,
    TRes Function(Subscription$ProposalUpdated$proposalUpdated$votes) then,
  ) = _CopyWithImpl$Subscription$ProposalUpdated$proposalUpdated$votes;

  factory CopyWith$Subscription$ProposalUpdated$proposalUpdated$votes.stub(
    TRes res,
  ) = _CopyWithStubImpl$Subscription$ProposalUpdated$proposalUpdated$votes;

  TRes call({Enum$VoteChoice? choice, String? $__typename});
}

class _CopyWithImpl$Subscription$ProposalUpdated$proposalUpdated$votes<TRes>
    implements
        CopyWith$Subscription$ProposalUpdated$proposalUpdated$votes<TRes> {
  _CopyWithImpl$Subscription$ProposalUpdated$proposalUpdated$votes(
    this._instance,
    this._then,
  );

  final Subscription$ProposalUpdated$proposalUpdated$votes _instance;

  final TRes Function(Subscription$ProposalUpdated$proposalUpdated$votes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? choice = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Subscription$ProposalUpdated$proposalUpdated$votes(
          choice: choice == _undefined || choice == null
              ? _instance.choice
              : (choice as Enum$VoteChoice),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Subscription$ProposalUpdated$proposalUpdated$votes<TRes>
    implements
        CopyWith$Subscription$ProposalUpdated$proposalUpdated$votes<TRes> {
  _CopyWithStubImpl$Subscription$ProposalUpdated$proposalUpdated$votes(
    this._res,
  );

  TRes _res;

  call({Enum$VoteChoice? choice, String? $__typename}) => _res;
}
