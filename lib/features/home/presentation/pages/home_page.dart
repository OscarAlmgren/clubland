import '../../../../core/design_system/design_system.dart';

/// Home page - main dashboard for the app
class HomePage extends StatelessWidget {
  /// Constructs a [HomePage].
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Clubland',
              style: AppTextStyles.headlineMedium.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            AppSpacing.verticalSpaceSM,
            Text(
              'Discover premium clubs and make reservations worldwide.',
              style: AppTextStyles.bodyLarge.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            AppSpacing.verticalSpaceXXL,

            // Quick Actions
            Text(
              'Quick Actions',
              style: AppTextStyles.titleMedium.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            AppSpacing.verticalSpaceMD,
            Row(
              children: [
                Expanded(
                  child: AppCard(
                    child: Column(
                      children: [
                        Icon(
                          Icons.location_city,
                          size: 32,
                          color: colorScheme.onSurface,
                        ),
                        AppSpacing.verticalSpaceSM,
                        Text(
                          'Browse Clubs',
                          style: AppTextStyles.titleSmall.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AppSpacing.horizontalSpaceMD,
                Expanded(
                  child: AppCard(
                    child: Column(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 32,
                          color: colorScheme.onSurface,
                        ),
                        AppSpacing.verticalSpaceSM,
                        Text(
                          'My Bookings',
                          style: AppTextStyles.titleSmall.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
