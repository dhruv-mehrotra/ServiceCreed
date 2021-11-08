import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:service_creed/models/geopoint.dart';
import 'package:service_creed/models/nearby.dart';
import 'package:service_creed/services/nearby_location_api.dart';

class MapModel extends ChangeNotifier {
  GoogleMapController _mapController;
  List<LatLng> users = [];

  LatLng userPosition = LatLng(40.71427, -74.00597);
  List<Nearby> nearbyLocations = <Nearby>[];

  GoogleMapController get mapController => _mapController;

  final Set<Marker> _markers = {};

  Set<Marker> get markers => _markers;

  MapModel(String service);

  Future<void> addAllUserMakerToMap() async {
    await _addMarkerToMap(
      markerPosition: GeoPoint(40.71427, -74.00597),
    );
    users.add(LatLng(40.71427, -74.00597));
  }

  Future<void> getUserPosition() async {
    GeoPoint point = LatLng(40.71427, -74.00597) as GeoPoint;
    userPosition = LatLng(40.71427, -74.00597);
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(40.71427, -74.00597);
    Placemark marks = placeMarks[0];
    _addMarkerToMap(
      markerPosition: point,
    );
  }

  Future<void> _addMarkerToMap({GeoPoint markerPosition}) async {
    try {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(40.71427, -74.00597);
      Placemark marks = placeMarks[0];
      var points = LatLng(markerPosition.latitude, markerPosition.longitude);
      _markers.add(Marker(
          position: points,
          onTap: () async {
            final List<Nearby> result =
                await NearcyLocationApi.instance.getNearby(
                    userLocation:
                        // markerPosition,
                        GeoPoint(4.8119283, 7.046236272219636),
                    radius: 10000,
                    type: 'restaurants',
                    keyword: '');
            nearbyLocations = result;

            notifyListeners();
          },
          infoWindow: InfoWindow(
            snippet:
                "${marks.name},${marks.locality}, ${marks.administrativeArea}",
          ),
          icon: BitmapDescriptor.defaultMarker));
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
