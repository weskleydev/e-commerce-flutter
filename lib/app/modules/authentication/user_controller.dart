import 'package:ecommerce_model/utils/keys.dart';
import 'package:get/get.dart';

import 'user_model.dart';
import 'authentication_provider.dart';

class UserController extends GetxController {
  UserController(this.provider);
  final AuthenticationProvider provider;

  final Rx<User> _user = Rx<User>(User());
  User get user => _user.value;
  set user(User value) => _user.value = value;

  bool get isAdmin => (user.roles != null && (user.roles!.contains("admin")));

  bool get isLoggedIn => (user.sId != null);

  void logOut() async {
    user = User();
    await box.write('auth', null);
    await box.write('notificationId', null);
  }

  persistenteUser() async {
    if (box.read('auth') != null) {
      user = User.fromJson(box.read('auth'));
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await persistenteUser();
  }
}
