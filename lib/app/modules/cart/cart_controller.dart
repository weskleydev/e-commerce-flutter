import 'package:ecommerce_model/app/modules/authentication/user_controller.dart';
import 'package:ecommerce_model/app/modules/products/product_model.dart';
import 'package:get/get.dart';

import 'cart_model.dart';
import 'cart_provider.dart';

class CartController extends GetxController with StateMixin<List<Cart>> {
  CartController(this.provider);
  final CartProvider provider;

//Declaração da lista de produtos (o carrinho em si).
  final _cartList = <Cart>[].obs;
  List<Cart> get cartList => _cartList;
  set cartList(List<Cart> value) => _cartList.value = value;

//Declaração da variável para pegar a soma dos produtos do carrinho.
  final _productsPrice = 0.0.obs;
  double get productsPrice => _productsPrice.value;
  set productsPrice(double value) => _productsPrice.value = value;

//Declaração da variável para pegar a soma dos produtos do carrinho.
  final _deliveryPrice = 0.0.obs;
  get deliveryPrice => _deliveryPrice.value;
  set deliveryPrice(value) => _deliveryPrice.value = value;

  final _coupon = 0.obs;
  get coupon => _coupon.value;
  set coupon(value) => _coupon.value = value;

  final _discountPrice = 0.0.obs;
  get discountPrice => _discountPrice.value;
  setDiscountPrice(value) {
    switch (value) {
      case '10OFF':
        _discountPrice.value = (productsPrice + (deliveryPrice ?? 0)) * 0.1;
        coupon = 10;
        break;
      case '20OFF':
        _discountPrice.value = (productsPrice + (deliveryPrice ?? 0)) * 0.20;
        coupon = 20;
        break;
      case '30OFF':
        _discountPrice.value = (productsPrice + (deliveryPrice ?? 0)) * 0.30;
        coupon = 30;
        break;
      case '40OFF':
        _discountPrice.value = (productsPrice + (deliveryPrice ?? 0)) * 0.40;
        coupon = 40;
        break;
      default:
        _discountPrice.value = 0.0;
        coupon = 0;
    }
  }

//get para a soma do total de produtos  + o delivery (se tiver)
  num get totalPrice => (productsPrice + (deliveryPrice ?? 0)) - discountPrice;

//Função para carregar o carrinho do servidor.
  getItems() async {
    cartList.clear();
    cartList = await provider.getItems();

    if (cartList != []) {
      change(cartList, status: RxStatus.success());
    } else {
      change(cartList, status: RxStatus.empty());
    }

    for (var item in cartList) {
      productsPrice += item.totalPrice;
    }

    // update();
  }

//Função para Limpar o carrinho.
  clear() async {
    for (final item in cartList) {
      await provider.clear(item);
    }
    cartList.clear();
    // update();
  }

// Função para atualizar os itens do carrinho.
  Future<void> onItemUpdated() async {
    productsPrice = 0.0;

    for (int i = 0; i < cartList.length; i++) {
      final cart = cartList[i];

      if (cart.quantity == 0) {
        await removeOfCart(cart, cartList);
        i--;
        continue;
      }
      productsPrice += cart.totalPrice;
      await updateCartModel(cart);
    }
  }

// Função para atualizar os itens do carrinho no servidor.
  Future<void> updateCartModel(Cart cart) async {
    if (cart.sId != null) {
      await provider.updateCart(cart);
    }
  }

// Função para atualizar os itens do carrinho no servidor.
  Future<void> removeOfCart(Cart cart, List<Cart> items) async {
    items.removeWhere((p) => p.sId == cart.sId && p.size == cart.size);
    await provider.removeOfCart(cart);
  }

  bool get isCartValid {
    for (final cartProduct in cartList) {
      if (!cartProduct.hasStock) return false;
    }
    return true;
  }

  increment(cartProduct) {
    cartProduct.quantity++;
    onItemUpdated();
    update();
  }

  decrement(cartProduct) {
    cartProduct.quantity--;
    onItemUpdated();
    update();
  }

  addToCart(Product product, Sizes selectedSize) async {
    await getItems();
    try {
      final e = cartList
          .firstWhere((p) => p.stackable(product.sId, selectedSize.name));
      increment(e);
    } catch (e) {
      final cartProduct = Cart.fromProduct(product, selectedSize.name);
      await provider.addToCart(cartProduct);
      cartList = await provider.getItems();
      onItemUpdated();
    }
  }

  @override
  void onInit() async {
    super.onInit();
    if (Get.find<UserController>().isLoggedIn) {
      await getItems();
    }
  }
}
