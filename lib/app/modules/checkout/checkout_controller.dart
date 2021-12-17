import 'package:ecommerce_model/app/modules/address/address_controller.dart';
import 'package:ecommerce_model/app/modules/authentication/user_controller.dart';
import 'package:ecommerce_model/app/modules/cart/cart_controller.dart';
import 'package:ecommerce_model/app/modules/orders/order_model.dart';
import 'package:ecommerce_model/app/modules/orders/orders_controller.dart';
import 'package:ecommerce_model/app/modules/payment/payment_controller.dart';
import 'package:ecommerce_model/app/modules/products/product_model.dart';
import 'package:ecommerce_model/app/modules/products/products_controller.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final _loading = false.obs;
  get loading => _loading.value;
  set loading(value) => _loading.value = value;

  final cartController = Get.find<CartController>();
  final address = Get.find<AddressController>().address;
  final orderController = Get.find<OrdersController>();
  final productController = Get.find<ProductsController>();
  final String paymentMethod = Get.find<PaymentController>().paymentMethod;
  final user = Get.find<UserController>().user;

  final _orderSave = Order().obs;
  get orderSave => _orderSave.value;
  set orderSave(value) => _orderSave.value = value;

  Future<void> checkout(
      {required Function onStockFail, required Function onSuccess}) async {
    loading = true;
    try {
      await _decrementStock();
    } catch (e) {
      onStockFail(e);
      loading = true;
      return;
    }

    // ignore: todo
    // TODO: PROCESSAR PAGAMENTO

    final order =
        Order.fromCartManager(cartController, address, user, paymentMethod);

    // order.user =
    // order.id = orderId.toString();
    orderSave = await orderController.provider
        .postOrder(order, cartController.cartList);
    // print(orderSave);
    cartController.clear();
    onSuccess();
    loading = false;
  }

  Future<void> _decrementStock() async {
    final List<Product> productsToUpdate = [];
    final List<Product> productsWithoutStock = [];

    for (final cart in cartController.cartList) {
      Product product;

      if (productsToUpdate.any((p) => p.sId == cart.product.sId)) {
        product = productsToUpdate.firstWhere((p) => p.sId == cart.product.sId);
      } else {
        product = await productController.provider.getById(cart.product.sId);
      }

      cart.product = product;

      final size = product.findSize(cart.size);
      if (size != null) {
        if (size.stock - cart.quantity < 0) {
          productsWithoutStock.add(product);
        } else {
          size.stock -= cart.quantity;
          productsToUpdate.add(product);
        }
      }
    }

    if (productsWithoutStock.isNotEmpty) {
      return Future.error(
          '${productsWithoutStock.length} produtos sem estoque');
    }

    for (final product in productsToUpdate) {
      productController.provider.decrementStock(product);
    }
  }
}
