class User {
  late String? sId;
  late String? name;
  late String? email;
  late String? password;
  late List<dynamic>? roles;
  late String? token;

  User(
      {this.sId, this.name, this.email, this.password, this.roles, this.token});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    roles = json['roles'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['roles'] = roles;
    data['token'] = token;
    return data;
  }

  @override
  String toString() {
    return 'User{id: $sId, name: $name, email: $email, roles $roles. token $token}';
  }
}
