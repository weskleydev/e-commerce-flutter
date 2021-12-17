import 'package:ecommerce_model/app/modules/address/components/cep_imput_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'address_controller.dart';
import 'components/address_input_field.dart';

class AddressView extends GetView<AddressController> {
  @override
  Widget build(BuildContext context) {
    return GetX<AddressController>(builder: (_) {
      final address = _.address;
      final zipcodeValid = address.zipCode != null;
      return Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4.0),
        child: ExpansionTile(
          title: Text(
            zipcodeValid
                ? 'CEP: ${controller.address.zipCode!}'
                : "Calcular Frete",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: zipcodeValid ? null : Colors.grey[700]),
          ),
          leading: Icon(Icons.location_on_outlined),
          trailing: Icon(Icons.add),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      zipcodeValid ? Container() : CepInputField(address),
                      AddressInputField(address),
                    ],
                  ),
                ))
          ],
        ),
      );
    });
    // Card(
    //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //   child: Padding(
    //     padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
    //     child: GetX<AddressController>(
    //       builder: (_) {
    //         final address = _.address;
    //         return
    //         Form(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               Text(
    //                 'Endereço de Entrega',
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.w600,
    //                   fontSize: 16,
    //                 ),
    //               ),
    //               CepInputField(address),
    //               AddressInputField(address),
    //             ],
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}




// import 'package:ecommerce_model/app/modules/address/components/address_card.dart';
// import 'package:ecommerce_model/app/modules/cart/cart_controller.dart';
// import 'package:ecommerce_model/app/modules/cart/components/payment_method.dart';
// import 'package:ecommerce_model/app/modules/cart/components/price_card.dart';
// import 'package:ecommerce_model/app/routes/app_pages.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import 'address_controller.dart';

// class AddressView extends GetView<AddressController> {
//   final CartController cartController = Get.arguments;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Entrega'),
//         centerTitle: true,
//       ),
//       body: ListView(children: <Widget>[
//         PaymentMethod(),
//         AddressCard(),
//         Obx(() => PriceCard(
//               buttonText: 'Continuar para o Pagamento',
//               onPressed: controller.isAddressValid
//                   ? () {
//                       Get.toNamed(Routes.checkout,
//                           arguments: [cartController, controller.address]);
//                     }
//                   : null,
//             ))
//       ]),
//     );
//   }
// }
