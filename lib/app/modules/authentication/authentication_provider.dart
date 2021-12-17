import 'package:ecommerce_model/utils/constants.dart';
import 'package:ecommerce_model/utils/messages.dart';
import 'package:get/get_connect/connect.dart';

class AuthenticationProvider extends GetConnect {
  signIn(String email, String password) async {
    try {
      final response = await post('$url/users/signIn',
          {"email": email.toLowerCase(), "password": password});

      if (response.statusCode == 200) {
        return response.body;
      } else {
        Messages.error("Error", response.body['message']);
        return null;
      }
    } catch (e) {
      Messages.error("Error Catch", e.toString());
      return null;
    }
  }

  signUp(String name, String email, String password) async {
    try {
      final response = await post('$url/users/signUp',
          {"name": name, "email": email.toLowerCase(), "password": password});

      if (response.statusCode == 201) {
        return response.body;
      } else {
        Messages.error("Error", response.body['message']);
        return null;
      }
    } catch (e) {
      Messages.error("Error Catch", e.toString());
      return null;
    }
  }
}
