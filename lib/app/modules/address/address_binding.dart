import 'package:ecommerce_model/app/data/services/cep-aberto/cep_aberto.dart';
import 'package:ecommerce_model/app/modules/address/address_provider.dart';
import 'package:get/get.dart';

import 'address_controller.dart';

class AddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressController>(
        () => AddressController(AddressProvider(CepAbertoService())),
        fenix: true);
  }
}
