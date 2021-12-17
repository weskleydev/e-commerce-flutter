import 'package:get/get_utils/src/get_utils/get_utils.dart';

bool validateName(String text) {
  if (text.isEmpty) {
    return false;
  } else if (text.trim().split(' ').length <= 1) {
    return false;
  }
  return true;
}

String? validateEmail(String? text) {
  if (text!.isEmpty) {
    return "Campo obrigatorio";
  } else if (!GetUtils.isEmail(text)) {
    return "Email inválido";
  }
  return null;
}

bool validatePassword(String text) {
  if (text.length < 6) {
    return false;
  } else {
    return true;
  }
}

String? errorName(String text) {
  if (text == '' || text.length > 6) {
    return null;
  } else {
    return 'Nome muito Curto';
  }
}

String? errorEmail(String text) {
  const String _kEmailRule =
      r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
  final RegExp emailExp = RegExp(_kEmailRule);

  if (emailExp.hasMatch(text)) {
    return null;
  } else if (text.isEmpty) {
    return null;
  } else {
    return "Formato do email incorreto";
  }
}

String? errorPassword(String text) {
  if (text.length < 5 && text.isNotEmpty) {
    return 'Senha curta, deve possuir no mínimo 6 caracteres';
  }
  // else if (text == '' ) {
  //   return null;
  // }
  else {
    return null;
  }
}
