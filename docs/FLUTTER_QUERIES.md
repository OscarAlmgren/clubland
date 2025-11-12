# Flutter GraphQL Query Examples

This document contains the correct GraphQL queries for the Clubland Flutter app.

## Club Queries with Pagination

### Nearby Clubs Query

```graphql
query NearbyClubs($latitude: Float!, $longitude: Float!, $radius: Float, $pagination: PaginationInput) {
  nearbyClubs(latitude: $latitude, longitude: $longitude, radius: $radius, pagination: $pagination) {
    nodes {
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
      }
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
```

**Variables:**
```json
{
  "latitude": 37.7749,
  "longitude": -122.4194,
  "radius": 50.0,
  "pagination": {
    "page": 1,
    "pageSize": 10
  }
}
```

### Featured Clubs Query

```graphql
query FeaturedClubs($pagination: PaginationInput) {
  featuredClubs(pagination: $pagination) {
    nodes {
      id
      name
      description
      location
      website
      logo
      coverImage
      status
      settings {
        allowReciprocal
        reciprocalFee
      }
      facilities {
        id
        name
        type
        capacity
      }
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
```

**Variables:**
```json
{
  "pagination": {
    "page": 1,
    "pageSize": 20
  }
}
```

### All Clubs with Filter

```graphql
query Clubs($filter: ClubFilterInput, $pagination: PaginationInput) {
  clubs(filter: $filter, pagination: $pagination) {
    nodes {
      id
      name
      description
      location
      address
      contactEmail
      contactPhone
      website
      status
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
```

**Variables:**
```json
{
  "filter": {
    "search": "Golf",
    "city": "San Francisco",
    "status": "ACTIVE"
  },
  "pagination": {
    "page": 1,
    "pageSize": 15
  }
}
```

## Key Changes from Previous Version

### ❌ OLD (Incorrect - returns validation errors):
```graphql
query NearbyClubs {
  nearbyClubs(latitude: 37.7749, longitude: -122.4194) {
    id          # ❌ ERROR: Cannot query field "id" on type "ClubConnection"
    name        # ❌ ERROR: Cannot query field "name" on type "ClubConnection"
    description # ❌ ERROR: Cannot query field "description" on type "ClubConnection"
  }
}
```

### ✅ NEW (Correct - uses pagination wrapper):
```graphql
query NearbyClubs {
  nearbyClubs(latitude: 37.7749, longitude: -122.4194) {
    nodes {     # ✅ Access clubs through 'nodes' array
      id
      name
      description
    }
    pageInfo {  # ✅ Pagination info available
      hasNextPage
      total
    }
  }
}
```

## Flutter GraphQL Client Update

Update your Flutter GraphQL queries to use the `ClubConnection` structure:

```dart
// Before (causing errors):
final nearbyClubsQuery = gql(r'''
  query NearbyClubs($latitude: Float!, $longitude: Float!) {
    nearbyClubs(latitude: $latitude, longitude: $longitude) {
      id
      name
      description
    }
  }
''');

// After (correct):
final nearbyClubsQuery = gql(r'''
  query NearbyClubs($latitude: Float!, $longitude: Float!, $pagination: PaginationInput) {
    nearbyClubs(latitude: $latitude, longitude: $longitude, pagination: $pagination) {
      nodes {
        id
        name
        description
        location
        website
      }
      pageInfo {
        page
        pageSize
        total
        hasNextPage
      }
    }
  }
''');

// Access the data:
final clubs = result.data?['nearbyClubs']?['nodes'] as List?;
final pageInfo = result.data?['nearbyClubs']?['pageInfo'];
```

## Testing the Fixed Queries

You can test these queries using GraphQL Playground or your Flutter app after restarting the API gateway service.

**Note:** Currently both `nearbyClubs` and `featuredClubs` return empty results (logged as "not implemented") but they now return the correct pagination structure that your Flutter app expects.
