import 'package:ecommerce_model/app/modules/authentication/user_controller.dart';
import 'package:ecommerce_model/app/modules/cart/cart_model.dart';
import 'package:ecommerce_model/utils/constants.dart';
import 'package:ecommerce_model/utils/messages.dart';
import 'package:get/get.dart';

class CartProvider extends GetConnect {
  var userToken = Get.find<UserController>().user.token!;

  getItems() async {
    try {
      final response =
          await get('$url/cart', headers: {"x-access-token": userToken});

      if (response.statusCode == 200) {
        List<Cart> items = response.body.map<Cart>((map) {
          return Cart.fromJson(map);
        }).toList();
        return items;
      } else {
        Messages.error("Error", response.body['message']);
      }
    } catch (e) {
      Messages.error("Error Catch", e.toString());
    }
  }

  addToCart(Cart cart) async {
    try {
      var response = await post('$url/cart', cart.toCartItemMap(),
          headers: {"x-access-token": userToken});
      if (response.statusCode != 201) {
        Messages.error("Error", response.body['message']);
      }
    } catch (e) {
      Messages.error("Error Catch", e.toString());
      return null;
    }
  }

  updateCart(Cart cart) async {
    try {
      final response = await put('$url/cart/${cart.sId}', cart.toCartItemMap(),
          headers: {"x-access-token": userToken});
      if (response.statusCode != 200) {
        Messages.error("Error", response.body['message']);
      }
    } catch (e) {
      Messages.error("Error Catch", e.toString());
    }
  }

  removeOfCart(Cart cart) async {
    try {
      var response = await delete(
        '$url/cart',
        query: {"id": cart.sId},
        headers: {"x-access-token": userToken},
      );
      if (response.statusCode != 200) {
        Messages.error("Error", response.body['message']);
      }
    } catch (e) {
      Messages.error("Error Catch", e.toString());
    }
  }

  clear(Cart cart) async {
    try {
      var response = await delete(
        '$url/cart',
        query: {"id": cart.sId},
        headers: {"x-access-token": userToken},
      );
      if (response.statusCode != 200) {
        Messages.error("Error", response.body['message']);
      }
    } catch (e) {
      Messages.error("Error Catch", e.toString());
    }
  }
}
