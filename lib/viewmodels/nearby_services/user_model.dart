import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';

enum HomeState {
  Initial,
  Loading,
  Loaded,
  Error,
}

class UserLocationModel extends ChangeNotifier {
  HomeState _homeState = HomeState.Initial;
  Position position;

  UserLocationModel() {
    this.position = _determinePosition() as Position;
  }

  HomeState get homeState => _homeState;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _homeState = HomeState.Error;
      notifyListeners();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _homeState = HomeState.Error;
        notifyListeners();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _homeState = HomeState.Error;
      notifyListeners();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}