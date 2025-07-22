import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  StringCalculator stringCalculator = StringCalculator();

  test('empty string returns 0', () {
    final result = stringCalculator.add('');
    expect(result, equals(0));
  });
}
