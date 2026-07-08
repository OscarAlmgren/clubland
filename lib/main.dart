import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

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

  runApp(const ProviderScope(child: ClublandApp()));
}
