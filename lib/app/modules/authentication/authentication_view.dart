import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'authentication_controller.dart';
import 'components/sign_in.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
