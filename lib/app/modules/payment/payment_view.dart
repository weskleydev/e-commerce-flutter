import 'package:ecommerce_model/app/modules/cart/cart_controller.dart';
import 'package:ecommerce_model/app/modules/cart/components/price_card.dart';
import 'package:ecommerce_model/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'components/payment_button.dart';
import 'payment_controller.dart';

enum Payment { dinheiro, credito, debito, pix }

class PaymentView extends GetView<PaymentController> {
  // final cartController = Get.arguments;
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Forma de Pagamento'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            PaymentButton('Dinheiro', Icons.money),
            PaymentButton('Cartão de Crédito', Icons.credit_card),
            PaymentButton('Cartão de Débito', Icons.credit_card),
            PaymentButton('Pix', Icons.qr_code),
            PriceCard(
              buttonText: 'Continuar para o Pagamento',
              onPressed: cartController.isCartValid
                  ? () => Get.toNamed(Routes.checkout)
                  : null,
            ),
          ],
        ));
  }
}
