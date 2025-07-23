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

  test('new line as delimiter', () {
    final result = stringCalculator.add('12\n13\n14');
    expect(result, equals(39));
  });

  test('custom delimiters', () {
    final result = stringCalculator.add('//;\n1;2');
    expect(result, equals(3));
  });

  test('custom delimiters with multiple characters', () {
    final result = stringCalculator.add('//^^\n1^^2^^3');
    expect(result, equals(6));
  });

  test('custom delimiters with multiple characters and spaces', () {
    final result = stringCalculator.add('// &\n1 &2 &3');
    expect(result, equals(6));
  });

  test('If delimiter is not closed, throw an exception', () {
    expect(()=>stringCalculator.add('//[*]\n1[*2[*3'), throwsA(isA<FormatException>()));
  });

  test('If numbers are not properly formatted, throw an exception', () {
    expect(()=>stringCalculator.add('//*\n1**3'), throwsA(isA<FormatException>()));
  });

  test('Negative numbers are not allowed', () {
    expect(()=>stringCalculator.add('-1,2'), throwsA(predicate((e) => e is FormatException && e.message == 'Negative numbers not allowed -1')));
  });
  
  test('Multiple negative numbers are not allowed', () {
    expect(()=>stringCalculator.add('-1,3,-2'), throwsA(predicate((e) => e is FormatException && e.message == 'Negative numbers not allowed -1,-2')));
  });

  test('Negative numbers are not allowed with custom delimiter', () {
    expect(()=>stringCalculator.add('//*\n-1*2'), throwsA(predicate((e) => e is FormatException && e.message == 'Negative numbers not allowed -1')));
  });
}
