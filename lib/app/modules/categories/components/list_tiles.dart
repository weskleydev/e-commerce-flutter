import 'package:ecommerce_model/app/modules/categories/category_model.dart';
import 'package:ecommerce_model/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../categories_controller.dart';

class ListTiles extends GetView<CategoriesController> {
  ListTiles(this.category);
  final Category category;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyText1;
    return ListTile(
        onTap: () => Get.toNamed(Routes.products, arguments: category.sId),
        leading: CircleAvatar(
            radius: 40,
            child: Image.network(category.image,
                fit: BoxFit.contain,
                height: 40,
                width: 40,
                color: Colors.white)),
        title: Text(
          category.name,
          textAlign: TextAlign.center,
          style: style,
        ),
        trailing: Icon(
          Icons.arrow_right_outlined,
          color: Colors.white,
        ));
  }
}
