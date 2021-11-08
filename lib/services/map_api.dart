import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:service_creed/constants/secrets.dart';

class GoogleMapApi {
  static GoogleMapApi _instance;

  GoogleMapApi._();

  static GoogleMapApi get instance {
    if (_instance == null) {
      _instance = GoogleMapApi._();
    }
    return _instance;
  }

  Future<String> getRouteCoordinates(LatLng l1, LatLng l2) async {
    Uri url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=$GOOGLE_PLACES_API_KEY"
            as Uri;
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    return values['routes'][0]['overview_polyline']['points'];
  }
}
