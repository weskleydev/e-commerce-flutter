import 'package:ecommerce_model/app/modules/products/product_model.dart';
import 'package:ecommerce_model/app/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_details.dart';

class GridTiles extends StatelessWidget {
  GridTiles(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => ProductDetails(product)),
      child: Card(
          //margin: EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ImageWidget(
                image: product.images.first,
                fit: BoxFit.contain,
                height: 120.0,
              ),
              Divider(
                endIndent: 10,
                indent: 10,
                height: 2,
                thickness: 0.5,
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 12.0),
                  child: Text(
                    product.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Text(
                'R\$ ${product.basePrice.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          )),
    );
  }
}
