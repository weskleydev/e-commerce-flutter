import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppText extends StatelessWidget {
  final String label;
  final String hint;
  final bool? password;
  final bool? enabled;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final IconData? iconPrefixo;
  final IconButton? suffixIcon;
  final Function? onChanged;
  final Function? onSaved;
  final Color? color;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final Function? onFieldSubmitted;
  final Widget? prefix;
  final int? maxLines;
  final int? minLines;

  final String? initialValue;

  AppText(this.label, this.hint,
      {this.password,
      this.enabled,
      this.controller,
      this.validator,
      this.keyboardType,
      this.textInputAction,
      this.focusNode,
      this.onSaved,
      this.nextFocus,
      this.iconPrefixo,
      this.initialValue,
      this.suffixIcon,
      this.onChanged,
      this.color,
      this.inputFormatters,
      this.errorText,
      this.onFieldSubmitted,
      this.prefix,
      this.maxLines,
      this.minLines});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextFormField(
          inputFormatters: inputFormatters,
          initialValue: initialValue,
          controller: controller,
          obscureText: password ?? false,
          validator: validator,
          maxLines: (maxLines != null) ? maxLines : 1,
          minLines: (minLines != null) ? minLines : 1,
          enabled: enabled,
          autofocus: false,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onSaved: onSaved as void Function(String?)?,
          onChanged:
              onChanged != null ? onChanged as void Function(String) : null,
          focusNode: focusNode,
          onFieldSubmitted: (onFieldSubmitted != null)
              ? onFieldSubmitted as void Function(String)
              : ((term) => _fieldFocusChange(context, focusNode, nextFocus)),
          style: TextStyle(color: color ?? Colors.black.withOpacity(0.3)),
          decoration: InputDecoration(hintText: hint, suffixIcon: suffixIcon)),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode? currentFocus, FocusNode? nextFocus) {
    currentFocus!.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
