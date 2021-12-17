import 'package:ecommerce_model/app/modules/home/home_provider.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(HomeProvider()),
    );
  }
}
