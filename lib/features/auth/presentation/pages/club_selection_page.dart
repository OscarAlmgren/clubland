import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';
import '../../../../features/clubs/domain/entities/simple_club.dart';
import '../../../../features/clubs/presentation/controllers/clubs_controller.dart';

/// Lets the user pick their club before logging in.
///
/// Accepts [email] from the login page and pairs it with the selected club
/// slug before navigating to [HankoAuthPage].
class ClubSelectionPage extends ConsumerStatefulWidget {
  const ClubSelectionPage({required this.email, super.key});

  final String email;

  @override
  ConsumerState<ClubSelectionPage> createState() => _ClubSelectionPageState();
}

class _ClubSelectionPageState extends ConsumerState<ClubSelectionPage> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final clubsAsync = ref.watch(allClubsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Club'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search clubs...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
              onChanged: (value) =>
                  setState(() => _query = value.toLowerCase()),
            ),
          ),
          Expanded(
            child: clubsAsync.when(
              data: (clubs) {
                final filtered = _query.isEmpty
                    ? clubs
                    : clubs
                          .where(
                            (c) =>
                                c.name.toLowerCase().contains(_query) ||
                                c.description.toLowerCase().contains(_query),
                          )
                          .toList();

                if (filtered.isEmpty) {
                  return Center(
                    child: Text(
                      'No clubs found',
                      style: theme.textTheme.bodyMedium,
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) =>
                      _ClubTile(club: filtered[index], email: widget.email),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, size: 48),
                    const SizedBox(height: 8),
                    Text('Failed to load clubs: $error'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => ref.invalidate(allClubsProvider),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ClubTile extends StatelessWidget {
  const _ClubTile({required this.club, required this.email});

  final SimpleClub club;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: club.logo != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  club.logo!,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _defaultLogo(context),
                ),
              )
            : _defaultLogo(context),
        title: Text(club.name, style: Theme.of(context).textTheme.titleMedium),
        subtitle: club.description.isNotEmpty
            ? Text(
                club.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push(
          RoutePaths.hankoAuth,
          extra: {'email': email, 'clubSlug': club.slug},
        ),
      ),
    );
  }

  Widget _defaultLogo(BuildContext context) => Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(Icons.business, color: Theme.of(context).colorScheme.primary),
  );
}
