import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

import 'core/config/environment_config.dart';
import 'core/design_system/design_system.dart';
import 'core/security/encryption_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize environment configuration
  EnvironmentConfig.initialize();

  // Validate configuration for production
  try {
    EnvironmentConfig.validateConfig();
  } on Exception catch (e) {
    if (kDebugMode) {
      Logger().w('Configuration validation warning: $e');
    } else {
      // In production, configuration errors should be fatal
      Logger().e('Configuration validation failed: $e');
      rethrow;
    }
  }

  // Initialize encryption service
  try {
    EncryptionService.instance;
  } on Exception catch (e) {
    Logger().e('Failed to initialize encryption service: $e');
    rethrow;
  }

  // Initialize Hive for local storage
  await Hive.initFlutter();

  // Log environment info in debug mode
  if (kDebugMode) {
    final logger = Logger();
    logger.i('Clubland app starting...');
    logger.d('Environment: ${EnvironmentConfig.currentEnvironment.name}');
    logger.d('Configuration: ${EnvironmentConfig.getConfigSummary()}');
  }

  runApp(const ProviderScope(child: ClublandApp()));
}

/// Initialize the ClublandApp
class ClublandApp extends StatelessWidget {
  /// Constructs a [ClublandApp]
  const ClublandApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Clubland',
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    home: const WelcomeScreen(),
    debugShowCheckedModeBanner: false,
  );
}

/// Initialize the WelcomeScreen
class WelcomeScreen extends StatelessWidget {
  /// Constructs a [WelcomeScreen]
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Padding(
        padding: AppSpacing.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_city, size: 80, color: Colors.blue),
            AppSpacing.verticalSpaceXL,
            Text(
              'Welcome to Clubland',
              style: AppTextStyles.headlineLarge,
              textAlign: TextAlign.center,
            ),
            AppSpacing.verticalSpaceMD,
            Text(
              'Discover premium reciprocal clubs worldwide',
              style: AppTextStyles.bodyLarge,
              textAlign: TextAlign.center,
            ),
            AppSpacing.verticalSpaceXXL,
            AppButton.primary(
              text: 'Get Started',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Feature coming soon!')),
                );
              },
            ),
            AppSpacing.verticalSpaceMD,
            AppButton.secondary(
              text: 'Learn More',
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('About Clubland'),
                    content: const Text(
                      'Clubland is a premium reciprocal club membership platform that connects you to exclusive clubs worldwide.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
