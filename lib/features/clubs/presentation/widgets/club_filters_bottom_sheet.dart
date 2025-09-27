import 'package:flutter/material.dart';

class ClubFiltersBottomSheet extends StatefulWidget {
  const ClubFiltersBottomSheet({
    this.currentFilter,
    this.onFilterChanged,
    super.key,
  });

  final String? currentFilter;
  final ValueChanged<String?>? onFilterChanged;

  @override
  State<ClubFiltersBottomSheet> createState() => _ClubFiltersBottomSheetState();
}

class _ClubFiltersBottomSheetState extends State<ClubFiltersBottomSheet> {
  String? _selectedFilter;

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.currentFilter;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'Filter Clubs',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() => _selectedFilter = null);
                    widget.onFilterChanged?.call(null);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Clear'),
                ),
              ],
            ),
          ),

          // Filter options
          ListView(
            shrinkWrap: true,
            children: [
              _buildFilterOption('All Clubs', null),
              _buildFilterOption('Featured', 'featured'),
              _buildFilterOption('Nearby', 'nearby'),
              _buildFilterOption('Recently Added', 'recent'),
              _buildFilterOption('Highly Rated', 'rated'),
            ],
          ),

          // Apply button
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  widget.onFilterChanged?.call(_selectedFilter);
                  Navigator.of(context).pop();
                },
                child: const Text('Apply Filter'),
              ),
            ),
          ),

          // Safe area padding
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Widget _buildFilterOption(String title, String? value) {
    final isSelected = _selectedFilter == value;

    return ListTile(
      title: Text(title),
      trailing: isSelected
          ? Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.primary,
            )
          : null,
      onTap: () => setState(() => _selectedFilter = value),
    );
  }
}