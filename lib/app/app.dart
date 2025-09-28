import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/design_system/design_system.dart';
import '../core/providers/core_providers.dart';
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
    final scaffoldMessengerKey = ref.watch(scaffoldMessengerKeyProvider);

    return MaterialApp.router(
      title: 'Clubland',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: ref.watch(appRouterProvider),
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,

      // Localization configuration
      locale: currentLocale,
      supportedLocales: supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      builder: (context, child) => AppWrapper(child: child!),
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
    try {
      // Initialize core services first (GraphQL, storage, error handler, etc.)
      final isInitialized = await ref.read(appInitializationProvider.future);

      if (!isInitialized) {
        throw Exception('Core services initialization failed');
      }

      // Auth initialization is optional for basic app functionality
      // The auth state will be managed by the router's redirect logic
      try {
        // Don't await - let auth initialize in background
        ref.read(authControllerProvider.future).then((_) {
          // Auth controller initialized successfully
        }).catchError((Object e) {
          // Auth controller initialization failed (non-fatal)
        });
      } catch (e) {
        // Auth controller initialization error (non-fatal)
      }

      // Add a delay to show splash screen
      await Future<void>.delayed(const Duration(milliseconds: 2000));

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e, stackTrace) {
      // If initialization fails, show error and retry
      if (mounted) {
        setState(() {
          _isInitialized = false;
        });
      }
      // Could add retry logic here
      rethrow;
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
