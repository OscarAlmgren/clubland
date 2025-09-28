import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_sizing.dart';
import '../theme/app_spacing.dart';

/// Card variants for different use cases, controlling background, elevation, and border.
enum AppCardVariant {
  /// Card with a noticeable shadow/elevation.
  elevated,

  /// Card with a distinct outline/border.
  outlined,

  /// Card with a filled background, but no shadow.
  filled,

  /// Card with no background color or shadow, used primarily for inkwell effects.
  transparent,
}

/// Custom app card widget with consistent styling, acting as a wrapper around Material.
///
/// This provides consistent theming for elevation, borders, rounding, and ink well effects.
class AppCard extends StatelessWidget {
  /// Constructs a general [AppCard].
  const AppCard({
    required this.child,
    super.key,
    this.variant = AppCardVariant.elevated,
    this.onTap,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.elevation,
    this.clipBehavior = Clip.antiAlias,
  });

  /// Constructs an **elevated** card (default Material style).
  const AppCard.elevated({
    required this.child,
    super.key,
    this.onTap,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.elevation,
    this.clipBehavior = Clip.antiAlias,
  }) : variant = AppCardVariant.elevated,
       borderColor = null,
       borderWidth = null;

  /// Constructs an **outlined** card.
  const AppCard.outlined({
    required this.child,
    super.key,
    this.onTap,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.clipBehavior = Clip.antiAlias,
  }) : variant = AppCardVariant.outlined,
       elevation = null;

  /// Constructs a **filled** card.
  const AppCard.filled({
    required this.child,
    super.key,
    this.onTap,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.clipBehavior = Clip.antiAlias,
  }) : variant = AppCardVariant.filled,
       borderColor = null,
       borderWidth = null,
       elevation = null;

  /// Constructs a **transparent** card (used mainly for click effects on custom backgrounds).
  const AppCard.transparent({
    required this.child,
    super.key,
    this.onTap,
    this.padding,
    this.margin,
    this.borderRadius,
    this.clipBehavior = Clip.antiAlias,
  }) : variant = AppCardVariant.transparent,
       backgroundColor = Colors.transparent,
       borderColor = null,
       borderWidth = null,
       elevation = null;

  /// The widget contained within the card.
  final Widget child;

  /// The style of the card, affecting background color, border, and elevation.
  final AppCardVariant variant;

  /// An optional callback when the card is tapped, enabling the inkwell effect.
  final VoidCallback? onTap;

  /// Padding applied inside the card content. Defaults to [AppSpacing.cardPaddingAll].
  final EdgeInsetsGeometry? padding;

  /// Margin applied to the container wrapping the card.
  final EdgeInsetsGeometry? margin;

  /// Overrides the card's background color based on the selected [variant].
  final Color? backgroundColor;

  /// Custom border color, primarily used for the [AppCardVariant.outlined] variant.
  final Color? borderColor;

  /// Custom border width, primarily used for the [AppCardVariant.outlined] variant.
  final double? borderWidth;

  /// Custom border radius. Defaults to [AppSizing.borderRadiusLG].
  final BorderRadius? borderRadius;

  /// Custom elevation. Defaults are based on the [variant].
  final double? elevation;

  /// Determines how content is clipped to the card's boundaries. Defaults to [Clip.antiAlias].
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: margin,
      child: Material(
        color: _getBackgroundColor(colorScheme),
        elevation: _getElevation(),
        borderRadius: _getBorderRadius(),
        clipBehavior: clipBehavior,
        child: InkWell(
          onTap: onTap,
          borderRadius: _getBorderRadius(),
          child: Container(
            decoration: _getDecoration(colorScheme),
            padding: _getPadding(),
            child: child,
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(ColorScheme colorScheme) {
    if (backgroundColor != null) return backgroundColor!;

    switch (variant) {
      case AppCardVariant.elevated:
        return colorScheme.surface;
      case AppCardVariant.outlined:
        return colorScheme.surface;
      case AppCardVariant.filled:
        return colorScheme.surfaceContainerHighest;
      case AppCardVariant.transparent:
        return Colors.transparent;
    }
  }

  double _getElevation() {
    if (elevation != null) return elevation!;

    switch (variant) {
      case AppCardVariant.elevated:
        return AppSizing.elevationSM;
      case AppCardVariant.outlined:
      case AppCardVariant.filled:
      case AppCardVariant.transparent:
        return AppSizing.elevationNone;
    }
  }

  BorderRadius _getBorderRadius() => borderRadius ?? AppSizing.borderRadiusLG;

  EdgeInsetsGeometry _getPadding() => padding ?? AppSpacing.cardPaddingAll;

  Decoration? _getDecoration(ColorScheme colorScheme) {
    switch (variant) {
      case AppCardVariant.outlined:
        return BoxDecoration(
          border: Border.all(
            color: borderColor ?? colorScheme.outline,
            width: borderWidth ?? 1,
          ),
          borderRadius: _getBorderRadius(),
        );
      case AppCardVariant.elevated:
      case AppCardVariant.filled:
      case AppCardVariant.transparent:
        return null;
    }
  }
}

/// Specialized card for displaying club summary information.
class ClubCard extends StatelessWidget {
  /// Constructs a [ClubCard].
  const ClubCard({
    required this.clubName,
    required this.location,
    super.key,
    this.imageUrl,
    this.amenities = const [],
    this.onTap,
    this.trailing,
  });

  /// The full name of the club.
  final String clubName;

  /// The location or address of the club.
  final String location;

  /// Optional URL for the club's cover image.
  final String? imageUrl;

  /// A list of key amenities or features offered by the club.
  final List<String> amenities;

  /// Callback executed when the card is tapped.
  final VoidCallback? onTap;

  /// An optional widget to display on the trailing side (e.g., a favorite button).
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageUrl != null) ...[
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppSizing.radiusLG),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => ColoredBox(
                    color: colorScheme.surfaceContainerHighest,
                    child: Icon(
                      Icons.image_not_supported,
                      color: colorScheme.onSurfaceVariant,
                      size: AppSizing.iconXL,
                    ),
                  ),
                ),
              ),
            ),
            AppSpacing.verticalSpaceMD,
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clubName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppSpacing.verticalSpaceXS,
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: AppSizing.iconSM,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        AppSpacing.horizontalSpaceXS,
                        Expanded(
                          child: Text(
                            location,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: colorScheme.onSurfaceVariant),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    if (amenities.isNotEmpty) ...[
                      AppSpacing.verticalSpaceSM,
                      Wrap(
                        spacing: AppSpacing.xs,
                        runSpacing: AppSpacing.xs,
                        children: amenities
                            .take(3)
                            .map(
                              (amenity) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.sm,
                                  vertical: AppSpacing.xs,
                                ),
                                decoration: BoxDecoration(
                                  color: colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(
                                    AppSizing.radiusSM,
                                  ),
                                ),
                                child: Text(
                                  amenity,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        color: colorScheme.onPrimaryContainer,
                                      ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[
                AppSpacing.horizontalSpaceSM,
                trailing!,
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// Specialized card for displaying booking summary information.
class BookingCard extends StatelessWidget {
  /// Constructs a [BookingCard].
  const BookingCard({
    required this.clubName,
    required this.bookingDate,
    required this.bookingTime,
    required this.status,
    required this.guestCount,
    super.key,
    this.onTap,
    this.actions,
  });

  /// The name of the club the booking is for.
  final String clubName;

  /// The date of the booking.
  final DateTime bookingDate;

  /// The time of the booking (e.g., "7:00 PM").
  final String bookingTime;

  /// The current status of the booking (e.g., 'confirmed', 'pending', 'cancelled').
  final String status;

  /// The number of guests included in the booking.
  final int guestCount;

  /// Callback executed when the card is tapped.
  final VoidCallback? onTap;

  /// Optional list of action buttons to display at the bottom right of the card.
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final statusColor = AppColors.getBookingStatusColor(status);

    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  clubName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(AppSizing.radiusSM),
                ),
                child: Text(
                  status.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          AppSpacing.verticalSpaceSM,
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: AppSizing.iconSM,
                color: colorScheme.onSurfaceVariant,
              ),
              AppSpacing.horizontalSpaceXS,
              Text(
                '${bookingDate.day}/${bookingDate.month}/${bookingDate.year}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              AppSpacing.horizontalSpaceLG,
              Icon(
                Icons.access_time,
                size: AppSizing.iconSM,
                color: colorScheme.onSurfaceVariant,
              ),
              AppSpacing.horizontalSpaceXS,
              Text(bookingTime, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          AppSpacing.verticalSpaceXS,
          Row(
            children: [
              Icon(
                Icons.people,
                size: AppSizing.iconSM,
                color: colorScheme.onSurfaceVariant,
              ),
              AppSpacing.horizontalSpaceXS,
              Text(
                '$guestCount guest${guestCount != 1 ? 's' : ''}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          if (actions != null && actions!.isNotEmpty) ...[
            AppSpacing.verticalSpaceMD,
            Row(mainAxisAlignment: MainAxisAlignment.end, children: actions!),
          ],
        ],
      ),
    );
  }
}
