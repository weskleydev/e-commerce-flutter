import 'package:flutter/material.dart';

class CabecalhoItens extends StatelessWidget {
  const CabecalhoItens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Item',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontSize: 12.0,
            ),
          ),
        ),
        Container(
          width: 150,
          child: Text(
            'Produto',
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontSize: 12.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            'Tamanho',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
              fontSize: 12.0,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          'Valor',
          style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal),
        ),
        Text(
          'Qtd',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
