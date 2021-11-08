import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:service_creed/constants/secrets.dart';
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
    Uri url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${userLocation.latitude},${userLocation.longitude}&radius=$radius&type=$type&keyword=$keyword&key=$GOOGLE_PLACES_API_KEY'
            as Uri;
    http.Response response = await http.get(url);
    final values = jsonDecode(response.body);
    final List result = values['results'];
    print(result);
    return result.map((e) => Nearby.fromJson(e)).toList();
  }
}
