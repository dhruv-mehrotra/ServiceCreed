import 'package:flutter/material.dart';

class PaymentDetails {
  final int amount;
  final DateTime date;
  final String status;
  final String paymentMethod;

  const PaymentDetails({
    @required this.amount,
    @required this.date,
    @required this.status,
    @required this.paymentMethod,
  });

  PaymentDetails.fromJson(Map<String, dynamic> json)
      : amount = json['amount'] as int,
        date = json['date'],
        status = json['status'] as String,
        paymentMethod = json['payment_method'] as String;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'date': date,
        'status': status,
        'payment_method': paymentMethod,
      };
}
