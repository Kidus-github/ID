/// Custom exception class to handle various format-related errors.
class FormatExceptions implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const FormatExceptions(
      [this.message =
          'An unexpected format error occurred. Please check your input.']);

  /// Create a format exception from a specific error message.
  factory FormatExceptions.fromMessage(String message) {
    print('FormatException');
    return FormatExceptions(message);
  }

  /// Get the corresponding error message.
  String get formattedMessage => message;

  /// Create a format exception from a specific error code.
  factory FormatExceptions.fromCode(String code) {
    print('FormatException1');
    switch (code) {
      case 'invalid-email-format':
        return const FormatExceptions(
            'The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const FormatExceptions(
            'The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const FormatExceptions(
            'The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const FormatExceptions(
            'The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const FormatExceptions(
            'The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const FormatExceptions(
            'The input should be in a valid numeric format.');
      // Add more cases as needed
      default:
        return const FormatExceptions(
            'An unknown format error occurred. Please check your input.');
    }
  }
}
