import 'dart:convert';

import 'package:service_creed/models/app_user_model.dart';
import 'package:service_creed/models/order_model.dart';

class Customer extends AppUser {
  final List<Order> _ordersPlaced;

  Customer({
    int id,
    String username,
    String fullName,
    String email,
    String password,
    String address,
    String mobileNumber,
    String profilePicture,
    List<Order> orderPlaced,
  })  : _ordersPlaced = orderPlaced,
        super(
          id: id,
          username: username,
          fullName: fullName,
          email: email,
          password: password,
          address: address,
          mobileNumber: mobileNumber,
          profilePicture: profilePicture,
        );

  Customer copyWith({
    int id,
    String username,
    String fullName,
    String email,
    String password,
    String address,
    String mobileNumber,
    String profilePicture,
    List<Order> orderPlaced,
  }) =>
      Customer(
        username: username ?? this.username,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        password: password ?? this.password,
        address: address ?? this.address,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        profilePicture: profilePicture ?? this.profilePicture,
        orderPlaced: orderPlaced ?? this._ordersPlaced,
      );

  Customer.fromjson(Map<String, dynamic> json)
      : _ordersPlaced = (jsonDecode(json['orders_placed']) as List<dynamic>)
            .map((dynamic order) => Order.fromJson(jsonDecode(order)))
            .toList(),
        super(
          id: json["id"],
          username: json["username"],
          fullName: json["fullName"],
          email: json["email"],
          password: json["password"],
          address: json["address"],
          mobileNumber: json["mobile_number"],
          profilePicture: json["profilePicture"],
        );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'username': username,
        'fullname': fullName,
        'email': email,
        'password': password,
        'address': address,
        'mobile_number': mobileNumber,
        'profile_picture': profilePicture,
        'orders_placed': _ordersPlaced,
      };
}
