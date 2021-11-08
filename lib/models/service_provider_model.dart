import 'dart:convert';

import 'package:service_creed/models/service_model.dart';
import 'package:flutter/material.dart';

class ServiceProvider {
  final Service service;
  final double cost;
  final String name;

  const ServiceProvider({
    @required this.service,
    @required this.cost,
    @required this.name,
  });

  ServiceProvider.fromJson(Map<String, dynamic> json)
      : service = Service.fromJson(jsonDecode(json['service'])),
        cost = json['cost'],
        name = json['name'];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'service': service,
      'cost': cost,
      'name': name,
    };
  }
}
