import 'package:ecommerce_model/app/modules/checkout/checkout_controller.dart';
import 'package:ecommerce_model/app/modules/orders/order_model.dart';
import 'package:ecommerce_model/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'confirmation_tile.dart';

class ConfirmationView extends GetView<CheckoutController> {
  // final Order order = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final Order order = controller.orderSave;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pedido Confirmado'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Get.offAllNamed(Routes.home),
              icon: Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: Card(
            margin: const EdgeInsets.all(16),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        order.formattedId,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        'R\$ ${order.price!.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: order.items!.map((e) {
                    return ConfirmationTile(e.cart!);
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
