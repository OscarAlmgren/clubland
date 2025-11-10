// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_feed_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// News feed controller - manages news feed items

@ProviderFor(NewsFeedController)
const newsFeedControllerProvider = NewsFeedControllerProvider._();

/// News feed controller - manages news feed items
final class NewsFeedControllerProvider
    extends
        $AsyncNotifierProvider<NewsFeedController, List<NewsFeedItemEntity>> {
  /// News feed controller - manages news feed items
  const NewsFeedControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newsFeedControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newsFeedControllerHash();

  @$internal
  @override
  NewsFeedController create() => NewsFeedController();
}

String _$newsFeedControllerHash() =>
    r'fbdffcdcb1160caba966bab5ae490c1c9654b10f';

/// News feed controller - manages news feed items

abstract class _$NewsFeedController
    extends $AsyncNotifier<List<NewsFeedItemEntity>> {
  FutureOr<List<NewsFeedItemEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<NewsFeedItemEntity>>,
              List<NewsFeedItemEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<NewsFeedItemEntity>>,
                List<NewsFeedItemEntity>
              >,
              AsyncValue<List<NewsFeedItemEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
