# String Calculator

A simple Dart implementation of the String Calculator kata. This package provides a `StringCalculator` class that can parse a string of numbers, apply custom delimiters, and return their sum, while handling errors and negative values gracefully.

## Features

- **Empty input**: `add("")` returns `0`.
- **Single number**: `add("12")` returns `12`.
- **Multiple numbers**: comma- or newline-separated values (e.g. `"1,2,3"` or `"1\n2,3"`).
- **Custom delimiters**:
  - Single-character: `"//;\n1;2"` → `3`
  - Multi-character: `"//***\n1***2***3"` → `6`
  - Delimiters with spaces: `"//[* ]\n1[* ]2[* ]3"` → `6`
- **Error handling**:
  - Throws `FormatException("Invalid number: '<token>'")` on parse errors.
  - Throws `FormatException("Custom delimiter format must end with newline")` for malformed delimiters.
  - Throws `FormatException("negative numbers not allowed <n1>,<n2>,…")` if any negative numbers are provided.

## Installation

Add this package to your project:

```yaml
dependencies:
  string_calculator:
    git:
      url: https://github.com/<your-org>/string_calculator.git
      ref: main
```

## Usage

```dart
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
```

## Testing

Run the built-in test suite:

```bash
flutter test
```