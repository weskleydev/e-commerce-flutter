import 'package:ecommerce_model/app/modules/products/product_model.dart';

class Cart {
  late String? sId;
  late Product product;
  late int quantity;
  late String size;
  num? fixedPrice;

  Cart(
      {this.sId,
      required this.product,
      required this.quantity,
      required this.size,
      required this.fixedPrice});

  Cart.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product = Product.fromJson(json['product']);
    quantity = json['quantity'];
    size = json['size'];
  }

  Cart.fromProduct(currentProduct, selectedSizeName) {
    product = currentProduct;
    quantity = 1;
    size = selectedSizeName;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['product'] = product.toJson();
    data['quantity'] = quantity;
    data['size'] = size;
    return data;
  }

  Sizes? get itemSize {
    //  if (product == null) return null;
    return product.findSize(size);
  }

  num get unitPrice {
    // if (product == null) return 0;
    return itemSize?.price ?? 0;
  }

  Map<String, dynamic> toCartItemMap() {
    return {
      'product': product,
      'quantity': quantity,
      'size': size,
    };
  }

  bool stackable(productNewSid, selectedSizeName) {
    return productNewSid == product.sId && selectedSizeName == size;
  }

  Map<String, dynamic> toOrderItemMap() {
    return {
      "cart": {"product": product, "quantity": quantity, "size": size},
      'fixedPrice': fixedPrice ?? unitPrice,
    };
  }

  num get totalPrice => unitPrice * quantity;

  bool get hasStock {
    if (product.deleted) return false;
    final size = itemSize;
    if (size == null) return false;
    return size.stock >= quantity;
  }

  @override
  String toString() {
    return 'Cart{_id: $sId, product: {$product}, quantity: $quantity, size: $size}';
  }
}
