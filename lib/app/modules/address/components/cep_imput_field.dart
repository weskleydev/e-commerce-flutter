import 'package:brasil_fields/brasil_fields.dart';
import 'package:ecommerce_model/app/modules/address/address_controller.dart';
import 'package:ecommerce_model/app/modules/address/address_model.dart';
import 'package:ecommerce_model/app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CepInputField extends GetView<AddressController> {
  CepInputField(this.address);

  final Address address;
  final FocusNode _addressFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Obx(() => Visibility(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: controller.cepController,
                decoration: InputDecoration(
                    isDense: true,
                    suffixIcon: IconButton(
                        onPressed: () async {
                          if (Form.of(context)!.validate()) {
                            try {
                              await controller
                                  .getAddress(controller.cepController.text);
                            } catch (e) {
                              Get.snackbar('', '$e',
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          }
                        },
                        icon: Icon(Icons.search_outlined)),
                    border: OutlineInputBorder(),
                    hintText: "Digite o CEP"),
                // decoration: const InputDecoration(
                //     isDense: true, labelText: 'CEP', hintText: '12.345-678'),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                validator: (cep) {
                  if (cep!.isEmpty) {
                    return 'Campo obrigatório';
                  } else if (cep.length != 10) {
                    return 'CEP Inválido';
                  }
                  return null;
                },
                onFieldSubmitted: (value) async {
                  _addressFocus.unfocus();
                  if (Form.of(context)!.validate()) {
                    try {
                      await controller
                          .getAddress(controller.cepController.text);
                    } catch (e) {
                      Get.snackbar('', '$e',
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 3),
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  }
                },
              ),
              if (controller.loading)
                LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(primaryColor),
                ),
            ],
          ),
          replacement: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(children: <Widget>[
                Expanded(
                  child: Text(
                    'CEP: ${address.zipCode}',
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.w600),
                  ),
                ),
                CustomIconButton(
                  iconData: Icons.edit,
                  color: primaryColor,
                  size: 20,
                  onTap: () {
                    controller.removeAddress();
                  },
                ),
              ])),
          visible: address.zipCode == null,
        ));
  }
}
