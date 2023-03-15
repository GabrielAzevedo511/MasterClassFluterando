class CpfValidator {
  final String _cpf;
  const CpfValidator({required String cpf}) : _cpf = cpf;

  bool validate() {
    List<int> numbers = _cpf
        .replaceAll('.', '')
        .replaceAll('-', '')
        .split('')
        .map((e) => int.parse(e))
        .toList();
    List<int> verificationNumbers = numbers.sublist(0, numbers.length - 2);
    List<int> verificationNumbers1 = numbers.sublist(0, numbers.length - 1);
    List<int> lastNumbers = numbers.sublist(numbers.length - 2);
    return lastNumbers.first == verifyDigit(verificationNumbers) &&
        lastNumbers.last == verifyDigit(verificationNumbers1);
  }
}

int verifyDigit(List<int> list) {
  double sum = 0;
  int counter = list.length + 1;
  for (var number in list) {
    sum += (counter * number);
    counter--;
  }
  return ((sum % 11) < 2) ? 0 : (11 - (sum % 11)).round();
}
