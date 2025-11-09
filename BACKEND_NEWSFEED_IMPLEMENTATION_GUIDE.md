# Backend Implementation Guide: News Feed Feature

## Overview

This document provides comprehensive specifications for implementing the News Feed feature on the backend. The News Feed is a unified, chronological stream that aggregates three types of content:

1. **News Posts** - Club announcements and updates
2. **Events** - Upcoming club events with RSVP functionality
3. **Lunch Menus** - Weekly restaurant lunch offerings

## Architecture

### Feed Aggregation Strategy

The news feed should aggregate content from multiple sources into a unified, time-ordered stream. The backend should:

- Combine news posts, events, and lunch menus into a single feed
- Sort items chronologically by their relevant timestamp
- Support pagination for efficient data loading
- Filter content based on user's club memberships
- Include user-specific context (e.g., RSVP status for events)

## Data Models

### 1. News Post

Represents club announcements, updates, and news articles.

**Database Schema:**

```sql
CREATE TABLE news_posts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    club_id UUID NOT NULL REFERENCES clubs(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    image_url VARCHAR(500),
    author VARCHAR(100),
    posted_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),

    INDEX idx_news_posts_club_id (club_id),
    INDEX idx_news_posts_posted_at (posted_at DESC)
);
```

**GraphQL Type:**

```graphql
type NewsPost {
  id: ID!
  clubId: ID!
  title: String!
  content: String!
  imageUrl: String
  author: String
  postedAt: Time!
  createdAt: Time!
  updatedAt: Time!
}

input CreateNewsPostInput {
  clubId: ID!
  title: String!
  content: String!
  imageUrl: String
  author: String
  postedAt: Time
}

input UpdateNewsPostInput {
  title: String
  content: String
  imageUrl: String
  author: String
}
```

### 2. Lunch Menu

Represents weekly restaurant lunch offerings.

**Database Schema:**

```sql
CREATE TABLE lunch_menus (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    club_id UUID NOT NULL REFERENCES clubs(id) ON DELETE CASCADE,
    week_start_date DATE NOT NULL,
    week_end_date DATE NOT NULL,
    special_notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),

    INDEX idx_lunch_menus_club_id (club_id),
    INDEX idx_lunch_menus_week_start (week_start_date DESC),
    UNIQUE INDEX idx_lunch_menus_club_week (club_id, week_start_date)
);

CREATE TABLE lunch_menu_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    lunch_menu_id UUID NOT NULL REFERENCES lunch_menus(id) ON DELETE CASCADE,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    display_order INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),

    INDEX idx_lunch_menu_items_menu_id (lunch_menu_id)
);
```

**GraphQL Type:**

```graphql
type LunchMenuItem {
  name: String!
  description: String!
  price: Float!
}

type LunchMenu {
  id: ID!
  clubId: ID!
  weekStartDate: Time!
  weekEndDate: Time!
  menuItems: [LunchMenuItem!]!
  specialNotes: String
  createdAt: Time!
  updatedAt: Time!
}

input LunchMenuItemInput {
  name: String!
  description: String!
  price: Float!
}

input CreateLunchMenuInput {
  clubId: ID!
  weekStartDate: Time!
  weekEndDate: Time!
  menuItems: [LunchMenuItemInput!]!
  specialNotes: String
}

input UpdateLunchMenuInput {
  weekStartDate: Time
  weekEndDate: Time
  menuItems: [LunchMenuItemInput!]
  specialNotes: String
}
```

### 3. News Feed Item (Union Type)

Unified wrapper for different feed content types.

**GraphQL Type:**

```graphql
enum NewsFeedItemType {
  NEWS_POST
  EVENT
  LUNCH_MENU
}

type NewsFeedItem {
  id: ID!
  type: NewsFeedItemType!
  timestamp: Time!

  # Content (only one will be populated based on type)
  newsPost: NewsPost
  event: Event
  lunchMenu: LunchMenu

  # Event-specific: User's RSVP status if applicable
  userRSVPStatus: RSVPStatus
}
```

## GraphQL API

### Queries

#### Get News Feed

Primary query for retrieving the aggregated news feed.

```graphql
type Query {
  """
  Get news feed items for the current user's clubs.
  Aggregates news posts, events, and lunch menus in chronological order.
  """
  newsFeed(
    """Club ID to filter by (optional - defaults to all user's clubs)"""
    clubId: ID

    """Maximum number of items to return"""
    limit: Int = 20

    """Cursor for pagination"""
    after: String

    """Filter by item types"""
    types: [NewsFeedItemType!]

    """Start date for filtering (optional)"""
    startDate: Time

    """End date for filtering (optional)"""
    endDate: Time
  ): NewsFeedConnection!
}

type NewsFeedConnection {
  nodes: [NewsFeedItem!]!
  edges: [NewsFeedEdge!]!
  pageInfo: PageInfo!
  totalCount: Int!
}

type NewsFeedEdge {
  node: NewsFeedItem!
  cursor: String!
}
```

**Implementation Notes:**

1. **Authorization**: Only return items for clubs the user is a member of
2. **Pagination**: Use cursor-based pagination with encoded timestamp + type + id
3. **Sorting**: Default to reverse chronological order by timestamp
4. **User Context**: Include RSVP status for events if user has responded
5. **Performance**: Consider using database views or materialized views for complex aggregation

**Example Query:**

```graphql
query GetNewsFeed($clubId: ID, $limit: Int, $after: String) {
  newsFeed(clubId: $clubId, limit: $limit, after: $after) {
    nodes {
      id
      type
      timestamp

      newsPost {
        id
        title
        content
        author
        postedAt
        imageUrl
      }

      event {
        id
        title
        description
        eventType
        startTime
        endTime
        location
        capacity
        currentAttendees
        availableSpots
        guestPolicy
        requiresPayment
        price
        fullHouseExclusive
      }

      lunchMenu {
        id
        weekStartDate
        weekEndDate
        menuItems {
          name
          description
          price
        }
        specialNotes
      }

      userRSVPStatus
    }

    pageInfo {
      hasNextPage
      endCursor
    }

    totalCount
  }
}
```

### Mutations

#### News Posts

```graphql
type Mutation {
  """Create a new news post"""
  createNewsPost(input: CreateNewsPostInput!): NewsPost!

  """Update an existing news post"""
  updateNewsPost(id: ID!, input: UpdateNewsPostInput!): NewsPost!

  """Delete a news post"""
  deleteNewsPost(id: ID!): Boolean!
}
```

**Authorization:**
- Only club admins/managers can create, update, or delete news posts
- Verify user has appropriate permissions for the club

#### Lunch Menus

```graphql
type Mutation {
  """Create a new lunch menu for a week"""
  createLunchMenu(input: CreateLunchMenuInput!): LunchMenu!

  """Update an existing lunch menu"""
  updateLunchMenu(id: ID!, input: UpdateLunchMenuInput!): LunchMenu!

  """Delete a lunch menu"""
  deleteLunchMenu(id: ID!): Boolean!
}
```

**Authorization:**
- Only restaurant managers/admins can create, update, or delete lunch menus
- Verify user has appropriate permissions

**Business Rules:**
- Only one lunch menu per club per week
- Week should start on Monday and end on Sunday
- Automatically calculate week_end_date from week_start_date if not provided

## Implementation Details

### Feed Aggregation Algorithm

The backend should efficiently combine different content types:

```sql
-- Example SQL for feed aggregation
WITH user_clubs AS (
    SELECT club_id
    FROM memberships
    WHERE user_id = $1 AND status = 'ACTIVE'
),
news_items AS (
    SELECT
        'news_' || id::text as id,
        'NEWS_POST' as type,
        posted_at as timestamp,
        id as content_id,
        club_id
    FROM news_posts
    WHERE club_id IN (SELECT club_id FROM user_clubs)
    AND posted_at >= $2  -- start_date
),
event_items AS (
    SELECT
        'event_' || id::text as id,
        'EVENT' as type,
        start_time as timestamp,
        id as content_id,
        club_id
    FROM events
    WHERE club_id IN (SELECT club_id FROM user_clubs)
    AND start_time >= $2
    AND start_time <= $3  -- end_date
),
lunch_items AS (
    SELECT
        'lunch_' || id::text as id,
        'LUNCH_MENU' as type,
        week_start_date as timestamp,
        id as content_id,
        club_id
    FROM lunch_menus
    WHERE club_id IN (SELECT club_id FROM user_clubs)
    AND week_start_date >= $2
),
combined_feed AS (
    SELECT * FROM news_items
    UNION ALL
    SELECT * FROM event_items
    UNION ALL
    SELECT * FROM lunch_items
)
SELECT * FROM combined_feed
ORDER BY timestamp DESC
LIMIT $4
OFFSET $5;
```

### RSVP Status Integration

For event items in the feed, include the user's RSVP status:

```sql
-- Join with RSVP table to get user status
SELECT
    e.*,
    r.status as user_rsvp_status
FROM events e
LEFT JOIN rsvps r ON r.event_id = e.id
    AND r.user_id = $1
    AND r.status NOT IN ('CANCELLED', 'DECLINED')
WHERE e.id IN (SELECT content_id FROM event_items);
```

### Cursor-Based Pagination

Implement cursor-based pagination for infinite scroll:

**Cursor Format:**
```
base64encode(timestamp:type:id)
```

**Decoding Logic:**
```python
def decode_cursor(cursor: str) -> tuple:
    decoded = base64.b64decode(cursor).decode('utf-8')
    timestamp, item_type, item_id = decoded.split(':')
    return timestamp, item_type, item_id

def encode_cursor(timestamp, item_type, item_id: str) -> str:
    cursor_string = f"{timestamp}:{item_type}:{item_id}"
    return base64.b64encode(cursor_string.encode('utf-8')).decode('utf-8')
```

**Pagination Query:**
```sql
-- When cursor is provided
WHERE (timestamp, type, id) < ($cursor_timestamp, $cursor_type, $cursor_id)
ORDER BY timestamp DESC, type, id
LIMIT $limit
```

## Business Logic

### News Posts

1. **Creation**: Admins can create posts with optional future posting dates
2. **Visibility**: Posts are visible to all club members
3. **Soft Delete**: Consider implementing soft deletes for audit trail
4. **Rich Content**: Support markdown or HTML in content field

### Events in Feed

1. **Upcoming Only**: Only show future events (past events excluded from feed)
2. **RSVP Status**: Include user's current RSVP status (CONFIRMED, TENTATIVE, etc.)
3. **Full Events**: Mark events as full when `availableSpots <= 0`
4. **Special Badges**:
   - "ATTENDING" - User has confirmed RSVP
   - "FULLBOKAD" - Event is at capacity
   - "FULL HOUSE EXCLUSIVE" - Event requires full house membership
   - "OTHERS WELCOME" - Event allows non-member guests

### Lunch Menus

1. **Weekly Basis**: One menu per club per week
2. **Current Week Priority**: Current week's menu should appear near top of feed
3. **Auto-Archive**: Consider hiding menus older than 2 weeks
4. **Currency Formatting**: Handle price formatting on frontend, store as decimal

## Performance Optimization

### Database Indexes

```sql
-- Composite index for feed queries
CREATE INDEX idx_news_feed_combined ON (
    (CASE
        WHEN table_name = 'news_posts' THEN posted_at
        WHEN table_name = 'events' THEN start_time
        WHEN table_name = 'lunch_menus' THEN week_start_date
    END) DESC,
    club_id
);

-- Indexes for RSVP lookups
CREATE INDEX idx_rsvps_user_event ON rsvps(user_id, event_id)
WHERE status NOT IN ('CANCELLED', 'DECLINED');
```

### Caching Strategy

1. **Query Cache**: Cache feed queries for 2-5 minutes per user/club
2. **Invalidation**: Invalidate cache when:
   - New content is posted
   - Events are updated
   - User RSVPs to events
3. **Redis Keys**: `newsfeed:{user_id}:{club_id}:{cursor}`

### Query Optimization

1. Use database views for complex aggregation logic
2. Consider materialized views for large clubs with high activity
3. Implement read replicas for feed queries
4. Use connection pooling for concurrent requests

## Testing Requirements

### Unit Tests

1. **Feed Aggregation**: Test correct merging of different content types
2. **Sorting**: Verify chronological ordering
3. **Pagination**: Test cursor-based pagination edge cases
4. **Authorization**: Verify users only see their clubs' content
5. **RSVP Integration**: Test status inclusion for events

### Integration Tests

1. **End-to-End Feed**: Create multiple items, verify feed composition
2. **Real-time Updates**: Test cache invalidation on new content
3. **Concurrent Requests**: Test pagination consistency
4. **Performance**: Load test with 1000+ items

### Test Data

```graphql
# Example test scenario
mutation CreateTestNewsFeed {
  # News post
  createNewsPost(input: {
    clubId: "club_1"
    title: "Welcome to the Holiday Season!"
    content: "Join us for festive celebrations..."
    author: "Club Manager"
  }) {
    id
  }

  # Event - already exists in your schema
  createEvent(input: {
    clubId: "club_1"
    title: "Wine Tasting Evening"
    # ... event details
  }) {
    id
  }

  # Lunch menu
  createLunchMenu(input: {
    clubId: "club_1"
    weekStartDate: "2024-12-09"
    weekEndDate: "2024-12-15"
    menuItems: [
      {
        name: "Grilled Salmon with Herbs"
        description: "Fresh Atlantic salmon..."
        price: 28.50
      }
    ]
    specialNotes: "All items include soup or salad"
  }) {
    id
  }
}
```

## Migration Plan

### Phase 1: Database Schema

1. Create `news_posts` table
2. Create `lunch_menus` and `lunch_menu_items` tables
3. Add necessary indexes
4. Set up foreign key constraints

### Phase 2: GraphQL Schema

1. Add new types to GraphQL schema
2. Implement resolvers for News Posts
3. Implement resolvers for Lunch Menus
4. Add NewsFeedItem union type

### Phase 3: Feed Aggregation

1. Implement feed query resolver
2. Add RSVP status integration
3. Implement pagination logic
4. Add filtering capabilities

### Phase 4: Mutations

1. Implement News Post mutations (create, update, delete)
2. Implement Lunch Menu mutations (create, update, delete)
3. Add authorization checks
4. Add validation logic

### Phase 5: Optimization

1. Add database indexes
2. Implement caching layer
3. Add query monitoring
4. Performance testing and tuning

## Security Considerations

### Authorization Matrix

| Action | News Posts | Lunch Menus | Events |
|--------|-----------|-------------|--------|
| View | All club members | All club members | All club members |
| Create | Club admins only | Restaurant managers only | Event organizers |
| Update | Creator or admin | Creator or manager | Creator or admin |
| Delete | Creator or admin | Creator or manager | Creator or admin |

### Validation Rules

1. **Content Length**: Limit post content to 10,000 characters
2. **Image URLs**: Validate URL format and whitelist domains
3. **Prices**: Validate positive numbers with max 2 decimal places
4. **Dates**: Validate week ranges (Monday-Sunday)
5. **Rate Limiting**: Limit feed queries to 60/minute per user

### Input Sanitization

1. Sanitize HTML/markdown in news post content
2. Validate all user inputs against XSS attacks
3. Use parameterized queries to prevent SQL injection
4. Validate file uploads for image URLs

## Monitoring and Observability

### Metrics to Track

1. **Feed Performance**:
   - Query execution time (p50, p95, p99)
   - Items per feed request
   - Cache hit rate

2. **Content Metrics**:
   - News posts created per day
   - Events in feed per user
   - Lunch menus updated per week

3. **User Engagement**:
   - Feed refresh rate
   - Items clicked/viewed
   - RSVP conversion from feed

### Logging

Log important events:
```json
{
  "event": "newsfeed_query",
  "user_id": "user_123",
  "club_id": "club_456",
  "items_returned": 15,
  "query_time_ms": 45,
  "cache_hit": true
}
```

## Error Handling

### GraphQL Errors

Return appropriate errors for common scenarios:

```graphql
# Unauthorized access
{
  "errors": [{
    "message": "Not authorized to create news posts for this club",
    "extensions": {
      "code": "UNAUTHORIZED",
      "clubId": "club_123"
    }
  }]
}

# Validation error
{
  "errors": [{
    "message": "Lunch menu already exists for this week",
    "extensions": {
      "code": "DUPLICATE_ENTRY",
      "weekStart": "2024-12-09"
    }
  }]
}

# Not found
{
  "errors": [{
    "message": "News post not found",
    "extensions": {
      "code": "NOT_FOUND",
      "id": "post_123"
    }
  }]
}
```

## Example Implementations

### Go (Golang) Example

```go
// News feed resolver
func (r *queryResolver) NewsFeed(ctx context.Context, clubID *string, limit *int, after *string) (*NewsFeedConnection, error) {
    userID := auth.GetUserIDFromContext(ctx)

    // Get user's club memberships
    clubs, err := r.getMemberClubs(ctx, userID, clubID)
    if err != nil {
        return nil, err
    }

    // Build feed query
    feedItems, err := r.aggregateFeed(ctx, clubs, limit, after)
    if err != nil {
        return nil, err
    }

    // Enhance with RSVP status
    feedItems, err = r.enhanceWithRSVPStatus(ctx, userID, feedItems)
    if err != nil {
        return nil, err
    }

    return buildConnection(feedItems), nil
}

func (r *queryResolver) aggregateFeed(ctx context.Context, clubIDs []string, limit *int, cursor *string) ([]*NewsFeedItem, error) {
    query := `
        WITH combined_feed AS (
            -- News posts
            SELECT
                'news_' || id::text as id,
                'NEWS_POST' as type,
                posted_at as timestamp,
                id as content_id,
                club_id
            FROM news_posts
            WHERE club_id = ANY($1)

            UNION ALL

            -- Events
            SELECT
                'event_' || id::text as id,
                'EVENT' as type,
                start_time as timestamp,
                id as content_id,
                club_id
            FROM events
            WHERE club_id = ANY($1)
            AND start_time > NOW()

            UNION ALL

            -- Lunch menus
            SELECT
                'lunch_' || id::text as id,
                'LUNCH_MENU' as type,
                week_start_date as timestamp,
                id as content_id,
                club_id
            FROM lunch_menus
            WHERE club_id = ANY($1)
        )
        SELECT * FROM combined_feed
        ORDER BY timestamp DESC
        LIMIT $2
    `

    // Execute query and map results
    rows, err := r.db.QueryContext(ctx, query, pq.Array(clubIDs), *limit)
    // ... handle results
}
```

### Node.js (TypeScript) Example

```typescript
// News feed resolver
export const newsFeedResolver = {
  Query: {
    newsFeed: async (
      _: any,
      args: NewsFeedArgs,
      context: Context
    ): Promise<NewsFeedConnection> => {
      const userId = context.user.id;

      // Get user's clubs
      const clubs = await getUserClubs(userId, args.clubId);

      // Aggregate feed items
      const items = await aggregateFeed(clubs, args);

      // Enhance with user context
      const enhancedItems = await enhanceWithUserContext(userId, items);

      return buildConnection(enhancedItems, args);
    }
  },

  Mutation: {
    createNewsPost: async (
      _: any,
      { input }: { input: CreateNewsPostInput },
      context: Context
    ): Promise<NewsPost> => {
      // Check authorization
      await checkClubAdmin(context.user.id, input.clubId);

      // Create post
      const post = await db.newsPost.create({
        data: {
          clubId: input.clubId,
          title: input.title,
          content: input.content,
          imageUrl: input.imageUrl,
          author: input.author,
          postedAt: input.postedAt || new Date()
        }
      });

      // Invalidate cache
      await invalidateFeedCache(input.clubId);

      return post;
    }
  }
};

async function aggregateFeed(
  clubs: string[],
  args: NewsFeedArgs
): Promise<NewsFeedItem[]> {
  const [newsPosts, events, lunchMenus] = await Promise.all([
    // Fetch news posts
    db.newsPost.findMany({
      where: { clubId: { in: clubs } },
      orderBy: { postedAt: 'desc' }
    }),

    // Fetch upcoming events
    db.event.findMany({
      where: {
        clubId: { in: clubs },
        startTime: { gte: new Date() }
      },
      orderBy: { startTime: 'desc' }
    }),

    // Fetch recent lunch menus
    db.lunchMenu.findMany({
      where: { clubId: { in: clubs } },
      orderBy: { weekStartDate: 'desc' }
    })
  ]);

  // Combine and sort
  const items: NewsFeedItem[] = [
    ...newsPosts.map(post => ({
      id: `news_${post.id}`,
      type: 'NEWS_POST',
      timestamp: post.postedAt,
      newsPost: post
    })),
    ...events.map(event => ({
      id: `event_${event.id}`,
      type: 'EVENT',
      timestamp: event.startTime,
      event: event
    })),
    ...lunchMenus.map(menu => ({
      id: `lunch_${menu.id}`,
      type: 'LUNCH_MENU',
      timestamp: menu.weekStartDate,
      lunchMenu: menu
    }))
  ];

  return items.sort((a, b) =>
    b.timestamp.getTime() - a.timestamp.getTime()
  );
}
```

### Python (FastAPI/Strawberry) Example

```python
@strawberry.type
class Query:
    @strawberry.field
    async def news_feed(
        self,
        info: Info,
        club_id: Optional[str] = None,
        limit: int = 20,
        after: Optional[str] = None,
        types: Optional[List[NewsFeedItemType]] = None
    ) -> NewsFeedConnection:
        """Get aggregated news feed for user's clubs."""
        user_id = info.context.user.id

        # Get user's club memberships
        clubs = await get_user_clubs(user_id, club_id)

        # Aggregate feed
        items = await aggregate_feed(
            clubs=clubs,
            limit=limit,
            cursor=after,
            types=types
        )

        # Add RSVP context
        items = await enhance_with_rsvp_status(user_id, items)

        return build_connection(items, limit)


async def aggregate_feed(
    clubs: List[str],
    limit: int,
    cursor: Optional[str] = None,
    types: Optional[List[str]] = None
) -> List[NewsFeedItem]:
    """Aggregate different content types into feed."""

    # Build queries for each type
    queries = []

    if not types or 'NEWS_POST' in types:
        queries.append(
            select(
                literal('news_').op('||')(NewsPost.id).label('id'),
                literal('NEWS_POST').label('type'),
                NewsPost.posted_at.label('timestamp'),
                NewsPost.id.label('content_id'),
                NewsPost.club_id
            )
            .where(NewsPost.club_id.in_(clubs))
        )

    if not types or 'EVENT' in types:
        queries.append(
            select(
                literal('event_').op('||')(Event.id).label('id'),
                literal('EVENT').label('type'),
                Event.start_time.label('timestamp'),
                Event.id.label('content_id'),
                Event.club_id
            )
            .where(
                Event.club_id.in_(clubs),
                Event.start_time > datetime.now()
            )
        )

    if not types or 'LUNCH_MENU' in types:
        queries.append(
            select(
                literal('lunch_').op('||')(LunchMenu.id).label('id'),
                literal('LUNCH_MENU').label('type'),
                LunchMenu.week_start_date.label('timestamp'),
                LunchMenu.id.label('content_id'),
                LunchMenu.club_id
            )
            .where(LunchMenu.club_id.in_(clubs))
        )

    # Combine queries
    combined = union_all(*queries).alias('feed')

    # Apply sorting and pagination
    query = (
        select(combined)
        .order_by(combined.c.timestamp.desc())
        .limit(limit)
    )

    if cursor:
        # Decode cursor and apply
        timestamp, item_type, item_id = decode_cursor(cursor)
        query = query.where(
            tuple_(combined.c.timestamp, combined.c.type, combined.c.id)
            < (timestamp, item_type, item_id)
        )

    # Execute and load full objects
    async with get_session() as session:
        result = await session.execute(query)
        feed_items = result.all()

        # Load full objects based on IDs
        return await load_feed_content(feed_items)
```

## Frontend Integration Notes

The Flutter frontend expects:

1. **Feed Items**: Returned in `NewsFeedConnection` format with pagination
2. **RSVP Status**: For events, include current user's RSVP status as enum value
3. **Event Flags**: Properly set `fullHouseExclusive`, `availableSpots`, `guestPolicy`
4. **Timestamps**: Return as ISO 8601 strings, frontend converts to DateTime
5. **Images**: Provide absolute URLs for news post images
6. **Prices**: Return as Float, frontend handles currency formatting

### Expected Response Format

```json
{
  "data": {
    "newsFeed": {
      "nodes": [
        {
          "id": "news_abc123",
          "type": "NEWS_POST",
          "timestamp": "2024-12-09T10:30:00Z",
          "newsPost": {
            "id": "abc123",
            "clubId": "club_1",
            "title": "Welcome to the Holiday Season!",
            "content": "We are excited to announce...",
            "author": "Club Manager",
            "postedAt": "2024-12-09T10:30:00Z",
            "imageUrl": null
          },
          "event": null,
          "lunchMenu": null,
          "userRSVPStatus": null
        },
        {
          "id": "event_def456",
          "type": "EVENT",
          "timestamp": "2024-12-12T18:00:00Z",
          "newsPost": null,
          "event": {
            "id": "def456",
            "clubId": "club_1",
            "title": "Wine Tasting Evening",
            "eventType": "DINING",
            "startTime": "2024-12-12T18:00:00Z",
            "endTime": "2024-12-12T21:00:00Z",
            "currentAttendees": 24,
            "availableSpots": 6,
            "fullHouseExclusive": false,
            "guestPolicy": "MEMBERS_ONLY"
          },
          "lunchMenu": null,
          "userRSVPStatus": "CONFIRMED"
        }
      ],
      "pageInfo": {
        "hasNextPage": true,
        "endCursor": "MjAyNC0xMi0xMlQxODowMDowMFo6RVZFTlQ6ZGVmNDU2"
      },
      "totalCount": 42
    }
  }
}
```

## Summary

This implementation guide provides complete specifications for:

- ✅ Database schemas for news posts and lunch menus
- ✅ GraphQL types, queries, and mutations
- ✅ Feed aggregation logic with examples in Go, Node.js, and Python
- ✅ Pagination strategy (cursor-based)
- ✅ Authorization and security requirements
- ✅ Performance optimization strategies
- ✅ Testing requirements
- ✅ Migration and deployment plan

The backend should aggregate news posts, events, and lunch menus into a unified, chronological feed that provides rich context for users while maintaining performance and security.
