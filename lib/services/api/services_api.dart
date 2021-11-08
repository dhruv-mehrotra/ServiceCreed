import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:service_creed/constants/secrets.dart';
import 'package:service_creed/locator.dart';
import 'package:service_creed/models/service_category.dart';
import 'package:service_creed/models/service_model.dart';
import 'package:service_creed/models/service_provider_model.dart';
import 'package:service_creed/services/local_storage_service.dart';

class ServicesApi {
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();

  Future<List<ServiceCategory>> getServiceCategories() async {
    String token = _localStorageService.token;
    var response = await http.get(
      Uri.parse('$BASE_URI/category/'),
      headers: {
        'Authorization': 'Bearer' + token,
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List<dynamic>)
          .map((category) => ServiceCategory.fromJson(category))
          .toList();
    } else
      throw Exception('Unexpected Error Occured');
  }

  Future<List<Service>> getService(int categoryId) async {
    String token = _localStorageService.token;
    var response = await http.get(
      Uri.parse('$BASE_URI/service/'),
      headers: {
        'Authorization': 'Bearer' + token,
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List<dynamic>)
          .map((service) => Service.fromJson(service))
          .toList()
          .where((service) => service.category.id == categoryId)
          .toList();
    } else
      throw Exception('Unexpected Error Occured');
  }

  Future<List<ServiceProvider>> getServiceProvider(int serviceId) async {
    String token = _localStorageService.token;
    var response = await http.get(
      Uri.parse('$BASE_URI/serviceprovider/'),
      headers: {
        'Authorization': 'Bearer' + token,
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List<dynamic>)
          .map((dynamic serviceprovider) =>
              ServiceProvider.fromJson(serviceprovider))
          .toList()
          .where((serviceprovider) =>
              serviceprovider.service.serviceId == serviceId)
          .toList();
    } else
      throw Exception('Unexpected Error occured');
  }
}
