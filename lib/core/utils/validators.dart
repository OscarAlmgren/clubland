import 'package:intl/intl.dart';

/// Form validation utilities
class Validators {
  /// Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  /// Password validation
  static String? validatePassword(String? value, {int minLength = 8}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < minLength) {
      return 'Password must be at least $minLength characters long';
    }

    // Check for at least one uppercase letter
    if (!RegExp('[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for at least one lowercase letter
    if (!RegExp('[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for at least one digit
    if (!RegExp('[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    // Check for at least one special character
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  /// Confirm password validation
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  /// Phone number validation
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Remove all non-digit characters for validation
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.length < 10) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  /// Required field validation
  static String? validateRequired(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Name validation
  static String? validateName(String? value, {String fieldName = 'Name'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    if (value.trim().length < 2) {
      return '$fieldName must be at least 2 characters long';
    }

    // Check for valid name characters (letters, spaces, hyphens, apostrophes)
    if (!RegExp(r"^[a-zA-Z\s\-']+$").hasMatch(value.trim())) {
      return '$fieldName can only contain letters, spaces, hyphens, and apostrophes';
    }

    return null;
  }

  /// Date validation
  static String? validateDate(
    String? value, {
    bool isFutureRequired = false,
    bool isPastRequired = false,
  }) {
    if (value == null || value.isEmpty) {
      return 'Date is required';
    }

    DateTime? date;
    try {
      date = DateFormat('yyyy-MM-dd').parse(value);
    } on Exception {
      return 'Please enter a valid date';
    }

    final now = DateTime.now();

    if (isFutureRequired && date.isBefore(now)) {
      return 'Date must be in the future';
    }

    if (isPastRequired && date.isAfter(now)) {
      return 'Date must be in the past';
    }

    return null;
  }

  /// Age validation (for date of birth)
  static String? validateAge(
    String? value, {
    int minAge = 18,
    int maxAge = 120,
  }) {
    if (value == null || value.isEmpty) {
      return 'Date of birth is required';
    }

    DateTime? birthDate;
    try {
      birthDate = DateFormat('yyyy-MM-dd').parse(value);
    } on Exception {
      return 'Please enter a valid date';
    }

    final now = DateTime.now();
    final age = now.year - birthDate.year;

    if (age < minAge) {
      return 'You must be at least $minAge years old';
    }

    if (age > maxAge) {
      return 'Please enter a valid date of birth';
    }

    return null;
  }

  /// URL validation
  static String? validateUrl(String? value, {bool isRequired = true}) {
    if (value == null || value.isEmpty) {
      return isRequired ? 'URL is required' : null;
    }

    final urlRegex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );

    if (!urlRegex.hasMatch(value)) {
      return 'Please enter a valid URL';
    }

    return null;
  }

  /// Credit card number validation (basic Luhn algorithm)
  static String? validateCreditCard(String? value) {
    if (value == null || value.isEmpty) {
      return 'Credit card number is required';
    }

    // Remove spaces and hyphens
    final cardNumber = value.replaceAll(RegExp(r'[\s\-]'), '');

    // Check if all characters are digits
    if (!RegExp(r'^[0-9]+$').hasMatch(cardNumber)) {
      return 'Credit card number can only contain digits';
    }

    // Check length (most cards are 13-19 digits)
    if (cardNumber.length < 13 || cardNumber.length > 19) {
      return 'Please enter a valid credit card number';
    }

    // Luhn algorithm validation
    if (!_isValidLuhn(cardNumber)) {
      return 'Please enter a valid credit card number';
    }

    return null;
  }

  /// CVV validation
  static String? validateCvv(String? value) {
    if (value == null || value.isEmpty) {
      return 'CVV is required';
    }

    if (!RegExp(r'^[0-9]{3,4}$').hasMatch(value)) {
      return 'CVV must be 3 or 4 digits';
    }

    return null;
  }

  /// Expiry date validation (MM/YY format)
  static String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Expiry date is required';
    }

    if (!RegExp(r'^(0[1-9]|1[0-2])\/([0-9]{2})$').hasMatch(value)) {
      return 'Please enter date in MM/YY format';
    }

    final parts = value.split('/');
    final month = int.parse(parts[0]);
    final year = int.parse('20${parts[1]}'); // Assuming 20xx

    final now = DateTime.now();
    final expiryDate = DateTime(year, month + 1, 0); // Last day of the month

    if (expiryDate.isBefore(now)) {
      return 'Card has expired';
    }

    return null;
  }

  /// Postal code validation
  static String? validatePostalCode(String? value, {String? countryCode}) {
    if (value == null || value.isEmpty) {
      return 'Postal code is required';
    }

    // US ZIP code validation
    if (countryCode == 'US' || countryCode == null) {
      if (!RegExp(r'^\d{5}(-\d{4})?$').hasMatch(value)) {
        return 'Please enter a valid ZIP code';
      }
    }
    // Canadian postal code validation
    else if (countryCode == 'CA') {
      if (!RegExp(r'^[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d$').hasMatch(value)) {
        return 'Please enter a valid postal code (A1A 1A1)';
      }
    }
    // UK postal code validation
    else if (countryCode == 'GB') {
      if (!RegExp(
        r'^[A-Za-z]{1,2}\d[A-Za-z\d]? \d[A-Za-z]{2}$',
      ).hasMatch(value)) {
        return 'Please enter a valid postal code';
      }
    }

    return null;
  }

  /// Rating validation (1-5 stars)
  static String? validateRating(double? value) {
    if (value == null) {
      return 'Rating is required';
    }

    if (value < 1 || value > 5) {
      return 'Rating must be between 1 and 5';
    }

    return null;
  }

  /// Review text validation
  static String? validateReview(String? value, {int maxLength = 500}) {
    if (value == null || value.trim().isEmpty) {
      return 'Review is required';
    }

    if (value.trim().length < 10) {
      return 'Review must be at least 10 characters long';
    }

    if (value.length > maxLength) {
      return 'Review cannot exceed $maxLength characters';
    }

    return null;
  }

  /// Number validation
  static String? validateNumber(
    String? value, {
    double? min,
    double? max,
    bool isRequired = true,
  }) {
    if (value == null || value.isEmpty) {
      return isRequired ? 'Number is required' : null;
    }

    final number = double.tryParse(value);
    if (number == null) {
      return 'Please enter a valid number';
    }

    if (min != null && number < min) {
      return 'Number must be at least $min';
    }

    if (max != null && number > max) {
      return 'Number cannot exceed $max';
    }

    return null;
  }

  /// Integer validation
  static String? validateInteger(
    String? value, {
    int? min,
    int? max,
    bool isRequired = true,
  }) {
    if (value == null || value.isEmpty) {
      return isRequired ? 'Number is required' : null;
    }

    final number = int.tryParse(value);
    if (number == null) {
      return 'Please enter a valid whole number';
    }

    if (min != null && number < min) {
      return 'Number must be at least $min';
    }

    if (max != null && number > max) {
      return 'Number cannot exceed $max';
    }

    return null;
  }

  /// Length validation
  static String? validateLength(
    String? value, {
    int? minLength,
    int? maxLength,
    bool isRequired = true,
  }) {
    if (value == null || value.isEmpty) {
      return isRequired ? 'Field is required' : null;
    }

    if (minLength != null && value.length < minLength) {
      return 'Must be at least $minLength characters long';
    }

    if (maxLength != null && value.length > maxLength) {
      return 'Cannot exceed $maxLength characters';
    }

    return null;
  }

  /// Custom validation with multiple validators
  static String? validateMultiple(
    String? value,
    List<String? Function(String?)> validators,
  ) {
    for (final validator in validators) {
      final result = validator(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }

  /// Luhn algorithm implementation for credit card validation
  static bool _isValidLuhn(String cardNumber) {
    var sum = 0;
    var alternate = false;

    for (var i = cardNumber.length - 1; i >= 0; i--) {
      var digit = int.parse(cardNumber[i]);

      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit = (digit % 10) + 1;
        }
      }

      sum += digit;
      alternate = !alternate;
    }

    return (sum % 10) == 0;
  }
}
