import 'package:ecommerce_model/app/modules/products/product_model.dart';
import 'package:ecommerce_model/app/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../products_controller.dart';
import 'product_details.dart';

class ListTiles extends GetView<ProductsController> {
  ListTiles(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => ProductDetails(product)),
      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        margin: EdgeInsets.all(15),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    child: ImageWidget(
                      image: product.images.first,
                      fit: BoxFit.contain,
                      height: 120.0,
                      width: 300.0,
                    )),
              ),
              Container(
                color: Colors.grey,
                width: 0.5,
                height: 100,
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        product.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Divider(color: Colors.transparent),
                      Text(
                        'R\$ ${product.basePrice.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    // ListTile(
    //     title: Text(product.name), trailing: Icon(Icons.arrow_right_outlined));
  }
}
