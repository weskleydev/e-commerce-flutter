import 'package:ecommerce_model/app/modules/address/address_controller.dart';
import 'package:ecommerce_model/app/modules/address/address_model.dart';
import 'package:ecommerce_model/app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'textform_address.dart';

class AddressInputField extends GetView<AddressController> {
  AddressInputField(this.address);

  final Address address;
  final FocusNode _numberFocus = FocusNode();
  final FocusNode _complementFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    String? emptyValidator(String? text) =>
        text!.isEmpty ? 'Campo obrigatório' : null;

    if (address.zipCode != null && controller.deliveryPrice == 0.0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormAddress(
            enabled: false,
            labelText: 'Rua/Avenida',
            hintText: 'Av. Brasil',
            initialValue: address.street,
            onSaved: (t) => address.street = t,
            validator: emptyValidator,
            keyboardType: TextInputType.text,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormAddress(
                  enabled: !controller.loading,
                  labelText: 'Número',
                  hintText: '123',
                  textInputAction: TextInputAction.next,
                  initialValue:
                      address.number != null ? address.number.toString() : '',
                  focusNode: _numberFocus,
                  nextFocus: _complementFocus,
                  onSaved: (t) => address.number = int.tryParse(t!),
                  validator: emptyValidator,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormAddress(
                  enabled: !controller.loading,
                  labelText: 'Complemento',
                  hintText: 'Opcional',
                  initialValue: address.complement,
                  focusNode: _complementFocus,
                  onSaved: (t) => address.complement = t,
                  validator: emptyValidator,
                  onFieldSubmitted: (value) async {
                    _complementFocus.unfocus();
                    {
                      if (Form.of(context)!.validate()) {
                        Form.of(context)!.save();
                        try {
                          await controller.setAddress(address);
                        } catch (e) {
                          Get.snackbar('', '$e', backgroundColor: Colors.red);
                        }
                      }
                    }
                  },
                ),
              ),
            ],
          ),
          TextFormAddress(
            enabled: false,
            initialValue: address.district,
            labelText: 'Bairro',
            hintText: 'Centro',
            validator: emptyValidator,
            onSaved: (t) => address.district = t,
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: TextFormAddress(
                  enabled: false,
                  initialValue: address.city,
                  labelText: 'Cidade',
                  hintText: 'Campos dos Goytacazes',
                  validator: emptyValidator,
                  onSaved: (t) => address.city = t,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  autocorrect: false,
                  enabled: false,
                  textCapitalization: TextCapitalization.characters,
                  initialValue: address.state,
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'UF',
                    hintText: 'SP',
                    counterText: '',
                  ),
                  maxLength: 2,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (e.length != 2) {
                      return 'Inválido';
                    }
                    return null;
                  },
                  onSaved: (t) => address.state = t,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          if (controller.loading)
            LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(primaryColor),
              backgroundColor: Colors.transparent,
            ),
          ElevatedButton(
            onPressed: !controller.loading
                ? () async {
                    if (Form.of(context)!.validate()) {
                      Form.of(context)!.save();
                      try {
                        await controller.setAddress(address);
                      } catch (e) {
                        Get.snackbar('', '$e', backgroundColor: Colors.red);
                      }
                    }
                  }
                : null,
            child: const Text('Calcular Frete'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return primaryColor.withAlpha(100);
                    } else {
                      return primaryColor;
                    }
                  },
                ),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
          ),
        ],
      );
    } else if (address.zipCode != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                  '${address.street}, ${address.number} - ${address.district}\n'
                  '${address.city} - ${address.state}'),
            ),
            CustomIconButton(
              iconData: Icons.edit,
              color: primaryColor,
              size: 20,
              onTap: () {
                controller.removeAddress();
              },
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
