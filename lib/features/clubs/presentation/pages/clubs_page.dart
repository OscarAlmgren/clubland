import '../../../../core/design_system/design_system.dart';

/// Clubs page - browse and search clubs
class ClubsPage extends StatelessWidget {
  /// Constructs a [ClubsPage]
  const ClubsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Clubs'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Navigate to search
          },
        ),
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {
            // Show filters
          },
        ),
      ],
    ),
    body: ListView.separated(
      padding: AppSpacing.pagePadding,
      itemCount: 5,
      separatorBuilder: (context, index) => AppSpacing.verticalSpaceMD,
      itemBuilder: (context, index) => ClubCard(
        clubName: 'Premium Club ${index + 1}',
        location: 'New York, NY',
        amenities: const ['Dining', 'Fitness', 'Business'],
        onTap: () {
          // Navigate to club details
        },
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        // Show nearby clubs
      },
      child: const Icon(Icons.my_location),
    ),
  );
}
