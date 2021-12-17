import 'package:ecommerce_model/app/modules/authentication/user_controller.dart';
import 'package:ecommerce_model/app/modules/cart/cart_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'address_model.dart';
import 'address_provider.dart';

class AddressController extends GetxController {
  AddressController(this.provider);
  final AddressProvider provider;

  final userController = Get.find<UserController>();
  final cartController = Get.find<CartController>();

  final TextEditingController cepController = TextEditingController();

  final _deliveryPrice = 0.0.obs;
  get deliveryPrice => _deliveryPrice.value;
  set deliveryPrice(value) => _deliveryPrice.value = value;

  final _address = Address().obs;
  Address get address => _address.value;
  set address(Address value) => _address.value = value;

  final _loading = false.obs;
  get loading => _loading.value;
  set loading(value) => _loading.value = value;

  bool get isAddressValid =>
      address.zipCode != null &&
      address.number != null &&
      deliveryPrice != null;

  Future<void> getAddress(String cep) async {
    loading = true;
    try {
      final addressToService = await provider.getAddressToService(cep);
      if (addressToService != null) {
        address = addressToService;
      }
    } catch (e) {
      loading = false;
      return Future.error('CEP Inválido');
    }
    loading = false;
  }

  Future<void> setAddress(Address newAddress) async {
    loading = true;

    final result =
        await provider.calculateDelivery(newAddress.lat!, newAddress.long!);

    if (result != null) {
      deliveryPrice = result;
      cartController.deliveryPrice = result;

      if (address.sId != null) {
        address = await provider.putAddress(newAddress);
      } else {
        address = await provider.postAddress(newAddress);
      }
      print(address);

      loading = false;
    } else {
      loading = false;
      return Future.error('Endereço fora do raio de entrega :(');
    }
  }

  void removeAddress() async {
    final Address? addressUser = await provider.getAddress();

    if (addressUser != null) {
      if (address.sId != null) {
        await provider.deleteAddress(address);
      }
    }

    address = Address();
    deliveryPrice = 0.0;
    cepController.clear();
    cartController.deliveryPrice = deliveryPrice;
    // update();
  }

  Future<void> loadUserAddress() async {
    final Address? addressUser = await provider.getAddress();

    if (addressUser != null) {
      final result =
          await provider.calculateDelivery(addressUser.lat!, addressUser.long!);

      if (result != null) {
        deliveryPrice = result;
        cartController.deliveryPrice = deliveryPrice;
        address = addressUser;
      }
    }
  }

  @override
  void onInit() async {
    super.onInit();
    if (userController.user.sId != null) {
      await loadUserAddress();
    }
  }
}
