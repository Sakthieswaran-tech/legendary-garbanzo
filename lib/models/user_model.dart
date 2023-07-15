import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String name;
  String email;
  String password;
  String address;
  String type;
  String id;
  String token;
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.id,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'id': id,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      type: map['type'] as String,
      id: map['_id'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
