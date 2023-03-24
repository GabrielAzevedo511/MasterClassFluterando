// DESAFIO MASTERCLASS 6

// Cifra de Vigenère é uma criptografia simples usada para embaralhar textos. Valores que não seja letras NÃO SÃO TRANSFORMADOS.

// Crie uma classe que execute 3 regras de negócio relacionado a criptografia:
// A - Gerador de Key randômica.
// B - Encode (Retorne o texto criptografado)
// C - Decode (Retorne o texto descriptografado).

// Obs: Use apenas valores maiúsculos. Certifique-se disso!

// ```
// A. Algorítimo para Key:
// Para executar o encode e decode é necessário ter uma chave que tenha valores randômicos mas que tenha a mesma quantidade de caracteres do texto a ser criptografado.

// B. Encode:
// Passo 1: Receba a o texto a ser criptografado e a chave em questão.
// Passo 2: deve-se somar o charCode de cada letra do texto e da key em suas respectivas posições e dividir por 26. O RESTO dessa divisão deve ser somado com o CharCode da letra A.
// Passo 3: O resultado da soma anterior é o novo char.
// Lembre-se: Valores não alfabetos não devem ser transformados.

// C. Decode:
// Passo 1: Receba a o texto criptografado e a chave.
// Passo 2: deve-se subtrair o charCode de cada letra do texto e da key em suas respectivas posições somando o resultado com 26. O resultado deve ser dividido por 26. O RESTO dessa divisão deve ser somado com o CharCode da letra A.
// Passo 3: O resultado da soma anterior é o  char descriptografado.

import 'dart:math';

class VigenereCripto {
  String generateKey(String text) {
    String keyToReturn = '';
    for (int i = 0; i < text.length; i++) {
      int randomNumberZeroUntil25 = Random().nextInt(26);
      keyToReturn += String.fromCharCode(randomNumberZeroUntil25 + 65);
    }
    return keyToReturn;
  }

  String encodeText({String? key, required String text}) {
    bool keyIsNull = key == null;
    String internKey = keyIsNull ? generateKey(text) : key;
    String textToReturn = '';
    for (int i = 0; i < text.length; i++) {
      textToReturn += _decodeOrEncodeVigenere(
          index: i, key: internKey, text: text, decode: false);
    }
    return textToReturn;
  }

  int _returnCharCodeByVigenere(
      {required int keyValue, required int textValue, bool decode = false}) {
    return decode
        ? ((keyValue - textValue) % 26) + 65
        : ((keyValue + textValue) % 26) + 65;
  }

  String decodeText({required String key, required String text}) {
    String textToReturn = '';
    for (int i = 0; i < text.length; i++) {
      textToReturn +=
          _decodeOrEncodeVigenere(index: i, key: key, text: text, decode: true);
    }
    return textToReturn;
  }

  String _decodeOrEncodeVigenere({
    required String key,
    required String text,
    bool decode = false,
    required int index,
  }) {
    bool isLetter = text[index].contains(RegExp(r'[A-Z]'));
    if (isLetter) {
      int keyCharCodeValue = key.codeUnitAt(index);
      int textCharCodeValue = text.codeUnitAt(index);
      return String.fromCharCode(
        _returnCharCodeByVigenere(
          keyValue: keyCharCodeValue,
          textValue: textCharCodeValue,
          decode: true,
        ),
      );
    } else {
      return text[index];
    }
  }
}
