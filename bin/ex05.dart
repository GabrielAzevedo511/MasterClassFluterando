bool mod10CardVerification(List<int> numbers) {
  int lastNumber = numbers.removeLast();
  int sum = 0;
  for (int i = 0; i < numbers.length; i++) {
    if (i.isEven) {
      int handle = numbers[i] * 2;
      bool haveTwoDigits = handle / 10 >= 1;
      sum += haveTwoDigits ? returnSumOfEachDigit(handle) : handle;
    } else {
      sum += numbers[i];
    }
  }
  int digitVerificator = (10 - (sum % 10)) % 10;
  return lastNumber == digitVerificator;
}

int returnSumOfEachDigit(int number) {
  int dozen = number ~/ 10;
  int unit = number - (dozen * 10);
  return dozen + unit;
}

void exercicio5() {
  String invalid = '5419825003461210';
  String valid1 = '4916641859369080';
  String valid2 = '5458656470793535';
  print(
      'Primeiro cartão, inválido, deve retornar false\n${mod10CardVerification(invalid.split('').map((e) => int.parse(e)).toList())}');
  print(
      'Segundo cartão, válido, deve retornar true\n${mod10CardVerification(valid1.split('').map((e) => int.parse(e)).toList())}');
  print(
      'Terceiro cartão, válido, deve retornar true\n${mod10CardVerification(valid2.split('').map((e) => int.parse(e)).toList())}');
}
