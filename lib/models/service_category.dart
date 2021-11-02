import 'package:flutter/cupertino.dart';

class ServiceCategory {
  final String label;
  final String url;

  const ServiceCategory({
    @required this.label,
    @required this.url,
  });

  ServiceCategory.fromJson(Map<String, dynamic> json)
      : label = json['label'] as String,
        url = json['url'] as String;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'label': label,
        'url': url,
      };
}
