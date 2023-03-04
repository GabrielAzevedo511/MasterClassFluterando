import 'ex01.dart';
import 'ex02.dart';
import 'dart:io';

void main(List<String> arguments) {
  print(
      'Coloque a quantidade de numeros da sequencia fibonacci que deseja ver:');
  String? dataFromUser = stdin.readLineSync(retainNewlines: false);
  switch (dataFromUser) {
    case '0':
      exercicio1();
      break;
    case '1':
      exercicio2();
      break;
    case '2':
      break;
    default:
      break;
  }
}
