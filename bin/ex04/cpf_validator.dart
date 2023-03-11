class CpfValidator {
  final String _cpf;
  const CpfValidator({required String cpf}) : _cpf = cpf;

  bool validate() {
    List<String> numbers =
        _cpf.replaceAll('.', '').replaceAll('-', '').split('');
    List<String> verificationNumbers = numbers.sublist(0, numbers.length - 2);
    List<String> verificationNumbers1 = numbers.sublist(0, numbers.length - 1);
    List<int> lastNumbers =
        numbers.sublist(numbers.length - 2).map((e) => int.parse(e)).toList();
    return lastNumbers.first == verifyDigit(verificationNumbers) &&
        lastNumbers.last == verifyDigit(verificationNumbers1);
  }
}

int verifyDigit(List<String> list) {
  double sum = 0;
  int counter = list.length + 1;
  for (var element in list) {
    int number = int.parse(element);
    sum += (counter * number);
    counter--;
  }
  return ((sum % 11) < 2) ? 0 : (11 - (sum % 11)).round();
}
