import 'package:get/get.dart';

import 'package:ecommerce_model/app/modules/address/address_binding.dart';
import 'package:ecommerce_model/app/modules/address/address_view.dart';
import 'package:ecommerce_model/app/modules/authentication/authentication_binding.dart';
import 'package:ecommerce_model/app/modules/authentication/authentication_view.dart';
import 'package:ecommerce_model/app/modules/cart/cart_binding.dart';
import 'package:ecommerce_model/app/modules/cart/cart_view.dart';
import 'package:ecommerce_model/app/modules/categories/categories_binding.dart';
import 'package:ecommerce_model/app/modules/categories/categories_view.dart';
import 'package:ecommerce_model/app/modules/checkout/checkout_binding.dart';
import 'package:ecommerce_model/app/modules/checkout/checkout_view.dart';
import 'package:ecommerce_model/app/modules/home/home_binding.dart';
import 'package:ecommerce_model/app/modules/home/home_view.dart';
import 'package:ecommerce_model/app/modules/orders/orders_binding.dart';
import 'package:ecommerce_model/app/modules/orders/orders_view.dart';
import 'package:ecommerce_model/app/modules/payment/payment_binding.dart';
import 'package:ecommerce_model/app/modules/payment/payment_view.dart';
import 'package:ecommerce_model/app/modules/products/products_binding.dart';
import 'package:ecommerce_model/app/modules/products/products_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
        name: _Paths.home,
        page: () => HomeView(),
        bindings: [HomeBinding(), AuthenticationBinding()]),
    GetPage(
        name: _Paths.products,
        page: () => ProductsView(),
        bindings: [ProductsBinding(), CartBinding()]),
    GetPage(
        name: _Paths.categories,
        page: () => CategoriesView(),
        binding: CategoriesBinding()),
    GetPage(
      name: _Paths.authentication,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.cart,
      page: () => CartView(),
      bindings: [CartBinding(), AddressBinding()],
    ),
    GetPage(
        name: _Paths.address,
        page: () => AddressView(),
        bindings: [AddressBinding(), CartBinding()]),
    GetPage(name: _Paths.checkout, page: () => CheckoutView(), bindings: [
      CheckoutBinding(),
      ProductsBinding(),
      CartBinding(),
      OrdersBinding(),
      AddressBinding()
    ]),
    GetPage(
      name: _Paths.orders,
      page: () => OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
        name: _Paths.payment,
        page: () => PaymentView(),
        bindings: [PaymentBinding(), CartBinding(), AddressBinding()]),
  ];
}
