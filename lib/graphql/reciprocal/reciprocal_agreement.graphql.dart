import '../../schema/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$ReciprocalAgreement {
  factory Variables$Query$ReciprocalAgreement({required String id}) =>
      Variables$Query$ReciprocalAgreement._({r'id': id});

  Variables$Query$ReciprocalAgreement._(this._$data);

  factory Variables$Query$ReciprocalAgreement.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$ReciprocalAgreement._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$ReciprocalAgreement<
    Variables$Query$ReciprocalAgreement
  >
  get copyWith => CopyWith$Variables$Query$ReciprocalAgreement(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$ReciprocalAgreement ||
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

abstract class CopyWith$Variables$Query$ReciprocalAgreement<TRes> {
  factory CopyWith$Variables$Query$ReciprocalAgreement(
    Variables$Query$ReciprocalAgreement instance,
    TRes Function(Variables$Query$ReciprocalAgreement) then,
  ) = _CopyWithImpl$Variables$Query$ReciprocalAgreement;

  factory CopyWith$Variables$Query$ReciprocalAgreement.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ReciprocalAgreement;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$ReciprocalAgreement<TRes>
    implements CopyWith$Variables$Query$ReciprocalAgreement<TRes> {
  _CopyWithImpl$Variables$Query$ReciprocalAgreement(this._instance, this._then);

  final Variables$Query$ReciprocalAgreement _instance;

  final TRes Function(Variables$Query$ReciprocalAgreement) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$ReciprocalAgreement._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$ReciprocalAgreement<TRes>
    implements CopyWith$Variables$Query$ReciprocalAgreement<TRes> {
  _CopyWithStubImpl$Variables$Query$ReciprocalAgreement(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$ReciprocalAgreement {
  Query$ReciprocalAgreement({
    this.reciprocalAgreement,
    this.$__typename = 'Query',
  });

  factory Query$ReciprocalAgreement.fromJson(Map<String, dynamic> json) {
    final l$reciprocalAgreement = json['reciprocalAgreement'];
    final l$$__typename = json['__typename'];
    return Query$ReciprocalAgreement(
      reciprocalAgreement: l$reciprocalAgreement == null
          ? null
          : Query$ReciprocalAgreement$reciprocalAgreement.fromJson(
              (l$reciprocalAgreement as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ReciprocalAgreement$reciprocalAgreement? reciprocalAgreement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reciprocalAgreement = reciprocalAgreement;
    _resultData['reciprocalAgreement'] = l$reciprocalAgreement?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reciprocalAgreement = reciprocalAgreement;
    final l$$__typename = $__typename;
    return Object.hashAll([l$reciprocalAgreement, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ReciprocalAgreement ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reciprocalAgreement = reciprocalAgreement;
    final lOther$reciprocalAgreement = other.reciprocalAgreement;
    if (l$reciprocalAgreement != lOther$reciprocalAgreement) {
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

extension UtilityExtension$Query$ReciprocalAgreement
    on Query$ReciprocalAgreement {
  CopyWith$Query$ReciprocalAgreement<Query$ReciprocalAgreement> get copyWith =>
      CopyWith$Query$ReciprocalAgreement(this, (i) => i);
}

abstract class CopyWith$Query$ReciprocalAgreement<TRes> {
  factory CopyWith$Query$ReciprocalAgreement(
    Query$ReciprocalAgreement instance,
    TRes Function(Query$ReciprocalAgreement) then,
  ) = _CopyWithImpl$Query$ReciprocalAgreement;

  factory CopyWith$Query$ReciprocalAgreement.stub(TRes res) =
      _CopyWithStubImpl$Query$ReciprocalAgreement;

  TRes call({
    Query$ReciprocalAgreement$reciprocalAgreement? reciprocalAgreement,
    String? $__typename,
  });
  CopyWith$Query$ReciprocalAgreement$reciprocalAgreement<TRes>
  get reciprocalAgreement;
}

class _CopyWithImpl$Query$ReciprocalAgreement<TRes>
    implements CopyWith$Query$ReciprocalAgreement<TRes> {
  _CopyWithImpl$Query$ReciprocalAgreement(this._instance, this._then);

  final Query$ReciprocalAgreement _instance;

  final TRes Function(Query$ReciprocalAgreement) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? reciprocalAgreement = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ReciprocalAgreement(
      reciprocalAgreement: reciprocalAgreement == _undefined
          ? _instance.reciprocalAgreement
          : (reciprocalAgreement
                as Query$ReciprocalAgreement$reciprocalAgreement?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$ReciprocalAgreement$reciprocalAgreement<TRes>
  get reciprocalAgreement {
    final local$reciprocalAgreement = _instance.reciprocalAgreement;
    return local$reciprocalAgreement == null
        ? CopyWith$Query$ReciprocalAgreement$reciprocalAgreement.stub(
            _then(_instance),
          )
        : CopyWith$Query$ReciprocalAgreement$reciprocalAgreement(
            local$reciprocalAgreement,
            (e) => call(reciprocalAgreement: e),
          );
  }
}

class _CopyWithStubImpl$Query$ReciprocalAgreement<TRes>
    implements CopyWith$Query$ReciprocalAgreement<TRes> {
  _CopyWithStubImpl$Query$ReciprocalAgreement(this._res);

  TRes _res;

  call({
    Query$ReciprocalAgreement$reciprocalAgreement? reciprocalAgreement,
    String? $__typename,
  }) => _res;

  CopyWith$Query$ReciprocalAgreement$reciprocalAgreement<TRes>
  get reciprocalAgreement =>
      CopyWith$Query$ReciprocalAgreement$reciprocalAgreement.stub(_res);
}

const documentNodeQueryReciprocalAgreement = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ReciprocalAgreement'),
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
            name: NameNode(value: 'reciprocalAgreement'),
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
                        name: NameNode(value: 'blackoutDates'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'specialConditions'),
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
                  name: NameNode(value: 'expirationDate'),
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
Query$ReciprocalAgreement _parserFn$Query$ReciprocalAgreement(
  Map<String, dynamic> data,
) => Query$ReciprocalAgreement.fromJson(data);
typedef OnQueryComplete$Query$ReciprocalAgreement =
    FutureOr<void> Function(Map<String, dynamic>?, Query$ReciprocalAgreement?);

class Options$Query$ReciprocalAgreement
    extends graphql.QueryOptions<Query$ReciprocalAgreement> {
  Options$Query$ReciprocalAgreement({
    String? operationName,
    required Variables$Query$ReciprocalAgreement variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ReciprocalAgreement? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ReciprocalAgreement? onComplete,
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
                 data == null
                     ? null
                     : _parserFn$Query$ReciprocalAgreement(data),
               ),
         onError: onError,
         document: documentNodeQueryReciprocalAgreement,
         parserFn: _parserFn$Query$ReciprocalAgreement,
       );

  final OnQueryComplete$Query$ReciprocalAgreement? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$ReciprocalAgreement
    extends graphql.WatchQueryOptions<Query$ReciprocalAgreement> {
  WatchOptions$Query$ReciprocalAgreement({
    String? operationName,
    required Variables$Query$ReciprocalAgreement variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ReciprocalAgreement? typedOptimisticResult,
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
         document: documentNodeQueryReciprocalAgreement,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$ReciprocalAgreement,
       );
}

class FetchMoreOptions$Query$ReciprocalAgreement
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ReciprocalAgreement({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$ReciprocalAgreement variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryReciprocalAgreement,
       );
}

extension ClientExtension$Query$ReciprocalAgreement on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ReciprocalAgreement>>
  query$ReciprocalAgreement(Options$Query$ReciprocalAgreement options) async =>
      await this.query(options);

  graphql.ObservableQuery<Query$ReciprocalAgreement>
  watchQuery$ReciprocalAgreement(
    WatchOptions$Query$ReciprocalAgreement options,
  ) => this.watchQuery(options);

  void writeQuery$ReciprocalAgreement({
    required Query$ReciprocalAgreement data,
    required Variables$Query$ReciprocalAgreement variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryReciprocalAgreement,
      ),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$ReciprocalAgreement? readQuery$ReciprocalAgreement({
    required Variables$Query$ReciprocalAgreement variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryReciprocalAgreement,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ReciprocalAgreement.fromJson(result);
  }
}

class Query$ReciprocalAgreement$reciprocalAgreement {
  Query$ReciprocalAgreement$reciprocalAgreement({
    required this.id,
    required this.clubId,
    required this.partnerClubId,
    required this.status,
    required this.terms,
    required this.effectiveDate,
    this.expirationDate,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'ReciprocalAgreement',
  });

  factory Query$ReciprocalAgreement$reciprocalAgreement.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$clubId = json['clubId'];
    final l$partnerClubId = json['partnerClubId'];
    final l$status = json['status'];
    final l$terms = json['terms'];
    final l$effectiveDate = json['effectiveDate'];
    final l$expirationDate = json['expirationDate'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$ReciprocalAgreement$reciprocalAgreement(
      id: (l$id as String),
      clubId: (l$clubId as String),
      partnerClubId: (l$partnerClubId as String),
      status: fromJson$Enum$AgreementStatus((l$status as String)),
      terms: Query$ReciprocalAgreement$reciprocalAgreement$terms.fromJson(
        (l$terms as Map<String, dynamic>),
      ),
      effectiveDate: DateTime.parse((l$effectiveDate as String)),
      expirationDate: l$expirationDate == null
          ? null
          : DateTime.parse((l$expirationDate as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String clubId;

  final String partnerClubId;

  final Enum$AgreementStatus status;

  final Query$ReciprocalAgreement$reciprocalAgreement$terms terms;

  final DateTime effectiveDate;

  final DateTime? expirationDate;

  final DateTime createdAt;

  final DateTime updatedAt;

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
    final l$expirationDate = expirationDate;
    _resultData['expirationDate'] = l$expirationDate?.toIso8601String();
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
    final l$partnerClubId = partnerClubId;
    final l$status = status;
    final l$terms = terms;
    final l$effectiveDate = effectiveDate;
    final l$expirationDate = expirationDate;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$clubId,
      l$partnerClubId,
      l$status,
      l$terms,
      l$effectiveDate,
      l$expirationDate,
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
    if (other is! Query$ReciprocalAgreement$reciprocalAgreement ||
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
    final l$expirationDate = expirationDate;
    final lOther$expirationDate = other.expirationDate;
    if (l$expirationDate != lOther$expirationDate) {
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

extension UtilityExtension$Query$ReciprocalAgreement$reciprocalAgreement
    on Query$ReciprocalAgreement$reciprocalAgreement {
  CopyWith$Query$ReciprocalAgreement$reciprocalAgreement<
    Query$ReciprocalAgreement$reciprocalAgreement
  >
  get copyWith =>
      CopyWith$Query$ReciprocalAgreement$reciprocalAgreement(this, (i) => i);
}

abstract class CopyWith$Query$ReciprocalAgreement$reciprocalAgreement<TRes> {
  factory CopyWith$Query$ReciprocalAgreement$reciprocalAgreement(
    Query$ReciprocalAgreement$reciprocalAgreement instance,
    TRes Function(Query$ReciprocalAgreement$reciprocalAgreement) then,
  ) = _CopyWithImpl$Query$ReciprocalAgreement$reciprocalAgreement;

  factory CopyWith$Query$ReciprocalAgreement$reciprocalAgreement.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$ReciprocalAgreement$reciprocalAgreement;

  TRes call({
    String? id,
    String? clubId,
    String? partnerClubId,
    Enum$AgreementStatus? status,
    Query$ReciprocalAgreement$reciprocalAgreement$terms? terms,
    DateTime? effectiveDate,
    DateTime? expirationDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
  CopyWith$Query$ReciprocalAgreement$reciprocalAgreement$terms<TRes> get terms;
}

class _CopyWithImpl$Query$ReciprocalAgreement$reciprocalAgreement<TRes>
    implements CopyWith$Query$ReciprocalAgreement$reciprocalAgreement<TRes> {
  _CopyWithImpl$Query$ReciprocalAgreement$reciprocalAgreement(
    this._instance,
    this._then,
  );

  final Query$ReciprocalAgreement$reciprocalAgreement _instance;

  final TRes Function(Query$ReciprocalAgreement$reciprocalAgreement) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? clubId = _undefined,
    Object? partnerClubId = _undefined,
    Object? status = _undefined,
    Object? terms = _undefined,
    Object? effectiveDate = _undefined,
    Object? expirationDate = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ReciprocalAgreement$reciprocalAgreement(
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
          : (terms as Query$ReciprocalAgreement$reciprocalAgreement$terms),
      effectiveDate: effectiveDate == _undefined || effectiveDate == null
          ? _instance.effectiveDate
          : (effectiveDate as DateTime),
      expirationDate: expirationDate == _undefined
          ? _instance.expirationDate
          : (expirationDate as DateTime?),
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

  CopyWith$Query$ReciprocalAgreement$reciprocalAgreement$terms<TRes> get terms {
    final local$terms = _instance.terms;
    return CopyWith$Query$ReciprocalAgreement$reciprocalAgreement$terms(
      local$terms,
      (e) => call(terms: e),
    );
  }
}

class _CopyWithStubImpl$Query$ReciprocalAgreement$reciprocalAgreement<TRes>
    implements CopyWith$Query$ReciprocalAgreement$reciprocalAgreement<TRes> {
  _CopyWithStubImpl$Query$ReciprocalAgreement$reciprocalAgreement(this._res);

  TRes _res;

  call({
    String? id,
    String? clubId,
    String? partnerClubId,
    Enum$AgreementStatus? status,
    Query$ReciprocalAgreement$reciprocalAgreement$terms? terms,
    DateTime? effectiveDate,
    DateTime? expirationDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;

  CopyWith$Query$ReciprocalAgreement$reciprocalAgreement$terms<TRes>
  get terms =>
      CopyWith$Query$ReciprocalAgreement$reciprocalAgreement$terms.stub(_res);
}

class Query$ReciprocalAgreement$reciprocalAgreement$terms {
  Query$ReciprocalAgreement$reciprocalAgreement$terms({
    required this.maxVisitsPerMonth,
    this.reciprocalFee,
    this.blackoutDates,
    this.specialConditions,
    this.$__typename = 'AgreementTerms',
  });

  factory Query$ReciprocalAgreement$reciprocalAgreement$terms.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$maxVisitsPerMonth = json['maxVisitsPerMonth'];
    final l$reciprocalFee = json['reciprocalFee'];
    final l$blackoutDates = json['blackoutDates'];
    final l$specialConditions = json['specialConditions'];
    final l$$__typename = json['__typename'];
    return Query$ReciprocalAgreement$reciprocalAgreement$terms(
      maxVisitsPerMonth: (l$maxVisitsPerMonth as int),
      reciprocalFee: (l$reciprocalFee as num?)?.toDouble(),
      blackoutDates: (l$blackoutDates as List<dynamic>?)
          ?.map((e) => DateTime.parse((e as String)))
          .toList(),
      specialConditions: (l$specialConditions as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final int maxVisitsPerMonth;

  final double? reciprocalFee;

  final List<DateTime>? blackoutDates;

  final String? specialConditions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    _resultData['maxVisitsPerMonth'] = l$maxVisitsPerMonth;
    final l$reciprocalFee = reciprocalFee;
    _resultData['reciprocalFee'] = l$reciprocalFee;
    final l$blackoutDates = blackoutDates;
    _resultData['blackoutDates'] = l$blackoutDates
        ?.map((e) => e.toIso8601String())
        .toList();
    final l$specialConditions = specialConditions;
    _resultData['specialConditions'] = l$specialConditions;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$maxVisitsPerMonth = maxVisitsPerMonth;
    final l$reciprocalFee = reciprocalFee;
    final l$blackoutDates = blackoutDates;
    final l$specialConditions = specialConditions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$maxVisitsPerMonth,
      l$reciprocalFee,
      l$blackoutDates == null
          ? null
          : Object.hashAll(l$blackoutDates.map((v) => v)),
      l$specialConditions,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ReciprocalAgreement$reciprocalAgreement$terms ||
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
    final l$blackoutDates = blackoutDates;
    final lOther$blackoutDates = other.blackoutDates;
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
    if (l$specialConditions != lOther$specialConditions) {
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

extension UtilityExtension$Query$ReciprocalAgreement$reciprocalAgreement$terms
    on Query$ReciprocalAgreement$reciprocalAgreement$terms {
  CopyWith$Query$ReciprocalAgreement$reciprocalAgreement$terms<
    Query$ReciprocalAgreement$reciprocalAgreement$terms
  >
  get copyWith => CopyWith$Query$ReciprocalAgreement$reciprocalAgreement$terms(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$ReciprocalAgreement$reciprocalAgreement$terms<
  TRes
> {
  factory CopyWith$Query$ReciprocalAgreement$reciprocalAgreement$terms(
    Query$ReciprocalAgreement$reciprocalAgreement$terms instance,
    TRes Function(Query$ReciprocalAgreement$reciprocalAgreement$terms) then,
  ) = _CopyWithImpl$Query$ReciprocalAgreement$reciprocalAgreement$terms;

  factory CopyWith$Query$ReciprocalAgreement$reciprocalAgreement$terms.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$ReciprocalAgreement$reciprocalAgreement$terms;

  TRes call({
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    List<DateTime>? blackoutDates,
    String? specialConditions,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ReciprocalAgreement$reciprocalAgreement$terms<TRes>
    implements
        CopyWith$Query$ReciprocalAgreement$reciprocalAgreement$terms<TRes> {
  _CopyWithImpl$Query$ReciprocalAgreement$reciprocalAgreement$terms(
    this._instance,
    this._then,
  );

  final Query$ReciprocalAgreement$reciprocalAgreement$terms _instance;

  final TRes Function(Query$ReciprocalAgreement$reciprocalAgreement$terms)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? maxVisitsPerMonth = _undefined,
    Object? reciprocalFee = _undefined,
    Object? blackoutDates = _undefined,
    Object? specialConditions = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ReciprocalAgreement$reciprocalAgreement$terms(
      maxVisitsPerMonth:
          maxVisitsPerMonth == _undefined || maxVisitsPerMonth == null
          ? _instance.maxVisitsPerMonth
          : (maxVisitsPerMonth as int),
      reciprocalFee: reciprocalFee == _undefined
          ? _instance.reciprocalFee
          : (reciprocalFee as double?),
      blackoutDates: blackoutDates == _undefined
          ? _instance.blackoutDates
          : (blackoutDates as List<DateTime>?),
      specialConditions: specialConditions == _undefined
          ? _instance.specialConditions
          : (specialConditions as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$ReciprocalAgreement$reciprocalAgreement$terms<
  TRes
>
    implements
        CopyWith$Query$ReciprocalAgreement$reciprocalAgreement$terms<TRes> {
  _CopyWithStubImpl$Query$ReciprocalAgreement$reciprocalAgreement$terms(
    this._res,
  );

  TRes _res;

  call({
    int? maxVisitsPerMonth,
    double? reciprocalFee,
    List<DateTime>? blackoutDates,
    String? specialConditions,
    String? $__typename,
  }) => _res;
}
