import 'dart:io';

// DESAFIO MASTERCLASS 3

// Uma das coisas mais úteis que aprendemos no ensino médio é a "Regra de 3".
// Consiste quando temos 3 valores e precisamos saber o quarto.
// Geralmente temos dois grupos, e o calculo é feito multiplicando paralelamente os valores entre os dois grupos. Ex:
// --
// Grupo1.1             Grupo1.2
//                    X
// Grupo2.1            Grupo2.2
// --
// Grupo1.1 x Grupo2.2 = Grupo2.1 x Grupo1.2

// Sabendo disso, crie uma função que receba 4 argumentos opcionais e que retorne a resolução da regra de 3,
// levando em consideração que será considerado o argumento vário como valor a ser encontrado, logo,
//  poderá ter apenas um valor necessáriamente "vazio".

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
  int quantityOfNull = 0;
  if (oneDotOne == null) quantityOfNull++;
  if (oneDotTwo == null) quantityOfNull++;
  if (twoDotOne == null) quantityOfNull++;
  if (twoDotTwo == null) quantityOfNull++;
  if (quantityOfNull > 1) {
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
