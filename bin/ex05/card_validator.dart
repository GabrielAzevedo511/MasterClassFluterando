class CardValidator {
  final String _card;
  const CardValidator({required String card}) : _card = card;

  bool validate() {
    if (_card.isEmpty) return false;
    if (_card.length < 10) return false;
    List<int> cardNumbers = _card.split('').map((e) => int.parse(e)).toList();
    bool isMod10Valid = _mod10CardVerification(cardNumbers);
    if (isMod10Valid) {
      print('O cartão $_card é válido pela Verificação Mod10.');
      return true;
    }
    print('O cartão $_card é inválido pela Verificação Mod10.');
    return false;
  }

  bool _mod10CardVerification(List<int> numbers) {
    int lastNumber = numbers.removeLast();
    int sum = 0;
    for (int i = 0; i < numbers.length; i++) {
      if (i.isEven) {
        sum += _valueToSumWhenEvenMod10(numbers[i]);
      } else {
        sum += numbers[i];
      }
    }
    int digitVerificator = (10 - (sum % 10)) % 10;
    return lastNumber == digitVerificator;
  }

  int _sumOfEachDigit(int number) {
    int dozen = number ~/ 10;
    int unit = number - (dozen * 10);
    return dozen + unit;
  }

  int _valueToSumWhenEvenMod10(int number) {
    int handle = number * 2;
    bool haveTwoDigits = handle / 10 >= 1;
    return haveTwoDigits ? _sumOfEachDigit(handle) : handle;
  }
}
