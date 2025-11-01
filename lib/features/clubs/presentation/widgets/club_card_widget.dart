import 'package:flutter/material.dart';

import '../../domain/entities/simple_club.dart';

/// A card widget used to display summary information for a single club.
///
/// It shows the club's logo, name, description, and an optional favorite button.
class ClubCardWidget extends StatelessWidget {
  /// Creates a [ClubCardWidget].
  const ClubCardWidget({
    required this.club,
    this.onTap,
    this.onFavorite,
    super.key,
  });

  /// The data model containing the club's information to display.
  final SimpleClub club;

  /// Callback executed when the user taps the card.
  final VoidCallback? onTap;

  /// Optional callback executed when the user taps the favorite icon.
  /// If null, the favorite icon is not displayed.
  final VoidCallback? onFavorite;

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Club logo placeholder
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: club.logo != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            club.logo!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.business,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        )
                      : Icon(
                          Icons.business,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                ),
                const SizedBox(width: 16),
                // Club info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        club.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (club.description.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          club.description,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                // Favorite button
                if (onFavorite != null)
                  IconButton(
                    onPressed: onFavorite,
                    icon: const Icon(Icons.favorite_border),
                    tooltip: 'Add to favorites',
                  ),
              ],
            ),
          ),
        ),
      );
}
