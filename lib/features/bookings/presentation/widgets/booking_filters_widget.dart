import 'package:flutter/material.dart';
import '../../domain/entities/booking_entity.dart';

class BookingFiltersWidget extends StatelessWidget {
  const BookingFiltersWidget({
    this.selectedStatus,
    this.onStatusChanged,
    this.currentFilter,
    this.onFilterChanged,
    super.key,
  });

  final BookingStatus? selectedStatus;
  final ValueChanged<BookingStatus?>? onStatusChanged;
  final BookingStatus? currentFilter;
  final ValueChanged<BookingStatus?>? onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter by Status',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              _FilterChip(
                label: 'All',
                isSelected: (currentFilter ?? selectedStatus) == null,
                onSelected: () {
                  onFilterChanged?.call(null);
                  onStatusChanged?.call(null);
                },
              ),
              ...BookingStatus.values.map(
                (status) => _FilterChip(
                  label: _getStatusLabel(status),
                  isSelected: (currentFilter ?? selectedStatus) == status,
                  onSelected: () {
                    onFilterChanged?.call(status);
                    onStatusChanged?.call(status);
                  },
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