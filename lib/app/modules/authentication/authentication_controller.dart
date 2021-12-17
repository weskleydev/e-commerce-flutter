import 'package:ecommerce_model/utils/keys.dart';
import 'package:ecommerce_model/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_model.dart';
import 'authentication_provider.dart';
import 'user_controller.dart';
import './components/validators_auth.dart';

class AuthenticationController extends GetxController {
  AuthenticationController(this.provider);
  final AuthenticationProvider provider;

  final userController = Get.find<UserController>();

  final _loading = false.obs;
  get loading => _loading.value;
  set loading(value) => _loading.value = value;

  final _name = ''.obs;
  get name => _name.value;
  set name(value) => _name.value = value;

  final _email = ''.obs;
  get email => _email.value;
  set email(value) => _email.value = value;

  final _password = ''.obs;
  get password => _password.value;
  set password(value) => _password.value = value;

  final _confirmPassword = ''.obs;
  get confirmPassword => _confirmPassword.value;
  set confirmPassword(value) => _confirmPassword.value = value;

  final _passwordVisible = true.obs;
  get passwordvisible => _passwordVisible.value;
  setPasswordVisible() => _passwordVisible.value = !_passwordVisible.value;

//----------------------- Validações ------------------------------

  String? get rxErrorName => errorName(name);
  String? get rxErrorEmail => errorEmail(email);
  String? get rxErrorPassword => errorPassword(password);

  bool get isLoginEnabled =>
      GetUtils.isEmail(email) && GetUtils.isLengthGreaterOrEqual(password, 6);

  bool get isCreateLoginEnabled =>
      GetUtils.isLengthGreaterOrEqual(name, 4) &&
      GetUtils.isEmail(email) &&
      GetUtils.isLengthGreaterOrEqual(password, 6) &&
      password == confirmPassword;

//------------------------------ Login ------------------------------------

  signIn() async {
    loading = true;
    await provider.signIn(email, password).then((auth) async {
      if (auth != null) {
        await box.write('auth', auth);
        userController.user = User.fromJson(box.read('auth'));
        name = '';
        email = '';
        password = '';
        Get.back();
        Messages.welcome(userController.user);
        Get.snackbar(
          '${auth["message"]}',
          'Seja Bem Vindo!',
          backgroundColor: Colors.white,
        );
      }
      loading = false;
    }).catchError((e) {
      loading = false;
      Get.defaultDialog(
          title: "Erro", content: Text('Falha ao Efetuar o Login \n$e'));
    });
  }

//---------------------------- Cadastro -------------------------------------

  Future<void> signUp() async {
    loading = true;
    await provider.signUp(name, email, password).then((auth) async {
      if (auth['_id'] != null) {
        await box.write('auth', auth);
        userController.user = User.fromJson(box.read('auth'));
        name = '';
        email = '';
        password = '';
        Get.close(2);
        Get.snackbar('Olá', 'Seja Bem Vindo ${auth['name']}',
            backgroundColor: Colors.white,
            animationDuration: Duration(seconds: 4),
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.defaultDialog(title: "Erro", content: Text('${auth['message']}'));
      }

      loading = false;
    }).catchError((e) {
      loading = false;
      Get.defaultDialog(
          title: "Erro", content: Text('Falha ao cadastrar o usuário $e'));
    });
  }
}
