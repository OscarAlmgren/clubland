import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CastVote {
  factory Variables$Mutation$CastVote({required Input$CastVoteInput input}) =>
      Variables$Mutation$CastVote._({r'input': input});

  Variables$Mutation$CastVote._(this._$data);

  factory Variables$Mutation$CastVote.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$CastVoteInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CastVote._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CastVoteInput get input => (_$data['input'] as Input$CastVoteInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CastVote<Variables$Mutation$CastVote>
  get copyWith => CopyWith$Variables$Mutation$CastVote(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CastVote ||
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

abstract class CopyWith$Variables$Mutation$CastVote<TRes> {
  factory CopyWith$Variables$Mutation$CastVote(
    Variables$Mutation$CastVote instance,
    TRes Function(Variables$Mutation$CastVote) then,
  ) = _CopyWithImpl$Variables$Mutation$CastVote;

  factory CopyWith$Variables$Mutation$CastVote.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CastVote;

  TRes call({Input$CastVoteInput? input});
}

class _CopyWithImpl$Variables$Mutation$CastVote<TRes>
    implements CopyWith$Variables$Mutation$CastVote<TRes> {
  _CopyWithImpl$Variables$Mutation$CastVote(this._instance, this._then);

  final Variables$Mutation$CastVote _instance;

  final TRes Function(Variables$Mutation$CastVote) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CastVote._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$CastVoteInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CastVote<TRes>
    implements CopyWith$Variables$Mutation$CastVote<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CastVote(this._res);

  TRes _res;

  call({Input$CastVoteInput? input}) => _res;
}

class Mutation$CastVote {
  Mutation$CastVote({required this.castVote, this.$__typename = 'Mutation'});

  factory Mutation$CastVote.fromJson(Map<String, dynamic> json) {
    final l$castVote = json['castVote'];
    final l$$__typename = json['__typename'];
    return Mutation$CastVote(
      castVote: Mutation$CastVote$castVote.fromJson(
        (l$castVote as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CastVote$castVote castVote;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$castVote = castVote;
    _resultData['castVote'] = l$castVote.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$castVote = castVote;
    final l$$__typename = $__typename;
    return Object.hashAll([l$castVote, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CastVote || runtimeType != other.runtimeType) {
      return false;
    }
    final l$castVote = castVote;
    final lOther$castVote = other.castVote;
    if (l$castVote != lOther$castVote) {
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

extension UtilityExtension$Mutation$CastVote on Mutation$CastVote {
  CopyWith$Mutation$CastVote<Mutation$CastVote> get copyWith =>
      CopyWith$Mutation$CastVote(this, (i) => i);
}

abstract class CopyWith$Mutation$CastVote<TRes> {
  factory CopyWith$Mutation$CastVote(
    Mutation$CastVote instance,
    TRes Function(Mutation$CastVote) then,
  ) = _CopyWithImpl$Mutation$CastVote;

  factory CopyWith$Mutation$CastVote.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CastVote;

  TRes call({Mutation$CastVote$castVote? castVote, String? $__typename});
  CopyWith$Mutation$CastVote$castVote<TRes> get castVote;
}

class _CopyWithImpl$Mutation$CastVote<TRes>
    implements CopyWith$Mutation$CastVote<TRes> {
  _CopyWithImpl$Mutation$CastVote(this._instance, this._then);

  final Mutation$CastVote _instance;

  final TRes Function(Mutation$CastVote) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? castVote = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CastVote(
      castVote: castVote == _undefined || castVote == null
          ? _instance.castVote
          : (castVote as Mutation$CastVote$castVote),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CastVote$castVote<TRes> get castVote {
    final local$castVote = _instance.castVote;
    return CopyWith$Mutation$CastVote$castVote(
      local$castVote,
      (e) => call(castVote: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CastVote<TRes>
    implements CopyWith$Mutation$CastVote<TRes> {
  _CopyWithStubImpl$Mutation$CastVote(this._res);

  TRes _res;

  call({Mutation$CastVote$castVote? castVote, String? $__typename}) => _res;

  CopyWith$Mutation$CastVote$castVote<TRes> get castVote =>
      CopyWith$Mutation$CastVote$castVote.stub(_res);
}

const documentNodeMutationCastVote = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CastVote'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'CastVoteInput'),
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
            name: NameNode(value: 'castVote'),
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
                  name: NameNode(value: 'comment'),
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
Mutation$CastVote _parserFn$Mutation$CastVote(Map<String, dynamic> data) =>
    Mutation$CastVote.fromJson(data);
typedef OnMutationCompleted$Mutation$CastVote =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CastVote?);

class Options$Mutation$CastVote
    extends graphql.MutationOptions<Mutation$CastVote> {
  Options$Mutation$CastVote({
    String? operationName,
    required Variables$Mutation$CastVote variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CastVote? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CastVote? onCompleted,
    graphql.OnMutationUpdate<Mutation$CastVote>? update,
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
                 data == null ? null : _parserFn$Mutation$CastVote(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCastVote,
         parserFn: _parserFn$Mutation$CastVote,
       );

  final OnMutationCompleted$Mutation$CastVote? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CastVote
    extends graphql.WatchQueryOptions<Mutation$CastVote> {
  WatchOptions$Mutation$CastVote({
    String? operationName,
    required Variables$Mutation$CastVote variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CastVote? typedOptimisticResult,
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
         document: documentNodeMutationCastVote,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CastVote,
       );
}

extension ClientExtension$Mutation$CastVote on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CastVote>> mutate$CastVote(
    Options$Mutation$CastVote options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CastVote> watchMutation$CastVote(
    WatchOptions$Mutation$CastVote options,
  ) => this.watchMutation(options);
}

class Mutation$CastVote$castVote {
  Mutation$CastVote$castVote({
    required this.id,
    required this.proposalId,
    required this.voter,
    required this.choice,
    this.comment,
    required this.createdAt,
    this.$__typename = 'Vote',
  });

  factory Mutation$CastVote$castVote.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$proposalId = json['proposalId'];
    final l$voter = json['voter'];
    final l$choice = json['choice'];
    final l$comment = json['comment'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Mutation$CastVote$castVote(
      id: (l$id as String),
      proposalId: (l$proposalId as String),
      voter: Mutation$CastVote$castVote$voter.fromJson(
        (l$voter as Map<String, dynamic>),
      ),
      choice: fromJson$Enum$VoteChoice((l$choice as String)),
      comment: (l$comment as String?),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String proposalId;

  final Mutation$CastVote$castVote$voter voter;

  final Enum$VoteChoice choice;

  final String? comment;

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
    final l$comment = comment;
    _resultData['comment'] = l$comment;
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
    final l$comment = comment;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$proposalId,
      l$voter,
      l$choice,
      l$comment,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CastVote$castVote ||
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
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (l$comment != lOther$comment) {
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

extension UtilityExtension$Mutation$CastVote$castVote
    on Mutation$CastVote$castVote {
  CopyWith$Mutation$CastVote$castVote<Mutation$CastVote$castVote>
  get copyWith => CopyWith$Mutation$CastVote$castVote(this, (i) => i);
}

abstract class CopyWith$Mutation$CastVote$castVote<TRes> {
  factory CopyWith$Mutation$CastVote$castVote(
    Mutation$CastVote$castVote instance,
    TRes Function(Mutation$CastVote$castVote) then,
  ) = _CopyWithImpl$Mutation$CastVote$castVote;

  factory CopyWith$Mutation$CastVote$castVote.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CastVote$castVote;

  TRes call({
    String? id,
    String? proposalId,
    Mutation$CastVote$castVote$voter? voter,
    Enum$VoteChoice? choice,
    String? comment,
    DateTime? createdAt,
    String? $__typename,
  });
  CopyWith$Mutation$CastVote$castVote$voter<TRes> get voter;
}

class _CopyWithImpl$Mutation$CastVote$castVote<TRes>
    implements CopyWith$Mutation$CastVote$castVote<TRes> {
  _CopyWithImpl$Mutation$CastVote$castVote(this._instance, this._then);

  final Mutation$CastVote$castVote _instance;

  final TRes Function(Mutation$CastVote$castVote) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? proposalId = _undefined,
    Object? voter = _undefined,
    Object? choice = _undefined,
    Object? comment = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CastVote$castVote(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      proposalId: proposalId == _undefined || proposalId == null
          ? _instance.proposalId
          : (proposalId as String),
      voter: voter == _undefined || voter == null
          ? _instance.voter
          : (voter as Mutation$CastVote$castVote$voter),
      choice: choice == _undefined || choice == null
          ? _instance.choice
          : (choice as Enum$VoteChoice),
      comment: comment == _undefined ? _instance.comment : (comment as String?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CastVote$castVote$voter<TRes> get voter {
    final local$voter = _instance.voter;
    return CopyWith$Mutation$CastVote$castVote$voter(
      local$voter,
      (e) => call(voter: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CastVote$castVote<TRes>
    implements CopyWith$Mutation$CastVote$castVote<TRes> {
  _CopyWithStubImpl$Mutation$CastVote$castVote(this._res);

  TRes _res;

  call({
    String? id,
    String? proposalId,
    Mutation$CastVote$castVote$voter? voter,
    Enum$VoteChoice? choice,
    String? comment,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CastVote$castVote$voter<TRes> get voter =>
      CopyWith$Mutation$CastVote$castVote$voter.stub(_res);
}

class Mutation$CastVote$castVote$voter {
  Mutation$CastVote$castVote$voter({
    required this.id,
    required this.username,
    this.$__typename = 'User',
  });

  factory Mutation$CastVote$castVote$voter.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$username = json['username'];
    final l$$__typename = json['__typename'];
    return Mutation$CastVote$castVote$voter(
      id: (l$id as String),
      username: (l$username as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String username;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$username = username;
    _resultData['username'] = l$username;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$username = username;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$username, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CastVote$castVote$voter ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CastVote$castVote$voter
    on Mutation$CastVote$castVote$voter {
  CopyWith$Mutation$CastVote$castVote$voter<Mutation$CastVote$castVote$voter>
  get copyWith => CopyWith$Mutation$CastVote$castVote$voter(this, (i) => i);
}

abstract class CopyWith$Mutation$CastVote$castVote$voter<TRes> {
  factory CopyWith$Mutation$CastVote$castVote$voter(
    Mutation$CastVote$castVote$voter instance,
    TRes Function(Mutation$CastVote$castVote$voter) then,
  ) = _CopyWithImpl$Mutation$CastVote$castVote$voter;

  factory CopyWith$Mutation$CastVote$castVote$voter.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CastVote$castVote$voter;

  TRes call({String? id, String? username, String? $__typename});
}

class _CopyWithImpl$Mutation$CastVote$castVote$voter<TRes>
    implements CopyWith$Mutation$CastVote$castVote$voter<TRes> {
  _CopyWithImpl$Mutation$CastVote$castVote$voter(this._instance, this._then);

  final Mutation$CastVote$castVote$voter _instance;

  final TRes Function(Mutation$CastVote$castVote$voter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? username = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CastVote$castVote$voter(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      username: username == _undefined || username == null
          ? _instance.username
          : (username as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CastVote$castVote$voter<TRes>
    implements CopyWith$Mutation$CastVote$castVote$voter<TRes> {
  _CopyWithStubImpl$Mutation$CastVote$castVote$voter(this._res);

  TRes _res;

  call({String? id, String? username, String? $__typename}) => _res;
}
