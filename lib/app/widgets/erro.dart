import 'package:flutter/material.dart';

class Erro extends StatelessWidget {
  const Erro(this.text, this.all);
  final String? text;
  final dynamic all;

  // final Function()? refresh;
  // final Future Function() refresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.error_rounded,
              size: 50,
              color: Colors.red,
            ),
            SizedBox(height: 15),
            Text(
              text ?? "Houve um erro na requisição",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 80),
            InkWell(
              onTap: () async => all,
              child: Column(
                children: [
                  Icon(
                    Icons.refresh_outlined,
                    size: 50,
                    color: Colors.black,
                  ),
                  Text(
                    "Click para\nTentar Novamente",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
