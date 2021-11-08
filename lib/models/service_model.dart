import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:service_creed/models/service_category.dart';

class Service {
  final int serviceId;
  final String serviceName;
  final ServiceCategory category;
  final String description;
  final String serviceImage;

  const Service({
    @required this.serviceId,
    @required this.serviceName,
    @required this.category,
    @required this.description,
    @required this.serviceImage,
  });

  Service.fromJson(Map<String, dynamic> json)
      : serviceId = json['id'] as int,
        serviceName = json['serviceName'] as String,
        category = ServiceCategory.fromJson(json['category']),
        description = json['description'] as String,
        serviceImage = json['serviceImage'] as String;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': serviceId,
      'serviceName': serviceName,
      'category': category,
      'description': description,
      'serviceImage': serviceImage,
    };
  }
}
