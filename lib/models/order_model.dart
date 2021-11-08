import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:service_creed/models/customer_model.dart';
import 'package:service_creed/models/payment_details_model.dart';
import 'package:service_creed/models/service_provider_model.dart';

class Order {
  final ServiceProvider provider;
  final Customer customer;
  final PaymentDetails paymentDetails;

  const Order({
    @required this.provider,
    @required this.customer,
    @required this.paymentDetails,
  });

  Order.fromJson(Map<String, dynamic> json)
      : provider = ServiceProvider.fromJson(jsonDecode(json['provider'])),
        customer = Customer.fromjson(jsonDecode(json['customer'])),
        paymentDetails =
            PaymentDetails.fromJson(jsonDecode(json['paymentDetails']));
}
