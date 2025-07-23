import 'constants.dart';

/// Splits numbers by the default delimiters (comma and newline) and parses them into integers.
List<int> parseNumbers(String numbers) {
  final tokens = numbers.split(RegExp(defaultDelimiterPattern));
  return tokens.map((token) {
    try {
      return int.parse(token);
    } on FormatException {
      throw FormatException("Invalid number: '$token'");
    }
  }).toList();
}

// Splits numbers by a custom delimiter and parses them into integers.
List<int> parseNumbersWithDelimiter(String numbers, String delimiter) {
  final tokens = numbers.split(delimiter);
  return tokens.map((token) {
    try {
      return int.parse(token);
    } on FormatException {
      throw FormatException("Invalid number: '$token'");
    }
  }).toList();
}

// Sums up a list of integers.
int sumNumbers(List<int> numbers) {
  final negatives = numbers.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw FormatException('Negative numbers not allowed ${negatives.join(',')}');
  }
  return numbers.reduce((sum, number) => sum + number);
} 