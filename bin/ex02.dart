import 'dart:io';

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
