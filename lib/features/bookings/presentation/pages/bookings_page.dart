import '../../../../core/design_system/design_system.dart';

/// Bookings page - view and manage bookings
class BookingsPage extends StatelessWidget {
  /// Constructs a [BookingsPage]
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('My Bookings'),
      actions: [
        IconButton(
          icon: const Icon(Icons.history),
          onPressed: () {
            // Navigate to booking history
          },
        ),
      ],
    ),
    body: ListView.separated(
      padding: AppSpacing.pagePadding,
      itemCount: 3,
      separatorBuilder: (context, index) => AppSpacing.verticalSpaceMD,
      itemBuilder: (context, index) => BookingCard(
        clubName: 'Premium Club ${index + 1}',
        bookingDate: DateTime.now().add(Duration(days: index + 1)),
        bookingTime: '7:00 PM',
        status: index == 0 ? 'confirmed' : 'pending',
        guestCount: 2 + index,
        onTap: () {
          // Navigate to booking details
        },
        actions: [
          if (index > 0)
            TextButton(
              onPressed: () {
                // Cancel booking
              },
              child: const Text('Cancel'),
            ),
          TextButton(
            onPressed: () {
              // View details
            },
            child: const Text('Details'),
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        // Navigate to clubs to make new booking
      },
      icon: const Icon(Icons.add),
      label: const Text('New Booking'),
    ),
  );
}
