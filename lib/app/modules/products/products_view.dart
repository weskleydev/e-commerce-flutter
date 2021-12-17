import 'package:ecommerce_model/app/widgets/empty_card.dart';
import 'package:ecommerce_model/app/widgets/erro.dart';
import 'package:ecommerce_model/app/widgets/loading.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'components/list_tab.dart';
import 'products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
          Colors.black54,
          Colors.blueGrey.withOpacity(0.9),
          Colors.black54,
        ], begin: Alignment.topLeft, end: Alignment.bottomLeft))),
        Scaffold(
            appBar: AppBar(
              title: Text('ProductsView'),
              centerTitle: true,
              actions: [
                Obx(() => IconButton(
                    onPressed: () => controller.type = !controller.type,
                    icon: Icon(controller.type ? Icons.list : Icons.grid_on)))
              ],
            ),
            body: controller.obx(((state) => ListTab()),
                onLoading: Loading(),
                onError: (error) => Erro(error, controller.getAll()),
                onEmpty: EmptyCard(
                    title: 'Não existem Promoções disponíveis',
                    iconData: Icons.local_offer_outlined))),
      ],
    );
  }
}
