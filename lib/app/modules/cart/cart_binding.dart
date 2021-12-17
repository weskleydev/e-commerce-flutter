import 'package:ecommerce_model/app/modules/cart/cart_provider.dart';
import 'package:get/get.dart';

import 'cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController(CartProvider()),
        fenix: true);
  }
}
