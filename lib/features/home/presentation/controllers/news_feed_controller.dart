import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../events/domain/entities/event_entity.dart';
import '../../domain/entities/lunch_menu_entity.dart';
import '../../domain/entities/news_feed_item_entity.dart';
import '../../domain/entities/news_post_entity.dart';

part 'news_feed_controller.g.dart';

/// News feed controller - manages news feed items
@riverpod
class NewsFeedController extends _$NewsFeedController {
  @override
  Future<List<NewsFeedItemEntity>> build() async {
    // TODO: Implement full data layer (repository/datasource) when backend API is ready
    // For now, returning mock data directly
    return _getMockNewsFeedItems();
  }

  /// Get mock news feed items for demonstration
  List<NewsFeedItemEntity> _getMockNewsFeedItems() {
    final now = DateTime.now();

    return [
      // Club news post
      NewsFeedItemEntity.newsPost(
        newsPost: NewsPostEntity(
          id: '1',
          clubId: 'club_1',
          title: 'Welcome to the Holiday Season!',
          content:
              'We are excited to announce our special holiday events and celebrations. '
              'Join us for festive gatherings, special dinners, and exclusive member activities throughout December.',
          postedAt: now.subtract(const Duration(hours: 2)),
          author: 'Club Manager',
        ),
      ),

      // Upcoming event - user is attending
      NewsFeedItemEntity.event(
        event: EventEntity(
          id: '1',
          clubId: 'club_1',
          title: 'Wine Tasting Evening',
          description:
              'Join us for an exclusive wine tasting featuring selections from renowned vineyards. '
              'Expert sommeliers will guide you through each tasting.',
          eventType: EventType.dining,
          startTime: now.add(const Duration(days: 3, hours: 18)),
          endTime: now.add(const Duration(days: 3, hours: 21)),
          location: 'Main Dining Room',
          capacity: 30,
          currentAttendees: 24,
          availableSpots: 6,
          guestPolicy: GuestPolicy.membersOnly,
          requiresApproval: false,
          requiresPayment: true,
          price: 75.0,
          allowsSubgroupPriority: false,
          fullHouseExclusive: false,
          createdAt: now.subtract(const Duration(days: 14)),
          updatedAt: now.subtract(const Duration(days: 14)),
        ),
        userRSVPStatus: 'confirmed', // User is attending
      ),

      // Weekly lunch menu
      NewsFeedItemEntity.lunchMenu(
        lunchMenu: LunchMenuEntity(
          id: 'lunch_1',
          clubId: 'club_1',
          weekStartDate: _getStartOfWeek(now),
          weekEndDate: _getEndOfWeek(now),
          menuItems: const [
            LunchMenuItem(
              name: 'Grilled Salmon with Herbs',
              description:
                  'Fresh Atlantic salmon with seasonal vegetables and lemon butter sauce',
              price: 28.50,
            ),
            LunchMenuItem(
              name: 'Classic Caesar Salad',
              description:
                  'Crispy romaine lettuce, parmesan, croutons, and house-made dressing',
              price: 16.00,
            ),
            LunchMenuItem(
              name: 'Beef Tenderloin Medallions',
              description:
                  'Perfectly seared beef with roasted potatoes and red wine reduction',
              price: 35.00,
            ),
            LunchMenuItem(
              name: 'Vegetarian Pasta Primavera',
              description:
                  'Fresh pasta with seasonal vegetables in a light cream sauce',
              price: 22.00,
            ),
            LunchMenuItem(
              name: 'Club Sandwich',
              description:
                  'Triple-decker with turkey, bacon, lettuce, and tomato',
              price: 18.50,
            ),
          ],
          specialNotes: 'All lunch items include soup or salad and coffee/tea',
        ),
      ),

      // Full house exclusive event - not attending yet
      NewsFeedItemEntity.event(
        event: EventEntity(
          id: '2',
          clubId: 'club_1',
          title: 'Annual Gala Dinner',
          description:
              'Our most prestigious event of the year. Black tie required. '
              'Featuring live entertainment, gourmet dining, and special guest speakers.',
          eventType: EventType.special,
          startTime: now.add(const Duration(days: 14, hours: 19)),
          endTime: now.add(const Duration(days: 14, hours: 23)),
          location: 'Grand Ballroom',
          capacity: 100,
          currentAttendees: 78,
          availableSpots: 22,
          guestPolicy: GuestPolicy.friendsAndFamily,
          maxGuestsPerMember: 2,
          requiresApproval: true,
          requiresPayment: true,
          price: 250.0,
          allowsSubgroupPriority: false,
          fullHouseExclusive: true, // Full house exclusive
          createdAt: now.subtract(const Duration(days: 30)),
          updatedAt: now.subtract(const Duration(days: 30)),
        ),
      ),

      // News post about new facility
      NewsFeedItemEntity.newsPost(
        newsPost: NewsPostEntity(
          id: '2',
          clubId: 'club_1',
          title: 'New Tennis Courts Now Open',
          content:
              'We are thrilled to announce that our newly renovated tennis courts are now open for use. '
              'Book your court time through the member portal.',
          postedAt: now.subtract(const Duration(days: 1)),
          author: 'Facilities Team',
        ),
      ),

      // Fully booked event
      NewsFeedItemEntity.event(
        event: EventEntity(
          id: '3',
          clubId: 'club_1',
          title: 'Golf Tournament',
          description:
              'Annual member golf tournament with prizes and dinner reception to follow.',
          eventType: EventType.sports,
          startTime: now.add(const Duration(days: 7, hours: 8)),
          endTime: now.add(const Duration(days: 7, hours: 17)),
          location: 'Golf Course',
          capacity: 40,
          currentAttendees: 40,
          availableSpots: 0, // Fully booked
          guestPolicy: GuestPolicy.membersOnly,
          requiresApproval: false,
          requiresPayment: false,
          allowsSubgroupPriority: false,
          fullHouseExclusive: false,
          createdAt: now.subtract(const Duration(days: 21)),
          updatedAt: now.subtract(const Duration(days: 21)),
        ),
      ),

      // Event with guests welcome
      NewsFeedItemEntity.event(
        event: EventEntity(
          id: '4',
          clubId: 'club_1',
          title: 'Family Brunch',
          description:
              'Bring your family for a delightful Sunday brunch with activities for children.',
          eventType: EventType.family,
          startTime: now.add(const Duration(days: 10, hours: 11)),
          endTime: now.add(const Duration(days: 10, hours: 14)),
          location: 'Terrace Restaurant',
          capacity: 60,
          currentAttendees: 35,
          availableSpots: 25,
          guestPolicy: GuestPolicy.friendsAndFamily, // Others welcome
          maxGuestsPerMember: 4,
          requiresApproval: false,
          requiresPayment: true,
          price: 45.0,
          allowsSubgroupPriority: false,
          fullHouseExclusive: false,
          createdAt: now.subtract(const Duration(days: 10)),
          updatedAt: now.subtract(const Duration(days: 10)),
        ),
      ),
    ];
  }

  /// Get start of current week (Monday)
  DateTime _getStartOfWeek(DateTime date) {
    final daysFromMonday = date.weekday - 1;
    return DateTime(
      date.year,
      date.month,
      date.day,
    ).subtract(Duration(days: daysFromMonday));
  }

  /// Get end of current week (Sunday)
  DateTime _getEndOfWeek(DateTime date) {
    final daysToSunday = 7 - date.weekday;
    return DateTime(
      date.year,
      date.month,
      date.day,
    ).add(Duration(days: daysToSunday));
  }

  /// Refresh news feed
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _getMockNewsFeedItems();
    });
  }

  /// Update RSVP status for an event
  Future<void> updateRSVP(String eventId, String status) async {
    final currentState = state.value;
    if (currentState == null) return;

    // Update the RSVP status in the list
    final updatedItems = currentState.map((item) {
      final event = item.event;
      if (item.type == NewsFeedItemType.event &&
          event != null &&
          event.id == eventId) {
        return NewsFeedItemEntity.event(
          event: event,
          userRSVPStatus: status,
        );
      }
      return item;
    }).toList();

    state = AsyncValue.data(updatedItems);
  }
}
