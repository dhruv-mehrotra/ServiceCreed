import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:service_creed/models/geopoint.dart';
import 'package:service_creed/models/nearby.dart';

class NearcyLocationApi {
  static NearcyLocationApi _instance;

  NearcyLocationApi._();

  static NearcyLocationApi get instance {
    if (_instance == null) {
      _instance = NearcyLocationApi._();
    }
    return _instance;
  }

  Future<List<Nearby>> getNearby(
      {GeoPoint userLocation,
      double radius,
      String type,
      String keyword}) async {
    print("GetNearby Called");
    var url = Uri.parse('https://api.npoint.io/8495bf05366b98dbc1e8');
    http.Response response = await http.get(url);
    final values = jsonDecode(response.body);
    final List result = values['results'];
    print(result);
    return result.map((e) => Nearby.fromJson(e)).toList();
  }
}
