import 'dart:io';

void exercicio3() {
  print('Sou uma calculadora de Regra de 3.');
  print('Meu funcionamento é o seguinte...');
  print(
      'Digite cada valor seguindo a expressão abaixo e digite "x" para a incógnita que deseja descobrir.');
  print('*' * 30);
  print('* ${' ' * 8} 1.1 ~ 1.2${' ' * 8} *');
  print('* ${' ' * 8} 2.1 ~ 2.2${' ' * 8} *');
  print('*' * 30);
  double? oneDotOne = getDoubleFromUser('Digite o valor  1.1:');
  double? oneDotTwo = getDoubleFromUser('Digite o valor  1.2:');
  double? twoDotOne = getDoubleFromUser('Digite o valor  2.1:');
  double? twoDotTwo = getDoubleFromUser('Digite o valor  2.2:');
  bool allAreNull = oneDotOne == null &&
      oneDotTwo == null &&
      twoDotOne == null &&
      twoDotTwo == null;
  bool moreThanOneAreNull = (oneDotOne == null && oneDotTwo == null) ||
      (twoDotOne == null && twoDotTwo == null);
  if (allAreNull || moreThanOneAreNull) {
    print('Erro valores inválidos');
    return;
  } else {
    double result = calculatesRuleOfThree(
        oneDotOne: oneDotOne,
        oneDotTwo: oneDotTwo,
        twoDotOne: twoDotOne,
        twoDotTwo: twoDotTwo);
    print('O valor que você procura é $result');
  }
}

double? getDoubleFromUser(String text) {
  print(text);
  String? dataFromUser = stdin.readLineSync(retainNewlines: false);
  return dataFromUser == null
      ? getDoubleFromUser(text)
      : double.tryParse(dataFromUser);
}

double calculatesRuleOfThree(
    {double? oneDotOne,
    double? oneDotTwo,
    double? twoDotOne,
    double? twoDotTwo}) {
  if (oneDotOne == null || oneDotTwo == null) {
    return oneDotOne == null
        ? (twoDotOne! * oneDotTwo!) / twoDotTwo!
        : (oneDotOne * twoDotTwo!) / twoDotOne!;
  } else {
    return twoDotOne == null
        ? (oneDotOne * twoDotTwo!) / oneDotTwo
        : (oneDotTwo * twoDotOne) / oneDotOne;
  }
}
