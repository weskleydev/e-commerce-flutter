import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../payment_controller.dart';
import 'card_credit.dart';

class PaymentButton extends GetView<PaymentController> {
  PaymentButton(this.title, this.icon);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Card(
          color: Colors.white,
          elevation: 0,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListTile(
            onTap: () {
              controller.paymentMethod = title;
              if (controller.paymentMethod == 'Cartão de Crédito' ||
                  controller.paymentMethod == 'Cartão de Débito') {
                Get.dialog(
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: Get.height * 0.4,
                        width: Get.width * 0.8,
                        child: CreditCardWidget(),
                      ),
                    ),
                    transitionDuration: Duration(milliseconds: 400),
                    transitionCurve: Curves.easeIn,
                    barrierColor: Colors.black26);
                // Get.defaultDialog(
                //     title: 'Informe os dados do Cratão',
                //     onConfirm: () => print("Ok"),
                //     content: CreditCardWidget());
              }
            },
            leading: Icon(
              icon,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            trailing: Icon(controller.paymentMethod == title
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank_outlined),
          ),
        ));
  }
}
