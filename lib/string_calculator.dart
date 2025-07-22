class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    if (!numbers.contains(',') && !numbers.contains('\n')) return int.parse(numbers);
    final numbersList = numbers.split(RegExp(r'[,|\n]')).map(int.parse).toList();
    return numbersList.reduce((acc, curr) => acc + curr);
  }
}
