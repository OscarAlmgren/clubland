import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// Text input formatters for various data types
class AppFormatters {
  /// Phone number formatter (US format)
  static TextInputFormatter get phoneNumber => _PhoneNumberFormatter();

  /// Credit card number formatter
  static TextInputFormatter get creditCard => _CreditCardFormatter();

  /// Expiry date formatter (MM/YY)
  static TextInputFormatter get expiryDate => _ExpiryDateFormatter();

  /// Currency formatter
  static TextInputFormatter get currency => _CurrencyFormatter();

  /// Uppercase formatter
  static TextInputFormatter get uppercase => UpperCaseTextFormatter();

  /// Lowercase formatter
  static TextInputFormatter get lowercase => LowerCaseTextFormatter();

  /// No spaces formatter
  static TextInputFormatter get noSpaces => FilteringTextInputFormatter.deny(RegExp(r'\s'));

  /// Only letters formatter
  static TextInputFormatter get lettersOnly => FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'));

  /// Only digits formatter
  static TextInputFormatter get digitsOnly => FilteringTextInputFormatter.digitsOnly;

  /// Letters and spaces only
  static TextInputFormatter get lettersAndSpaces => FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'));

  /// Alphanumeric only
  static TextInputFormatter get alphanumeric => FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'));

  /// Email formatter (basic)
  static TextInputFormatter get email => FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]'));

  /// Decimal number formatter
  static TextInputFormatter decimalNumber({int decimalPlaces = 2}) =>
      _DecimalFormatter(decimalPlaces: decimalPlaces);

  /// Length limiter
  static TextInputFormatter lengthLimit(int maxLength) => LengthLimitingTextInputFormatter(maxLength);
}

/// Phone number formatter implementation
class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digits

    if (text.length > 10) {
      return oldValue; // Don't allow more than 10 digits
    }

    String formatted = '';
    if (text.isNotEmpty) {
      if (text.length <= 3) {
        formatted = text;
      } else if (text.length <= 6) {
        formatted = '(${text.substring(0, 3)}) ${text.substring(3)}';
      } else {
        formatted = '(${text.substring(0, 3)}) ${text.substring(3, 6)}-${text.substring(6)}';
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// Credit card formatter implementation
class _CreditCardFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digits

    if (text.length > 16) {
      return oldValue; // Don't allow more than 16 digits
    }

    String formatted = '';
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formatted += ' ';
      }
      formatted += text[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// Expiry date formatter implementation (MM/YY)
class _ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digits

    if (text.length > 4) {
      return oldValue; // Don't allow more than 4 digits
    }

    String formatted = '';
    if (text.isNotEmpty) {
      if (text.length == 1) {
        final month = int.tryParse(text);
        if (month != null && month > 1) {
          formatted = '0$text/';
        } else {
          formatted = text;
        }
      } else if (text.length == 2) {
        final month = int.tryParse(text);
        if (month != null && month > 12) {
          formatted = '0${text[0]}/';
        } else {
          formatted = '$text/';
        }
      } else if (text.length == 3) {
        formatted = '${text.substring(0, 2)}/${text.substring(2)}';
      } else if (text.length == 4) {
        formatted = '${text.substring(0, 2)}/${text.substring(2)}';
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// Currency formatter implementation
class _CurrencyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'[^\d.]'), ''); // Keep only digits and decimal

    if (text.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // Ensure only one decimal point
    final parts = text.split('.');
    if (parts.length > 2) {
      return oldValue;
    }

    // Limit decimal places to 2
    if (parts.length == 2 && parts[1].length > 2) {
      return oldValue;
    }

    final double? amount = double.tryParse(text);
    if (amount == null) {
      return oldValue;
    }

    final formatted = NumberFormat.currency(symbol: '\$', decimalDigits: text.contains('.') ? null : 0)
        .format(amount);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// Decimal number formatter
class _DecimalFormatter extends TextInputFormatter {
  final int decimalPlaces;

  _DecimalFormatter({required this.decimalPlaces});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    // Allow empty text
    if (text.isEmpty) {
      return newValue;
    }

    // Check if it's a valid decimal number
    if (!RegExp(r'^\d*\.?\d*$').hasMatch(text)) {
      return oldValue;
    }

    // Check decimal places
    if (text.contains('.')) {
      final parts = text.split('.');
      if (parts.length == 2 && parts[1].length > decimalPlaces) {
        return oldValue;
      }
    }

    return newValue;
  }
}

/// Uppercase text formatter
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

/// Lowercase text formatter
class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

/// Title case text formatter
class TitleCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final words = newValue.text.split(' ');
    final titleCased = words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');

    return TextEditingValue(
      text: titleCased,
      selection: newValue.selection,
    );
  }
}

/// Data formatting utilities
class DataFormatters {
  /// Format currency
  static String formatCurrency(double amount, {String locale = 'en_US', String symbol = '\$'}) {
    return NumberFormat.currency(locale: locale, symbol: symbol).format(amount);
  }

  /// Format percentage
  static String formatPercentage(double value, {int decimalPlaces = 1}) {
    return NumberFormat.percentPattern().format(value);
  }

  /// Format file size
  static String formatFileSize(int bytes) {
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    var size = bytes.toDouble();
    var suffixIndex = 0;

    while (size >= 1024 && suffixIndex < suffixes.length - 1) {
      size /= 1024;
      suffixIndex++;
    }

    return '${size.toStringAsFixed(1)} ${suffixes[suffixIndex]}';
  }

  /// Format distance
  static String formatDistance(double meters) {
    if (meters < 1000) {
      return '${meters.round()} m';
    } else {
      final km = meters / 1000;
      return '${km.toStringAsFixed(1)} km';
    }
  }

  /// Format duration
  static String formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays}d ${duration.inHours.remainder(24)}h';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes.remainder(60)}m';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m';
    } else {
      return '${duration.inSeconds}s';
    }
  }

  /// Format phone number for display
  static String formatPhoneNumber(String phoneNumber, {String countryCode = 'US'}) {
    final digits = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (countryCode == 'US' && digits.length == 10) {
      return '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
    }

    return phoneNumber; // Return original if can't format
  }

  /// Format date relative to now
  static String formatRelativeDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 7) {
      return DateFormat.yMd().format(date);
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

  /// Format time range
  static String formatTimeRange(DateTime start, DateTime end) {
    final startTime = DateFormat.jm().format(start);
    final endTime = DateFormat.jm().format(end);
    return '$startTime - $endTime';
  }

  /// Format compact number (1.2K, 1.5M, etc.)
  static String formatCompactNumber(int number) {
    if (number < 1000) {
      return number.toString();
    } else if (number < 1000000) {
      final k = number / 1000;
      return '${k.toStringAsFixed(k.truncateToDouble() == k ? 0 : 1)}K';
    } else {
      final m = number / 1000000;
      return '${m.toStringAsFixed(m.truncateToDouble() == m ? 0 : 1)}M';
    }
  }

  /// Format ordinal numbers (1st, 2nd, 3rd, etc.)
  static String formatOrdinal(int number) {
    if (number >= 11 && number <= 13) {
      return '${number}th';
    }

    switch (number % 10) {
      case 1:
        return '${number}st';
      case 2:
        return '${number}nd';
      case 3:
        return '${number}rd';
      default:
        return '${number}th';
    }
  }

  /// Format rating with stars
  static String formatRating(double rating, {bool showNumeric = true}) {
    final stars = '★' * rating.floor() + '☆' * (5 - rating.floor());
    return showNumeric ? '$stars (${rating.toStringAsFixed(1)})' : stars;
  }
}