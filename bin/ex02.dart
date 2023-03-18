import 'dart:io';

// DESAFIO MASTERCLASS 2

// Na matemática, a sucessão de Fibonacci (ou sequência de Fibonacci), é uma sequência de números inteiros,
//começando normalmente por 0 e 1, na qual cada termo subsequente corresponde à soma dos dois anteriores.
//A sequência recebeu o nome do matemático italiano Leonardo de Pisa, mais conhecido por Fibonacci, que descreveu,
//no ano de 1202, o crescimento de uma população de coelhos, a partir desta. Esta sequência já era, no entanto,
//conhecida na antiguidade.

// Implemente a sequencia fibonacci com funcões recursivamente usando o Dart.

void exercicio2() {
  fibonacci(0, 1, getDataFromUser());
}

void fibonacci(int a, int b, int times) {
  if (times <= 0) {
    print('sequencia concluida');
    return;
  }
  var result = a + b;
  print(result);
  fibonacci(b, result, --times);
}

int getDataFromUser() {
  int valueToReturn = -1;
  int counter = 0;
  while (valueToReturn == -1) {
    print(
        'Coloque a quantidade de numeros da sequencia fibonacci que deseja ver:');
    String? dataFromUser = stdin.readLineSync(retainNewlines: false);
    if (dataFromUser!.toUpperCase() == 'SAIR') {
      valueToReturn = -400;
    } else if (int.tryParse(dataFromUser) == null) {
      print('\nPor favor, coloque o valor corretamente\n');
      if (++counter >= 3) {
        counter = 0;
        print('Caso deseje parar o programa, digite "sair".');
      }
      valueToReturn = -1;
    } else {
      valueToReturn = int.tryParse(dataFromUser)!;
    }
  }
  return valueToReturn;
}
