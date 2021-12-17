import 'package:ecommerce_model/utils/constants.dart';
import 'package:get/get.dart';

import 'category_model.dart';

class CategoriesProvider extends GetConnect {
  getAll() async {
    // try {
    final response = await get('$url/category');
    if (response.statusCode == 200) {
      List<Category> categories = response.body.map<Category>((map) {
        return Category.fromJson(map);
      }).toList();
      return categories;
    }
    // } catch (e) {
    // print(e);
    // }
  }
}
