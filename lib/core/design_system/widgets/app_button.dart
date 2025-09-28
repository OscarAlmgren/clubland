import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_sizing.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// Button variants for the app, determining color and style.
enum AppButtonVariant {
  /// Solid background, high emphasis. Uses primary color.
  primary,

  /// Solid background, medium emphasis. Uses secondary color.
  secondary,

  /// Transparent background with a border. Uses outline style.
  outline,

  /// Flat, minimal button (TextButton style). Low emphasis.
  ghost,

  /// Solid background, high emphasis for destructive actions. Uses error color.
  destructive,
}

/// Button sizes for the app, controlling height, padding, and text style.
enum AppButtonSize {
  /// Small button size.
  small,

  /// Medium (default) button size.
  medium,

  /// Large button size.
  large,
}

/// Custom app button widget with consistent styling across the application.
///
/// It supports various sizes, variants, loading states, and optional leading/trailing icons.
class AppButton extends StatelessWidget {
  /// Creates a custom app button.
  const AppButton({
    required this.text,
    super.key,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.leading,
    this.trailing,
    this.enabled = true,
  });

  /// Creates a primary (high-emphasis) button.
  const AppButton.primary({
    required this.text,
    super.key,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.leading,
    this.trailing,
    this.enabled = true,
  }) : variant = AppButtonVariant.primary;

  /// Creates a secondary (medium-emphasis) button.
  const AppButton.secondary({
    required this.text,
    super.key,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.leading,
    this.trailing,
    this.enabled = true,
  }) : variant = AppButtonVariant.secondary;

  /// Creates an outline button.
  const AppButton.outline({
    required this.text,
    super.key,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.leading,
    this.trailing,
    this.enabled = true,
  }) : variant = AppButtonVariant.outline;

  /// Creates a ghost (TextButton-style, low-emphasis) button.
  const AppButton.ghost({
    required this.text,
    super.key,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.leading,
    this.trailing,
    this.enabled = true,
  }) : variant = AppButtonVariant.ghost;

  /// Creates a destructive (error-colored) button for irreversible actions.
  const AppButton.destructive({
    required this.text,
    super.key,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.leading,
    this.trailing,
    this.enabled = true,
  }) : variant = AppButtonVariant.destructive;

  /// The text displayed inside the button.
  final String text;

  /// The callback function executed when the button is pressed. If null, the button is disabled.
  final VoidCallback? onPressed;

  /// The visual style of the button (e.g., primary, outline, destructive). Defaults to [AppButtonVariant.primary].
  final AppButtonVariant variant;

  /// The size of the button (small, medium, or large). Defaults to [AppButtonSize.medium].
  final AppButtonSize size;

  /// If true, a loading indicator is shown instead of the content, and [onPressed] is ignored.
  final bool isLoading;

  /// If true, the button takes up the full width of its parent container. Defaults to true.
  final bool isFullWidth;

  /// Optional widget displayed to the left of the button text.
  final Widget? leading;

  /// Optional widget displayed to the right of the button text.
  final Widget? trailing;

  /// Controls whether the button is interactive. If false, it appears disabled. Defaults to true.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDisabled = !enabled || onPressed == null;

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: _getHeight(),
      child: _buildButton(context, colorScheme, isDisabled),
    );
  }

  Widget _buildButton(
    BuildContext context,
    ColorScheme colorScheme,
    bool isDisabled,
  ) {
    switch (variant) {
      case AppButtonVariant.primary:
        return ElevatedButton(
          onPressed: isDisabled ? null : _handlePress,
          style: _getElevatedButtonStyle(colorScheme, isDisabled),
          child: _buildContent(),
        );
      case AppButtonVariant.secondary:
        return ElevatedButton(
          onPressed: isDisabled ? null : _handlePress,
          style: _getSecondaryButtonStyle(colorScheme, isDisabled),
          child: _buildContent(),
        );
      case AppButtonVariant.outline:
        return OutlinedButton(
          onPressed: isDisabled ? null : _handlePress,
          style: _getOutlinedButtonStyle(colorScheme, isDisabled),
          child: _buildContent(),
        );
      case AppButtonVariant.ghost:
        return TextButton(
          onPressed: isDisabled ? null : _handlePress,
          style: _getTextButtonStyle(colorScheme, isDisabled),
          child: _buildContent(),
        );
      case AppButtonVariant.destructive:
        return ElevatedButton(
          onPressed: isDisabled ? null : _handlePress,
          style: _getDestructiveButtonStyle(colorScheme, isDisabled),
          child: _buildContent(),
        );
    }
  }

  Widget _buildContent() {
    if (isLoading) {
      return SizedBox(
        height: _getIconSize(),
        width: _getIconSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == AppButtonVariant.outline ||
                    variant == AppButtonVariant.ghost
                ? AppColors.brandPrimary
                : Colors.white,
          ),
        ),
      );
    }

    final children = <Widget>[];

    if (leading != null) {
      children.add(leading!);
      children.add(AppSpacing.horizontalSpaceSM);
    }

    children.add(
      Text(text, style: _getTextStyle(), textAlign: TextAlign.center),
    );

    if (trailing != null) {
      children.add(AppSpacing.horizontalSpaceSM);
      children.add(trailing!);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  void _handlePress() {
    if (!isLoading && onPressed != null) {
      onPressed!();
    }
  }

  double _getHeight() {
    switch (size) {
      case AppButtonSize.small:
        return AppSizing.buttonHeightSmall;
      case AppButtonSize.medium:
        return AppSizing.buttonHeightMedium;
      case AppButtonSize.large:
        return AppSizing.buttonHeightLarge;
    }
  }

  double _getIconSize() {
    switch (size) {
      case AppButtonSize.small:
        return AppSizing.iconSM;
      case AppButtonSize.medium:
        return AppSizing.iconMD;
      case AppButtonSize.large:
        return AppSizing.iconLG;
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case AppButtonSize.small:
        return AppTextStyles.labelMedium;
      case AppButtonSize.medium:
        return AppTextStyles.labelLarge;
      case AppButtonSize.large:
        return AppTextStyles.titleMedium;
    }
  }

  ButtonStyle _getElevatedButtonStyle(
    ColorScheme colorScheme,
    bool isDisabled,
  ) => ElevatedButton.styleFrom(
    backgroundColor: isDisabled
        ? colorScheme.surfaceContainerHighest
        : colorScheme.primary,
    foregroundColor: isDisabled
        ? colorScheme.onSurfaceVariant
        : colorScheme.onPrimary,
    elevation: isDisabled ? 0 : 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizing.radiusLG),
    ),
    padding: _getPadding(),
  );

  ButtonStyle _getSecondaryButtonStyle(
    ColorScheme colorScheme,
    bool isDisabled,
  ) => ElevatedButton.styleFrom(
    backgroundColor: isDisabled
        ? colorScheme.surfaceContainerHighest
        : colorScheme.secondary,
    foregroundColor: isDisabled
        ? colorScheme.onSurfaceVariant
        : colorScheme.onSecondary,
    elevation: isDisabled ? 0 : 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizing.radiusLG),
    ),
    padding: _getPadding(),
  );

  ButtonStyle _getOutlinedButtonStyle(
    ColorScheme colorScheme,
    bool isDisabled,
  ) => OutlinedButton.styleFrom(
    foregroundColor: isDisabled
        ? colorScheme.onSurfaceVariant
        : colorScheme.primary,
    side: BorderSide(
      color: isDisabled
          ? colorScheme.outline.withValues(alpha: .3)
          : colorScheme.outline,
      width: 1.5,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizing.radiusLG),
    ),
    padding: _getPadding(),
  );

  ButtonStyle _getTextButtonStyle(ColorScheme colorScheme, bool isDisabled) =>
      TextButton.styleFrom(
        foregroundColor: isDisabled
            ? colorScheme.onSurfaceVariant
            : colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizing.radiusLG),
        ),
        padding: _getPadding(),
      );

  ButtonStyle _getDestructiveButtonStyle(
    ColorScheme colorScheme,
    bool isDisabled,
  ) => ElevatedButton.styleFrom(
    backgroundColor: isDisabled
        ? colorScheme.surfaceContainerHighest
        : colorScheme.error,
    foregroundColor: isDisabled
        ? colorScheme.onSurfaceVariant
        : colorScheme.onError,
    elevation: isDisabled ? 0 : 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizing.radiusLG),
    ),
    padding: _getPadding(),
  );

  EdgeInsets _getPadding() {
    switch (size) {
      case AppButtonSize.small:
        return AppSpacing.buttonPaddingSmall;
      case AppButtonSize.medium:
        return AppSpacing.buttonPaddingMedium;
      case AppButtonSize.large:
        return AppSpacing.buttonPaddingLarge;
    }
  }
}
