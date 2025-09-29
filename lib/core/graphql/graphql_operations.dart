/// Comprehensive GraphQL operations for Clubland app.
///
/// Contains all GraphQL queries, mutations, and subscriptions organized by
/// feature area. Each operation is defined as a static constant string using
/// raw strings for proper formatting.
class GraphQLOperations {
  // =================================================================
  // AUTHENTICATION OPERATIONS
  // =================================================================

  /// Login mutation - authenticate user with email and password.
  ///
  /// Returns session data including user profile, tokens, and permissions.
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
            profile {
              bio
              interests
              memberSince
              totalVisits
              favoriteClubs
            }
            roles {
              id
              name
              permissions
            }
            clubMemberships {
              id
              club {
                id
                name
                logo
              }
              role
              joinedAt
            }
            preferences {
              theme
              notifications {
                bookingReminders
                clubUpdates
                socialActivity
              }
              privacy {
                showProfile
                showActivity
                allowMessages
              }
            }
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

  /// Register mutation - create a new user account.
  ///
  /// Creates a new user with email, password, and profile information.
  /// Optionally accepts a club code for initial club membership.
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
            avatar
            profile {
              bio
              interests
              memberSince
              totalVisits
              favoriteClubs
            }
            roles {
              id
              name
              permissions
            }
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

  /// Logout mutation - invalidate current user session.
  ///
  /// Terminates the user's session on the server and invalidates tokens.
  static const String logoutMutation = '''
    mutation Logout {
      logout {
        success
        message
      }
    }
  ''';

  static const String refreshTokenMutation = r'''
    mutation RefreshToken($refreshToken: String!) {
      refreshToken(token: $refreshToken) {
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

  // =================================================================
  // USER PROFILE OPERATIONS
  // =================================================================

  static const String currentUserQuery = '''
    query CurrentUser {
      me {
        id
        email
        firstName
        lastName
        avatar
        profile {
          bio
          interests
          memberSince
          totalVisits
          favoriteClubs
        }
        roles {
          id
          name
          permissions
        }
        clubMemberships {
          id
          club {
            id
            name
            logo
            address
          }
          role
          joinedAt
          isActive
        }
        preferences {
          theme
          notifications {
            bookingReminders
            clubUpdates
            socialActivity
            pushEnabled
            emailEnabled
          }
          privacy {
            showProfile
            showActivity
            allowMessages
          }
        }
        recentActivity {
          id
          type
          description
          createdAt
          metadata
        }
      }
    }
  ''';

  static const String updateProfileMutation = r'''
    mutation UpdateProfile($input: UpdateProfileInput!) {
      updateProfile(input: $input) {
        user {
          id
          firstName
          lastName
          avatar
          profile {
            bio
            interests
            memberSince
            totalVisits
            favoriteClubs
          }
        }
        success
        message
      }
    }
  ''';

  static const String uploadAvatarMutation = r'''
    mutation UploadAvatar($file: Upload!) {
      uploadAvatar(file: $file) {
        user {
          id
          avatar
        }
        success
        message
      }
    }
  ''';

  static const String updatePreferencesMutation = r'''
    mutation UpdatePreferences($input: UpdatePreferencesInput!) {
      updatePreferences(input: $input) {
        preferences {
          theme
          notifications {
            bookingReminders
            clubUpdates
            socialActivity
            pushEnabled
            emailEnabled
          }
          privacy {
            showProfile
            showActivity
            allowMessages
          }
        }
        success
        message
      }
    }
  ''';

  // =================================================================
  // CLUB DISCOVERY OPERATIONS
  // =================================================================

  static const String clubsQuery = r'''
    query Clubs(
      $filter: ClubFilterInput
      $sort: ClubSortInput
      $pagination: PaginationInput
    ) {
      clubs(filter: $filter, sort: $sort, pagination: $pagination) {
        nodes {
          id
          name
          slug
          description
          address {
            street
            city
            state
            country
            postalCode
            coordinates {
              latitude
              longitude
            }
          }
          logo
          coverImage
          images
          amenities {
            id
            name
            icon
            category
          }
          facilities {
            id
            name
            description
            capacity
            bookingRequired
            amenities
          }
          operatingHours {
            dayOfWeek
            openTime
            closeTime
            isOpen
          }
          contact {
            phone
            email
            website
            socialMedia {
              platform
              url
            }
          }
          membership {
            isPublic
            requiresApplication
            monthlyFee
            initiatonFee
            benefits
          }
          stats {
            totalMembers
            activeMembers
            totalBookings
            averageRating
            totalReviews
          }
          userRelation {
            isMember
            membershipStatus
            joinedAt
            favorited
            visited
            lastVisitAt
          }
        }
        pageInfo {
          hasNextPage
          hasPreviousPage
          startCursor
          endCursor
          totalCount
        }
      }
    }
  ''';

  static const String clubDetailsQuery = r'''
    query ClubDetails($id: ID!) {
      club(id: $id) {
        id
        name
        slug
        description
        address {
          street
          city
          state
          country
          postalCode
          coordinates {
            latitude
            longitude
          }
        }
        logo
        coverImage
        images
        amenities {
          id
          name
          icon
          category
          description
        }
        facilities {
          id
          name
          description
          capacity
          bookingRequired
          amenities
          images
          operatingHours {
            dayOfWeek
            openTime
            closeTime
            isOpen
          }
        }
        operatingHours {
          dayOfWeek
          openTime
          closeTime
          isOpen
        }
        contact {
          phone
          email
          website
          socialMedia {
            platform
            url
          }
        }
        membership {
          isPublic
          requiresApplication
          monthlyFee
          initiatonFee
          benefits
          applicationForm
        }
        staff {
          id
          user {
            id
            firstName
            lastName
            avatar
          }
          role
          bio
          specialties
        }
        events {
          id
          title
          description
          startTime
          endTime
          facility {
            id
            name
          }
          organizer {
            id
            firstName
            lastName
          }
          capacity
          spotsRemaining
          isPublic
        }
        reviews {
          id
          rating
          comment
          createdAt
          user {
            id
            firstName
            lastName
            avatar
          }
          aspects {
            cleanliness
            staff
            facilities
            value
          }
        }
        stats {
          totalMembers
          activeMembers
          totalBookings
          averageRating
          totalReviews
          popularTimes {
            dayOfWeek
            hour
            popularity
          }
        }
        userRelation {
          isMember
          membershipStatus
          joinedAt
          favorited
          visited
          lastVisitAt
          bookings {
            id
            startTime
            endTime
            status
          }
        }
      }
    }
  ''';

  static const String searchClubsQuery = r'''
    query SearchClubs(
      $query: String!
      $location: LocationInput
      $radius: Float
      $amenities: [String!]
      $pagination: PaginationInput
    ) {
      searchClubs(
        query: $query
        location: $location
        radius: $radius
        amenities: $amenities
        pagination: $pagination
      ) {
        nodes {
          id
          name
          slug
          description
          address {
            street
            city
            state
            coordinates {
              latitude
              longitude
            }
          }
          logo
          coverImage
          amenities {
            id
            name
            icon
          }
          stats {
            averageRating
            totalReviews
            totalMembers
          }
          userRelation {
            isMember
            favorited
          }
          distance
        }
        pageInfo {
          hasNextPage
          totalCount
        }
      }
    }
  ''';

  // =================================================================
  // BOOKING OPERATIONS
  // =================================================================

  static const String userBookingsQuery = r'''
    query UserBookings(
      $filter: BookingFilterInput
      $pagination: PaginationInput
    ) {
      myBookings(filter: $filter, pagination: $pagination) {
        nodes {
          id
          startTime
          endTime
          status
          notes
          createdAt
          updatedAt
          club {
            id
            name
            logo
            address {
              city
              state
            }
          }
          facility {
            id
            name
            description
            capacity
          }
          participants {
            id
            user {
              id
              firstName
              lastName
              avatar
            }
            role
            status
          }
          cancellation {
            reason
            cancelledAt
            refundAmount
          }
          payment {
            amount
            currency
            status
            method
          }
        }
        pageInfo {
          hasNextPage
          totalCount
        }
      }
    }
  ''';

  static const String facilityAvailabilityQuery = r'''
    query FacilityAvailability(
      $facilityId: ID!
      $startDate: DateTime!
      $endDate: DateTime!
    ) {
      facilityAvailability(
        facilityId: $facilityId
        startDate: $startDate
        endDate: $endDate
      ) {
        facility {
          id
          name
          capacity
          bookingSettings {
            minBookingDuration
            maxBookingDuration
            advanceBookingLimit
            cancellationPolicy
          }
        }
        availableSlots {
          startTime
          endTime
          available
          capacity
          remainingSpots
          price {
            amount
            currency
          }
        }
        bookedSlots {
          id
          startTime
          endTime
          participant {
            id
            firstName
            lastName
          }
        }
      }
    }
  ''';

  static const String createBookingMutation = r'''
    mutation CreateBooking($input: CreateBookingInput!) {
      createBooking(input: $input) {
        booking {
          id
          startTime
          endTime
          status
          notes
          club {
            id
            name
            logo
          }
          facility {
            id
            name
            description
          }
          participants {
            id
            user {
              id
              firstName
              lastName
            }
            role
            status
          }
          payment {
            amount
            currency
            status
            method
          }
        }
        success
        message
      }
    }
  ''';

  static const String cancelBookingMutation = r'''
    mutation CancelBooking($bookingId: ID!, $reason: String) {
      cancelBooking(bookingId: $bookingId, reason: $reason) {
        booking {
          id
          status
          cancellation {
            reason
            cancelledAt
            refundAmount
          }
        }
        success
        message
      }
    }
  ''';

  static const String updateBookingMutation = r'''
    mutation UpdateBooking($bookingId: ID!, $input: UpdateBookingInput!) {
      updateBooking(bookingId: $bookingId, input: $input) {
        booking {
          id
          startTime
          endTime
          notes
          participants {
            id
            user {
              id
              firstName
              lastName
            }
            role
            status
          }
        }
        success
        message
      }
    }
  ''';

  // =================================================================
  // SOCIAL FEATURES
  // =================================================================

  static const String userActivityQuery = r'''
    query UserActivity(
      $userId: ID
      $filter: ActivityFilterInput
      $pagination: PaginationInput
    ) {
      userActivity(userId: $userId, filter: $filter, pagination: $pagination) {
        nodes {
          id
          type
          title
          description
          createdAt
          user {
            id
            firstName
            lastName
            avatar
          }
          club {
            id
            name
            logo
          }
          metadata
          interactions {
            likes
            comments
            shares
            userLiked
            userCommented
          }
          comments {
            id
            text
            createdAt
            user {
              id
              firstName
              lastName
              avatar
            }
          }
        }
        pageInfo {
          hasNextPage
          totalCount
        }
      }
    }
  ''';

  static const String clubReviewsQuery = r'''
    query ClubReviews(
      $clubId: ID!
      $filter: ReviewFilterInput
      $pagination: PaginationInput
    ) {
      clubReviews(clubId: $clubId, filter: $filter, pagination: $pagination) {
        nodes {
          id
          rating
          comment
          createdAt
          updatedAt
          user {
            id
            firstName
            lastName
            avatar
          }
          aspects {
            cleanliness
            staff
            facilities
            value
          }
          helpful {
            count
            userMarkedHelpful
          }
          responses {
            id
            text
            createdAt
            author {
              id
              firstName
              lastName
              role
            }
          }
        }
        pageInfo {
          hasNextPage
          totalCount
        }
        stats {
          averageRating
          totalReviews
          ratingDistribution {
            rating
            count
            percentage
          }
          aspectAverages {
            cleanliness
            staff
            facilities
            value
          }
        }
      }
    }
  ''';

  static const String createReviewMutation = r'''
    mutation CreateReview($input: CreateReviewInput!) {
      createReview(input: $input) {
        review {
          id
          rating
          comment
          createdAt
          user {
            id
            firstName
            lastName
            avatar
          }
          aspects {
            cleanliness
            staff
            facilities
            value
          }
        }
        success
        message
      }
    }
  ''';

  static const String likeActivityMutation = r'''
    mutation LikeActivity($activityId: ID!) {
      likeActivity(activityId: $activityId) {
        activity {
          id
          interactions {
            likes
            userLiked
          }
        }
        success
      }
    }
  ''';

  static const String addCommentMutation = r'''
    mutation AddComment($activityId: ID!, $text: String!) {
      addComment(activityId: $activityId, text: $text) {
        comment {
          id
          text
          createdAt
          user {
            id
            firstName
            lastName
            avatar
          }
        }
        success
      }
    }
  ''';

  // =================================================================
  // SUBSCRIPTION OPERATIONS
  // =================================================================

  static const String bookingUpdatesSubscription = r'''
    subscription BookingUpdates($userId: ID!) {
      bookingUpdates(userId: $userId) {
        type
        booking {
          id
          startTime
          endTime
          status
          club {
            id
            name
            logo
          }
          facility {
            id
            name
          }
        }
        message
        timestamp
      }
    }
  ''';

  static const String clubActivitySubscription = r'''
    subscription ClubActivity($clubId: ID!) {
      clubActivity(clubId: $clubId) {
        type
        activity {
          id
          type
          title
          description
          createdAt
          user {
            id
            firstName
            lastName
            avatar
          }
          metadata
        }
        timestamp
      }
    }
  ''';

  static const String notificationsSubscription = r'''
    subscription Notifications($userId: ID!) {
      notifications(userId: $userId) {
        id
        type
        title
        message
        data
        createdAt
        read
        actionUrl
      }
    }
  ''';

  // =================================================================
  // ADMIN OPERATIONS (Club Management)
  // =================================================================

  static const String clubMembersQuery = r'''
    query ClubMembers(
      $clubId: ID!
      $filter: MemberFilterInput
      $pagination: PaginationInput
    ) {
      clubMembers(clubId: $clubId, filter: $filter, pagination: $pagination) {
        nodes {
          id
          user {
            id
            email
            firstName
            lastName
            avatar
            profile {
              totalVisits
              memberSince
            }
          }
          role
          joinedAt
          status
          permissions
          lastActivity
          totalBookings
          totalSpent
        }
        pageInfo {
          hasNextPage
          totalCount
        }
      }
    }
  ''';

  static const String clubBookingsQuery = r'''
    query ClubBookings(
      $clubId: ID!
      $filter: BookingFilterInput
      $pagination: PaginationInput
    ) {
      clubBookings(clubId: $clubId, filter: $filter, pagination: $pagination) {
        nodes {
          id
          startTime
          endTime
          status
          notes
          user {
            id
            firstName
            lastName
            avatar
          }
          facility {
            id
            name
          }
          payment {
            amount
            currency
            status
          }
          createdAt
        }
        pageInfo {
          hasNextPage
          totalCount
        }
        stats {
          totalRevenue
          totalBookings
          averageBookingValue
          occupancyRate
        }
      }
    }
  ''';

  static const String updateClubMutation = r'''
    mutation UpdateClub($clubId: ID!, $input: UpdateClubInput!) {
      updateClub(clubId: $clubId, input: $input) {
        club {
          id
          name
          description
          address {
            street
            city
            state
            postalCode
          }
          contact {
            phone
            email
            website
          }
          operatingHours {
            dayOfWeek
            openTime
            closeTime
            isOpen
          }
        }
        success
        message
      }
    }
  ''';
}
