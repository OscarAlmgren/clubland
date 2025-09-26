import 'package:flutter/material.dart';
import '../../data/models/booking_model.dart';
import 'booking_card_widget.dart';

class PastBookingsSection extends StatelessWidget {
  const PastBookingsSection({
    this.bookings = const [],
    this.onBookingTap,
    super.key,
  });

  final List<BookingModel> bookings;
  final ValueChanged<BookingModel>? onBookingTap;

  @override
  Widget build(BuildContext context) {
    if (bookings.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Icon(
                Icons.history,
                size: 64,
                color: Colors.grey,
              ),
              SizedBox(height: 16),
              Text(
                'No past bookings',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return BookingCardWidget(
          booking: booking,
          onTap: () => onBookingTap?.call(booking),
        );
      },
    );
  }
}