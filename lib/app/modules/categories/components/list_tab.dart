import 'package:ecommerce_model/app/modules/categories/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../categories_controller.dart';
import 'list_tiles.dart';

class ListTab extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
          separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Divider(
                  color: Colors.transparent,
                  height: 5,
                ),
              ),
          itemCount: controller.categories.length,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 5),
          itemBuilder: (_, index) {
            final Category category =
                controller.categories.reversed.toList()[index];
            return ListTiles(category);
          }),
    );
  }
}
