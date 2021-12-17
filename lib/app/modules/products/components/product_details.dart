import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_model/app/modules/authentication/user_controller.dart';
import 'package:ecommerce_model/app/modules/cart/cart_controller.dart';
import 'package:ecommerce_model/app/modules/products/product_model.dart';
import 'package:ecommerce_model/app/routes/app_pages.dart';
import 'package:ecommerce_model/app/widgets/app_button.dart';
import 'package:ecommerce_model/app/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../products_controller.dart';
import 'size.dart';

class ProductDetails extends GetView<ProductsController> {
  ProductDetails(this.product);
  final Product product;
  final isLoggedIn = Get.find<UserController>().isLoggedIn;

  int get totalStock {
    int stock = 0;
    for (final size in product.sizes) {
      stock += size.stock;
    }
    return stock;
  }

  bool get hasStock {
    return totalStock > 0;
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(product.name),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {
          controller.selectedSize =
              Sizes(name: '', price: 0.0, sId: '', stock: 0);
          return true;
        },
        child: ListView(
          children: <Widget>[
            CarouselSlider(
              items: product.images.map<Widget>((url) {
                return Container(
                  color: Colors.white,
                  child: ImageWidget(
                      image: url,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      height: Get.height * 0.28,
                      width: Get.width),
                );
              }).toList(),
              options: CarouselOptions(
                  height: Get.height * 0.28,
                  autoPlay: false,
                  viewportFraction: 1.0),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    product.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'A partir de',
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    'R\$ ${product.basePrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 12),
                    child: Text(
                      'Descrição',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 14),
                  ),
                  if (product.deleted)
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(
                        'Este produto não está mais disponível',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                      ),
                    )
                  else ...[
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(
                        'Tamanhos',
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 8),
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.spaceBetween,
                        children: product.sizes.map((s) {
                          return SizeWidget(size: s);
                        }).toList(),
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 20,
                  ),
                  if (product.hasStock)
                    SizedBox(
                      height: 44,
                      child: Obx(() {
                        print(controller.selectedSize);
                        return AppButton(
                          onPressed: controller.selectedSize.sId == ''
                              ? null
                              : () async {
                                  if (isLoggedIn) {
                                    await Get.find<CartController>().addToCart(
                                        product, controller.selectedSize);
                                    Get.toNamed(Routes.cart);
                                  } else {
                                    Get.toNamed(Routes.authentication);
                                  }
                                },
                          color: primaryColor,
                          textColor: Colors.white,
                          title: controller.selectedSize.sId == ''
                              ? 'Selecione um tamanho'
                              : !isLoggedIn
                                  ? 'Entre para Comprar'
                                  : 'Adicionar ao Carrinho',
                        );
                      }),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
