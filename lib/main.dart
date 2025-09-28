import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:logger/logger.dart';

import 'app/app.dart';
import 'core/config/environment_config.dart';
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
