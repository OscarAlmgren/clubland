import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// Button variants for the app
enum AppButtonVariant {
  primary,
  secondary,
  outline,
  ghost,
  destructive,
}

/// Button sizes for the app
enum AppButtonSize {
  small,
  medium,
  large,
}

/// Custom app button widget with consistent styling
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? leading;
  final Widget? trailing;
  final bool enabled;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.leading,
    this.trailing,
    this.enabled = true,
  });

  /// Primary button
  const AppButton.primary({
    super.key,
    required this.text,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.leading,
    this.trailing,
    this.enabled = true,
  }) : variant = AppButtonVariant.primary;

  /// Secondary button
  const AppButton.secondary({
    super.key,
    required this.text,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.leading,
    this.trailing,
    this.enabled = true,
  }) : variant = AppButtonVariant.secondary;

  /// Outline button
  const AppButton.outline({
    super.key,
    required this.text,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.leading,
    this.trailing,
    this.enabled = true,
  }) : variant = AppButtonVariant.outline;

  /// Ghost button
  const AppButton.ghost({
    super.key,
    required this.text,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.leading,
    this.trailing,
    this.enabled = true,
  }) : variant = AppButtonVariant.ghost;

  /// Destructive button
  const AppButton.destructive({
    super.key,
    required this.text,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.leading,
    this.trailing,
    this.enabled = true,
  }) : variant = AppButtonVariant.destructive;

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
            variant == AppButtonVariant.outline || variant == AppButtonVariant.ghost
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
      Text(
        text,
        style: _getTextStyle(),
        textAlign: TextAlign.center,
      ),
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

  ButtonStyle _getElevatedButtonStyle(ColorScheme colorScheme, bool isDisabled) {
    return ElevatedButton.styleFrom(
      backgroundColor: isDisabled
          ? colorScheme.surfaceVariant
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
  }

  ButtonStyle _getSecondaryButtonStyle(ColorScheme colorScheme, bool isDisabled) {
    return ElevatedButton.styleFrom(
      backgroundColor: isDisabled
          ? colorScheme.surfaceVariant
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
  }

  ButtonStyle _getOutlinedButtonStyle(ColorScheme colorScheme, bool isDisabled) {
    return OutlinedButton.styleFrom(
      foregroundColor: isDisabled
          ? colorScheme.onSurfaceVariant
          : colorScheme.primary,
      side: BorderSide(
        color: isDisabled
            ? colorScheme.outline.withOpacity(0.3)
            : colorScheme.outline,
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizing.radiusLG),
      ),
      padding: _getPadding(),
    );
  }

  ButtonStyle _getTextButtonStyle(ColorScheme colorScheme, bool isDisabled) {
    return TextButton.styleFrom(
      foregroundColor: isDisabled
          ? colorScheme.onSurfaceVariant
          : colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizing.radiusLG),
      ),
      padding: _getPadding(),
    );
  }

  ButtonStyle _getDestructiveButtonStyle(ColorScheme colorScheme, bool isDisabled) {
    return ElevatedButton.styleFrom(
      backgroundColor: isDisabled
          ? colorScheme.surfaceVariant
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
  }

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
