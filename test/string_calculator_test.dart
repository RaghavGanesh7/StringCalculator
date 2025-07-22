import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  StringCalculator stringCalculator = StringCalculator();

  test('empty string returns 0', () {
    final result = stringCalculator.add('');
    expect(result, equals(0));
  });

  test('single number returns the number', () {
    final result = stringCalculator.add('12');
    expect(result, equals(12));
  });

  test('two numbers returns the sum of the numbers', () {
    final result = stringCalculator.add('12,13');
    expect(result, equals(25));
  });

  test('three numbers returns the sum of the numbers', () {
    final result = stringCalculator.add('12,13,14');
    expect(result, equals(39));
  });

}
