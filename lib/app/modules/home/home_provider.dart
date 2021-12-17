import 'package:ecommerce_model/utils/constants.dart';
import 'package:get/get.dart';

import 'home_model.dart';

class HomeProvider extends GetConnect {
  getAll() async {
    // try {
    final response = await get('$url/home');
    print(response.body);
    if (response.statusCode == 200) {
      List<Home> items = response.body.map<Home>((map) {
        return Home.fromJson(map);
      }).toList();
      print(items);
      return items;
    }
    // } catch (e) {
    // print(e);
    // }
  }
}
