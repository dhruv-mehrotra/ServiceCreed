import 'package:dio/dio.dart';
import 'package:location/location.dart';
import 'package:service_creed/constants/secrets.dart';
import 'package:service_creed/viewmodels/base_viewmodel.dart';

class NearbySearchViewModel extends BaseViewModel {
  var dio = Dio();

  Location location = new Location();
  

  Future<void> locationService() async {
    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    PermissionStatus _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    LocationData _locationData = await location.getLocation();

    double userLatitude = _locationData.latitude;
    double userLongitude = _locationData.longitude;

    Future<List<String>> searchNearby(String keyword) async {
      var parameters = {
        'key': GOOGLE_PLACES_API_KEY,
        'location': '$userLatitude,$userLongitude',
        'radius': '5000',
        'keyword': keyword
      };

      var response =
          await dio.get(GOOGLE_PLACES_API_URL, queryParameters: parameters);
      return response.data['results']
          .map<String>((result) => result['name'].toString())
          .toList();
    }
  }
}
