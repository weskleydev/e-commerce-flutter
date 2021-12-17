import 'package:ecommerce_model/app/modules/cart/cart_controller.dart';
import 'package:ecommerce_model/app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceCard extends GetView<CartController> {
  const PriceCard({required this.buttonText, this.onPressed});

  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // final totalPrice = controller.totalPrice;

    return Obx(() => Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Resumo do Pedido',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Subtotal'),
                    Text('R\$ ${controller.productsPrice.toStringAsFixed(2)}')
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 12,
                ),
                if (controller.discountPrice != 0.0) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Desconto'),
                      Text('R\$ ${controller.discountPrice.toStringAsFixed(2)}')
                    ],
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 12,
                  ),
                ],
                if (controller.deliveryPrice != 0.0) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Entrega'),
                      Text('R\$ ${controller.deliveryPrice.toStringAsFixed(2)}')
                    ],
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 12,
                  ),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'R\$ ${controller.totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                AppButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: onPressed,
                  title: buttonText,
                ),
              ],
            ),
          ),
        ));
  }
}
