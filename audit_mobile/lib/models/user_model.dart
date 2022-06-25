import 'dart:convert';

class UserModel {
  late String email;
  late String username;
  late String name;
  late String roles;
  late String password;
  late DateTime createdAt;
  late DateTime updatedAt;

  UserModel({
    required this.email,
    required this.username,
    required this.name,
    required this.roles,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    username = json['username'];
    email = json['email'];
    roles = json['json'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'name': name,
      'password': password,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}