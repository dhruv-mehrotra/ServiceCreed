import 'package:flutter/material.dart';

class ServiceCategory {
  final int id;
  final String label;
  final String url;

  const ServiceCategory({
    @required this.id,
    @required this.label,
    @required this.url,
  });

  ServiceCategory.fromJson(Map<String, dynamic> json)
      : label = json['categoryName'] as String,
        url = json['categoryImage'] as String,
        id = json['id'] as int;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'categoryName': label,
        'categoryImage': url,
        'id': id,
      };
}
