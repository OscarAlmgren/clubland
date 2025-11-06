import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/event_entity.dart';
import '../../domain/entities/event_rsvp_entity.dart';
import '../controllers/events_controller.dart';

/// Update RSVP page for modifying existing event RSVPs
class UpdateRSVPPage extends ConsumerStatefulWidget {
  /// Event associated with the RSVP
  final EventEntity event;

  /// Existing RSVP to update
  final EventRSVPEntity rsvp;

  const UpdateRSVPPage({required this.event, required this.rsvp, super.key});

  @override
  ConsumerState<UpdateRSVPPage> createState() => _UpdateRSVPPageState();
}

class _UpdateRSVPPageState extends ConsumerState<UpdateRSVPPage> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  late RSVPResponse _response;
  late int _attendanceCount;
  final List<TextEditingController> _guestNameControllers = [];
  final Set<String> _selectedDietaryRestrictions = {};
  late TextEditingController _seatingPreferencesController;
  late TextEditingController _specialRequestsController;

  // Available dietary restrictions
  final List<String> _dietaryOptions = [
    'Vegetarian',
    'Vegan',
    'Gluten-Free',
    'Dairy-Free',
    'Nut Allergy',
    'Shellfish Allergy',
    'Halal',
    'Kosher',
    'Other',
  ];

  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _initializeFromRSVP();
  }

  void _initializeFromRSVP() {
    // Initialize form fields with existing RSVP data
    _response = widget.rsvp.response;
    _attendanceCount = widget.rsvp.attendanceCount;

    // Initialize dietary restrictions
    _selectedDietaryRestrictions.addAll(widget.rsvp.dietaryRestrictions);

    // Initialize text controllers
    _seatingPreferencesController = TextEditingController(
      text: widget.rsvp.seatingPreferences ?? '',
    );
    _specialRequestsController = TextEditingController(
      text: widget.rsvp.specialRequests ?? '',
    );

    // Initialize guest name controllers with existing guest names
    final guestCount = _attendanceCount - 1;
    for (var i = 0; i < guestCount; i++) {
      final controller = TextEditingController(
        text: i < widget.rsvp.guestNames.length
            ? widget.rsvp.guestNames[i]
            : '',
      );
      _guestNameControllers.add(controller);
    }
  }

  @override
  void dispose() {
    for (final controller in _guestNameControllers) {
      controller.dispose();
    }
    _seatingPreferencesController.dispose();
    _specialRequestsController.dispose();
    super.dispose();
  }

  void _updateGuestControllers() {
    final guestCount = _attendanceCount - 1;

    // Add controllers if needed
    while (_guestNameControllers.length < guestCount) {
      _guestNameControllers.add(TextEditingController());
    }

    // Remove excess controllers
    while (_guestNameControllers.length > guestCount) {
      _guestNameControllers.removeLast().dispose();
    }
  }

  Future<void> _updateRSVP() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final guestNames = _guestNameControllers
          .where((controller) => controller.text.isNotEmpty)
          .map((controller) => controller.text.trim())
          .toList();

      final input = {
        'response': _response.toString().split('.').last,
        'attendanceCount': _attendanceCount,
        if (guestNames.isNotEmpty) 'guestNames': guestNames,
        if (_selectedDietaryRestrictions.isNotEmpty)
          'dietaryRestrictions': _selectedDietaryRestrictions.toList(),
        if (_seatingPreferencesController.text.isNotEmpty)
          'seatingPreferences': [_seatingPreferencesController.text.trim()],
        if (_specialRequestsController.text.isNotEmpty)
          'specialRequests': [_specialRequestsController.text.trim()],
      };

      final controller = ref.read(rsvpControllerProvider.notifier);
      await controller.updateRSVP(widget.rsvp.id, input);

      if (!mounted) return;

      final rsvpState = ref.read(rsvpControllerProvider);

      if (rsvpState.hasError) {
        _showErrorDialog(rsvpState.error.toString());
      } else if (rsvpState.value != null) {
        _showSuccessDialog();
      }
    } catch (e) {
      if (!mounted) return;
      _showErrorDialog(e.toString());
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  void _showSuccessDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.check_circle,
          color: Theme.of(context).colorScheme.primary,
          size: 64,
        ),
        title: const Text('RSVP Updated'),
        content: const Text('Your RSVP has been updated successfully.'),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Go back to previous screen
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String error) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.error_outline,
          color: Theme.of(context).colorScheme.error,
          size: 64,
        ),
        title: const Text('Update Failed'),
        content: Text('Failed to update your RSVP: $error'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maxGuests = widget.event.maxGuestsPerMember ?? 4;

    return Scaffold(
      appBar: AppBar(title: const Text('Update RSVP')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Event summary
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.event.title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.event.startTime.toLocal().toString().split(
                            ' ',
                          )[0],
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Show current RSVP status
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Current Status: ${_getStatusLabel(widget.rsvp.status)}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Response selection
            Text(
              'Your Response',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SegmentedButton<RSVPResponse>(
              segments: const [
                ButtonSegment(
                  value: RSVPResponse.yes,
                  label: Text('Yes'),
                  icon: Icon(Icons.check),
                ),
                ButtonSegment(
                  value: RSVPResponse.maybe,
                  label: Text('Maybe'),
                  icon: Icon(Icons.help_outline),
                ),
                ButtonSegment(
                  value: RSVPResponse.no,
                  label: Text('No'),
                  icon: Icon(Icons.close),
                ),
              ],
              selected: {_response},
              onSelectionChanged: (Set<RSVPResponse> selection) {
                setState(() {
                  _response = selection.first;
                });
              },
            ),

            const SizedBox(height: 24),

            // Attendance count (only for Yes/Maybe)
            if (_response != RSVPResponse.no) ...[
              Text(
                'Number of Attendees',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  IconButton.filled(
                    onPressed: _attendanceCount > 1
                        ? () {
                            setState(() {
                              _attendanceCount--;
                              _updateGuestControllers();
                            });
                          }
                        : null,
                    icon: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '$_attendanceCount',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _attendanceCount == 1 ? 'person' : 'people',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton.filled(
                    onPressed: _attendanceCount < maxGuests
                        ? () {
                            setState(() {
                              _attendanceCount++;
                              _updateGuestControllers();
                            });
                          }
                        : null,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              if (maxGuests > 1) ...[
                const SizedBox(height: 8),
                Text(
                  'Maximum $maxGuests guests per member',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],

              const SizedBox(height: 24),

              // Guest names
              if (_attendanceCount > 1) ...[
                Text(
                  'Guest Names',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ...List.generate(
                  _guestNameControllers.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: TextFormField(
                      controller: _guestNameControllers[index],
                      decoration: InputDecoration(
                        labelText: 'Guest ${index + 1} Name',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.person_outline),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter guest name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 24),

              // Dietary restrictions
              Text(
                'Dietary Restrictions',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Select any dietary restrictions or allergies',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _dietaryOptions.map((option) {
                  final isSelected = _selectedDietaryRestrictions.contains(
                    option,
                  );
                  return FilterChip(
                    label: Text(option),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedDietaryRestrictions.add(option);
                        } else {
                          _selectedDietaryRestrictions.remove(option);
                        }
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 24),

              // Seating preferences
              Text(
                'Seating Preferences (Optional)',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _seatingPreferencesController,
                decoration: const InputDecoration(
                  hintText: 'e.g., Near the window, close to the stage',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.event_seat),
                ),
                maxLines: 2,
              ),

              const SizedBox(height: 24),

              // Special requests
              Text(
                'Special Requests (Optional)',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _specialRequestsController,
                decoration: const InputDecoration(
                  hintText: 'Any special requests or accommodations needed',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.note),
                ),
                maxLines: 3,
              ),
            ],

            const SizedBox(height: 24),

            // Payment info (if required)
            if (widget.event.requiresPayment && widget.event.price != null) ...[
              Card(
                color: theme.colorScheme.tertiaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.payment,
                        color: theme.colorScheme.onTertiaryContainer,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Required',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onTertiaryContainer,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$${widget.event.price!.toStringAsFixed(2)} per person',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onTertiaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Submit button
            FilledButton(
              onPressed: _isSubmitting ? null : _updateRSVP,
              child: _isSubmitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Update RSVP'),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  String _getStatusLabel(RSVPStatus status) {
    switch (status) {
      case RSVPStatus.confirmed:
        return 'Confirmed';
      case RSVPStatus.tentative:
        return 'Tentative';
      case RSVPStatus.pendingApproval:
        return 'Pending Approval';
      case RSVPStatus.waitlist:
        return 'Waitlist';
      case RSVPStatus.cancelled:
        return 'Cancelled';
      case RSVPStatus.declined:
        return 'Declined';
    }
  }
}
