import 'package:get/get.dart';

import 'categories_controller.dart';
import 'category_provider.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(CategoriesProvider()),
    );
  }
}
