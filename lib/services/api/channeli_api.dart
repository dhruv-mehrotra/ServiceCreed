import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:service_creed/models/my_user_model.dart';
import 'package:http/http.dart' as http;

class AccessPair {
  AccessPair({this.refresh, this.access});

  final String refresh;
  final String access;
}

// TODO (Saumya): Use baseUrl = https://channeli.in for all channeli links

//use this when new user has to be registered
Future<AccessPair> obtainNewPair(String username, String password) async {
  var response = await http.post(
      Uri.parse('https://channeli.in/token_auth/obtain_pair/'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(
          <String, String>{"username": username, "password": password}));
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    return AccessPair(refresh: data["refresh"], access: data["access"]);
  } else {
    throw Exception('Failed');
  }
}

//for refreshing access token of existing user
Future<AccessPair> obtainPair(String refresh) async {
  var response =
      await http.post(Uri.parse('https://channeli.in/token_auth/refresh/'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(<String, String>{"refresh": refresh}));
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    return AccessPair(refresh: refresh, access: data["access"]);
  } else {
    throw Exception('Failed');
  }
}

//obtaining userInfo from channeli
Future<MyUser> obtainUserInfo(String access) async {
  var response = await http.get(
      Uri.parse('https://channeli.in/kernel/who_am_i/'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $access'});
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
  } else {
    throw Exception('Failed');
  }
}
