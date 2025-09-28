import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_sizing.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// Defines the visual styles or variants for an application input field.
enum AppInputVariant {
  /// A field with a colored background, typically representing the filled style in Material Design.
  filled,

  /// A field surrounded by a continuous border stroke.
  outlined,

  /// A field indicated only by a line underneath the input area.
  underlined,
}

/// Custom app input field widget with consistent styling
class AppInputField extends StatefulWidget {
  /// Creates a [AppInputField]
  const AppInputField({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.validator,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
    this.variant = AppInputVariant.filled,
    this.focusNode,
  });

  /// Email input field
  const AppInputField.email({
    super.key,
    this.label = 'Email',
    this.hint = 'Enter your email',
    this.helperText,
    this.errorText,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.validator,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.variant = AppInputVariant.filled,
    this.focusNode,
  }) : obscureText = false,
       maxLines = 1,
       minLines = null,
       maxLength = null,
       keyboardType = TextInputType.emailAddress,
       textInputAction = TextInputAction.next,
       textCapitalization = TextCapitalization.none,
       inputFormatters = null,
       prefixText = null,
       suffixText = null;

  /// Password input field
  const AppInputField.password({
    super.key,
    this.label = 'Password',
    this.hint = 'Enter your password',
    this.helperText,
    this.errorText,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.validator,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.variant = AppInputVariant.filled,
    this.focusNode,
  }) : obscureText = true,
       maxLines = 1,
       minLines = null,
       maxLength = null,
       keyboardType = TextInputType.visiblePassword,
       textInputAction = TextInputAction.done,
       textCapitalization = TextCapitalization.none,
       inputFormatters = null,
       prefixText = null,
       suffixText = null;

  /// Search input field
  const AppInputField.search({
    super.key,
    this.label,
    this.hint = 'Search...',
    this.helperText,
    this.errorText,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.validator,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.prefixIcon = const Icon(Icons.search),
    this.suffixIcon,
    this.variant = AppInputVariant.filled,
    this.focusNode,
  }) : obscureText = false,
       maxLines = 1,
       minLines = null,
       maxLength = null,
       keyboardType = TextInputType.text,
       textInputAction = TextInputAction.search,
       textCapitalization = TextCapitalization.none,
       inputFormatters = null,
       prefixText = null,
       suffixText = null;

  /// Multiline text area
  const AppInputField.textarea({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.validator,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 4,
    this.minLines = 3,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.variant = AppInputVariant.filled,
    this.focusNode,
  }) : obscureText = false,
       keyboardType = TextInputType.multiline,
       textInputAction = TextInputAction.newline,
       textCapitalization = TextCapitalization.sentences,
       inputFormatters = null,
       prefixText = null,
       suffixText = null;

  /// The label text displayed above the input field.
  final String? label;

  /// Text displayed when the input field is empty.
  final String? hint;

  /// Text displayed below the input field to give the user information.
  final String? helperText;

  /// Text displayed below the input field to indicate an error. Overrides [helperText].
  final String? errorText;

  /// The initial value to populate the input field with.
  final String? initialValue;

  /// Controls the text being edited. Required for clearing or dynamically setting text.
  final TextEditingController? controller;

  /// Called when the text being edited changes.
  final ValueChanged<String>? onChanged;

  /// Called when the user taps the text input field.
  final VoidCallback? onTap;

  /// Called when the user submits the text via the keyboard action button.
  final ValueChanged<String>? onSubmitted;

  /// An optional method that validates the text input.
  final FormFieldValidator<String>? validator;

  /// Whether to hide the text being edited (e.g., for passwords).
  final bool obscureText;

  /// Whether the user can interact with the input field.
  final bool enabled;

  /// Whether the field is read-only (user can select text but not edit it).
  final bool readOnly;

  /// Whether the field should automatically gain focus when the widget is built.
  final bool autofocus;

  /// The maximum number of lines for the text to span. Defaults to 1.
  final int? maxLines;

  /// The minimum number of lines to reserve for the field's height.
  final int? minLines;

  /// The maximum length of the text input.
  final int? maxLength;

  /// The type of keyboard to display (e.g., [TextInputType.number], [TextInputType.emailAddress]).
  final TextInputType? keyboardType;

  /// The action button displayed on the keyboard (e.g., [TextInputAction.done], [TextInputAction.next]).
  final TextInputAction? textInputAction;

  /// Configures how the text input is capitalized.
  final TextCapitalization textCapitalization;

  /// A list of formatters to constrain and format the input text.
  final List<TextInputFormatter>? inputFormatters;

  /// An icon or widget to display at the beginning of the input field.
  final Widget? prefixIcon;

  /// An icon or widget to display at the end of the input field.
  final Widget? suffixIcon;

  /// Text to display before the input value.
  final String? prefixText;

  /// Text to display after the input value.
  final String? suffixText;

  /// The visual style variant of the input field.
  final AppInputVariant variant;

  /// An optional focus node to control and track the focus state of the field.
  final FocusNode? focusNode;

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTextStyles.fieldLabel.copyWith(
              color: widget.errorText != null
                  ? colorScheme.error
                  : colorScheme.onSurface,
            ),
          ),
          AppSpacing.verticalSpaceXS,
        ],
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          onFieldSubmitted: widget.onSubmitted,
          validator: widget.validator,
          obscureText: _obscureText,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          autofocus: widget.autofocus,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          inputFormatters: widget.inputFormatters,
          style: AppTextStyles.bodyMedium,
          decoration: _buildInputDecoration(context),
        ),
        if (widget.helperText != null || widget.errorText != null) ...[
          AppSpacing.verticalSpaceXS,
          Text(
            widget.errorText ?? widget.helperText!,
            style: AppTextStyles.helper.copyWith(
              color: widget.errorText != null
                  ? colorScheme.error
                  : colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    var suffixIcon = widget.suffixIcon;

    // Add show/hide password icon for password fields
    if (widget.obscureText && widget.suffixIcon == null) {
      suffixIcon = IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          size: AppSizing.iconMD,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }

    switch (widget.variant) {
      case AppInputVariant.filled:
        return InputDecoration(
          hintText: widget.hint,
          prefixIcon: widget.prefixIcon,
          suffixIcon: suffixIcon,
          prefixText: widget.prefixText,
          suffixText: widget.suffixText,
          filled: true,
          fillColor: widget.errorText != null
              ? colorScheme.errorContainer.withValues(alpha: 0.1)
              : _hasFocus
              ? colorScheme.primaryContainer.withValues(alpha: 0.1)
              : colorScheme.surfaceContainerHighest.withValues(alpha: .3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizing.radiusLG),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizing.radiusLG),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizing.radiusLG),
            borderSide: BorderSide(
              color: widget.errorText != null
                  ? colorScheme.error
                  : colorScheme.primary,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizing.radiusLG),
            borderSide: BorderSide(color: colorScheme.error),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizing.radiusLG),
            borderSide: BorderSide(color: colorScheme.error, width: 2),
          ),
          contentPadding: const EdgeInsets.all(AppSpacing.lg),
        );

      case AppInputVariant.outlined:
        return InputDecoration(
          hintText: widget.hint,
          prefixIcon: widget.prefixIcon,
          suffixIcon: suffixIcon,
          prefixText: widget.prefixText,
          suffixText: widget.suffixText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizing.radiusLG),
            borderSide: BorderSide(color: colorScheme.outline),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizing.radiusLG),
            borderSide: BorderSide(
              color: colorScheme.outline.withValues(alpha: .5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizing.radiusLG),
            borderSide: BorderSide(
              color: widget.errorText != null
                  ? colorScheme.error
                  : colorScheme.primary,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizing.radiusLG),
            borderSide: BorderSide(color: colorScheme.error),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizing.radiusLG),
            borderSide: BorderSide(color: colorScheme.error, width: 2),
          ),
          contentPadding: const EdgeInsets.all(AppSpacing.lg),
        );

      case AppInputVariant.underlined:
        return InputDecoration(
          hintText: widget.hint,
          prefixIcon: widget.prefixIcon,
          suffixIcon: suffixIcon,
          prefixText: widget.prefixText,
          suffixText: widget.suffixText,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: colorScheme.outline),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: colorScheme.outline.withValues(alpha: .5),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget.errorText != null
                  ? colorScheme.error
                  : colorScheme.primary,
              width: 2,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorScheme.error),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorScheme.error, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: AppSpacing.md,
            horizontal: AppSpacing.xs,
          ),
        );
    }
  }
}
