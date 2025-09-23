import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';

/// Home page - main dashboard for the app
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const SingleChildScrollView(
        padding: AppSpacing.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Clubland',
              style: AppTextStyles.headlineMedium,
            ),
            AppSpacing.verticalSpaceSM,
            Text(
              'Discover premium clubs and make reservations worldwide.',
              style: AppTextStyles.bodyLarge,
            ),
            AppSpacing.verticalSpaceXXL,

            // Quick Actions
            Text(
              'Quick Actions',
              style: AppTextStyles.titleMedium,
            ),
            AppSpacing.verticalSpaceMD,
            Row(
              children: [
                Expanded(
                  child: AppCard(
                    child: Column(
                      children: [
                        Icon(Icons.location_city, size: 32),
                        AppSpacing.verticalSpaceSM,
                        Text('Browse Clubs', style: AppTextStyles.titleSmall),
                      ],
                    ),
                  ),
                ),
                AppSpacing.horizontalSpaceMD,
                Expanded(
                  child: AppCard(
                    child: Column(
                      children: [
                        Icon(Icons.calendar_today, size: 32),
                        AppSpacing.verticalSpaceSM,
                        Text('My Bookings', style: AppTextStyles.titleSmall),
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