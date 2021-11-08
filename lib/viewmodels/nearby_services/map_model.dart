import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:service_creed/models/geopoint.dart';
import 'package:service_creed/models/nearby.dart';
import 'package:service_creed/services/nearby_location_api.dart';

class MapModel extends ChangeNotifier {
  GoogleMapController _mapController;
  List<LatLng> users = [];

  LatLng userPosition = LatLng(-33.8587323, 151.2100055);
  List<Nearby> nearbyLocations = <Nearby>[];

  GoogleMapController get mapController => _mapController;

  final Set<Marker> _markers = {};

  Set<Marker> get markers => _markers;

  MapModel(String service) {
    getUserPosition();
  }

  Future<void> addAllUserMakerToMap() async {
    await _addMarkerToMap(
      markerPosition: GeoPoint(-33.8587323, 151.2100055),
    );
    users.add(LatLng(-33.8587323, 151.2100055));
  }

  Future<void> getUserPosition() async {
    print("getUserPosition called");
    GeoPoint point = GeoPoint(-33.8587323, 151.2100055);
    userPosition = LatLng(-33.8587323, 151.2100055);
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(-33.8587323, 151.2100055);
    Placemark marks = placeMarks[0];
    _addMarkerToMap(
        markerPosition: point,
        placeName: '${marks.locality}, ${marks.administrativeArea}');
    print("getUserPosition concluded");
  }

  Future<void> _addMarkerToMap(
      {GeoPoint markerPosition, String placeName}) async {
    print("_addMarkerToMap called");
    try {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(-33.8587323, 151.2100055);
      Placemark marks = placeMarks[0];
      var points = LatLng(markerPosition.latitude, markerPosition.longitude);
      _markers.add(Marker(
          position: points,
          onTap: () async {
            final List<Nearby> result = await NearcyLocationApi.instance
                .getNearby(
                    userLocation: GeoPoint(-33.8587323, 151.2100055),
                    radius: 10000,
                    type: 'restaurants',
                    keyword: '');
            nearbyLocations = result;

            notifyListeners();
          },
          infoWindow: InfoWindow(
            title: placeName,
            snippet:
                "${marks.name},${marks.locality}, ${marks.administrativeArea}",
          ),
          icon: BitmapDescriptor.defaultMarker,
          markerId: MarkerId(placeName)));
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void onMapCreate(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  void onCameraMoved(CameraPosition position) {
    userPosition = position.target;
    notifyListeners();
  }

//
  void _moveCameraToUserLocation(LatLng newPosition) async {
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: newPosition,
          zoom: 15,
        ),
      ),
    );
  }
}
