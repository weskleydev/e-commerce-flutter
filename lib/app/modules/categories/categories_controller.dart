import 'package:ecommerce_model/app/modules/categories/category_model.dart';
import 'package:get/get.dart';
import 'category_provider.dart';

class CategoriesController extends GetxController
    with StateMixin<List<Category>> {
  CategoriesController(this.provider);
  final CategoriesProvider provider;

  final _categories = <Category>[].obs;
  List<Category> get categories => _categories;
  set categories(List<Category> value) => _categories.value = value;

  getAll() async {
    final list = await provider.getAll();
    if (list != null) {
      categories = list;
      if (list.length > 0) {
        change(categories, status: RxStatus.success());
      } else {
        change(categories, status: RxStatus.empty());
      }
    } else {
      change(null, status: RxStatus.error('Houve um erro na requisição.'));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAll();
  }
}
