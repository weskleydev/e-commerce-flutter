import 'package:ecommerce_model/app/modules/authentication/components/sign_in.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
