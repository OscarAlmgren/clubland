import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Optimized image loading system with multiple performance enhancements
class OptimizedImageLoading {
  static const int _maxCacheSize = 100;
  static const int _maxMemoryCacheSize = 50 * 1024 * 1024; // 50MB
  static final Map<String, ImageInfo> _imageCache = {};
  static final Map<String, DateTime> _cacheTimestamps = {};
  static int _currentCacheSize = 0;

  /// Load and cache an image with automatic resizing
  static Future<ImageProvider> loadOptimizedImage({
    required String imageUrl,
    int? targetWidth,
    int? targetHeight,
    bool useMemoryCache = true,
    BoxFit fit = BoxFit.cover,
  }) async {
    final cacheKey =
        '${imageUrl}_${targetWidth ?? 0}_${targetHeight ?? 0}_$fit';

    if (useMemoryCache && _imageCache.containsKey(cacheKey)) {
      _updateCacheAccess(cacheKey);
      return MemoryImage(
        _imageCache[cacheKey]!.image.toByteData().then(
              (data) => data!.buffer.asUint8List(),
            )
            as Uint8List,
      );
    }

    try {
      final imageProvider = _createImageProvider(imageUrl);

      if (targetWidth != null || targetHeight != null) {
        return _ResizedImageProvider(
          imageProvider,
          targetWidth: targetWidth,
          targetHeight: targetHeight,
          fit: fit,
          cacheKey: useMemoryCache ? cacheKey : null,
        );
      }

      return imageProvider;
    } on Exception catch (e) {
      debugPrint('Failed to load image $imageUrl: $e');
      return const AssetImage('assets/images/placeholder.png'); // Fallback
    }
  }

  static ImageProvider _createImageProvider(String imageUrl) {
    if (imageUrl.startsWith('http')) {
      return NetworkImage(imageUrl);
    } else if (imageUrl.startsWith('assets/')) {
      return AssetImage(imageUrl);
    } else {
      return AssetImage('assets/images/$imageUrl');
    }
  }

  static void _updateCacheAccess(String cacheKey) {
    _cacheTimestamps[cacheKey] = DateTime.now();
  }

  static void _addToCache(String cacheKey, ImageInfo imageInfo) {
    // Remove old entries if cache is too large
    if (_imageCache.length >= _maxCacheSize) {
      _evictLeastRecentlyUsed();
    }

    _imageCache[cacheKey] = imageInfo;
    _cacheTimestamps[cacheKey] = DateTime.now();
    _currentCacheSize += _estimateImageSize(imageInfo);
  }

  static void _evictLeastRecentlyUsed() {
    if (_cacheTimestamps.isEmpty) return;

    final oldestKey = _cacheTimestamps.entries
        .reduce((a, b) => a.value.isBefore(b.value) ? a : b)
        .key;

    final imageInfo = _imageCache.remove(oldestKey);
    _cacheTimestamps.remove(oldestKey);

    if (imageInfo != null) {
      _currentCacheSize -= _estimateImageSize(imageInfo);
    }
  }

  static int _estimateImageSize(ImageInfo imageInfo) {
    final image = imageInfo.image;
    return image.width * image.height * 4; // Assume 4 bytes per pixel (RGBA)
  }

  /// Clear the image cache
  static void clearCache() {
    _imageCache.clear();
    _cacheTimestamps.clear();
    _currentCacheSize = 0;
  }

  /// Get cache statistics
  static Map<String, dynamic> getCacheStats() => {
    'cachedImages': _imageCache.length,
    'estimatedMemoryUsage': _currentCacheSize,
    'maxCacheSize': _maxCacheSize,
    'maxMemorySize': _maxMemoryCacheSize,
  };
}

class _ResizedImageProvider extends ImageProvider<_ResizedImageProvider> {
  const _ResizedImageProvider(
    this.imageProvider, {
    this.targetWidth,
    this.targetHeight,
    this.fit = BoxFit.cover,
    this.cacheKey,
  });

  final ImageProvider imageProvider;
  final int? targetWidth;
  final int? targetHeight;
  final BoxFit fit;
  final String? cacheKey;

  @override
  Future<_ResizedImageProvider> obtainKey(ImageConfiguration configuration) =>
      SynchronousFuture<_ResizedImageProvider>(this);

  @override
  ImageStreamCompleter loadImage(
    _ResizedImageProvider key,
    ImageDecoderCallback decode,
  ) => MultiFrameImageStreamCompleter(
    codec: _loadAsync(key, decode),
    scale: 1.0,
  );

  Future<ui.Codec> _loadAsync(
    _ResizedImageProvider key,
    ImageDecoderCallback decode,
  ) async {
    try {
      final completer = Completer<ui.Codec>();

      imageProvider
          .resolve(ImageConfiguration.empty)
          .addListener(
            ImageStreamListener((ImageInfo info, bool _) async {
              try {
                final resizedImage = await _resizeImage(
                  info.image,
                  targetWidth,
                  targetHeight,
                  fit,
                );

                if (cacheKey != null) {
                  OptimizedImageLoading._addToCache(
                    cacheKey!,
                    ImageInfo(image: resizedImage),
                  );
                }

                final bytes = await resizedImage.toByteData(
                  format: ui.ImageByteFormat.png,
                );
                if (bytes != null) {
                  final codec = await decode(
                    bytes.buffer.asUint8List() as ui.ImmutableBuffer,
                  );
                  completer.complete(codec);
                } else {
                  throw Exception('Failed to encode resized image');
                }
              } catch (e) {
                completer.completeError(e);
              }
            }),
          );

      return completer.future;
    } on Exception catch (e) {
      // FIX: Throw a guaranteed Error class (FlutterError)
      throw FlutterError('Failed to load and resize image: $e');
    }
  }

  static Future<ui.Image> _resizeImage(
    ui.Image image,
    int? targetWidth,
    int? targetHeight,
    BoxFit fit,
  ) async {
    final originalWidth = image.width;
    final originalHeight = image.height;

    // Calculate target dimensions
    int finalWidth, finalHeight;

    if (targetWidth != null && targetHeight != null) {
      // Both dimensions specified
      switch (fit) {
        case BoxFit.cover:
          final scaleX = targetWidth / originalWidth;
          final scaleY = targetHeight / originalHeight;
          // Take the larger scale factor to cover the target area
          final scale = math.max(scaleX, scaleY);
          finalWidth = (originalWidth * scale).round();
          finalHeight = (originalHeight * scale).round();
          break;

        case BoxFit.contain:
          final scaleX = targetWidth / originalWidth;
          final scaleY = targetHeight / originalHeight;
          // Take the smaller scale factor to contain the image within the target area
          final scale = math.min(scaleX, scaleY);
          finalWidth = (originalWidth * scale).round();
          finalHeight = (originalHeight * scale).round();
          break;

        case BoxFit.fill:
          // Stretch to fill both dimensions, ignoring aspect ratio
          finalWidth = targetWidth;
          finalHeight = targetHeight;
          break;

        // FIX: Enumerating all remaining BoxFit values instead of 'default'
        case BoxFit.fitWidth:
          // Scale to fit the target width, calculating proportional height
          final scale = targetWidth / originalWidth;
          finalWidth = targetWidth;
          finalHeight = (originalHeight * scale).round();
          break;

        case BoxFit.fitHeight:
          // Scale to fit the target height, calculating proportional width
          final scale = targetHeight / originalHeight;
          finalWidth = (originalWidth * scale).round();
          finalHeight = targetHeight;
          break;

        case BoxFit.scaleDown:
        case BoxFit.none:
          // For scaleDown and none, when both target dimensions are present,
          // the standard approach is often to apply BoxFit.contain or do nothing,
          // but matching your original 'default' intention (setting to target size)
          // or simply deferring to the 'Don't upscale' logic is best here.
          finalWidth = targetWidth;
          finalHeight = targetHeight;
          break;
      }
    } else if (targetWidth != null) {
      // Only width specified
      final scale = targetWidth / originalWidth;
      finalWidth = targetWidth;
      finalHeight = (originalHeight * scale).round();
    } else if (targetHeight != null) {
      // Only height specified
      final scale = targetHeight / originalHeight;
      finalWidth = (originalWidth * scale).round();
      finalHeight = targetHeight;
    } else {
      // No resizing needed
      return image;
    }

    // Don't upscale images
    if (finalWidth > originalWidth || finalHeight > originalHeight) {
      return image;
    }

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, originalWidth.toDouble(), originalHeight.toDouble()),
      Rect.fromLTWH(0, 0, finalWidth.toDouble(), finalHeight.toDouble()),
      Paint()..filterQuality = FilterQuality.high,
    );

    final picture = recorder.endRecording();
    final resizedImage = await picture.toImage(finalWidth, finalHeight);

    picture.dispose();
    return resizedImage;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is _ResizedImageProvider &&
        other.imageProvider == imageProvider &&
        other.targetWidth == targetWidth &&
        other.targetHeight == targetHeight &&
        other.fit == fit;
  }

  @override
  int get hashCode =>
      Object.hash(imageProvider, targetWidth, targetHeight, fit);
}

/// Optimized image widget with lazy loading and automatic sizing
class OptimizedImage extends StatefulWidget {
  /// Construcs a [OptimizedImage]
  const OptimizedImage({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.useMemoryCache = true,
    this.fadeInDuration = const Duration(milliseconds: 250),
  });

  /// The image URL or asset path
  final String imageUrl;

  /// Target width for optimization
  final double? width;

  /// Target height for optimization
  final double? height;

  /// How the image should fit within its bounds
  final BoxFit fit;

  /// Widget to show while loading
  final Widget? placeholder;

  /// Widget to show on error
  final Widget? errorWidget;

  /// Whether to use memory cache
  final bool useMemoryCache;

  /// Duration for fade-in animation
  final Duration fadeInDuration;

  @override
  State<OptimizedImage> createState() => _OptimizedImageState();
}

class _OptimizedImageState extends State<OptimizedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  ImageProvider? _imageProvider;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.fadeInDuration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _loadImage();
  }

  @override
  void didUpdateWidget(OptimizedImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      _loadImage();
    }
  }

  Future<void> _loadImage() async {
    try {
      setState(() {
        _hasError = false;
      });

      final provider = await OptimizedImageLoading.loadOptimizedImage(
        imageUrl: widget.imageUrl,
        targetWidth: widget.width?.round(),
        targetHeight: widget.height?.round(),
        useMemoryCache: widget.useMemoryCache,
        fit: widget.fit,
      );

      if (mounted) {
        setState(() {
          _imageProvider = provider;
        });
        _animationController.forward();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return widget.errorWidget ??
          Container(
            width: widget.width,
            height: widget.height,
            color: Colors.grey[300],
            child: const Icon(Icons.error, color: Colors.grey),
          );
    }

    if (_imageProvider == null) {
      return widget.placeholder ??
          Container(
            width: widget.width,
            height: widget.height,
            color: Colors.grey[200],
            child: const Center(child: CircularProgressIndicator.adaptive()),
          );
    }

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Image(
        image: _imageProvider!,
        width: widget.width,
        height: widget.height,
        fit: widget.fit,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded || frame != null) {
            return child;
          }
          return widget.placeholder ??
              Container(
                width: widget.width,
                height: widget.height,
                color: Colors.grey[200],
              );
        },
        errorBuilder: (context, error, stackTrace) =>
            widget.errorWidget ??
            Container(
              width: widget.width,
              height: widget.height,
              color: Colors.grey[300],
              child: const Icon(Icons.broken_image, color: Colors.grey),
            ),
      ),
    );
  }
}
