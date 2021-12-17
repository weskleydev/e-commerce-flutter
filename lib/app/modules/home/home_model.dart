class Home {
  late String sId;
  late String image;
  late int pos;
  late int eixoX;
  late int eixoY;

  Home(
      {required this.sId,
      required this.image,
      required this.pos,
      required this.eixoX,
      required this.eixoY});

  Home.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    pos = json['pos'];
    eixoX = json['eixoX'];
    eixoY = json['eixoY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['pos'] = this.pos;
    data['eixoX'] = this.eixoX;
    data['eixoY'] = this.eixoY;
    return data;
  }

  @override
  String toString() {
    return 'Home{sId: $sId, image: $image, pos: $pos, eixoX: $eixoX, eixoY: $eixoY}';
  }
}


// class Home {
//   late String image;
//   late int pos;
//   late int eixoX;
//   late double eixoY;

//   Home(
//       {required this.image,
//       required this.pos,
//       required this.eixoX,
//       required this.eixoY});

//   Home.fromJson(Map<String, dynamic> json) {
//     image = json['image'];
//     pos = json['pos'];
//     eixoX = json['eixoX'];
//     eixoY = json['eixoY'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['image'] = image;
//     data['pos'] = pos;
//     data['eixoX'] = eixoX;
//     data['eixoY'] = eixoY;
//     return data;
//   }

//   @override
//   String toString() {
//     return 'Home{image: $image, pos: $pos, eixoX: $eixoX, eixoY: $eixoY}';
//   }
// }
