import 'package:ecommerce_model/app/modules/authentication/authentication_controller.dart';
import 'package:ecommerce_model/app/widgets/app_button.dart';
import 'package:ecommerce_model/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'validators_auth.dart';

class SignUp extends GetView<AuthenticationController> {
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar'),
        centerTitle: true,
      ),
      body: Obx(
        () => Center(
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Icon(
                  Icons.person_add_outlined,
                  size: 200,
                ),
                AppText("Nome", "Digite seu nome",
                    iconPrefixo: Icons.person_outline,
                    onChanged: (value) => controller.name = value,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    color: Colors.black,
                    password: false,
                    errorText: controller.rxErrorName,
                    focusNode: _nameFocus,
                    nextFocus: _emailFocus,
                    validator: (name) {
                      if (name!.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (name.trim().split(' ').length <= 1) {
                        return 'Preencha seu Nome completo';
                      }
                      return null;
                    }),
                AppText("Email", "Digite o login",
                    iconPrefixo: Icons.email_outlined,
                    onChanged: (value) => controller.email = value,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    color: Colors.black,
                    password: false,
                    errorText: controller.rxErrorEmail,
                    focusNode: _emailFocus,
                    nextFocus: _passwordFocus,
                    validator: validateEmail),
                AppText("Senha", "Digite a senha",
                    iconPrefixo: Icons.lock_outline,
                    onChanged: (value) => controller.password = value,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    color: Colors.black,
                    password: controller.passwordvisible,
                    suffixIcon: IconButton(
                      color: Colors.black,
                      icon: controller.passwordvisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () => controller.setPasswordVisible(),
                    ),
                    errorText: controller.rxErrorPassword,
                    focusNode: _passwordFocus,
                    nextFocus: _confirmPasswordFocus,
                    validator: (value) => errorPassword(value!)),
                AppText("Confirmar Senha", "Confirme a senha",
                    iconPrefixo: Icons.lock_outline,
                    onChanged: (value) => controller.confirmPassword = value,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    color: Colors.black,
                    password: controller.passwordvisible,
                    suffixIcon: IconButton(
                      color: Colors.black,
                      icon: controller.passwordvisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () => controller.setPasswordVisible(),
                    ),
                    errorText: controller.rxErrorPassword,
                    onFieldSubmitted: (value) {
                      _confirmPasswordFocus.unfocus();
                      controller.signUp();
                    },
                    focusNode: _confirmPasswordFocus,
                    validator: (value) => errorPassword(value!)),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: AppButton(
                      title: 'Criar Conta',
                      showProgress: controller.loading,
                      onPressed: (controller.isCreateLoginEnabled)
                          ? controller.signUp
                          : null
                      // controller.isCreateLoginEnabled ? controller.signUp : null
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
