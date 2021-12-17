import 'package:ecommerce_model/app/modules/authentication/user_controller.dart';
import 'package:ecommerce_model/app/modules/categories/components/list_tab.dart';
import 'package:ecommerce_model/app/routes/app_pages.dart';
import 'package:ecommerce_model/app/widgets/empty_card.dart';
import 'package:ecommerce_model/app/widgets/erro.dart';
import 'package:ecommerce_model/app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: userController.isLoggedIn
            ? FloatingActionButton(
                onPressed: () => Get.toNamed(Routes.cart),
                child: Icon(Icons.shopping_cart_outlined),
              )
            : null,
        appBar: AppBar(
          title: Text('Categorias'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Get.toNamed(Routes.orders),
              icon: Icon(Icons.checklist_rtl_outlined)),
          actions: [
            Obx(() => userController.isLoggedIn
                ? button(
                    label: 'logout',
                    icon: Icons.logout,
                    onPressed: () => userController.logOut())
                : button(
                    label: 'Login',
                    icon: Icons.login,
                    onPressed: () => Get.toNamed(Routes.authentication)))
          ],
        ),
        body: controller.obx(((state) => ListTab()),
            onLoading: Loading(),
            onError: (error) => Erro(error, controller.getAll()),
            onEmpty: EmptyCard(
                title: 'Não existem Promoções disponíveis',
                iconData: Icons.local_offer_outlined)));
  }

  TextButton button(
      {required String label,
      required IconData icon,
      required void Function() onPressed}) {
    return TextButton.icon(
      style: ButtonStyle(
          textStyle:
              MaterialStateProperty.all(TextStyle(fontWeight: FontWeight.bold)),
          padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          foregroundColor: MaterialStateProperty.all(Colors.white)),
      label: Text(label),
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
