import 'package:ecommerce_model/app/widgets/bottom_bar.dart';
import 'package:ecommerce_model/app/widgets/empty_card.dart';
import 'package:ecommerce_model/app/widgets/erro.dart';
import 'package:ecommerce_model/app/widgets/loading.dart';
import 'package:ecommerce_model/app/widgets/login_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'components/order_tile.dart';
import 'orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(3),
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
        leading: Icon(
          Icons.sports_soccer_outlined,
          size: 35,
        ),
        centerTitle: true,
      ),
      body: Obx(() => (controller.userController.user.sId == null)
          ? LoginCard()
          : controller.obx(
              ((state) => ListView.builder(
                  itemCount: state!.length,
                  itemBuilder: (_, index) {
                    return OrderTile(state.reversed.toList()[index]);
                  })),
              onLoading: Loading(),
              onError: (error) => Erro(error, controller.getAll()),
              onEmpty: EmptyCard(
                  title: 'Nenhuma compra encontrada',
                  iconData: Icons.border_clear_outlined))),
    );
  }
}
