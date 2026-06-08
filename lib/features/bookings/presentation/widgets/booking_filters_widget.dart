import 'package:flutter/material.dart';

import '../../../../core/graphql/graphql_api.dart';
import '../../domain/entities/booking_entity.dart';

class BookingFiltersWidget extends StatelessWidget {
  const BookingFiltersWidget({
    this.selectedStatus,
    this.onStatusChanged,
    this.currentFilter,
    this.onFilterChanged,
    super.key,
  });

  final Enum$BookingStatus? selectedStatus;
  final ValueChanged<Enum$BookingStatus?>? onStatusChanged;
  final Enum$BookingStatus? currentFilter;
  final ValueChanged<Enum$BookingStatus?>? onFilterChanged;

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
              ...Enum$BookingStatus.values
                  .where((s) => s != Enum$BookingStatus.$unknown)
                  .map(
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

  String _getStatusLabel(Enum$BookingStatus status) {
    switch (status) {
      case Enum$BookingStatus.CONFIRMED:
        return 'Confirmed';
      case Enum$BookingStatus.PENDING:
        return 'Pending';
      case Enum$BookingStatus.CANCELLED:
        return 'Cancelled';
      case Enum$BookingStatus.CHECKED_IN:
        return 'Checked In';
      case Enum$BookingStatus.CHECKED_OUT:
        return 'Completed';
      case Enum$BookingStatus.NO_SHOW:
        return 'No Show';
      case Enum$BookingStatus.$unknown:
        return 'Unknown';
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