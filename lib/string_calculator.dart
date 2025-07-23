import 'src/constants.dart';
import 'src/utils.dart';

class StringCalculator {

  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    
    //check for custom delimiter
    if (numbers.startsWith(customDelimiterPrefix)) {
      return _handleCustomDelimiter(numbers);
    }

    //if no custom delimiter, check for default delimiters
    if (!numbers.contains(',') && !numbers.contains('\n')) return int.parse(numbers);
    
    //parse numbers default scenario
    final parsedNumbers = parseNumbers(numbers);
    return sumNumbers(parsedNumbers);
  }

  int _handleCustomDelimiter(String numbers) {
    final delimiterEndIndex = numbers.indexOf('\n');
    //check if delimiter format is followed by newline
    if (delimiterEndIndex == -1) {
      throw const FormatException('Custom delimiter format must end with newline');
    }

    //extract delimiter
    final delimiter = numbers.substring(customDelimiterPrefix.length, delimiterEndIndex);
    //extract numbers
    final numbersPart = numbers.substring(delimiterEndIndex + 1);

    //check if numbers part is empty
    if (numbersPart.isEmpty) {
      return 0;
    }

    //parse numbers if parsing fails, throw an exception
    final parsedNumbers = parseNumbersWithDelimiter(numbersPart, delimiter);
    return sumNumbers(parsedNumbers);
  }
} 