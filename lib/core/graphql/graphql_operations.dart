/// @deprecated Use generated GraphQL operations from graphql_api.dart instead.
///
/// This file contains legacy raw string GraphQL operations.
/// The new graphql_codegen approach provides:
/// - Fully type-safe generated Dart classes
/// - Automatic serialization/deserialization
/// - Better IDE support and autocomplete
/// - Compile-time validation against schema
/// - Operations aligned with the actual backend schema
///
/// Migration guide:
/// ```dart
/// // Old (deprecated):
/// final result = await client.mutate(
///   MutationOptions(
///     document: gql(GraphQLOperations.loginMutation),
///   ),
/// );
///
/// // New (recommended):
/// import 'package:clubland/core/graphql/graphql_api.dart';
///
/// final result = await client.mutate(
///   MutationOptions(
///     document: documentNodeMutationLogin,
///     variables: Variables$Mutation$Login(
///       email: 'user@example.com',
///       password: 'password123',
///     ).toJson(),
///   ),
/// );
///
/// final data = Mutation$Login.fromJson(result.data!);
/// ```
@Deprecated(
  'Use generated operations from graphql_api.dart instead. '
  'This provides fully type-safe GraphQL operations.',
)
library;

// Re-export the new generated API
export 'graphql_api.dart';
