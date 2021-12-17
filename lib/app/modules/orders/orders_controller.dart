import 'package:ecommerce_model/app/modules/authentication/user_controller.dart';
import 'package:get/get.dart';
import 'order_model.dart';
import 'orders_provider.dart';

class OrdersController extends GetxController with StateMixin<List<Order>> {
  OrdersController(this.provider);
  final OrdersProvider provider;
  final userController = Get.find<UserController>();

  final _orders = <Order>[].obs;
  get orders => _orders;
  set orders(value) => _orders.value = value;

  getAll() async {
    await provider.getAll().then((list) {
      if (list != null) {
        orders = list;
        if (list.length > 0) {
          change(orders, status: RxStatus.success());
        } else {
          change(orders, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error('Houve um erro na requisição.'));
      }
    });
  }

  saveOrder(order, cartList) async {
    await provider.postOrder(order, cartList);
  }

  @override
  void onInit() {
    super.onInit();
    if (userController.isLoggedIn) {
      getAll();
    }
  }
}
