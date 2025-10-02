/// @deprecated Use [GraphQLDocuments] instead for type-safe GraphQL operations.
///
/// This file contains legacy raw string GraphQL operations.
/// The new [GraphQLDocuments] class in graphql_documents.dart provides:
/// - Type-safe DocumentNode AST instead of raw strings
/// - Better IDE support and autocomplete
/// - Compile-time validation
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
/// final result = await client.mutate(
///   MutationOptions(
///     document: GraphQLDocuments.loginMutation,
///   ),
/// );
/// ```
@Deprecated(
  'Use GraphQLDocuments from graphql_documents.dart instead. '
  'This provides type-safe DocumentNode operations.',
)
library;

export 'graphql_documents.dart' show GraphQLDocuments;

/// Legacy GraphQL operations class.
///
/// @deprecated Use [GraphQLDocuments] instead.
@Deprecated('Use GraphQLDocuments instead')
class GraphQLOperations {
  /// @deprecated Use GraphQLDocuments.loginMutation instead
  @Deprecated('Use GraphQLDocuments.loginMutation')
  static const String loginMutation = r'''
    mutation Login($email: String!, $password: String!) {
      login(input: {
        email: $email
        password: $password
      }) {
        session {
          id
          expiresAt
          user {
            id
            email
            firstName
            lastName
            avatar
          }
        }
        tokens {
          accessToken
          refreshToken
          expiresIn
        }
      }
    }
  ''';

  /// @deprecated Use GraphQLDocuments.registerMutation instead
  @Deprecated('Use GraphQLDocuments.registerMutation')
  static const String registerMutation = r'''
    mutation Register(
      $email: String!
      $password: String!
      $firstName: String!
      $lastName: String!
      $clubCode: String
    ) {
      register(input: {
        email: $email
        password: $password
        firstName: $firstName
        lastName: $lastName
        clubCode: $clubCode
      }) {
        session {
          id
          expiresAt
          user {
            id
            email
            firstName
            lastName
          }
        }
        tokens {
          accessToken
          refreshToken
          expiresIn
        }
      }
    }
  ''';

  /// @deprecated Use GraphQLDocuments.logoutMutation instead
  @Deprecated('Use GraphQLDocuments.logoutMutation')
  static const String logoutMutation = '''
    mutation Logout {
      logout {
        success
        message
      }
    }
  ''';
}
