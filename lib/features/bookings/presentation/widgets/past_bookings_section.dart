import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_loading_widget.dart';
import '../controllers/bookings_controller.dart';
import 'booking_card_widget.dart';

class PastBookingsSection extends ConsumerWidget {
  const PastBookingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingsState = ref.watch(pastBookingsProvider);

    return bookingsState.when(
      data: (bookings) {
        if (bookings.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No past bookings',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
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
          const AppLoadingWidget(message: 'Loading past bookings...'),
      error: (error, stack) => AppErrorWidget(
        error: error.toString(),
        onRetry: () => ref.invalidate(pastBookingsProvider),
      ),
    );
  }
}
