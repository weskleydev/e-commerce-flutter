import 'package:flutter/material.dart';

import 'card_credit_text_field.dart';

class CardCreditBack extends StatelessWidget {
  const CardCreditBack({required this.cvvFocus});

  final FocusNode cvvFocus;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 16,
      child: Container(
        height: 200,
        color: const Color(0xFF1B4B52),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              height: 40,
              margin: const EdgeInsets.symmetric(vertical: 16),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 70,
                  child: Container(
                    color: Colors.grey[500],
                    margin: const EdgeInsets.only(left: 12),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: CardCreditTextField(
                      hint: '123',
                      maxLength: 3,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      // ],
                      textAlign: TextAlign.end,
                      textInputType: TextInputType.number,
                      validator: (cvv) {
                        if (cvv!.length != 3) return 'Inválido';
                        return null;
                      },
                      focusNode: cvvFocus,
                    ),
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Container(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FilteringTextInputFormatter {}
