import 'package:ecommerce_model/app/modules/authentication/user_controller.dart';
import 'package:ecommerce_model/utils/constants.dart';
import 'package:ecommerce_model/utils/messages.dart';
import 'package:get/get.dart';
import 'product_model.dart';

class ProductsProvider extends GetConnect {
  var userToken = Get.find<UserController>().user.token;
  getAll() async {
    try {
      final response = await get('$url/products');
      if (response.statusCode == 200) {
        List<Product> products = response.body.map<Product>((map) {
          return Product.fromJson(map);
        }).toList();
        return products;
      }
    } catch (e) {
      print(e);
    }
  }

  getByCategory(id) async {
    try {
      final response = await get('$url/products/category/$id');
      if (response.statusCode == 200) {
        List<Product> products = response.body.map<Product>((map) {
          return Product.fromJson(map);
        }).toList();
        return products;
      }
    } catch (e) {
      print(e);
    }
  }

  getById(id) async {
    try {
      final response = await get('$url/products/$id');
      if (response.statusCode == 200) {
        return Product.fromJson(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  decrementStock(Product product) async {
    try {
      var response = await put(
        '$url/products/${product.sId}',
        {'sizes': product.exportSizeList()},
        headers: {"x-access-token": userToken!},
      );

      if (response.statusCode == 200) {
        return response.body['product'];
      } else {
        Messages.error("Error", response.body['message']);
      }
    } catch (e) {
      Messages.error("Error Catch", e.toString());
    }
  }
}
