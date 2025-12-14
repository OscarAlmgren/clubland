import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_loading_widget.dart';
import '../controllers/bookings_controller.dart';
import 'booking_card_widget.dart';

class UpcomingBookingsSection extends ConsumerWidget {
  const UpcomingBookingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingsState = ref.watch(upcomingBookingsProvider);

    return bookingsState.when(
      data: (bookings) {
        if (bookings.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Builder(
                builder: (context) {
                  final theme = Theme.of(context);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.event_available,
                        size: 64,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No upcoming bookings',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return BookingCardWidget(
              booking: booking,
              onTap: () => context.push('/bookings/${booking.id}'),
            );
          },
        );
      },
      loading: () =>
          const AppLoadingWidget(message: 'Loading upcoming bookings...'),
      error: (error, stack) => AppErrorWidget(
        error: error.toString(),
        onRetry: () => ref.invalidate(upcomingBookingsProvider),
      ),
    );
  }
}
