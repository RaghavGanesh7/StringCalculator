class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    if (!numbers.contains(',')) return int.parse(numbers);
    final numbersList = numbers.split(',').map(int.parse).toList();
    return numbersList.reduce((acc, curr) => acc + curr);
  }
}
