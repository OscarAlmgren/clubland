import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../events/presentation/controllers/events_controller.dart';
import '../../data/repositories/home_feed_repository_impl.dart';
import '../../domain/repositories/home_feed_repository.dart';

part 'home_providers.g.dart';

/// Home feed repository provider.
@riverpod
HomeFeedRepository homeFeedRepository(Ref ref) {
  final eventsRepo = ref.read(eventsRepositoryProvider);
  return HomeFeedRepositoryImpl(eventsRepository: eventsRepo);
}
