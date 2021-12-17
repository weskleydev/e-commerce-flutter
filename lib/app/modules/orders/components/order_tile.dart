import 'package:flutter/material.dart';

import '../order_model.dart';
import 'orders_product_tile.dart';

class OrderTile extends StatelessWidget {
  const OrderTile(this.order, {this.showControls = false});

  final Order order;
  final bool showControls;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  order.formattedId,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
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
            Text(
              order.status!,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: primaryColor,
                  fontSize: 14),
            )
          ],
        ),
        children: <Widget>[
          Column(
            children: order.items!.map((e) {
              return OrderProductTile(e.cart!);
            }).toList(),
          ),
          if (showControls && order.status != 'Pedido Cancelado')
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  TextButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                      Colors.red,
                    )),
                    onPressed: () {},
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {},
                    // Get.find<AdminOrdersUsersController>().back(order),
                    child: const Text('Recuar'),
                  ),
                  TextButton(
                    onPressed: () {},
                    // Get.find<AdminOrdersUsersController>().advance(order),
                    child: const Text('Avançar'),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(primaryColor)),
                    child: const Text('Endereço'),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
