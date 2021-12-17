import 'package:ecommerce_model/app/data/services/cep-aberto/cep_aberto.dart';
import 'package:ecommerce_model/app/modules/authentication/user_controller.dart';
import 'package:ecommerce_model/utils/constants.dart';
import 'package:ecommerce_model/utils/messages.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'address_model.dart';

class AddressProvider extends GetConnect {
  AddressProvider(this.apiCepAberto);
  final CepAbertoService apiCepAberto;

  var userToken = Get.find<UserController>().user.token!;

  late num deliveryPrice;

  getAddressToService(cep) async {
    try {
      final cepAbertoAddress = await apiCepAberto.getAddressFromCep(cep);

      var address = Address(
          street: cepAbertoAddress.logradouro,
          district: cepAbertoAddress.bairro,
          zipCode: cepAbertoAddress.cep,
          city: cepAbertoAddress.cidade.nome,
          state: cepAbertoAddress.estado.sigla,
          lat: cepAbertoAddress.latitude,
          long: cepAbertoAddress.longitude);

      if (address.zipCode != null) {
        return address;
      } else {
        return Future.error('CEP Inválido');
      }
    } catch (e) {
      Messages.error("Error Catch", e.toString());
    }
  }

  calculateDelivery(double lat, double long) async {
    final double latStore = -21.768126608472414; //doc.data()['lat'] as double;
    final double longStore = -41.31982746157135; //doc.data()['long'] as double;
    final num base = 5; //doc.data()['base'] as num;
    final num km = 0.5; //doc.data()['km'] as num;
    final num maxkm = 50; //= doc.data()['maxkm'] as num;

    double dis = Geolocator.distanceBetween(latStore, longStore, lat, long);

    dis /= 1000.0;

    if (dis > maxkm) {
      return null;
    }

    deliveryPrice = base + dis * km;

    return deliveryPrice;
  }

  getAddress() async {
    try {
      final response =
          await get('$url/address', headers: {"x-access-token": userToken});

      if (response.statusCode == 200) {
        if (response.body != null) {
          return Address.fromJson(response.body);
        }
      } else {
        Messages.error("Error", response.body['message']);
        return null;
      }
    } catch (e) {
      Messages.error("Error Catch", e.toString());
      return null;
    }
  }

  postAddress(Address address) async {
    try {
      var response = await post(
        '$url/address',
        address.toJson(),
        headers: {"x-access-token": userToken},
      );

      if (response.statusCode == 201) {
        if (response.body != null) {
          return Address.fromJson(response.body);
        }
      } else {
        Messages.error("Error", response.body['message']);
      }
    } catch (e) {
      Messages.error("Error Catch", e.toString());
    }
  }

  putAddress(Address address) async {
    try {
      var response = await put(
        '$url/address/${address.sId}',
        address.toJson(),
        headers: {"x-access-token": userToken},
      );

      if (response.statusCode == 200) {
        if (response.body != null) {
          return Address.fromJson(response.body);
        }
      } else {
        Messages.error("Error", response.body['message']);
      }
    } catch (e) {
      Messages.error("Error", e.toString());
    }
  }

  deleteAddress(Address address) async {
    try {
      var response = await delete(
        '$url/address',
        query: {"id": address.sId},
        headers: {"x-access-token": userToken},
      );
      if (response.statusCode != 200) {
        Messages.error("Error", response.body['message']);
      }
    } catch (e) {
      Messages.error("Erroradd", e.toString());
    }
  }
}
