import 'package:flutter/material.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  final calc = StringCalculator();

  print(calc.add(''));            // 0
  print(calc.add('7'));           // 7
  print(calc.add('1,2,3'));       // 6
  print(calc.add('1\n2,3'));     // 6
  print(calc.add('//;\n4;5'));   // 9

  try {
    calc.add('-1,2,-3');
  } catch (e) {
    print(e); // FormatException: negative numbers not allowed -1,-3
  }
}

