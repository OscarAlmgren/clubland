import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Proposal {
  factory Variables$Query$Proposal({required String id}) =>
      Variables$Query$Proposal._({r'id': id});

  Variables$Query$Proposal._(this._$data);

  factory Variables$Query$Proposal.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$Proposal._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$Proposal<Variables$Query$Proposal> get copyWith =>
      CopyWith$Variables$Query$Proposal(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Proposal ||
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

abstract class CopyWith$Variables$Query$Proposal<TRes> {
  factory CopyWith$Variables$Query$Proposal(
    Variables$Query$Proposal instance,
    TRes Function(Variables$Query$Proposal) then,
  ) = _CopyWithImpl$Variables$Query$Proposal;

  factory CopyWith$Variables$Query$Proposal.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Proposal;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$Proposal<TRes>
    implements CopyWith$Variables$Query$Proposal<TRes> {
  _CopyWithImpl$Variables$Query$Proposal(this._instance, this._then);

  final Variables$Query$Proposal _instance;

  final TRes Function(Variables$Query$Proposal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$Proposal._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$Proposal<TRes>
    implements CopyWith$Variables$Query$Proposal<TRes> {
  _CopyWithStubImpl$Variables$Query$Proposal(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$Proposal {
  Query$Proposal({this.proposal, this.$__typename = 'Query'});

  factory Query$Proposal.fromJson(Map<String, dynamic> json) {
    final l$proposal = json['proposal'];
    final l$$__typename = json['__typename'];
    return Query$Proposal(
      proposal: l$proposal == null
          ? null
          : Query$Proposal$proposal.fromJson(
              (l$proposal as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Proposal$proposal? proposal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$proposal = proposal;
    _resultData['proposal'] = l$proposal?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$proposal = proposal;
    final l$$__typename = $__typename;
    return Object.hashAll([l$proposal, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Proposal || runtimeType != other.runtimeType) {
      return false;
    }
    final l$proposal = proposal;
    final lOther$proposal = other.proposal;
    if (l$proposal != lOther$proposal) {
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

extension UtilityExtension$Query$Proposal on Query$Proposal {
  CopyWith$Query$Proposal<Query$Proposal> get copyWith =>
      CopyWith$Query$Proposal(this, (i) => i);
}

abstract class CopyWith$Query$Proposal<TRes> {
  factory CopyWith$Query$Proposal(
    Query$Proposal instance,
    TRes Function(Query$Proposal) then,
  ) = _CopyWithImpl$Query$Proposal;

  factory CopyWith$Query$Proposal.stub(TRes res) =
      _CopyWithStubImpl$Query$Proposal;

  TRes call({Query$Proposal$proposal? proposal, String? $__typename});
  CopyWith$Query$Proposal$proposal<TRes> get proposal;
}

class _CopyWithImpl$Query$Proposal<TRes>
    implements CopyWith$Query$Proposal<TRes> {
  _CopyWithImpl$Query$Proposal(this._instance, this._then);

  final Query$Proposal _instance;

  final TRes Function(Query$Proposal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? proposal = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Proposal(
      proposal: proposal == _undefined
          ? _instance.proposal
          : (proposal as Query$Proposal$proposal?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Proposal$proposal<TRes> get proposal {
    final local$proposal = _instance.proposal;
    return local$proposal == null
        ? CopyWith$Query$Proposal$proposal.stub(_then(_instance))
        : CopyWith$Query$Proposal$proposal(
            local$proposal,
            (e) => call(proposal: e),
          );
  }
}

class _CopyWithStubImpl$Query$Proposal<TRes>
    implements CopyWith$Query$Proposal<TRes> {
  _CopyWithStubImpl$Query$Proposal(this._res);

  TRes _res;

  call({Query$Proposal$proposal? proposal, String? $__typename}) => _res;

  CopyWith$Query$Proposal$proposal<TRes> get proposal =>
      CopyWith$Query$Proposal$proposal.stub(_res);
}

const documentNodeQueryProposal = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Proposal'),
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
            name: NameNode(value: 'proposal'),
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
                  name: NameNode(value: 'type'),
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
                  name: NameNode(value: 'proposer'),
                  alias: null,
                  arguments: [],
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
                        name: NameNode(value: 'username'),
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
                  name: NameNode(value: 'votes'),
                  alias: null,
                  arguments: [],
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
                        name: NameNode(value: 'choice'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'comment'),
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
                              name: NameNode(value: 'id'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'username'),
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
                  name: NameNode(value: 'votingDeadline'),
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
Query$Proposal _parserFn$Query$Proposal(Map<String, dynamic> data) =>
    Query$Proposal.fromJson(data);
typedef OnQueryComplete$Query$Proposal =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Proposal?);

class Options$Query$Proposal extends graphql.QueryOptions<Query$Proposal> {
  Options$Query$Proposal({
    String? operationName,
    required Variables$Query$Proposal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Proposal? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Proposal? onComplete,
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
                 data == null ? null : _parserFn$Query$Proposal(data),
               ),
         onError: onError,
         document: documentNodeQueryProposal,
         parserFn: _parserFn$Query$Proposal,
       );

  final OnQueryComplete$Query$Proposal? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Proposal
    extends graphql.WatchQueryOptions<Query$Proposal> {
  WatchOptions$Query$Proposal({
    String? operationName,
    required Variables$Query$Proposal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Proposal? typedOptimisticResult,
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
         document: documentNodeQueryProposal,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Proposal,
       );
}

class FetchMoreOptions$Query$Proposal extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Proposal({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$Proposal variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryProposal,
       );
}

extension ClientExtension$Query$Proposal on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Proposal>> query$Proposal(
    Options$Query$Proposal options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$Proposal> watchQuery$Proposal(
    WatchOptions$Query$Proposal options,
  ) => this.watchQuery(options);

  void writeQuery$Proposal({
    required Query$Proposal data,
    required Variables$Query$Proposal variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryProposal),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$Proposal? readQuery$Proposal({
    required Variables$Query$Proposal variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryProposal),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Proposal.fromJson(result);
  }
}

class Query$Proposal$proposal {
  Query$Proposal$proposal({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
    required this.proposer,
    required this.votes,
    required this.votingDeadline,
    required this.createdAt,
    this.$__typename = 'Proposal',
  });

  factory Query$Proposal$proposal.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$type = json['type'];
    final l$status = json['status'];
    final l$proposer = json['proposer'];
    final l$votes = json['votes'];
    final l$votingDeadline = json['votingDeadline'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$Proposal$proposal(
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String),
      type: fromJson$Enum$ProposalType((l$type as String)),
      status: fromJson$Enum$ProposalStatus((l$status as String)),
      proposer: Query$Proposal$proposal$proposer.fromJson(
        (l$proposer as Map<String, dynamic>),
      ),
      votes: (l$votes as List<dynamic>)
          .map(
            (e) => Query$Proposal$proposal$votes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      votingDeadline: DateTime.parse((l$votingDeadline as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String description;

  final Enum$ProposalType type;

  final Enum$ProposalStatus status;

  final Query$Proposal$proposal$proposer proposer;

  final List<Query$Proposal$proposal$votes> votes;

  final DateTime votingDeadline;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$type = type;
    _resultData['type'] = toJson$Enum$ProposalType(l$type);
    final l$status = status;
    _resultData['status'] = toJson$Enum$ProposalStatus(l$status);
    final l$proposer = proposer;
    _resultData['proposer'] = l$proposer.toJson();
    final l$votes = votes;
    _resultData['votes'] = l$votes.map((e) => e.toJson()).toList();
    final l$votingDeadline = votingDeadline;
    _resultData['votingDeadline'] = l$votingDeadline.toIso8601String();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$type = type;
    final l$status = status;
    final l$proposer = proposer;
    final l$votes = votes;
    final l$votingDeadline = votingDeadline;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$type,
      l$status,
      l$proposer,
      Object.hashAll(l$votes.map((v) => v)),
      l$votingDeadline,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Proposal$proposal || runtimeType != other.runtimeType) {
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
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$proposer = proposer;
    final lOther$proposer = other.proposer;
    if (l$proposer != lOther$proposer) {
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
    final l$votingDeadline = votingDeadline;
    final lOther$votingDeadline = other.votingDeadline;
    if (l$votingDeadline != lOther$votingDeadline) {
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

extension UtilityExtension$Query$Proposal$proposal on Query$Proposal$proposal {
  CopyWith$Query$Proposal$proposal<Query$Proposal$proposal> get copyWith =>
      CopyWith$Query$Proposal$proposal(this, (i) => i);
}

abstract class CopyWith$Query$Proposal$proposal<TRes> {
  factory CopyWith$Query$Proposal$proposal(
    Query$Proposal$proposal instance,
    TRes Function(Query$Proposal$proposal) then,
  ) = _CopyWithImpl$Query$Proposal$proposal;

  factory CopyWith$Query$Proposal$proposal.stub(TRes res) =
      _CopyWithStubImpl$Query$Proposal$proposal;

  TRes call({
    String? id,
    String? title,
    String? description,
    Enum$ProposalType? type,
    Enum$ProposalStatus? status,
    Query$Proposal$proposal$proposer? proposer,
    List<Query$Proposal$proposal$votes>? votes,
    DateTime? votingDeadline,
    DateTime? createdAt,
    String? $__typename,
  });
  CopyWith$Query$Proposal$proposal$proposer<TRes> get proposer;
  TRes votes(
    Iterable<Query$Proposal$proposal$votes> Function(
      Iterable<
        CopyWith$Query$Proposal$proposal$votes<Query$Proposal$proposal$votes>
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$Proposal$proposal<TRes>
    implements CopyWith$Query$Proposal$proposal<TRes> {
  _CopyWithImpl$Query$Proposal$proposal(this._instance, this._then);

  final Query$Proposal$proposal _instance;

  final TRes Function(Query$Proposal$proposal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? type = _undefined,
    Object? status = _undefined,
    Object? proposer = _undefined,
    Object? votes = _undefined,
    Object? votingDeadline = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Proposal$proposal(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      title: title == _undefined || title == null
          ? _instance.title
          : (title as String),
      description: description == _undefined || description == null
          ? _instance.description
          : (description as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$ProposalType),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$ProposalStatus),
      proposer: proposer == _undefined || proposer == null
          ? _instance.proposer
          : (proposer as Query$Proposal$proposal$proposer),
      votes: votes == _undefined || votes == null
          ? _instance.votes
          : (votes as List<Query$Proposal$proposal$votes>),
      votingDeadline: votingDeadline == _undefined || votingDeadline == null
          ? _instance.votingDeadline
          : (votingDeadline as DateTime),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Proposal$proposal$proposer<TRes> get proposer {
    final local$proposer = _instance.proposer;
    return CopyWith$Query$Proposal$proposal$proposer(
      local$proposer,
      (e) => call(proposer: e),
    );
  }

  TRes votes(
    Iterable<Query$Proposal$proposal$votes> Function(
      Iterable<
        CopyWith$Query$Proposal$proposal$votes<Query$Proposal$proposal$votes>
      >,
    )
    _fn,
  ) => call(
    votes: _fn(
      _instance.votes.map(
        (e) => CopyWith$Query$Proposal$proposal$votes(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$Proposal$proposal<TRes>
    implements CopyWith$Query$Proposal$proposal<TRes> {
  _CopyWithStubImpl$Query$Proposal$proposal(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    Enum$ProposalType? type,
    Enum$ProposalStatus? status,
    Query$Proposal$proposal$proposer? proposer,
    List<Query$Proposal$proposal$votes>? votes,
    DateTime? votingDeadline,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Proposal$proposal$proposer<TRes> get proposer =>
      CopyWith$Query$Proposal$proposal$proposer.stub(_res);

  votes(_fn) => _res;
}

class Query$Proposal$proposal$proposer {
  Query$Proposal$proposal$proposer({
    required this.id,
    required this.username,
    this.firstName,
    this.lastName,
    this.$__typename = 'User',
  });

  factory Query$Proposal$proposal$proposer.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$username = json['username'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$$__typename = json['__typename'];
    return Query$Proposal$proposal$proposer(
      id: (l$id as String),
      username: (l$username as String),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String username;

  final String? firstName;

  final String? lastName;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$username = username;
    _resultData['username'] = l$username;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$username = username;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$username,
      l$firstName,
      l$lastName,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Proposal$proposal$proposer ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Proposal$proposal$proposer
    on Query$Proposal$proposal$proposer {
  CopyWith$Query$Proposal$proposal$proposer<Query$Proposal$proposal$proposer>
  get copyWith => CopyWith$Query$Proposal$proposal$proposer(this, (i) => i);
}

abstract class CopyWith$Query$Proposal$proposal$proposer<TRes> {
  factory CopyWith$Query$Proposal$proposal$proposer(
    Query$Proposal$proposal$proposer instance,
    TRes Function(Query$Proposal$proposal$proposer) then,
  ) = _CopyWithImpl$Query$Proposal$proposal$proposer;

  factory CopyWith$Query$Proposal$proposal$proposer.stub(TRes res) =
      _CopyWithStubImpl$Query$Proposal$proposal$proposer;

  TRes call({
    String? id,
    String? username,
    String? firstName,
    String? lastName,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Proposal$proposal$proposer<TRes>
    implements CopyWith$Query$Proposal$proposal$proposer<TRes> {
  _CopyWithImpl$Query$Proposal$proposal$proposer(this._instance, this._then);

  final Query$Proposal$proposal$proposer _instance;

  final TRes Function(Query$Proposal$proposal$proposer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? username = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Proposal$proposal$proposer(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      username: username == _undefined || username == null
          ? _instance.username
          : (username as String),
      firstName: firstName == _undefined
          ? _instance.firstName
          : (firstName as String?),
      lastName: lastName == _undefined
          ? _instance.lastName
          : (lastName as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Proposal$proposal$proposer<TRes>
    implements CopyWith$Query$Proposal$proposal$proposer<TRes> {
  _CopyWithStubImpl$Query$Proposal$proposal$proposer(this._res);

  TRes _res;

  call({
    String? id,
    String? username,
    String? firstName,
    String? lastName,
    String? $__typename,
  }) => _res;
}

class Query$Proposal$proposal$votes {
  Query$Proposal$proposal$votes({
    required this.id,
    required this.choice,
    this.comment,
    required this.voter,
    required this.createdAt,
    this.$__typename = 'Vote',
  });

  factory Query$Proposal$proposal$votes.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$choice = json['choice'];
    final l$comment = json['comment'];
    final l$voter = json['voter'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$Proposal$proposal$votes(
      id: (l$id as String),
      choice: fromJson$Enum$VoteChoice((l$choice as String)),
      comment: (l$comment as String?),
      voter: Query$Proposal$proposal$votes$voter.fromJson(
        (l$voter as Map<String, dynamic>),
      ),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$VoteChoice choice;

  final String? comment;

  final Query$Proposal$proposal$votes$voter voter;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$choice = choice;
    _resultData['choice'] = toJson$Enum$VoteChoice(l$choice);
    final l$comment = comment;
    _resultData['comment'] = l$comment;
    final l$voter = voter;
    _resultData['voter'] = l$voter.toJson();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$choice = choice;
    final l$comment = comment;
    final l$voter = voter;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$choice,
      l$comment,
      l$voter,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Proposal$proposal$votes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$choice = choice;
    final lOther$choice = other.choice;
    if (l$choice != lOther$choice) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (l$comment != lOther$comment) {
      return false;
    }
    final l$voter = voter;
    final lOther$voter = other.voter;
    if (l$voter != lOther$voter) {
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

extension UtilityExtension$Query$Proposal$proposal$votes
    on Query$Proposal$proposal$votes {
  CopyWith$Query$Proposal$proposal$votes<Query$Proposal$proposal$votes>
  get copyWith => CopyWith$Query$Proposal$proposal$votes(this, (i) => i);
}

abstract class CopyWith$Query$Proposal$proposal$votes<TRes> {
  factory CopyWith$Query$Proposal$proposal$votes(
    Query$Proposal$proposal$votes instance,
    TRes Function(Query$Proposal$proposal$votes) then,
  ) = _CopyWithImpl$Query$Proposal$proposal$votes;

  factory CopyWith$Query$Proposal$proposal$votes.stub(TRes res) =
      _CopyWithStubImpl$Query$Proposal$proposal$votes;

  TRes call({
    String? id,
    Enum$VoteChoice? choice,
    String? comment,
    Query$Proposal$proposal$votes$voter? voter,
    DateTime? createdAt,
    String? $__typename,
  });
  CopyWith$Query$Proposal$proposal$votes$voter<TRes> get voter;
}

class _CopyWithImpl$Query$Proposal$proposal$votes<TRes>
    implements CopyWith$Query$Proposal$proposal$votes<TRes> {
  _CopyWithImpl$Query$Proposal$proposal$votes(this._instance, this._then);

  final Query$Proposal$proposal$votes _instance;

  final TRes Function(Query$Proposal$proposal$votes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? choice = _undefined,
    Object? comment = _undefined,
    Object? voter = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Proposal$proposal$votes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      choice: choice == _undefined || choice == null
          ? _instance.choice
          : (choice as Enum$VoteChoice),
      comment: comment == _undefined ? _instance.comment : (comment as String?),
      voter: voter == _undefined || voter == null
          ? _instance.voter
          : (voter as Query$Proposal$proposal$votes$voter),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Proposal$proposal$votes$voter<TRes> get voter {
    final local$voter = _instance.voter;
    return CopyWith$Query$Proposal$proposal$votes$voter(
      local$voter,
      (e) => call(voter: e),
    );
  }
}

class _CopyWithStubImpl$Query$Proposal$proposal$votes<TRes>
    implements CopyWith$Query$Proposal$proposal$votes<TRes> {
  _CopyWithStubImpl$Query$Proposal$proposal$votes(this._res);

  TRes _res;

  call({
    String? id,
    Enum$VoteChoice? choice,
    String? comment,
    Query$Proposal$proposal$votes$voter? voter,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Proposal$proposal$votes$voter<TRes> get voter =>
      CopyWith$Query$Proposal$proposal$votes$voter.stub(_res);
}

class Query$Proposal$proposal$votes$voter {
  Query$Proposal$proposal$votes$voter({
    required this.id,
    required this.username,
    this.firstName,
    this.lastName,
    this.$__typename = 'User',
  });

  factory Query$Proposal$proposal$votes$voter.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$username = json['username'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$$__typename = json['__typename'];
    return Query$Proposal$proposal$votes$voter(
      id: (l$id as String),
      username: (l$username as String),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String username;

  final String? firstName;

  final String? lastName;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$username = username;
    _resultData['username'] = l$username;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$username = username;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$username,
      l$firstName,
      l$lastName,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Proposal$proposal$votes$voter ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Proposal$proposal$votes$voter
    on Query$Proposal$proposal$votes$voter {
  CopyWith$Query$Proposal$proposal$votes$voter<
    Query$Proposal$proposal$votes$voter
  >
  get copyWith => CopyWith$Query$Proposal$proposal$votes$voter(this, (i) => i);
}

abstract class CopyWith$Query$Proposal$proposal$votes$voter<TRes> {
  factory CopyWith$Query$Proposal$proposal$votes$voter(
    Query$Proposal$proposal$votes$voter instance,
    TRes Function(Query$Proposal$proposal$votes$voter) then,
  ) = _CopyWithImpl$Query$Proposal$proposal$votes$voter;

  factory CopyWith$Query$Proposal$proposal$votes$voter.stub(TRes res) =
      _CopyWithStubImpl$Query$Proposal$proposal$votes$voter;

  TRes call({
    String? id,
    String? username,
    String? firstName,
    String? lastName,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Proposal$proposal$votes$voter<TRes>
    implements CopyWith$Query$Proposal$proposal$votes$voter<TRes> {
  _CopyWithImpl$Query$Proposal$proposal$votes$voter(this._instance, this._then);

  final Query$Proposal$proposal$votes$voter _instance;

  final TRes Function(Query$Proposal$proposal$votes$voter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? username = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Proposal$proposal$votes$voter(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      username: username == _undefined || username == null
          ? _instance.username
          : (username as String),
      firstName: firstName == _undefined
          ? _instance.firstName
          : (firstName as String?),
      lastName: lastName == _undefined
          ? _instance.lastName
          : (lastName as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Proposal$proposal$votes$voter<TRes>
    implements CopyWith$Query$Proposal$proposal$votes$voter<TRes> {
  _CopyWithStubImpl$Query$Proposal$proposal$votes$voter(this._res);

  TRes _res;

  call({
    String? id,
    String? username,
    String? firstName,
    String? lastName,
    String? $__typename,
  }) => _res;
}
