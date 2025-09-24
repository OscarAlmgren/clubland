import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Card variants for different use cases
enum AppCardVariant { elevated, outlined, filled, transparent }

/// Custom app card widget with consistent styling
class AppCard extends StatelessWidget {
  /// Constructs a [AppCard]
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

  /// Elevated card (default)
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

  /// Outlined card
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

  /// Filled card
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

  /// Transparent card (no background)
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
  final Widget child;
  final AppCardVariant variant;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final BorderRadius? borderRadius;
  final double? elevation;
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

/// Specialized card for club information
class ClubCard extends StatelessWidget {
  /// Constructs a [ClubCard]
  const ClubCard({
    required this.clubName,
    required this.location,
    super.key,
    this.imageUrl,
    this.amenities = const [],
    this.onTap,
    this.trailing,
  });
  final String clubName;
  final String location;
  final String? imageUrl;
  final List<String> amenities;
  final VoidCallback? onTap;
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

/// Specialized card for booking information
class BookingCard extends StatelessWidget {
  /// Constructs a [BookingCard]
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
  final String clubName;
  final DateTime bookingDate;
  final String bookingTime;
  final String status;
  final int guestCount;
  final VoidCallback? onTap;
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
