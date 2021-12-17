import 'package:ecommerce_model/app/modules/authentication/authentication_provider.dart';
import 'package:get/get.dart';

import 'authentication_controller.dart';
import 'user_controller.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController(AuthenticationProvider()), permanent: true);
    Get.lazyPut<AuthenticationController>(
      () => AuthenticationController(AuthenticationProvider()),
    );
  }
}
