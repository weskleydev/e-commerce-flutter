import 'package:ecommerce_model/app/modules/authentication/user_controller.dart';
import 'package:ecommerce_model/app/modules/cart/cart_model.dart';
import 'package:ecommerce_model/utils/constants.dart';
import 'package:ecommerce_model/utils/messages.dart';
import 'package:get/get.dart';

import 'order_model.dart';

class OrdersProvider extends GetConnect {
  var userToken = Get.find<UserController>().user.token;

  getAll() async {
    try {
      final response =
          await get('$url/orders', headers: {"x-access-token": userToken!});
      if (response.statusCode == 200) {
        print(response.body);
        List<Order> orders = response.body.map<Order>((map) {
          return Order.fromJson(map);
        }).toList();

        print(orders);
        return orders;
      }
    } catch (e) {
      print(e);
    }
  }

  postOrder(Order order, List<Cart> cartList) async {
    try {
      var response = await post(
        '$url/orders',
        {
          "items": cartList.map((e) => e.toOrderItemMap()).toList(),
          "price": num.parse(order.price!.toStringAsFixed(2)),
          "address": order.address,
          "payment": order.payment
        },
        headers: {"x-access-token": userToken!},
      );

      if (response.statusCode == 201) {
        if (response.body != null) {
          return Order.fromJson(response.body);
          // response.body; //Address.fromJson(response.body);
        }
      } else {
        Messages.error("Error", response.body['message']);
      }
    } catch (e) {
      Messages.error("Error Catch", e.toString());
    }
  }
}
