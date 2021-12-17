import 'package:ecommerce_model/app/modules/orders/orders_provider.dart';
import 'package:get/get.dart';

import 'orders_controller.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersController>(
      () => OrdersController(OrdersProvider()),
    );
  }
}
