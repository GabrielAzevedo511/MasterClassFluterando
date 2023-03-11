import 'dart:io';

import 'cpf_validator.dart';

void exercicio4() {
  print('Digite o CPF:');
  String? dataFromUser = stdin.readLineSync(retainNewlines: false);
  CpfValidator validator = CpfValidator(cpf: dataFromUser!);
  validator.validate()
      ? print('O CPF é válido.')
      : print('O CPF não é válido.');
}
