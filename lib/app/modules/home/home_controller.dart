import 'package:get/get.dart';
import 'home_model.dart';
import 'home_provider.dart';

class HomeController extends GetxController with StateMixin<List<Home>> {
  HomeController(this.provider);
  final HomeProvider provider;

  final _items = <Home>[].obs;
  List<Home> get items => _items;
  set items(List<Home> value) => _items.value = value;

  getAll() async {
    final list = await provider.getAll();
    if (list != null) {
      items = list;
      if (list.length > 0) {
        change(items, status: RxStatus.success());
      } else {
        change(items, status: RxStatus.empty());
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
