import 'package:ecommerce_model/app/modules/address/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class TextFormAddress extends GetView<AddressController> {
  TextFormAddress(
      {this.enabled,
      this.labelText,
      this.textInputAction,
      this.hintText,
      this.initialValue,
      this.focusNode,
      this.nextFocus,
      this.onFieldSubmitted,
      this.onSaved,
      this.keyboardType,
      this.inputFormatters,
      this.validator});

  final String? initialValue;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? labelText;
  final bool? enabled;
  final String? hintText;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final Function? onFieldSubmitted;
  final Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;

  String? emptyValidator(String? text) =>
      text!.isEmpty ? 'Campo obrigatório' : null;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      initialValue: initialValue,
      textInputAction: textInputAction,
      style: TextStyle(
          color: enabled! ? Colors.black : Colors.black54,
          fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        isDense: true,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black87),
        hintText: hintText,
      ),
      validator: emptyValidator,
      keyboardType: keyboardType,
      onSaved: onSaved,
      inputFormatters: inputFormatters,
      onFieldSubmitted: (onFieldSubmitted != null)
          ? onFieldSubmitted as void Function(String)
          : ((term) => _fieldFocusChange(context, focusNode, nextFocus)),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode? currentFocus, FocusNode? nextFocus) {
    currentFocus!.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
