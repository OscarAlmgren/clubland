import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/event_entity.dart';
import '../../domain/entities/event_rsvp_entity.dart';
import '../../domain/entities/rsvp_eligibility_entity.dart';
import '../controllers/events_controller.dart';

/// RSVP form page for submitting event RSVPs
class RSVPFormPage extends ConsumerStatefulWidget {
  /// Event to RSVP to
  final EventEntity event;

  /// Member ID for the RSVP
  final String memberId;

  /// Club ID
  final String clubId;

  /// RSVP eligibility information
  final RSVPEligibilityEntity eligibility;

  const RSVPFormPage({
    required this.event,
    required this.memberId,
    required this.clubId,
    required this.eligibility,
    super.key,
  });

  @override
  ConsumerState<RSVPFormPage> createState() => _RSVPFormPageState();
}

class _RSVPFormPageState extends ConsumerState<RSVPFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  RSVPResponse _response = RSVPResponse.yes;
  int _attendanceCount = 1;
  final List<TextEditingController> _guestNameControllers = [];
  final Set<String> _selectedDietaryRestrictions = {};
  final TextEditingController _seatingPreferencesController = TextEditingController();
  final TextEditingController _specialRequestsController = TextEditingController();

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
    _updateGuestControllers();
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

  Future<void> _submitRSVP() async {
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
        'eventId': widget.event.id,
        'memberId': widget.memberId,
        'clubId': widget.clubId,
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
      await controller.createRSVP(input);

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
        title: const Text('RSVP Submitted'),
        content: Text(
          widget.eligibility.requiresApproval
              ? 'Your RSVP has been submitted and is pending approval from the event organizer.'
              : 'Your RSVP has been confirmed! We look forward to seeing you at the event.',
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Go back to event details
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
        title: const Text('RSVP Failed'),
        content: Text(
          'Failed to submit your RSVP: $error',
        ),
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
    final maxGuests = widget.event.maxGuests ?? 4;

    return Scaffold(
      appBar: AppBar(
        title: const Text('RSVP to Event'),
      ),
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
                          '${widget.event.startTime.toLocal().toString().split(' ')[0]}',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
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
                  icon: Icon(Icons.check_circle),
                ),
                ButtonSegment(
                  value: RSVPResponse.maybe,
                  label: Text('Maybe'),
                  icon: Icon(Icons.help_outline),
                ),
                ButtonSegment(
                  value: RSVPResponse.no,
                  label: Text('No'),
                  icon: Icon(Icons.cancel),
                ),
              ],
              selected: {_response},
              onSelectionChanged: (Set<RSVPResponse> newSelection) {
                setState(() {
                  _response = newSelection.first;
                });
              },
            ),

            if (_response != RSVPResponse.no) ...[
              const SizedBox(height: 24),

              // Attendance count
              Text(
                'Number of Attendees',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  IconButton.outlined(
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
                    _attendanceCount.toString(),
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton.outlined(
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
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      '(Including yourself, max $maxGuests)',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),

              // Guest names
              if (_attendanceCount > 1) ...[
                const SizedBox(height: 24),
                Text(
                  'Guest Names',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please provide the names of your guests',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
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
                        prefixIcon: const Icon(Icons.person),
                      ),
                      textCapitalization: TextCapitalization.words,
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

              // Dietary restrictions
              const SizedBox(height: 24),
              Text(
                'Dietary Restrictions',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Select all that apply',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _dietaryOptions.map((option) {
                  final isSelected = _selectedDietaryRestrictions.contains(option);
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

              // Seating preferences
              const SizedBox(height: 24),
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
                  labelText: 'Seating Preferences',
                  hintText: 'e.g., Near window, quiet area, etc.',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.chair),
                ),
                maxLines: 2,
              ),

              // Special requests
              const SizedBox(height: 24),
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
                  labelText: 'Special Requests',
                  hintText: 'Any special accommodations or requests',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.notes),
                ),
                maxLines: 3,
              ),

              // Payment info
              if (widget.eligibility.requiresPayment &&
                  widget.eligibility.paymentAmount != null) ...[
                const SizedBox(height: 24),
                Card(
                  color: theme.colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.payment,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Payment Required',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Amount: \$${widget.eligibility.paymentAmount!.toStringAsFixed(2)}',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Payment will be processed separately after RSVP confirmation.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],

              // Approval notice
              if (widget.eligibility.requiresApproval) ...[
                const SizedBox(height: 16),
                Card(
                  color: theme.colorScheme.secondaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.verified_user,
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Your RSVP will require approval from the event organizer.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],

            const SizedBox(height: 32),

            // Submit button
            FilledButton.icon(
              onPressed: _isSubmitting ? null : _submitRSVP,
              icon: _isSubmitting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.send),
              label: Text(_isSubmitting ? 'Submitting...' : 'Submit RSVP'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
