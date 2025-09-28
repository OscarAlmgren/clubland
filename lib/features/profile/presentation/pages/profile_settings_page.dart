import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/language_provider.dart';
import '../../../../generated/l10n/l10n.dart';

/// Profile settings page for managing user preferences
class ProfileSettingsPage extends ConsumerWidget {
  /// Constructs a [ProfileSettingsPage]
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(languageNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingsSection(context, S.of(context).language, [
            _buildLanguageTile(context, ref, currentLanguage),
          ]),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
      Card(child: Column(children: children)),
    ],
  );

  Widget _buildLanguageTile(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<AppLanguage?> currentLanguageAsync,
  ) => ListTile(
    leading: const Icon(Icons.language),
    title: Text(S.of(context).language),
    subtitle: Text(S.of(context).languageSubtitle),
    trailing: currentLanguageAsync.when(
      data: (language) {
        // 💡 FIX: Simplify logic and provide a guaranteed non-null language object.
        final displayLanguage = language ?? AppLanguage.english;

        return Text(
          displayLanguage.getDisplayName(displayLanguage),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      },
      loading: () => const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
      error: (_, _) => const Icon(Icons.error_outline),
    ),
    onTap: () => _showLanguageSelector(context, ref, currentLanguageAsync),
  );

  void _showLanguageSelector(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<AppLanguage?> currentLanguageAsync,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        // We retrieve the selected language here
        final selectedLanguage = currentLanguageAsync.value;

        return AlertDialog(
          title: Text(S.of(context).selectLanguage),

          // The RadioGroup handles the value change for the entire group
          content: RadioGroup<AppLanguage>(
            groupValue: selectedLanguage,

            // This is the single place where the state is updated and the dialog is closed
            onChanged: (AppLanguage? value) {
              if (value != null) {
                // Update Riverpod state
                ref.read(languageNotifierProvider.notifier).setLanguage(value);
                // Close the dialog immediately after selection
                Navigator.of(context).pop();
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: AppLanguage.values.map((language) {
                final currentLang = selectedLanguage ?? AppLanguage.english;

                return RadioListTile<AppLanguage>(
                  value: language,
                  title: Text(language.getDisplayName(currentLang)),
                  selected: language == selectedLanguage,
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(S.of(context).cancel),
            ),
          ],
        );
      },
    );
  }
}
