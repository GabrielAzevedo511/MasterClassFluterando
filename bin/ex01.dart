import 'dart:io';

void exercicio1() {
  double weight = requestDataFromUser(
      text: 'Qual é o seu peso em kilogramas? \n Exemplo: 80kg  \n Peso:',
      metricUnit: 'kg');
  if (weight == -400) {
    print('Saindo');
    return;
  }
  double height = requestDataFromUser(
      text: 'Qual é a sua altura em metros? \nExemplo: 1.80m  \nAltura:',
      metricUnit: 'm');
  if (height == -400) {
    print('Saindo');
    return;
  }
  calculateIMC(height: height, weight: weight);
}

double requestDataFromUser({required String text, required String metricUnit}) {
  double valueToReturn = -1;
  int counter = 0;
  while (valueToReturn == -1) {
    print(text);
    String? dataFromUser = stdin.readLineSync(retainNewlines: false);
    if (dataFromUser!.toUpperCase() == 'SAIR') {
      valueToReturn = -400;
    } else if (!dataFromUser.contains(metricUnit)) {
      print(
          '\nPor favor, coloque o valor corretamente, junto com sua unidade de medida.\n');
      if (++counter >= 3) {
        counter = 0;
        print('Caso deseje parar o programa, digite "sair".');
      }
      valueToReturn = -1;
    } else {
      valueToReturn =
          double.tryParse(dataFromUser.replaceAll(metricUnit, '')) ?? -1;
    }
  }
  return valueToReturn;
}

void calculateIMC({required double height, required double weight}) {
  double imc = weight / (height * height);
  print('Seu IMC é ${imc.toStringAsFixed(2)}');
}
