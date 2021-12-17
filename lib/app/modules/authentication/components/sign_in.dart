import 'package:ecommerce_model/app/modules/authentication/authentication_controller.dart';
import 'package:ecommerce_model/app/modules/authentication/components/sign_up.dart';
import 'package:ecommerce_model/app/widgets/app_button.dart';
import 'package:ecommerce_model/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'validators_auth.dart';

class SignIn extends GetView<AuthenticationController> {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Entrar'),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.to(() => SignUp()),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black)),
            child: const Text(
              'CRIAR CONTA',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          )
        ],
      ),
      body: Center(
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 200,
              ),
              Obx(
                () => AppText("Email", "E-mail",
                    // initialValue: controller.email,
                    iconPrefixo: Icons.person_outline,
                    onChanged: (value) => controller.email = value,
                    color: Colors.black,
                    // onChanged: (value) => controller.email(value),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    password: false,
                    errorText: controller.rxErrorEmail,
                    focusNode: _emailFocus,
                    nextFocus: _passwordFocus,
                    validator: validateEmail),
              ),
              Obx(
                () => AppText("Senha", "Senha",
                    iconPrefixo: Icons.lock_outline,
                    // onChanged: controller.setPassword,
                    onChanged: (value) => controller.password = value,
                    keyboardType: TextInputType.emailAddress,
                    color: Colors.black,
                    textInputAction: TextInputAction.done,
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
                      _passwordFocus.unfocus();
                      controller.signIn();
                    },
                    focusNode: _passwordFocus,
                    validator: (value) => errorPassword(value!)),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 40),
                  child: AppButton(
                      title: "Entrar",
                      showProgress: controller.loading,
                      onPressed:
                          (controller.isLoginEnabled) ? controller.signIn : null
                      // controller.isLoginEnabled ? controller.signIn : null
                      ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero)),
                  child: const Text('Esqueci minha senha'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // Scaffold(
    //   appBar: AppBar(title: Text('SignIn')),
    //   body: ListView(
    //     shrinkWrap: true,
    //     children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Text(
    //           'Entre com seu login\n para continuar',
    //           textAlign: TextAlign.center,
    //           style: TextStyle(fontSize: 20),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 15,
    //       ),
    //       Obx(
    //         () => AppText("Email", "Digite o login",
    //             // initialValue: controller.email,
    //             iconPrefixo: Icons.person_outline,
    //             onChanged: controller.setEmail,
    //             color: Colors.white,
    //             // onChanged: (value) => controller.email(value),
    //             keyboardType: TextInputType.emailAddress,
    //             textInputAction: TextInputAction.next,
    //             password: false,
    //             errorText: controller.rxErrorEmail,
    //             focusNode: _emailFocus,
    //             nextFocus: _passwordFocus,
    //             validator: validateEmail),
    //       ),
    //       Obx(
    //         () => AppText("Senha", "Digite a senha",
    //             iconPrefixo: Icons.lock_outline,
    //             onChanged: controller.setPassword,
    //             keyboardType: TextInputType.emailAddress,
    //             color: Colors.white,
    //             textInputAction: TextInputAction.done,
    //             password: controller.passwordvisible,
    //             suffixIcon: IconButton(
    //               color: Colors.white,
    //               icon: controller.passwordvisible
    //                   ? Icon(Icons.visibility)
    //                   : Icon(Icons.visibility_off),
    //               onPressed: () => controller.setPasswordVisible(),
    //             ),
    //             errorText: controller.rxErrorPassword,
    //             onFieldSubmitted: (value) {
    //               _passwordFocus.unfocus();
    //               controller.signIn();
    //             },
    //             focusNode: _passwordFocus,
    //             validator: (value) => errorPassword(value!)),
    //       ),
    //       Obx(
    //         () => Padding(
    //           padding: const EdgeInsets.fromLTRB(10, 20, 10, 40),
    //           child: AppButton(
    //               title: "Entrar",
    //               showProgress: controller.loading,
    //               onPressed:
    //                   (controller.isLoginEnabled) ? controller.signIn : null
    //               // controller.isLoginEnabled ? controller.signIn : null
    //               ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
