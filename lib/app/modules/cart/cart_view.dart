import 'package:ecommerce_model/app/modules/address/address_view.dart';
import 'package:ecommerce_model/app/modules/authentication/user_controller.dart';
import 'package:ecommerce_model/app/routes/app_pages.dart';
import 'package:ecommerce_model/app/widgets/empty_card.dart';
import 'package:ecommerce_model/app/widgets/erro.dart';
import 'package:ecommerce_model/app/widgets/loading.dart';
import 'package:ecommerce_model/app/widgets/login_card.dart';
import 'package:ecommerce_model/app/modules/cart/components/price_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';
import 'components/cart_tile.dart';
import 'components/discount_card.dart';

class CartView extends GetView<CartController> {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: controller.obx(((state) {
        if (userController.user.sId == null) {
          return LoginCard();
        }

        if (controller.cartList.isEmpty) {
          return EmptyCard(
            iconData: Icons.remove_shopping_cart,
            title: 'Nenhum produto no carrinho!',
          );
        }

        return Obx(() => ListView(
              children: <Widget>[
                Column(
                  children: controller.cartList
                      .map<Widget>((cartProduct) => CartTile(
                            onMoveUp: cartProduct.hasStock
                                ? () {
                                    controller.increment(cartProduct);
                                  }
                                : null,
                            onMoveDown: () => controller.decrement(cartProduct),
                            cartProduct: cartProduct,
                          ))
                      .toList(),
                ),
                DiscountCard(),
                AddressView(),
                PriceCard(
                  buttonText: 'Continuar para o Pagamento',
                  onPressed: controller.isCartValid
                      ? () => Get.toNamed(Routes.payment)
                      : null,
                ),
              ],
            ));
      }),
          onLoading: Loading(),
          onError: (error) => Erro(error, controller.getItems()),
          onEmpty: EmptyCard(
            iconData: Icons.remove_shopping_cart,
            title: 'Nenhum produto no carrinho!',
          )),
    );
  }
}
