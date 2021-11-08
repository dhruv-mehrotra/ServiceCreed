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
      : serviceId = json['service_id'] as int,
        serviceName = json['service_name'] as String,
        category = ServiceCategory.fromJson(jsonDecode(json['category'])),
        description = json['description'] as String,
        serviceImage = json['service_image'] as String;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'service_id': serviceId,
      'service_name': serviceName,
      'category': category,
      'description': description,
      'service_image': serviceImage,
    };
  }
}
