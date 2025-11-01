import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$MyVotes {
  factory Variables$Query$MyVotes({String? proposalId}) =>
      Variables$Query$MyVotes._({
        if (proposalId != null) r'proposalId': proposalId,
      });

  Variables$Query$MyVotes._(this._$data);

  factory Variables$Query$MyVotes.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('proposalId')) {
      final l$proposalId = data['proposalId'];
      result$data['proposalId'] = (l$proposalId as String?);
    }
    return Variables$Query$MyVotes._(result$data);
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

  CopyWith$Variables$Query$MyVotes<Variables$Query$MyVotes> get copyWith =>
      CopyWith$Variables$Query$MyVotes(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$MyVotes || runtimeType != other.runtimeType) {
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

abstract class CopyWith$Variables$Query$MyVotes<TRes> {
  factory CopyWith$Variables$Query$MyVotes(
    Variables$Query$MyVotes instance,
    TRes Function(Variables$Query$MyVotes) then,
  ) = _CopyWithImpl$Variables$Query$MyVotes;

  factory CopyWith$Variables$Query$MyVotes.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$MyVotes;

  TRes call({String? proposalId});
}

class _CopyWithImpl$Variables$Query$MyVotes<TRes>
    implements CopyWith$Variables$Query$MyVotes<TRes> {
  _CopyWithImpl$Variables$Query$MyVotes(this._instance, this._then);

  final Variables$Query$MyVotes _instance;

  final TRes Function(Variables$Query$MyVotes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? proposalId = _undefined}) => _then(
    Variables$Query$MyVotes._({
      ..._instance._$data,
      if (proposalId != _undefined) 'proposalId': (proposalId as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$MyVotes<TRes>
    implements CopyWith$Variables$Query$MyVotes<TRes> {
  _CopyWithStubImpl$Variables$Query$MyVotes(this._res);

  TRes _res;

  call({String? proposalId}) => _res;
}

class Query$MyVotes {
  Query$MyVotes({required this.myVotes, this.$__typename = 'Query'});

  factory Query$MyVotes.fromJson(Map<String, dynamic> json) {
    final l$myVotes = json['myVotes'];
    final l$$__typename = json['__typename'];
    return Query$MyVotes(
      myVotes: (l$myVotes as List<dynamic>)
          .map(
            (e) => Query$MyVotes$myVotes.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MyVotes$myVotes> myVotes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myVotes = myVotes;
    _resultData['myVotes'] = l$myVotes.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myVotes = myVotes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$myVotes.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MyVotes || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myVotes = myVotes;
    final lOther$myVotes = other.myVotes;
    if (l$myVotes.length != lOther$myVotes.length) {
      return false;
    }
    for (int i = 0; i < l$myVotes.length; i++) {
      final l$myVotes$entry = l$myVotes[i];
      final lOther$myVotes$entry = lOther$myVotes[i];
      if (l$myVotes$entry != lOther$myVotes$entry) {
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

extension UtilityExtension$Query$MyVotes on Query$MyVotes {
  CopyWith$Query$MyVotes<Query$MyVotes> get copyWith =>
      CopyWith$Query$MyVotes(this, (i) => i);
}

abstract class CopyWith$Query$MyVotes<TRes> {
  factory CopyWith$Query$MyVotes(
    Query$MyVotes instance,
    TRes Function(Query$MyVotes) then,
  ) = _CopyWithImpl$Query$MyVotes;

  factory CopyWith$Query$MyVotes.stub(TRes res) =
      _CopyWithStubImpl$Query$MyVotes;

  TRes call({List<Query$MyVotes$myVotes>? myVotes, String? $__typename});
  TRes myVotes(
    Iterable<Query$MyVotes$myVotes> Function(
      Iterable<CopyWith$Query$MyVotes$myVotes<Query$MyVotes$myVotes>>,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$MyVotes<TRes>
    implements CopyWith$Query$MyVotes<TRes> {
  _CopyWithImpl$Query$MyVotes(this._instance, this._then);

  final Query$MyVotes _instance;

  final TRes Function(Query$MyVotes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? myVotes = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$MyVotes(
          myVotes: myVotes == _undefined || myVotes == null
              ? _instance.myVotes
              : (myVotes as List<Query$MyVotes$myVotes>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes myVotes(
    Iterable<Query$MyVotes$myVotes> Function(
      Iterable<CopyWith$Query$MyVotes$myVotes<Query$MyVotes$myVotes>>,
    )
    _fn,
  ) => call(
    myVotes: _fn(
      _instance.myVotes.map((e) => CopyWith$Query$MyVotes$myVotes(e, (i) => i)),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$MyVotes<TRes>
    implements CopyWith$Query$MyVotes<TRes> {
  _CopyWithStubImpl$Query$MyVotes(this._res);

  TRes _res;

  call({List<Query$MyVotes$myVotes>? myVotes, String? $__typename}) => _res;

  myVotes(_fn) => _res;
}

const documentNodeQueryMyVotes = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyVotes'),
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
            name: NameNode(value: 'myVotes'),
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
Query$MyVotes _parserFn$Query$MyVotes(Map<String, dynamic> data) =>
    Query$MyVotes.fromJson(data);
typedef OnQueryComplete$Query$MyVotes =
    FutureOr<void> Function(Map<String, dynamic>?, Query$MyVotes?);

class Options$Query$MyVotes extends graphql.QueryOptions<Query$MyVotes> {
  Options$Query$MyVotes({
    String? operationName,
    Variables$Query$MyVotes? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MyVotes? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$MyVotes? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables?.toJson() ?? {},
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
                 data == null ? null : _parserFn$Query$MyVotes(data),
               ),
         onError: onError,
         document: documentNodeQueryMyVotes,
         parserFn: _parserFn$Query$MyVotes,
       );

  final OnQueryComplete$Query$MyVotes? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$MyVotes
    extends graphql.WatchQueryOptions<Query$MyVotes> {
  WatchOptions$Query$MyVotes({
    String? operationName,
    Variables$Query$MyVotes? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MyVotes? typedOptimisticResult,
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
         document: documentNodeQueryMyVotes,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$MyVotes,
       );
}

class FetchMoreOptions$Query$MyVotes extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$MyVotes({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$MyVotes? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryMyVotes,
       );
}

extension ClientExtension$Query$MyVotes on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$MyVotes>> query$MyVotes([
    Options$Query$MyVotes? options,
  ]) async => await this.query(options ?? Options$Query$MyVotes());

  graphql.ObservableQuery<Query$MyVotes> watchQuery$MyVotes([
    WatchOptions$Query$MyVotes? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$MyVotes());

  void writeQuery$MyVotes({
    required Query$MyVotes data,
    Variables$Query$MyVotes? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryMyVotes),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$MyVotes? readQuery$MyVotes({
    Variables$Query$MyVotes? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMyVotes),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$MyVotes.fromJson(result);
  }
}

class Query$MyVotes$myVotes {
  Query$MyVotes$myVotes({
    required this.id,
    required this.proposalId,
    required this.choice,
    this.comment,
    required this.createdAt,
    this.$__typename = 'Vote',
  });

  factory Query$MyVotes$myVotes.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$proposalId = json['proposalId'];
    final l$choice = json['choice'];
    final l$comment = json['comment'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$MyVotes$myVotes(
      id: (l$id as String),
      proposalId: (l$proposalId as String),
      choice: fromJson$Enum$VoteChoice((l$choice as String)),
      comment: (l$comment as String?),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String proposalId;

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
    final l$choice = choice;
    final l$comment = comment;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$proposalId,
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
    if (other is! Query$MyVotes$myVotes || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$MyVotes$myVotes on Query$MyVotes$myVotes {
  CopyWith$Query$MyVotes$myVotes<Query$MyVotes$myVotes> get copyWith =>
      CopyWith$Query$MyVotes$myVotes(this, (i) => i);
}

abstract class CopyWith$Query$MyVotes$myVotes<TRes> {
  factory CopyWith$Query$MyVotes$myVotes(
    Query$MyVotes$myVotes instance,
    TRes Function(Query$MyVotes$myVotes) then,
  ) = _CopyWithImpl$Query$MyVotes$myVotes;

  factory CopyWith$Query$MyVotes$myVotes.stub(TRes res) =
      _CopyWithStubImpl$Query$MyVotes$myVotes;

  TRes call({
    String? id,
    String? proposalId,
    Enum$VoteChoice? choice,
    String? comment,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MyVotes$myVotes<TRes>
    implements CopyWith$Query$MyVotes$myVotes<TRes> {
  _CopyWithImpl$Query$MyVotes$myVotes(this._instance, this._then);

  final Query$MyVotes$myVotes _instance;

  final TRes Function(Query$MyVotes$myVotes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? proposalId = _undefined,
    Object? choice = _undefined,
    Object? comment = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$MyVotes$myVotes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      proposalId: proposalId == _undefined || proposalId == null
          ? _instance.proposalId
          : (proposalId as String),
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
}

class _CopyWithStubImpl$Query$MyVotes$myVotes<TRes>
    implements CopyWith$Query$MyVotes$myVotes<TRes> {
  _CopyWithStubImpl$Query$MyVotes$myVotes(this._res);

  TRes _res;

  call({
    String? id,
    String? proposalId,
    Enum$VoteChoice? choice,
    String? comment,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}
