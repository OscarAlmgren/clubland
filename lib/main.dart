import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/design_system/design_system.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const ProviderScope(child: ClublandApp()));
}

class ClublandApp extends StatelessWidget {
  const ClublandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clubland',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_city,
                size: 80,
                color: Colors.blue,
              ),
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
                    const SnackBar(
                      content: Text('Feature coming soon!'),
                    ),
                  );
                },
              ),
              AppSpacing.verticalSpaceMD,
              AppButton.secondary(
                text: 'Learn More',
                onPressed: () {
                  showDialog(
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
}
