import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/app.dart';
import 'core/config/environment_config.dart';

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

  // Storage initialization is now handled by the StorageManager in app providers

  // Log environment info in debug mode
  if (kDebugMode) {
    final logger = Logger();
    logger.i('Clubland app starting...');
    logger.d('Environment: ${EnvironmentConfig.currentEnvironment.name}');
    logger.d('Configuration: ${EnvironmentConfig.getConfigSummary()}');
  }

  // Crash reporting: initialized only when a DSN is provided, so dev builds
  // without SENTRY_DSN run without it. Sentry.captureException elsewhere is a
  // no-op when uninitialized.
  final sentryDsn = EnvironmentConfig.sentryDsn;
  if (sentryDsn.isNotEmpty && EnvironmentConfig.enableCrashReporting) {
    await SentryFlutter.init((options) {
      options
        ..dsn = sentryDsn
        ..environment = EnvironmentConfig.currentEnvironment.name
        ..tracesSampleRate = 0.2;
    }, appRunner: () => runApp(const ProviderScope(child: ClublandApp())));
  } else {
    runApp(const ProviderScope(child: ClublandApp()));
  }
}
