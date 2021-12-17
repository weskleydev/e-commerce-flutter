import 'package:ecommerce_model/app/modules/cart/cart_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DiscountCard extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4.0),
      child: ExpansionTile(
        maintainState: true,
        title: Obx(() => Text(
              controller.coupon != 0
                  ? "Você recebeu ${controller.coupon}% de desconto!"
                  : "Cupom de Desconto",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.grey[700]),
            )),
        leading: Icon(Icons.card_giftcard),
        trailing: Icon(Icons.add),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Digite seu cupom"),
                // initialValue: controller.couponCode ?? "",
                onChanged: (value) =>
                    controller.setDiscountPrice(value.toUpperCase())
                //     controller.setDiscountPrice = value.toUpperCase
                ),
          )
        ],
      ),
    );
  }
}
