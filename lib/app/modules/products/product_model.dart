class Product {
  late String? sId;
  late String category;
  late String name;
  late String description;
  late List<dynamic> images;
  late List<Sizes> sizes;
  late bool deleted;

  Product(
      {this.sId,
      required this.category,
      required this.name,
      required this.description,
      required this.images,
      required this.sizes,
      required this.deleted});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    name = json['name'];
    description = json['description'];
    images = json['images'];
    sizes = (json['sizes'] as List)
        .map((i) => Sizes.fromJson(i as Map<String, dynamic>))
        .toList();
    deleted = json['deleted'];
  }

  Sizes? findSize(String name) {
    try {
      return sizes.firstWhere((s) => s.name == name);
    } catch (e) {
      return null;
    }
  }

  int get totalStock {
    int stock = 0;
    for (final size in sizes) {
      stock += size.stock;
    }
    return stock;
  }

  bool get hasStock {
    return totalStock > 0 && !deleted;
  }

  num get basePrice {
    num lowest = double.infinity;
    for (final size in sizes) {
      if (size.price < lowest) lowest = size.price;
    }
    return lowest;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['category'] = category;
    data['name'] = name;
    data['description'] = description;
    data['images'] = images;
    data['sizes'] = sizes.map((v) => v.toJson()).toList();
    data['deleted'] = deleted;
    return data;
  }

  List<Map<String, dynamic>> exportSizeList() {
    return sizes.map((size) => size.toJson()).toList();
  }

  @override
  String toString() {
    return 'Product{_id: $sId, category: $category, name: $name, description: ${description.substring(0, 15)}, images: $images, sizes: $sizes, deleted $deleted}';
  }
}

class Sizes {
  late String name;
  late num price;
  late int stock;
  late String? sId;

  Sizes(
      {required this.name,
      required this.price,
      required this.stock,
      required this.sId});

  Sizes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    stock = json['stock'];
    sId = json['_id'];
  }

  bool get hasStock => stock > 0;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['stock'] = stock;
    data['_id'] = sId;
    return data;
  }

  @override
  String toString() {
    return 'Sizes{sId: $sId, name: $name, price: $price, stock: $stock}';
  }
}
