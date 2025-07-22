class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }
    if (numbers.contains(',')) {
      final numbersList = numbers.split(',');
      return int.parse(numbersList[0]) + int.parse(numbersList[1]);
    }
    return int.parse(numbers);
  }
}
