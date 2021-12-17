import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  Loading([this.text]);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              backgroundColor: Colors.green,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
            SizedBox(height: 15),
            Text(
              text ?? "Carregando",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ]),
    );
  }
}
