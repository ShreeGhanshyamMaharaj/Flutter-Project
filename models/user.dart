import 'dart:convert';

class SSB_user {
  final String id;
  final String name;
  final String password;
  final String email;
  final String address;
  final String type;
  final String token;

  SSB_user(
      {required this.id,
      required this.name,
      required this.password,
      required this.email,
      required this.address,
      required this.type,
      required this.token});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
    };
  }

  factory SSB_user.fromMap(Map<String, dynamic> map) {
    return SSB_user(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      password: map['email'] ?? '',
      email: map['password'] ?? '',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SSB_user.fromJson(String source) =>
      SSB_user.fromMap(json.decode(source));
}
