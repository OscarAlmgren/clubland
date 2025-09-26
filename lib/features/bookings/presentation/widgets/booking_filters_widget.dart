import 'package:flutter/material.dart';
import '../../data/models/booking_model.dart';

class BookingFiltersWidget extends StatelessWidget {
  const BookingFiltersWidget({
    this.selectedStatus,
    this.onStatusChanged,
    super.key,
  });

  final BookingStatus? selectedStatus;
  final ValueChanged<BookingStatus?>? onStatusChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter by Status',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              _FilterChip(
                label: 'All',
                isSelected: selectedStatus == null,
                onSelected: () => onStatusChanged?.call(null),
              ),
              ...BookingStatus.values.map(
                (status) => _FilterChip(
                  label: _getStatusLabel(status),
                  isSelected: selectedStatus == status,
                  onSelected: () => onStatusChanged?.call(status),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getStatusLabel(BookingStatus status) {
    switch (status) {
      case BookingStatus.confirmed:
        return 'Confirmed';
      case BookingStatus.pending:
        return 'Pending';
      case BookingStatus.cancelled:
        return 'Cancelled';
      case BookingStatus.completed:
        return 'Completed';
      case BookingStatus.noShow:
        return 'No Show';
    }
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onSelected(),
      selectedColor: Theme.of(context).colorScheme.primaryContainer,
      checkmarkColor: Theme.of(context).colorScheme.onPrimaryContainer,
    );
  }
}