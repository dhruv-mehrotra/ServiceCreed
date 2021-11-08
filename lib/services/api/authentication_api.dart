import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthenticationApi {
  static String BASE_URI = 'http://10.70.5.26:8000/servicecreed';

  Future<String> login(String username, String password) async {
    var response = await http.post(
      Uri.parse('$BASE_URI/login'),
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['access'];
    } else if (response.statusCode == 401) {
      throw Exception('Wrong password');
    } else if (response.statusCode == 404) {
      throw Exception('User not found');
    } else
      throw Exception('Unexpected error occured');
  }
}
