import 'package:ecommerce_model/app/modules/products/product_provider.dart';
import 'package:get/get.dart';

import 'products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(
      () => ProductsController(ProductsProvider()),
    );
  }
}
