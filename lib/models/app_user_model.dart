import 'package:flutter/material.dart';

class AppUser {
  AppUser({
    @required this.id,
    @required this.username,
    @required this.fullName,
    @required this.email,
    @required this.password,
    @required this.address,
    @required this.mobileNumber,
    @required this.profilePicture,
  });

  final int id;
  final String username;
  final String fullName;
  final String email;
  final String password;
  final String address;
  final String mobileNumber;
  final String profilePicture;

  AppUser.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json["username"],
        fullName = json["fullName"],
        email = json["email"],
        password = json["password"],
        address = json["address"],
        mobileNumber = json["mobileNumber"],
        profilePicture = json["profilePicture"];

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "username": username,
        "fullName": fullName,
        "email": email,
        "password": password,
        "address": address,
        "mobileNumber": mobileNumber,
        "profilePicture": profilePicture,
      };
}
