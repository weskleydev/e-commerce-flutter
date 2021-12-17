import 'package:ecommerce_model/app/modules/authentication/user_model.dart';

class Address {
  String? sId;
  User? user;
  String? city;
  String? complement;
  String? district;
  double? lat;
  double? long;
  int? number;
  String? state;
  String? street;
  String? zipCode;

  Address(
      {this.sId,
      this.user,
      this.city,
      this.complement,
      this.district,
      this.lat,
      this.long,
      this.number,
      this.state,
      this.street,
      this.zipCode});

  Address.fromJson(Map<String, dynamic> json) {
    district = json['district'] as String;
    sId = json['_id'] as String;
    user = User.fromJson(json['user']);
    city = json['city'] as String;
    complement = json['complement'] as String;
    lat = json['lat'] as double;
    long = json['long'] as double;
    number = json['number'] as int;
    state = json['state'] as String;
    street = json['street'] as String;
    zipCode = json['zipCode'] as String;
  }

  // Address.fromJson(Map<String, dynamic> json) {
  //   sId = json['_id'];
  //   user = User.fromJson(json['user']);
  //   city = json['city'];
  //   complement = json['complement'];
  //   district = json['district'];
  //   lat = json['lat'];
  //   long = json['long'];
  //   number = json['number'];
  //   state = json['state'];
  //   street = json['street'];
  //   zipCode = json['zipCode'];
  // }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['city'] = city;
    data['complement'] = complement;
    data['district'] = district;
    data['lat'] = lat;
    data['long'] = long;
    data['number'] = number;
    data['state'] = state;
    data['street'] = street;
    data['zipCode'] = zipCode;
    return data;
  }

  @override
  String toString() {
    return 'Address{_id: $sId,user: $user, street: $street,  number: $number, complement: $complement, district: $district, zipCode: $zipCode, state: $state, city: $city, lat: $lat, long: $long';
  }
}
