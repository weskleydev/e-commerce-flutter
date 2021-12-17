import 'package:ecommerce_model/app/modules/products/product_model.dart';
import 'package:get/get.dart';

import 'product_provider.dart';

class ProductsController extends GetxController with StateMixin<List<Product>> {
  ProductsController(this.provider);
  final ProductsProvider provider;

  final categoryId = Get.arguments;

  final _products = <Product>[].obs;
  get products => _products;
  set products(value) => _products.value = value;

  final _type = true.obs;
  get type => _type.value;
  set type(value) => _type.value = value;

  final Rx<Sizes> _selectedSize =
      Rx<Sizes>(Sizes(name: '', price: 0.0, sId: '', stock: 0));
  Sizes get selectedSize => _selectedSize.value;
  set selectedSize(Sizes value) {
    _selectedSize.value = value;
  }

  getAll() async {
    final list = await provider.getByCategory(categoryId);
    if (list != null) {
      products = list;
      if (list.length > 0) {
        change(products, status: RxStatus.success());
      } else {
        change(products, status: RxStatus.empty());
      }
    } else {
      change(null, status: RxStatus.error('Houve um erro na requisição.'));
    }
  }

  getByCategory(categoryId) {
    provider.getByCategory(categoryId);
  }

  @override
  void onInit() {
    super.onInit();
    getAll();
  }
}
