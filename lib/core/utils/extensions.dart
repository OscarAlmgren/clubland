import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// String extensions
extension StringExtensions on String {
  /// Check if string is a valid email
  bool get isValidEmail {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(this);
  }

  /// Check if string is a valid phone number
  bool get isValidPhoneNumber {
    return RegExp(r'^\+?[\d\s\-\(\)]+$').hasMatch(this) && length >= 10;
  }

  /// Capitalize first letter
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Title case
  String get titleCase {
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Check if string is empty or null
  bool get isNullOrEmpty => isEmpty;

  /// Remove all whitespace
  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  /// Format as currency
  String formatAsCurrency({String symbol = '\$', int decimalPlaces = 2}) {
    final amount = double.tryParse(this) ?? 0.0;
    return NumberFormat.currency(symbol: symbol, decimalDigits: decimalPlaces).format(amount);
  }

  /// Truncate string with ellipsis
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }

  /// Convert to slug (URL-friendly string)
  String get toSlug {
    return toLowerCase()
        .replaceAll(RegExp(r'[^\w\s-]'), '')
        .replaceAll(RegExp(r'[-\s]+'), '-')
        .trim();
  }

  /// Check if string contains only digits
  bool get isNumeric => RegExp(r'^[0-9]+$').hasMatch(this);

  /// Parse to DateTime
  DateTime? get toDateTime {
    try {
      return DateTime.parse(this);
    } catch (e) {
      return null;
    }
  }

  /// Format phone number
  String get formatPhoneNumber {
    final cleaned = removeWhitespace;
    if (cleaned.length == 10) {
      return '(${cleaned.substring(0, 3)}) ${cleaned.substring(3, 6)}-${cleaned.substring(6)}';
    }
    return this;
  }
}

/// DateTime extensions
extension DateTimeExtensions on DateTime {
  /// Format as time only
  String get timeOnly => DateFormat.jm().format(this);

  /// Format as date only
  String get dateOnly => DateFormat.yMd().format(this);

  /// Format as date and time
  String get dateTime => DateFormat.yMd().add_jm().format(this);

  /// Format as relative time (e.g., "2 hours ago")
  String get relativeTime {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 7) {
      return dateOnly;
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }

  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }

  /// Check if date is tomorrow
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year && month == tomorrow.month && day == tomorrow.day;
  }

  /// Get start of day
  DateTime get startOfDay => DateTime(year, month, day);

  /// Get end of day
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);

  /// Format for API (ISO 8601)
  String get toIso8601String => toUtc().toIso8601String();

  /// Add business days (excluding weekends)
  DateTime addBusinessDays(int days) {
    var date = this;
    var addedDays = 0;

    while (addedDays < days) {
      date = date.add(const Duration(days: 1));
      if (date.weekday != DateTime.saturday && date.weekday != DateTime.sunday) {
        addedDays++;
      }
    }

    return date;
  }
}

/// List extensions
extension ListExtensions<T> on List<T> {
  /// Get element at index safely
  T? getOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }

  /// Check if list is null or empty
  bool get isNullOrEmpty => isEmpty;

  /// Toggle element in list
  void toggle(T element) {
    if (contains(element)) {
      remove(element);
    } else {
      add(element);
    }
  }

  /// Group by a key function
  Map<K, List<T>> groupBy<K>(K Function(T) keyFunction) {
    final result = <K, List<T>>{};
    for (final element in this) {
      final key = keyFunction(element);
      result.putIfAbsent(key, () => []).add(element);
    }
    return result;
  }

  /// Find first element or null
  T? firstWhereOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  /// Chunk list into smaller lists
  List<List<T>> chunk(int size) {
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, (i + size < length) ? i + size : length));
    }
    return chunks;
  }
}

/// Map extensions
extension MapExtensions<K, V> on Map<K, V> {
  /// Get value safely
  V? getOrNull(K key) => this[key];

  /// Get value or default
  V getOrDefault(K key, V defaultValue) => this[key] ?? defaultValue;

  /// Check if map is null or empty
  bool get isNullOrEmpty => isEmpty;
}

/// BuildContext extensions
extension BuildContextExtensions on BuildContext {
  /// Get theme
  ThemeData get theme => Theme.of(this);

  /// Get text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Get media query
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get screen size
  Size get screenSize => mediaQuery.size;

  /// Get screen width
  double get screenWidth => screenSize.width;

  /// Get screen height
  double get screenHeight => screenSize.height;

  /// Check if device is mobile
  bool get isMobile => screenWidth < 768;

  /// Check if device is tablet
  bool get isTablet => screenWidth >= 768 && screenWidth < 1024;

  /// Check if device is desktop
  bool get isDesktop => screenWidth >= 1024;

  /// Get safe area padding
  EdgeInsets get safeAreaPadding => mediaQuery.padding;

  /// Get keyboard height
  double get keyboardHeight => mediaQuery.viewInsets.bottom;

  /// Check if keyboard is visible
  bool get isKeyboardVisible => keyboardHeight > 0;

  /// Show snackbar
  void showSnackBar(String message, {Duration? duration, Color? backgroundColor}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration ?? const Duration(seconds: 4),
        backgroundColor: backgroundColor,
      ),
    );
  }

  /// Show error snackbar
  void showErrorSnackBar(String message) {
    showSnackBar(message, backgroundColor: colorScheme.error);
  }

  /// Show success snackbar
  void showSuccessSnackBar(String message) {
    showSnackBar(message, backgroundColor: Colors.green);
  }

  /// Push named route
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  /// Pop current route
  void pop<T>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  /// Push and remove until
  Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil<T>(
      routeName,
      predicate,
      arguments: arguments,
    );
  }
}

/// Duration extensions
extension DurationExtensions on Duration {
  /// Format duration as human readable
  String get humanReadable {
    if (inDays > 0) {
      return '${inDays}d ${inHours.remainder(24)}h';
    } else if (inHours > 0) {
      return '${inHours}h ${inMinutes.remainder(60)}m';
    } else if (inMinutes > 0) {
      return '${inMinutes}m';
    } else {
      return '${inSeconds}s';
    }
  }

  /// Format duration as timer (mm:ss)
  String get timerFormat {
    final minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

/// Double extensions
extension DoubleExtensions on double {
  /// Format as currency
  String toCurrency({String symbol = '\$', int decimalPlaces = 2}) {
    return NumberFormat.currency(symbol: symbol, decimalDigits: decimalPlaces).format(this);
  }

  /// Format as percentage
  String toPercentage({int decimalPlaces = 1}) {
    return NumberFormat.percentPattern().format(this / 100);
  }

  /// Round to decimal places
  double roundToDecimalPlaces(int decimalPlaces) {
    final mod = pow(10.0, decimalPlaces);
    return ((this * mod).round().toDouble() / mod);
  }

  /// Convert to file size string
  String get fileSizeString {
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    var size = this;
    var suffixIndex = 0;

    while (size >= 1024 && suffixIndex < suffixes.length - 1) {
      size /= 1024;
      suffixIndex++;
    }

    return '${size.roundToDecimalPlaces(1)} ${suffixes[suffixIndex]}';
  }
}

/// Color extensions
extension ColorExtensions on Color {
  /// Convert to hex string
  String get hexString {
    return '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
  }

  /// Lighten color
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Darken color
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
}

/// Import required for pow function
import 'dart:math' show pow;