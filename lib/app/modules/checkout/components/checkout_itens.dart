import 'package:ecommerce_model/app/modules/cart/cart_model.dart';
import 'package:flutter/material.dart';

class CheckoutItens extends StatelessWidget {
  const CheckoutItens({required this.cartProduct});

  final Cart cartProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 150,
                child: Text(
                  cartProduct.product.name,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  'nº ${cartProduct.size}',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'R\$ ${cartProduct.unitPrice.toStringAsFixed(2)}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                '${cartProduct.quantity}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
