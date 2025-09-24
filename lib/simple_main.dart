import 'package:flutter/material.dart';

void main() {
  runApp(const ClublandDemo());
}

class ClublandDemo extends StatelessWidget {
  const ClublandDemo({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Clubland Demo',
    theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
    home: const WelcomeScreen(),
    debugShowCheckedModeBanner: false,
  );
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Clubland'),
      backgroundColor: Colors.blue.shade700,
      foregroundColor: Colors.white,
    ),
    body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_city, size: 80, color: Colors.blue),
          const SizedBox(height: 32),
          Text(
            'Welcome to Clubland',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Discover premium reciprocal clubs worldwide',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const FeaturesScreen(),
                  ),
                );
              },
              child: const Text('Explore Features'),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue.shade700,
                side: BorderSide(color: Colors.blue.shade700),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
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
              child: const Text('Learn More'),
            ),
          ),
        ],
      ),
    ),
  );
}

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Features'),
      backgroundColor: Colors.blue.shade700,
      foregroundColor: Colors.white,
    ),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _FeatureCard(
          icon: Icons.search,
          title: 'Find Clubs',
          description: 'Discover premium clubs worldwide',
          onTap: () => _showFeatureDialog(context, 'Find Clubs'),
        ),
        const SizedBox(height: 16),
        _FeatureCard(
          icon: Icons.calendar_today,
          title: 'Book Visits',
          description: 'Reserve your reciprocal club visits',
          onTap: () => _showFeatureDialog(context, 'Book Visits'),
        ),
        const SizedBox(height: 16),
        _FeatureCard(
          icon: Icons.person,
          title: 'Member Profile',
          description: 'Manage your membership and preferences',
          onTap: () => _showFeatureDialog(context, 'Member Profile'),
        ),
        const SizedBox(height: 16),
        _FeatureCard(
          icon: Icons.history,
          title: 'Visit History',
          description: 'Track your club visits and experiences',
          onTap: () => _showFeatureDialog(context, 'Visit History'),
        ),
      ],
    ),
  );

  void _showFeatureDialog(BuildContext context, String feature) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(feature),
        content: Text('The $feature feature will be available soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Card(
    elevation: 2,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 32, color: Colors.blue.shade700),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    ),
  );
}
