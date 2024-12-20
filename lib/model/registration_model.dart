// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

// Registration Model
class RegistrationModel {
  final String username;
  final String password;
  final String confirmPassword;
  final String name;
  final String email;
  final String phoneNumber;

  RegistrationModel({
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        username: json["username"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "confirm_password": confirmPassword,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
      };
}