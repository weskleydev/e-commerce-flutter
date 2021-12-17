class Category {
  late String image;
  late String name;
  late bool deleted;
  late String sId;

  Category(
      {required this.image,
      required this.name,
      required this.deleted,
      required this.sId});

  Category.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    deleted = json['deleted'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['deleted'] = deleted;
    data['_id'] = sId;
    return data;
  }
}
