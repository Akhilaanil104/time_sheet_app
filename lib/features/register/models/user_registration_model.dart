
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserRegistrationModel {
final String username;
final String password;
final String confirmPassword;
final String name;
final String email;
final String phone_number;

  UserRegistrationModel({required this.username, required this.password, required this.confirmPassword, required this.name, required this.email, required this.phone_number});
  
Map<String,dynamic> toJson() {
  return{
    "username": username,
    "password": password,
    "confirm_password": confirmPassword,
    "name": name,
    "email": email,
    "phone_number": phone_number
  };
}
factory UserRegistrationModel.fromJson(Map<String, dynamic> json) {
  return UserRegistrationModel(
    username: json['username'] as String,
    password: json['password'] as String,
    confirmPassword: json['confirm_password'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    phone_number: json['phone_number'] as String
  
);}
UserRegistrationModel copyWith({
  String? username,
  String? password,
  String? confirmPassword,
  String? name,
  String? email,
  String? phone_number,
}){
  return UserRegistrationModel(
    username: username ?? this.username,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    name: name ?? this.name,
    email: email ?? this.email,
    phone_number: phone_number ?? this.phone_number);
}
}
