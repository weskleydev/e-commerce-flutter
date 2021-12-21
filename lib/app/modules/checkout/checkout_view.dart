import 'package:ecommerce_model/app/modules/cart/components/price_card.dart';
import 'package:ecommerce_model/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'checkout_controller.dart';
import 'components/cabecalho_items.dart';
import 'components/checkout_itens.dart';
import 'components/confirmation_view.dart';

class CheckoutView extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamento'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.loading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Processando seu pagamento...',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16),
                    )
                  ],
                ),
              )
            : ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: CabecalhoItens(),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Column(
                          children: controller.cartController.cartList
                              .map<Widget>((cartProduct) => Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: Column(
                                          children: [
                                            Text(
                                              // final Product product = controller.products[index];
                                              ('0${controller.cartController.cartList.indexOf(cartProduct) + 1}')
                                                  .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: CheckoutItens(
                                          cartProduct: cartProduct,
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  PriceCard(
                    buttonText: 'Finalizar Pedido',
                    onPressed: () {
                      controller.checkout(onStockFail: (e) {
                        Get.offAllNamed(Routes.cart);
                      }, onSuccess: () async {
                        // Get.offAllNamed(Routes.home);
                        await Get.to(() => ConfirmationView());
                      });
                    },
                  )
                ],
              ),
      ),
    );
  }
}
