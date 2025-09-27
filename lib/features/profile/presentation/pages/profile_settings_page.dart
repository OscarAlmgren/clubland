import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
          _buildSettingsSection(
            context,
            S.of(context).language,
            [
              _buildLanguageTile(context, ref, currentLanguage),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
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
        Card(
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildLanguageTile(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<AppLanguage?> currentLanguageAsync,
  ) {
    return ListTile(
      leading: const Icon(Icons.language),
      title: Text(S.of(context).language),
      subtitle: Text(S.of(context).languageSubtitle),
      trailing: currentLanguageAsync.when(
        data: (language) => Text(
          language?.getDisplayName(language ?? AppLanguage.english) ??
              AppLanguage.english.getDisplayName(AppLanguage.english),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        loading: () => const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        error: (_, __) => const Icon(Icons.error_outline),
      ),
      onTap: () => _showLanguageSelector(context, ref, currentLanguageAsync),
    );
  }

  void _showLanguageSelector(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<AppLanguage?> currentLanguageAsync,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).selectLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: AppLanguage.values.map((language) {
            final isSelected = currentLanguageAsync.value == language;
            final currentLang = currentLanguageAsync.value ?? AppLanguage.english;

            return ListTile(
              leading: Radio<AppLanguage>(
                value: language,
                groupValue: currentLanguageAsync.value,
                onChanged: (AppLanguage? value) {
                  if (value != null) {
                    ref.read(languageNotifierProvider.notifier).setLanguage(value);
                    Navigator.of(context).pop();
                  }
                },
              ),
              title: Text(language.getDisplayName(currentLang)),
              selected: isSelected,
              onTap: () {
                ref.read(languageNotifierProvider.notifier).setLanguage(language);
                Navigator.of(context).pop();
              },
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(S.of(context).cancel),
          ),
        ],
      ),
    );
  }
}