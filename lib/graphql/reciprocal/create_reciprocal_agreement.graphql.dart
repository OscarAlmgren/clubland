import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CreateReciprocalAgreement {
  factory Variables$Mutation$CreateReciprocalAgreement({
    required Input$CreateReciprocalAgreementInput input,
  }) => Variables$Mutation$CreateReciprocalAgreement._({r'input': input});

  Variables$Mutation$CreateReciprocalAgreement._(this._$data);

  factory Variables$Mutation$CreateReciprocalAgreement.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$CreateReciprocalAgreementInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateReciprocalAgreement._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreateReciprocalAgreementInput get input =>
      (_$data['input'] as Input$CreateReciprocalAgreementInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateReciprocalAgreement<
    Variables$Mutation$CreateReciprocalAgreement
  >
  get copyWith =>
      CopyWith$Variables$Mutation$CreateReciprocalAgreement(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateReciprocalAgreement ||
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

abstract class CopyWith$Variables$Mutation$CreateReciprocalAgreement<TRes> {
  factory CopyWith$Variables$Mutation$CreateReciprocalAgreement(
    Variables$Mutation$CreateReciprocalAgreement instance,
    TRes Function(Variables$Mutation$CreateReciprocalAgreement) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateReciprocalAgreement;

  factory CopyWith$Variables$Mutation$CreateReciprocalAgreement.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateReciprocalAgreement;

  TRes call({Input$CreateReciprocalAgreementInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateReciprocalAgreement<TRes>
    implements CopyWith$Variables$Mutation$CreateReciprocalAgreement<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateReciprocalAgreement(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateReciprocalAgreement _instance;

  final TRes Function(Variables$Mutation$CreateReciprocalAgreement) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateReciprocalAgreement._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$CreateReciprocalAgreementInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateReciprocalAgreement<TRes>
    implements CopyWith$Variables$Mutation$CreateReciprocalAgreement<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateReciprocalAgreement(this._res);

  TRes _res;

  call({Input$CreateReciprocalAgreementInput? input}) => _res;
}

class Mutation$CreateReciprocalAgreement {
  Mutation$CreateReciprocalAgreement({
    required this.createReciprocalAgreement,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateReciprocalAgreement.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$createReciprocalAgreement = json['createReciprocalAgreement'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateReciprocalAgreement(
      createReciprocalAgreement:
          Mutation$CreateReciprocalAgreement$createReciprocalAgreement.fromJson(
            (l$createReciprocalAgreement as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateReciprocalAgreement$createReciprocalAgreement
  createReciprocalAgreement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createReciprocalAgreement = createReciprocalAgreement;
    _resultData['createReciprocalAgreement'] = l$createReciprocalAgreement
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createReciprocalAgreement = createReciprocalAgreement;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createReciprocalAgreement, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateReciprocalAgreement ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createReciprocalAgreement = createReciprocalAgreement;
    final lOther$createReciprocalAgreement = other.createReciprocalAgreement;
    if (l$createReciprocalAgreement != lOther$createReciprocalAgreement) {
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

extension UtilityExtension$Mutation$CreateReciprocalAgreement
    on Mutation$CreateReciprocalAgreement {
  CopyWith$Mutation$CreateReciprocalAgreement<
    Mutation$CreateReciprocalAgreement
  >
  get copyWith => CopyWith$Mutation$CreateReciprocalAgreement(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateReciprocalAgreement<TRes> {
  factory CopyWith$Mutation$CreateReciprocalAgreement(
    Mutation$CreateReciprocalAgreement instance,
    TRes Function(Mutation$CreateReciprocalAgreement) then,
  ) = _CopyWithImpl$Mutation$CreateReciprocalAgreement;

  factory CopyWith$Mutation$CreateReciprocalAgreement.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateReciprocalAgreement;

  TRes call({
    Mutation$CreateReciprocalAgreement$createReciprocalAgreement?
    createReciprocalAgreement,
    String? $__typename,
  });
  CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement<TRes>
  get createReciprocalAgreement;
}

class _CopyWithImpl$Mutation$CreateReciprocalAgreement<TRes>
    implements CopyWith$Mutation$CreateReciprocalAgreement<TRes> {
  _CopyWithImpl$Mutation$CreateReciprocalAgreement(this._instance, this._then);

  final Mutation$CreateReciprocalAgreement _instance;

  final TRes Function(Mutation$CreateReciprocalAgreement) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createReciprocalAgreement = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateReciprocalAgreement(
      createReciprocalAgreement:
          createReciprocalAgreement == _undefined ||
              createReciprocalAgreement == null
          ? _instance.createReciprocalAgreement
          : (createReciprocalAgreement
                as Mutation$CreateReciprocalAgreement$createReciprocalAgreement),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement<TRes>
  get createReciprocalAgreement {
    final local$createReciprocalAgreement = _instance.createReciprocalAgreement;
    return CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement(
      local$createReciprocalAgreement,
      (e) => call(createReciprocalAgreement: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CreateReciprocalAgreement<TRes>
    implements CopyWith$Mutation$CreateReciprocalAgreement<TRes> {
  _CopyWithStubImpl$Mutation$CreateReciprocalAgreement(this._res);

  TRes _res;

  call({
    Mutation$CreateReciprocalAgreement$createReciprocalAgreement?
    createReciprocalAgreement,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement<TRes>
  get createReciprocalAgreement =>
      CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement.stub(
        _res,
      );
}

const documentNodeMutationCreateReciprocalAgreement = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateReciprocalAgreement'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'CreateReciprocalAgreementInput'),
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
            name: NameNode(value: 'createReciprocalAgreement'),
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
                  name: NameNode(value: 'clubId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'partnerClubId'),
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
                  name: NameNode(value: 'terms'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'maxVisitsPerMonth'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'reciprocalFee'),
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
                  name: NameNode(value: 'effectiveDate'),
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
Mutation$CreateReciprocalAgreement _parserFn$Mutation$CreateReciprocalAgreement(
  Map<String, dynamic> data,
) => Mutation$CreateReciprocalAgreement.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateReciprocalAgreement =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$CreateReciprocalAgreement?,
    );

class Options$Mutation$CreateReciprocalAgreement
    extends graphql.MutationOptions<Mutation$CreateReciprocalAgreement> {
  Options$Mutation$CreateReciprocalAgreement({
    String? operationName,
    required Variables$Mutation$CreateReciprocalAgreement variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateReciprocalAgreement? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateReciprocalAgreement? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateReciprocalAgreement>? update,
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
                 data == null
                     ? null
                     : _parserFn$Mutation$CreateReciprocalAgreement(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateReciprocalAgreement,
         parserFn: _parserFn$Mutation$CreateReciprocalAgreement,
       );

  final OnMutationCompleted$Mutation$CreateReciprocalAgreement?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateReciprocalAgreement
    extends graphql.WatchQueryOptions<Mutation$CreateReciprocalAgreement> {
  WatchOptions$Mutation$CreateReciprocalAgreement({
    String? operationName,
    required Variables$Mutation$CreateReciprocalAgreement variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateReciprocalAgreement? typedOptimisticResult,
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
         document: documentNodeMutationCreateReciprocalAgreement,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateReciprocalAgreement,
       );
}

extension ClientExtension$Mutation$CreateReciprocalAgreement
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateReciprocalAgreement>>
  mutate$CreateReciprocalAgreement(
    Options$Mutation$CreateReciprocalAgreement options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateReciprocalAgreement>
  watchMutation$CreateReciprocalAgreement(
    WatchOptions$Mutation$CreateReciprocalAgreement options,
  ) => this.watchMutation(options);
}

class Mutation$CreateReciprocalAgreement$createReciprocalAgreement {
  Mutation$CreateReciprocalAgreement$createReciprocalAgreement({
    required this.id,
    required this.clubId,
    required this.partnerClubId,
    required this.status,
    required this.terms,
    required this.effectiveDate,
    this.$__typename = 'ReciprocalAgreement',
  });

  factory Mutation$CreateReciprocalAgreement$createReciprocalAgreement.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$partnerClubId = json['partnerClubId'];
    final l$status = json['status'];
    final l$terms = json['terms'];
    final l$effectiveDate = json['effectiveDate'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateReciprocalAgreement$createReciprocalAgreement(
      id: (l$id as String),
      clubId: (l$clubId as String),
      partnerClubId: (l$partnerClubId as String),
      status: fromJson$Enum$AgreementStatus((l$status as String)),
      terms:
          Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms.fromJson(
            (l$terms as Map<String, dynamic>),
          ),
      effectiveDate: DateTime.parse((l$effectiveDate as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String partnerClubId;

  final Enum$AgreementStatus status;

  final Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms
  terms;

  final DateTime effectiveDate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$clubId = clubId;
    _resultData['clubId'] = l$clubId;
    final l$partnerClubId = partnerClubId;
    _resultData['partnerClubId'] = l$partnerClubId;
    final l$status = status;
    _resultData['status'] = toJson$Enum$AgreementStatus(l$status);
    final l$terms = terms;
    _resultData['terms'] = l$terms.toJson();
    final l$effectiveDate = effectiveDate;
    _resultData['effectiveDate'] = l$effectiveDate.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clubId = clubId;
    final l$partnerClubId = partnerClubId;
    final l$status = status;
    final l$terms = terms;
    final l$effectiveDate = effectiveDate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$partnerClubId,
      l$status,
      l$terms,
      l$effectiveDate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Mutation$CreateReciprocalAgreement$createReciprocalAgreement ||
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
    final l$partnerClubId = partnerClubId;
    final lOther$partnerClubId = other.partnerClubId;
    if (l$partnerClubId != lOther$partnerClubId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateReciprocalAgreement$createReciprocalAgreement
    on Mutation$CreateReciprocalAgreement$createReciprocalAgreement {
  CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement<
    Mutation$CreateReciprocalAgreement$createReciprocalAgreement
  >
  get copyWith =>
      CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement<
  TRes
> {
  factory CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement(
    Mutation$CreateReciprocalAgreement$createReciprocalAgreement instance,
    TRes Function(Mutation$CreateReciprocalAgreement$createReciprocalAgreement)
    then,
  ) = _CopyWithImpl$Mutation$CreateReciprocalAgreement$createReciprocalAgreement;

  factory CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateReciprocalAgreement$createReciprocalAgreement;

  TRes call({
    String? id,
    String? clubId,
    String? partnerClubId,
    Enum$AgreementStatus? status,
    Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms? terms,
    DateTime? effectiveDate,
    String? $__typename,
  });
  CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms<
    TRes
  >
  get terms;
}

class _CopyWithImpl$Mutation$CreateReciprocalAgreement$createReciprocalAgreement<
  TRes
>
    implements
        CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement<
          TRes
        > {
  _CopyWithImpl$Mutation$CreateReciprocalAgreement$createReciprocalAgreement(
    this._instance,
    this._then,
  );

  final Mutation$CreateReciprocalAgreement$createReciprocalAgreement _instance;

  final TRes Function(
    Mutation$CreateReciprocalAgreement$createReciprocalAgreement,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? partnerClubId = _undefined,
    Object? status = _undefined,
    Object? terms = _undefined,
    Object? effectiveDate = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateReciprocalAgreement$createReciprocalAgreement(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      clubId: clubId == _undefined || clubId == null
          ? _instance.clubId
          : (clubId as String),
      partnerClubId: partnerClubId == _undefined || partnerClubId == null
          ? _instance.partnerClubId
          : (partnerClubId as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$AgreementStatus),
      terms: terms == _undefined || terms == null
          ? _instance.terms
          : (terms
                as Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms),
      effectiveDate: effectiveDate == _undefined || effectiveDate == null
          ? _instance.effectiveDate
          : (effectiveDate as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms<
    TRes
  >
  get terms {
    final local$terms = _instance.terms;
    return CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms(
      local$terms,
      (e) => call(terms: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CreateReciprocalAgreement$createReciprocalAgreement<
  TRes
>
    implements
        CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement<
          TRes
        > {
  _CopyWithStubImpl$Mutation$CreateReciprocalAgreement$createReciprocalAgreement(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? partnerClubId,
    Enum$AgreementStatus? status,
    Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms? terms,
    DateTime? effectiveDate,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms<
    TRes
  >
  get terms =>
      CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms.stub(
        _res,
      );
}

class Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms {
  Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms({
    required this.maxVisitsPerMonth,
    this.reciprocalFee,
    this.$__typename = 'AgreementTerms',
  });

  factory Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$maxVisitsPerMonth = json['maxVisitsPerMonth'];
    final l$reciprocalFee = json['reciprocalFee'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms(
      maxVisitsPerMonth: (l$maxVisitsPerMonth as int),
      reciprocalFee: (l$reciprocalFee as num?)?.toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final int maxVisitsPerMonth;

  final double? reciprocalFee;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    _resultData['maxVisitsPerMonth'] = l$maxVisitsPerMonth;
    final l$reciprocalFee = reciprocalFee;
    _resultData['reciprocalFee'] = l$reciprocalFee;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    final l$reciprocalFee = reciprocalFee;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$maxVisitsPerMonth,
      l$reciprocalFee,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms ||
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
    if (l$reciprocalFee != lOther$reciprocalFee) {
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

extension UtilityExtension$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms
    on Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms {
  CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms<
    Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms
  >
  get copyWith =>
      CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms<
  TRes
> {
  factory CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms(
    Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms instance,
    TRes Function(
      Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms,
    )
    then,
  ) = _CopyWithImpl$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms;

  factory CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms;

  TRes call({
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms<
  TRes
>
    implements
        CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms<
          TRes
        > {
  _CopyWithImpl$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms(
    this._instance,
    this._then,
  );

  final Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms
  _instance;

  final TRes Function(
    Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? maxVisitsPerMonth = _undefined,
    Object? reciprocalFee = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms(
      maxVisitsPerMonth:
          maxVisitsPerMonth == _undefined || maxVisitsPerMonth == null
          ? _instance.maxVisitsPerMonth
          : (maxVisitsPerMonth as int),
      reciprocalFee: reciprocalFee == _undefined
          ? _instance.reciprocalFee
          : (reciprocalFee as double?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms<
  TRes
>
    implements
        CopyWith$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms<
          TRes
        > {
  _CopyWithStubImpl$Mutation$CreateReciprocalAgreement$createReciprocalAgreement$terms(
    this._res,
  );

  TRes _res;

  call({int? maxVisitsPerMonth, double? reciprocalFee, String? $__typename}) =>
      _res;
}
