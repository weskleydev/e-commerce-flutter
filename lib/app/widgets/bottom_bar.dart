import 'package:ecommerce_model/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  BottomBar(this.indexPage);
  final int? indexPage;

  String setPage(int index) {
    switch (index) {
      case 0:
        return Routes.home;
      case 1:
        return Routes.categories;
      case 2:
        return Routes.cart;
      case 3:
        return Routes.orders;

      default:
        return Routes.home;
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        // Obx(() =>
        BottomNavigationBar(
            // elevation: 30,
            backgroundColor: Colors.indigo.shade700,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.shade400,
            selectedIconTheme: IconThemeData(color: Colors.white, size: 22),
            selectedFontSize: 15,
            unselectedFontSize: 13,
            unselectedIconTheme:
                IconThemeData(color: Colors.grey.shade400, size: 19),
            type: BottomNavigationBarType.fixed,
            currentIndex: indexPage!,
            onTap: (indexPage) async {
              // _.bottomTapped(indexPage);
              //  controller.bottomTapped(indexPage);
              Get.offNamed(setPage(indexPage));
            },
            items: [
          bottomNavigationBarItem('Home', Icons.home_outlined, 0),
          bottomNavigationBarItem('Produtos', Icons.view_list_outlined, 1),
          bottomNavigationBarItem(
              'Meu Carrinho', Icons.shopping_cart_outlined, 2),
          bottomNavigationBarItem(
              'Meus Pedidos', Icons.account_circle_outlined, 3),
          // if (_userControler.isAdmin) ...[
          // bottomNavigationBarItem('Admin', Icons.settings, 4)
          // ]
        ]
            // )
            );
  }

  bottomNavigationBarItem(
    String title,
    IconData icon,
    int page,
  ) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
        ),
        label: title);
  }
}
