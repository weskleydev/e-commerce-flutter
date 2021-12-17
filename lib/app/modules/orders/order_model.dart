import 'package:ecommerce_model/app/modules/address/address_model.dart';
import 'package:ecommerce_model/app/modules/authentication/user_model.dart';
import 'package:ecommerce_model/app/modules/cart/cart_controller.dart';
import 'package:ecommerce_model/app/modules/cart/cart_model.dart';

class Order {
  String? sId;
  User? user;
  num? price;
  String? payment;
  String? status;
  Address? address;
  List<Items>? items;
  String? createDate;
  int? number;

  Order(
      {this.sId,
      this.user,
      this.price,
      this.payment,
      this.address,
      this.status,
      this.items,
      this.createDate,
      this.number});

  String get formattedId => '#${number.toString().padLeft(6, '0')}';

  Order.fromCartManager(CartController cartController, Address addressOrder,
      User currentUser, paymentMethod) {
    price = cartController.totalPrice;
    user = currentUser;
    address = addressOrder;
    payment = paymentMethod;
  }

  // Order.fromJson(Map<String, dynamic> json) {
  //   sId = json['_id'];
  //   user = json['user'] != null ? User.fromJson(json['user']) : null;
  //   price = json['price'];
  //   payment = json['payment'];
  //   status = json['status'];
  //   if (json['items'] != null) {
  //     items = <Items>[];
  //     json['items'].forEach((v) {
  //       items!.add(Items.fromJson(v));
  //     });
  //   }
  //   createDate = json['createDate'];
  //   number = json['number'];
  // }
  Order.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    price = json['price'];
    payment = json['payment'];
    status = json['status'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    createDate = json['createDate'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['user'] = user!.toJson();
    data['price'] = price;
    data['payment'] = payment;
    data['status'] = status;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['createDate'] = createDate;
    data['number'] = number;
    return data;
  }

  @override
  String toString() {
    return 'Orders{sId: $sId, items: $items, price: $price, user: $user, address: $address, payment $payment, status: $status, createDate $createDate, number: $number}';
  }
}

class Items {
  Cart? cart;
  double? fixedPrice;
  String? sId;

  Items({this.cart, this.fixedPrice, this.sId});

  Items.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? Cart?.fromJson(json['cart']) : null;
    fixedPrice = json['fixedPrice'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (cart != null) {
      data['cart'] = cart!.toJson();
    }
    data['fixedPrice'] = fixedPrice;
    data['_id'] = sId;
    return data;
  }

  @override
  String toString() {
    return 'Items{sId: $sId, cart: $cart, fixedPrice: $fixedPrice}';
  }
}
