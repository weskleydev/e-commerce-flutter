import 'package:ecommerce_model/app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart_controller.dart';
import '../cart_model.dart';

class CartTile extends GetView<CartController> {
  const CartTile({required this.cartProduct, this.onMoveUp, this.onMoveDown});

  final Cart cartProduct;
  final VoidCallback? onMoveUp;
  final VoidCallback? onMoveDown;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 75,
              width: 75,
              child: Image.network(cartProduct.product.images.first),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      cartProduct.product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Tamanho: ${cartProduct.size}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          (cartProduct.hasStock)
                              ? Text(
                                  'R\$ ${cartProduct.unitPrice.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                                )
                              : Text(
                                  'Sem estoque\n suficiente',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                CustomIconButton(
                    iconData: Icons.add,
                    color: Theme.of(context).primaryColor,
                    onTap: onMoveUp),
                GetBuilder<CartController>(
                  builder: (_) => Text(
                    '${cartProduct.quantity}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                CustomIconButton(
                  iconData: Icons.remove,
                  color: cartProduct.quantity > 1
                      ? Theme.of(context).primaryColor
                      : Colors.red,
                  onTap: onMoveDown,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
