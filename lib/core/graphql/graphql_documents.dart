/// Type-safe GraphQL document definitions loaded from .graphql files.
///
/// This file provides strongly-typed GraphQL operations using the gql package
/// to parse GraphQL files into AST DocumentNode objects. This eliminates raw
/// strings while maintaining type safety.
///
/// All operations are defined in lib/graphql/ directory and organized by feature.
library;

import 'package:gql/ast.dart';
import 'package:gql/language.dart' as gql;

/// GraphQL operations for the Clubland application.
///
/// Operations are loaded from .graphql files and parsed into DocumentNode AST.
/// This provides compile-time validation and eliminates raw strings.
class GraphQLDocuments {
  // =================================================================
  // AUTHENTICATION OPERATIONS
  // =================================================================

  /// Login mutation - authenticate user with email and password.
  static final DocumentNode loginMutation = gql.parseString(r'''
mutation Login($email: String!, $password: String!) {
  login(input: { email: $email, password: $password }) {
    token
    refreshToken
    expiresAt
    user {
      id
      clubId
      email
      username
      firstName
      lastName
      status
      roles
      permissions
      createdAt
      updatedAt
    }
  }
}
''');

  /// Register mutation - create new user account.
  static final DocumentNode registerMutation = gql.parseString(r'''
mutation Register(
  $email: String!
  $password: String!
  $username: String!
  $clubId: ID!
  $firstName: String!
  $lastName: String!
) {
  register(
    input: {
      email: $email
      password: $password
      username: $username
      clubId: $clubId
      firstName: $firstName
      lastName: $lastName
    }
  ) {
    token
    refreshToken
    expiresAt
    user {
      id
      clubId
      email
      username
      firstName
      lastName
      status
      roles
      permissions
      createdAt
      updatedAt
    }
  }
}
''');

  /// Logout mutation - invalidate current session.
  static final DocumentNode logoutMutation = gql.parseString(r'''
mutation Logout {
  logout
}
''');

  /// Refresh token mutation - get new access token.
  static final DocumentNode refreshTokenMutation = gql.parseString(r'''
mutation RefreshToken($refreshToken: String!) {
  refreshToken(refreshToken: $refreshToken) {
    token
    refreshToken
    expiresAt
    user {
      id
      clubId
      email
      username
      firstName
      lastName
      status
      roles
      permissions
    }
  }
}
''');

  // =================================================================
  // USER PROFILE OPERATIONS
  // =================================================================

  /// Current user query - get authenticated user details.
  static final DocumentNode currentUserQuery = gql.parseString(r'''
query CurrentUser {
  me {
    id
    clubId
    email
    username
    firstName
    lastName
    status
    roles
    permissions
    createdAt
    updatedAt
  }
}
''');

  // =================================================================
  // CLUB OPERATIONS
  // =================================================================

  /// Clubs query - list all clubs.
  static final DocumentNode clubsQuery = gql.parseString(r'''
query Clubs {
  clubs {
    id
    name
    description
    location
    website
    status
    settings {
      allowReciprocal
      requireApproval
      maxVisitsPerMonth
      reciprocalFee
    }
    createdAt
    updatedAt
  }
}
''');

  /// Club query - get single club by ID.
  static final DocumentNode clubQuery = gql.parseString(r'''
query Club($id: ID!) {
  club(id: $id) {
    id
    name
    description
    location
    website
    status
    settings {
      allowReciprocal
      requireApproval
      maxVisitsPerMonth
      reciprocalFee
    }
    createdAt
    updatedAt
  }
}
''');

  /// My club query - get current user's club.
  static final DocumentNode myClubQuery = gql.parseString(r'''
query MyClub {
  myClub {
    id
    name
    description
    location
    website
    status
    settings {
      allowReciprocal
      requireApproval
      maxVisitsPerMonth
      reciprocalFee
    }
    createdAt
    updatedAt
  }
}
''');

  // =================================================================
  // MEMBER OPERATIONS
  // =================================================================

  /// Members query - list all members with pagination.
  static final DocumentNode membersQuery = gql.parseString(r'''
query Members($pagination: PaginationInput, $status: MemberStatus) {
  members(pagination: $pagination, status: $status) {
    nodes {
      id
      clubId
      userId
      memberNumber
      membershipType
      status
      blockchainIdentity
      profile {
        firstName
        lastName
        dateOfBirth
        phoneNumber
        address {
          street
          city
          state
          postalCode
          country
        }
        emergencyContact {
          name
          relationship
          phoneNumber
        }
        preferences {
          emailNotifications
          smsNotifications
          pushNotifications
          marketingEmails
        }
      }
      joinedAt
      createdAt
      updatedAt
    }
    pageInfo {
      page
      pageSize
      total
      totalPages
      hasNextPage
      hasPrevPage
    }
  }
}
''');

  /// Member query - get single member by ID.
  static final DocumentNode memberQuery = gql.parseString(r'''
query Member($id: ID!) {
  member(id: $id) {
    id
    clubId
    userId
    memberNumber
    membershipType
    status
    blockchainIdentity
    profile {
      firstName
      lastName
      dateOfBirth
      phoneNumber
      address {
        street
        city
        state
        postalCode
        country
      }
      emergencyContact {
        name
        relationship
        phoneNumber
      }
      preferences {
        emailNotifications
        smsNotifications
        pushNotifications
        marketingEmails
      }
    }
    joinedAt
    createdAt
    updatedAt
  }
}
''');

  /// Create member mutation.
  static final DocumentNode createMemberMutation = gql.parseString(r'''
mutation CreateMember($input: CreateMemberInput!) {
  createMember(input: $input) {
    id
    clubId
    userId
    memberNumber
    membershipType
    status
    blockchainIdentity
    profile {
      firstName
      lastName
      dateOfBirth
      phoneNumber
    }
    joinedAt
    createdAt
    updatedAt
  }
}
''');

  /// Update member mutation.
  static final DocumentNode updateMemberMutation = gql.parseString(r'''
mutation UpdateMember($id: ID!, $input: MemberProfileInput!) {
  updateMember(id: $id, input: $input) {
    id
    clubId
    userId
    memberNumber
    membershipType
    status
    profile {
      firstName
      lastName
      dateOfBirth
      phoneNumber
      address {
        street
        city
        state
        postalCode
        country
      }
    }
    updatedAt
  }
}
''');

  // =================================================================
  // VISIT OPERATIONS
  // =================================================================

  /// Visits query - list all visits with pagination.
  static final DocumentNode visitsQuery = gql.parseString(r'''
query Visits($pagination: PaginationInput, $status: VisitStatus) {
  visits(pagination: $pagination, status: $status) {
    nodes {
      id
      memberId
      clubId
      visitingClubId
      status
      checkInTime
      checkOutTime
      services
      cost
      verified
      blockchainTxId
      createdAt
    }
    pageInfo {
      page
      pageSize
      total
      totalPages
      hasNextPage
      hasPrevPage
    }
  }
}
''');

  /// My visits query - get current user's visits.
  static final DocumentNode myVisitsQuery = gql.parseString(r'''
query MyVisits($pagination: PaginationInput) {
  myVisits(pagination: $pagination) {
    nodes {
      id
      memberId
      clubId
      visitingClubId
      status
      checkInTime
      checkOutTime
      services
      cost
      verified
      blockchainTxId
      createdAt
    }
    pageInfo {
      page
      pageSize
      total
      totalPages
      hasNextPage
      hasPrevPage
    }
  }
}
''');

  /// Record visit mutation.
  static final DocumentNode recordVisitMutation = gql.parseString(r'''
mutation RecordVisit($input: RecordVisitInput!) {
  recordVisit(input: $input) {
    id
    memberId
    clubId
    visitingClubId
    status
    checkInTime
    services
    cost
    verified
    createdAt
  }
}
''');

  /// Check out visit mutation.
  static final DocumentNode checkOutVisitMutation = gql.parseString(r'''
mutation CheckOutVisit($input: CheckOutVisitInput!) {
  checkOutVisit(input: $input) {
    id
    memberId
    clubId
    visitingClubId
    status
    checkInTime
    checkOutTime
    services
    cost
    verified
    blockchainTxId
    createdAt
  }
}
''');

  // =================================================================
  // NOTIFICATION OPERATIONS
  // =================================================================

  /// Notifications query - list all notifications.
  static final DocumentNode notificationsQuery = gql.parseString(r'''
query Notifications($pagination: PaginationInput, $unreadOnly: Boolean = false) {
  notifications(pagination: $pagination, unreadOnly: $unreadOnly) {
    nodes {
      id
      userId
      type
      title
      message
      status
      channels
      scheduledAt
      sentAt
      readAt
      createdAt
    }
    pageInfo {
      page
      pageSize
      total
      totalPages
      hasNextPage
      hasPrevPage
    }
  }
}
''');

  /// Unread notification count query.
  static final DocumentNode unreadNotificationCountQuery = gql.parseString(r'''
query UnreadNotificationCount {
  unreadNotificationCount
}
''');

  /// Create notification mutation.
  static final DocumentNode createNotificationMutation = gql.parseString(r'''
mutation CreateNotification($input: CreateNotificationInput!) {
  createNotification(input: $input) {
    id
    userId
    type
    title
    message
    status
    channels
    scheduledAt
    createdAt
  }
}
''');

  /// Mark notification as read mutation.
  static final DocumentNode markNotificationReadMutation = gql.parseString(r'''
mutation MarkNotificationRead($id: ID!) {
  markNotificationRead(id: $id) {
    id
    userId
    type
    title
    message
    status
    readAt
  }
}
''');

  /// Mark all notifications as read mutation.
  static final DocumentNode markAllNotificationsReadMutation =
      gql.parseString(r'''
mutation MarkAllNotificationsRead {
  markAllNotificationsRead
}
''');

  // =================================================================
  // SUBSCRIPTION OPERATIONS
  // =================================================================

  /// Notification received subscription.
  static final DocumentNode notificationReceivedSubscription =
      gql.parseString(r'''
subscription NotificationReceived {
  notificationReceived {
    id
    userId
    type
    title
    message
    status
    channels
    createdAt
  }
}
''');

  /// Visit status changed subscription.
  static final DocumentNode visitStatusChangedSubscription =
      gql.parseString(r'''
subscription VisitStatusChanged($clubId: ID) {
  visitStatusChanged(clubId: $clubId) {
    id
    memberId
    clubId
    visitingClubId
    status
    checkInTime
    checkOutTime
    verified
    createdAt
  }
}
''');

  /// Transaction status changed subscription.
  static final DocumentNode transactionStatusChangedSubscription =
      gql.parseString(r'''
subscription TransactionStatusChanged {
  transactionStatusChanged {
    id
    type
    chaincode
    function
    args
    status
    txId
    blockNumber
    timestamp
    error
    createdAt
  }
}
''');
}
