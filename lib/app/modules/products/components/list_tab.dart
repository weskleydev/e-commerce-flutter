import 'package:ecommerce_model/app/modules/products/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../products_controller.dart';
import 'grid_tiles.dart';
import 'list_tiles.dart';

class ListTab extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.type
          ? GridView.builder(
              //physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                childAspectRatio: 0.65,
              ),
              itemCount: controller.products.length,
              itemBuilder: (_, index) {
                final Product product = controller.products[index];
                return GridTiles(product);
              })
          : ListView.builder(
              itemCount: controller.products.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              itemBuilder: (_, index) {
                final Product product = controller.products[index];
                return ListTiles(product);
              }),
    );
  }
}
