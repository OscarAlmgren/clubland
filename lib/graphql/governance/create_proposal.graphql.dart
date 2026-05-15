import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CreateProposal {
  factory Variables$Mutation$CreateProposal({
    required Input$CreateProposalInput input,
  }) => Variables$Mutation$CreateProposal._({r'input': input});

  Variables$Mutation$CreateProposal._(this._$data);

  factory Variables$Mutation$CreateProposal.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$CreateProposalInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateProposal._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreateProposalInput get input =>
      (_$data['input'] as Input$CreateProposalInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateProposal<Variables$Mutation$CreateProposal>
  get copyWith => CopyWith$Variables$Mutation$CreateProposal(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateProposal ||
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

abstract class CopyWith$Variables$Mutation$CreateProposal<TRes> {
  factory CopyWith$Variables$Mutation$CreateProposal(
    Variables$Mutation$CreateProposal instance,
    TRes Function(Variables$Mutation$CreateProposal) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateProposal;

  factory CopyWith$Variables$Mutation$CreateProposal.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateProposal;

  TRes call({Input$CreateProposalInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateProposal<TRes>
    implements CopyWith$Variables$Mutation$CreateProposal<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateProposal(this._instance, this._then);

  final Variables$Mutation$CreateProposal _instance;

  final TRes Function(Variables$Mutation$CreateProposal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateProposal._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$CreateProposalInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateProposal<TRes>
    implements CopyWith$Variables$Mutation$CreateProposal<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateProposal(this._res);

  TRes _res;

  call({Input$CreateProposalInput? input}) => _res;
}

class Mutation$CreateProposal {
  Mutation$CreateProposal({
    required this.createProposal,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateProposal.fromJson(Map<String, dynamic> json) {
    final l$createProposal = json['createProposal'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateProposal(
      createProposal: Mutation$CreateProposal$createProposal.fromJson(
        (l$createProposal as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateProposal$createProposal createProposal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createProposal = createProposal;
    _resultData['createProposal'] = l$createProposal.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createProposal = createProposal;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createProposal, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateProposal || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createProposal = createProposal;
    final lOther$createProposal = other.createProposal;
    if (l$createProposal != lOther$createProposal) {
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

extension UtilityExtension$Mutation$CreateProposal on Mutation$CreateProposal {
  CopyWith$Mutation$CreateProposal<Mutation$CreateProposal> get copyWith =>
      CopyWith$Mutation$CreateProposal(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateProposal<TRes> {
  factory CopyWith$Mutation$CreateProposal(
    Mutation$CreateProposal instance,
    TRes Function(Mutation$CreateProposal) then,
  ) = _CopyWithImpl$Mutation$CreateProposal;

  factory CopyWith$Mutation$CreateProposal.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateProposal;

  TRes call({
    Mutation$CreateProposal$createProposal? createProposal,
    String? $__typename,
  });
  CopyWith$Mutation$CreateProposal$createProposal<TRes> get createProposal;
}

class _CopyWithImpl$Mutation$CreateProposal<TRes>
    implements CopyWith$Mutation$CreateProposal<TRes> {
  _CopyWithImpl$Mutation$CreateProposal(this._instance, this._then);

  final Mutation$CreateProposal _instance;

  final TRes Function(Mutation$CreateProposal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createProposal = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateProposal(
      createProposal: createProposal == _undefined || createProposal == null
          ? _instance.createProposal
          : (createProposal as Mutation$CreateProposal$createProposal),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateProposal$createProposal<TRes> get createProposal {
    final local$createProposal = _instance.createProposal;
    return CopyWith$Mutation$CreateProposal$createProposal(
      local$createProposal,
      (e) => call(createProposal: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CreateProposal<TRes>
    implements CopyWith$Mutation$CreateProposal<TRes> {
  _CopyWithStubImpl$Mutation$CreateProposal(this._res);

  TRes _res;

  call({
    Mutation$CreateProposal$createProposal? createProposal,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateProposal$createProposal<TRes> get createProposal =>
      CopyWith$Mutation$CreateProposal$createProposal.stub(_res);
}

const documentNodeMutationCreateProposal = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateProposal'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'CreateProposalInput'),
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
            name: NameNode(value: 'createProposal'),
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
                  name: NameNode(value: 'category'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'votingMethod'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'votingStartTime'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'votingEndTime'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'quorumRequired'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'approvalThreshold'),
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
Mutation$CreateProposal _parserFn$Mutation$CreateProposal(
  Map<String, dynamic> data,
) => Mutation$CreateProposal.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateProposal =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CreateProposal?);

class Options$Mutation$CreateProposal
    extends graphql.MutationOptions<Mutation$CreateProposal> {
  Options$Mutation$CreateProposal({
    String? operationName,
    required Variables$Mutation$CreateProposal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateProposal? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateProposal? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateProposal>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateProposal(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateProposal,
         parserFn: _parserFn$Mutation$CreateProposal,
       );

  final OnMutationCompleted$Mutation$CreateProposal? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateProposal
    extends graphql.WatchQueryOptions<Mutation$CreateProposal> {
  WatchOptions$Mutation$CreateProposal({
    String? operationName,
    required Variables$Mutation$CreateProposal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateProposal? typedOptimisticResult,
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
         document: documentNodeMutationCreateProposal,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateProposal,
       );
}

extension ClientExtension$Mutation$CreateProposal on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateProposal>> mutate$CreateProposal(
    Options$Mutation$CreateProposal options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateProposal> watchMutation$CreateProposal(
    WatchOptions$Mutation$CreateProposal options,
  ) => this.watchMutation(options);
}

class Mutation$CreateProposal$createProposal {
  Mutation$CreateProposal$createProposal({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
    this.category,
    required this.votingMethod,
    required this.votingStartTime,
    required this.votingEndTime,
    required this.quorumRequired,
    required this.approvalThreshold,
    required this.createdAt,
    this.$__typename = 'Proposal',
  });

  factory Mutation$CreateProposal$createProposal.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$type = json['type'];
    final l$status = json['status'];
    final l$category = json['category'];
    final l$votingMethod = json['votingMethod'];
    final l$votingStartTime = json['votingStartTime'];
    final l$votingEndTime = json['votingEndTime'];
    final l$quorumRequired = json['quorumRequired'];
    final l$approvalThreshold = json['approvalThreshold'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateProposal$createProposal(
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String),
      type: fromJson$Enum$ProposalType((l$type as String)),
      status: fromJson$Enum$ProposalStatus((l$status as String)),
      category: (l$category as String?),
      votingMethod: fromJson$Enum$VotingMethod((l$votingMethod as String)),
      votingStartTime: DateTime.parse((l$votingStartTime as String)),
      votingEndTime: DateTime.parse((l$votingEndTime as String)),
      quorumRequired: (l$quorumRequired as int),
      approvalThreshold: (l$approvalThreshold as num).toDouble(),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String description;

  final Enum$ProposalType type;

  final Enum$ProposalStatus status;

  final String? category;

  final Enum$VotingMethod votingMethod;

  final DateTime votingStartTime;

  final DateTime votingEndTime;

  final int quorumRequired;

  final double approvalThreshold;

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
    final l$category = category;
    _resultData['category'] = l$category;
    final l$votingMethod = votingMethod;
    _resultData['votingMethod'] = toJson$Enum$VotingMethod(l$votingMethod);
    final l$votingStartTime = votingStartTime;
    _resultData['votingStartTime'] = l$votingStartTime.toIso8601String();
    final l$votingEndTime = votingEndTime;
    _resultData['votingEndTime'] = l$votingEndTime.toIso8601String();
    final l$quorumRequired = quorumRequired;
    _resultData['quorumRequired'] = l$quorumRequired;
    final l$approvalThreshold = approvalThreshold;
    _resultData['approvalThreshold'] = l$approvalThreshold;
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
    final l$category = category;
    final l$votingMethod = votingMethod;
    final l$votingStartTime = votingStartTime;
    final l$votingEndTime = votingEndTime;
    final l$quorumRequired = quorumRequired;
    final l$approvalThreshold = approvalThreshold;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$type,
      l$status,
      l$category,
      l$votingMethod,
      l$votingStartTime,
      l$votingEndTime,
      l$quorumRequired,
      l$approvalThreshold,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateProposal$createProposal ||
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
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
      return false;
    }
    final l$votingMethod = votingMethod;
    final lOther$votingMethod = other.votingMethod;
    if (l$votingMethod != lOther$votingMethod) {
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
    final l$quorumRequired = quorumRequired;
    final lOther$quorumRequired = other.quorumRequired;
    if (l$quorumRequired != lOther$quorumRequired) {
      return false;
    }
    final l$approvalThreshold = approvalThreshold;
    final lOther$approvalThreshold = other.approvalThreshold;
    if (l$approvalThreshold != lOther$approvalThreshold) {
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

extension UtilityExtension$Mutation$CreateProposal$createProposal
    on Mutation$CreateProposal$createProposal {
  CopyWith$Mutation$CreateProposal$createProposal<
    Mutation$CreateProposal$createProposal
  >
  get copyWith =>
      CopyWith$Mutation$CreateProposal$createProposal(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateProposal$createProposal<TRes> {
  factory CopyWith$Mutation$CreateProposal$createProposal(
    Mutation$CreateProposal$createProposal instance,
    TRes Function(Mutation$CreateProposal$createProposal) then,
  ) = _CopyWithImpl$Mutation$CreateProposal$createProposal;

  factory CopyWith$Mutation$CreateProposal$createProposal.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateProposal$createProposal;

  TRes call({
    String? id,
    String? title,
    String? description,
    Enum$ProposalType? type,
    Enum$ProposalStatus? status,
    String? category,
    Enum$VotingMethod? votingMethod,
    DateTime? votingStartTime,
    DateTime? votingEndTime,
    int? quorumRequired,
    double? approvalThreshold,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateProposal$createProposal<TRes>
    implements CopyWith$Mutation$CreateProposal$createProposal<TRes> {
  _CopyWithImpl$Mutation$CreateProposal$createProposal(
    this._instance,
    this._then,
  );

  final Mutation$CreateProposal$createProposal _instance;

  final TRes Function(Mutation$CreateProposal$createProposal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? type = _undefined,
    Object? status = _undefined,
    Object? category = _undefined,
    Object? votingMethod = _undefined,
    Object? votingStartTime = _undefined,
    Object? votingEndTime = _undefined,
    Object? quorumRequired = _undefined,
    Object? approvalThreshold = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateProposal$createProposal(
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
      category: category == _undefined
          ? _instance.category
          : (category as String?),
      votingMethod: votingMethod == _undefined || votingMethod == null
          ? _instance.votingMethod
          : (votingMethod as Enum$VotingMethod),
      votingStartTime: votingStartTime == _undefined || votingStartTime == null
          ? _instance.votingStartTime
          : (votingStartTime as DateTime),
      votingEndTime: votingEndTime == _undefined || votingEndTime == null
          ? _instance.votingEndTime
          : (votingEndTime as DateTime),
      quorumRequired: quorumRequired == _undefined || quorumRequired == null
          ? _instance.quorumRequired
          : (quorumRequired as int),
      approvalThreshold:
          approvalThreshold == _undefined || approvalThreshold == null
          ? _instance.approvalThreshold
          : (approvalThreshold as double),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreateProposal$createProposal<TRes>
    implements CopyWith$Mutation$CreateProposal$createProposal<TRes> {
  _CopyWithStubImpl$Mutation$CreateProposal$createProposal(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    Enum$ProposalType? type,
    Enum$ProposalStatus? status,
    String? category,
    Enum$VotingMethod? votingMethod,
    DateTime? votingStartTime,
    DateTime? votingEndTime,
    int? quorumRequired,
    double? approvalThreshold,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}
