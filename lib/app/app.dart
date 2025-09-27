import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/design_system/design_system.dart';
import '../core/providers/language_provider.dart';
import '../features/auth/presentation/controllers/auth_controller.dart';
import '../features/auth/presentation/pages/splash_page.dart';
import '../generated/l10n/l10n.dart';
import 'router/app_router.dart';

/// Main Clubland application widget with routing and authentication
class ClublandApp extends ConsumerWidget {
  /// Constructs a [ClublandApp]
  const ClublandApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(currentLocaleProvider);
    final supportedLocales = ref.watch(supportedLocalesProvider);

    return MaterialApp.router(
      title: 'Clubland',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: ref.watch(appRouterProvider),
      debugShowCheckedModeBanner: false,

      // Localization configuration
      locale: currentLocale,
      supportedLocales: supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      builder: (context, child) {
        return AppWrapper(child: child!);
      },
    );
  }
}

/// App wrapper for global functionality like splash screen, error handling, etc.
class AppWrapper extends ConsumerStatefulWidget {
  /// Constructs an [AppWrapper]
  const AppWrapper({required this.child, super.key});

  /// The child widget to wrap
  final Widget child;

  @override
  ConsumerState<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends ConsumerState<AppWrapper> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Initialize auth controller (which handles auth state restoration)
    await ref.read(authControllerProvider.future);

    // Add a small delay to show splash screen
    await Future<void>.delayed(const Duration(milliseconds: 1500));

    if (mounted) {
      setState(() {
        _isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const SplashPage();
    }

    return widget.child;
  }
}
