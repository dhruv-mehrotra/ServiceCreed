import 'package:service_creed/models/app_user_model.dart';
import 'package:service_creed/models/order_model.dart';
import 'package:service_creed/models/service_model.dart';

class ServiceProvider extends AppUser {
  final Service service;
  final String cost;
  final List<Order> ordersRecieved;

  ServiceProvider({
    int id,
    String username,
    String fullName,
    String email,
    String password,
    String address,
    String mobileNumber,
    String profilePicture,
    List<Order> ordersReceived,
    Service service,
    String cost,
  })  : cost = cost,
        service = service,
        ordersRecieved = ordersReceived,
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

  ServiceProvider copyWith({
    int id,
    String username,
    String fullName,
    String email,
    String password,
    String address,
    String mobileNumber,
    String profilePicture,
    Service service,
    String cost,
    List<Order> ordersReceived,
  }) =>
      ServiceProvider(
        username: username ?? this.username,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        password: password ?? this.password,
        address: address ?? this.address,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        profilePicture: profilePicture ?? this.profilePicture,
        service: service ?? this.service,
        cost: cost ?? this.cost,
        ordersReceived: ordersRecieved ?? this.ordersRecieved,
      );

  ServiceProvider.fromJson(Map<String, dynamic> json)
      : service = Service.fromJson(json['services']),
        cost = json['cost'],
        ordersRecieved = [],
        super(
          id: json["id"],
          username: json["username"],
          fullName: json["fullName"],
          email: json["email"],
          password: json["password"],
          address: json["address"],
          mobileNumber: json["mobileNumber"],
          profilePicture: json["profilePicture"],
        );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'service': service,
      'cost': cost,
      'id': id,
      'username': username,
      'fullname': fullName,
      'email': email,
      'password': password,
      'address': address,
      'mobile_number': mobileNumber,
      'profile_picture': profilePicture,
    };
  }
}
