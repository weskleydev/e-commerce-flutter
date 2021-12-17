import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../product_model.dart';
import '../products_controller.dart';

class SizeWidget extends GetView<ProductsController> {
  const SizeWidget({required this.size});

  final Sizes size;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selected = size == controller.selectedSize;

      Color color = !size.hasStock
          ? Colors.red.withAlpha(50)
          : selected
              ? Theme.of(context).primaryColor
              : Colors.grey;

      return InkWell(
        onTap: () {
          if (size.hasStock) {
            controller.selectedSize = size;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: color),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                color: color,
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  size.name,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'R\$ ${size.price.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: color,
                      decoration: !size.hasStock
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
