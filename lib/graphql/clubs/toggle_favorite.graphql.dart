import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$ToggleFavoriteClub {
  factory Variables$Mutation$ToggleFavoriteClub({required String clubId}) =>
      Variables$Mutation$ToggleFavoriteClub._({r'clubId': clubId});

  Variables$Mutation$ToggleFavoriteClub._(this._$data);

  factory Variables$Mutation$ToggleFavoriteClub.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$clubId = data['clubId'];
    result$data['clubId'] = (l$clubId as String);
    return Variables$Mutation$ToggleFavoriteClub._(result$data);
  }

  Map<String, dynamic> _$data;

  String get clubId => (_$data['clubId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$clubId = clubId;
    result$data['clubId'] = l$clubId;
    return result$data;
  }

  CopyWith$Variables$Mutation$ToggleFavoriteClub<
    Variables$Mutation$ToggleFavoriteClub
  >
  get copyWith =>
      CopyWith$Variables$Mutation$ToggleFavoriteClub(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ToggleFavoriteClub ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$clubId = clubId;
    final lOther$clubId = other.clubId;
    if (l$clubId != lOther$clubId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$clubId = clubId;
    return Object.hashAll([l$clubId]);
  }
}

abstract class CopyWith$Variables$Mutation$ToggleFavoriteClub<TRes> {
  factory CopyWith$Variables$Mutation$ToggleFavoriteClub(
    Variables$Mutation$ToggleFavoriteClub instance,
    TRes Function(Variables$Mutation$ToggleFavoriteClub) then,
  ) = _CopyWithImpl$Variables$Mutation$ToggleFavoriteClub;

  factory CopyWith$Variables$Mutation$ToggleFavoriteClub.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ToggleFavoriteClub;

  TRes call({String? clubId});
}

class _CopyWithImpl$Variables$Mutation$ToggleFavoriteClub<TRes>
    implements CopyWith$Variables$Mutation$ToggleFavoriteClub<TRes> {
  _CopyWithImpl$Variables$Mutation$ToggleFavoriteClub(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ToggleFavoriteClub _instance;

  final TRes Function(Variables$Mutation$ToggleFavoriteClub) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? clubId = _undefined}) => _then(
    Variables$Mutation$ToggleFavoriteClub._({
      ..._instance._$data,
      if (clubId != _undefined && clubId != null) 'clubId': (clubId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$ToggleFavoriteClub<TRes>
    implements CopyWith$Variables$Mutation$ToggleFavoriteClub<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ToggleFavoriteClub(this._res);

  TRes _res;

  call({String? clubId}) => _res;
}

class Mutation$ToggleFavoriteClub {
  Mutation$ToggleFavoriteClub({
    required this.toggleFavoriteClub,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ToggleFavoriteClub.fromJson(Map<String, dynamic> json) {
    final l$toggleFavoriteClub = json['toggleFavoriteClub'];
    final l$$__typename = json['__typename'];
    return Mutation$ToggleFavoriteClub(
      toggleFavoriteClub: (l$toggleFavoriteClub as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool toggleFavoriteClub;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$toggleFavoriteClub = toggleFavoriteClub;
    _resultData['toggleFavoriteClub'] = l$toggleFavoriteClub;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$toggleFavoriteClub = toggleFavoriteClub;
    final l$$__typename = $__typename;
    return Object.hashAll([l$toggleFavoriteClub, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ToggleFavoriteClub ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$toggleFavoriteClub = toggleFavoriteClub;
    final lOther$toggleFavoriteClub = other.toggleFavoriteClub;
    if (l$toggleFavoriteClub != lOther$toggleFavoriteClub) {
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

extension UtilityExtension$Mutation$ToggleFavoriteClub
    on Mutation$ToggleFavoriteClub {
  CopyWith$Mutation$ToggleFavoriteClub<Mutation$ToggleFavoriteClub>
  get copyWith => CopyWith$Mutation$ToggleFavoriteClub(this, (i) => i);
}

abstract class CopyWith$Mutation$ToggleFavoriteClub<TRes> {
  factory CopyWith$Mutation$ToggleFavoriteClub(
    Mutation$ToggleFavoriteClub instance,
    TRes Function(Mutation$ToggleFavoriteClub) then,
  ) = _CopyWithImpl$Mutation$ToggleFavoriteClub;

  factory CopyWith$Mutation$ToggleFavoriteClub.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ToggleFavoriteClub;

  TRes call({bool? toggleFavoriteClub, String? $__typename});
}

class _CopyWithImpl$Mutation$ToggleFavoriteClub<TRes>
    implements CopyWith$Mutation$ToggleFavoriteClub<TRes> {
  _CopyWithImpl$Mutation$ToggleFavoriteClub(this._instance, this._then);

  final Mutation$ToggleFavoriteClub _instance;

  final TRes Function(Mutation$ToggleFavoriteClub) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? toggleFavoriteClub = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ToggleFavoriteClub(
      toggleFavoriteClub:
          toggleFavoriteClub == _undefined || toggleFavoriteClub == null
          ? _instance.toggleFavoriteClub
          : (toggleFavoriteClub as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$ToggleFavoriteClub<TRes>
    implements CopyWith$Mutation$ToggleFavoriteClub<TRes> {
  _CopyWithStubImpl$Mutation$ToggleFavoriteClub(this._res);

  TRes _res;

  call({bool? toggleFavoriteClub, String? $__typename}) => _res;
}

const documentNodeMutationToggleFavoriteClub = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ToggleFavoriteClub'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'clubId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'toggleFavoriteClub'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'clubId'),
                value: VariableNode(name: NameNode(value: 'clubId')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'club'),
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
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'slug'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'logo'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'userRelation'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'favorited'),
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
                  name: NameNode(value: 'success'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'message'),
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
Mutation$ToggleFavoriteClub _parserFn$Mutation$ToggleFavoriteClub(
  Map<String, dynamic> data,
) => Mutation$ToggleFavoriteClub.fromJson(data);
typedef OnMutationCompleted$Mutation$ToggleFavoriteClub =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$ToggleFavoriteClub?,
    );

class Options$Mutation$ToggleFavoriteClub
    extends graphql.MutationOptions<Mutation$ToggleFavoriteClub> {
  Options$Mutation$ToggleFavoriteClub({
    String? operationName,
    required Variables$Mutation$ToggleFavoriteClub variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ToggleFavoriteClub? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ToggleFavoriteClub? onCompleted,
    graphql.OnMutationUpdate<Mutation$ToggleFavoriteClub>? update,
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
                     : _parserFn$Mutation$ToggleFavoriteClub(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationToggleFavoriteClub,
         parserFn: _parserFn$Mutation$ToggleFavoriteClub,
       );

  final OnMutationCompleted$Mutation$ToggleFavoriteClub? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$ToggleFavoriteClub
    extends graphql.WatchQueryOptions<Mutation$ToggleFavoriteClub> {
  WatchOptions$Mutation$ToggleFavoriteClub({
    String? operationName,
    required Variables$Mutation$ToggleFavoriteClub variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ToggleFavoriteClub? typedOptimisticResult,
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
         document: documentNodeMutationToggleFavoriteClub,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$ToggleFavoriteClub,
       );
}

extension ClientExtension$Mutation$ToggleFavoriteClub on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ToggleFavoriteClub>>
  mutate$ToggleFavoriteClub(
    Options$Mutation$ToggleFavoriteClub options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$ToggleFavoriteClub>
  watchMutation$ToggleFavoriteClub(
    WatchOptions$Mutation$ToggleFavoriteClub options,
  ) => this.watchMutation(options);
}
