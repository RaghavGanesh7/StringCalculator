class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    if (!numbers.contains(',')) return int.parse(numbers);
    final numbersList = numbers.split(',');
    return int.parse(numbersList[0]) + int.parse(numbersList[1]);
  }
}
