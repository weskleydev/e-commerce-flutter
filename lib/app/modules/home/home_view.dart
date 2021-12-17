import 'package:ecommerce_model/app/widgets/bottom_bar.dart';
import 'package:ecommerce_model/app/widgets/empty_card.dart';
import 'package:ecommerce_model/app/widgets/erro.dart';
import 'package:ecommerce_model/app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/staggered_tab.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(0),
        appBar: AppBar(
          title: Text('Destaques'),
          centerTitle: true,
          leading: Icon(
            Icons.sports_soccer_outlined,
            size: 35,
          ),
        ),
        body: controller.obx(((state) => StaggeredTab(state)),
            onLoading: Loading(),
            onError: (error) => Erro(error, controller.getAll()),
            onEmpty: EmptyCard(
                title: 'Não existem Destaques',
                iconData: Icons.local_offer_outlined)));
  }
}
