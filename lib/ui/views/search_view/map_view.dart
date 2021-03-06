import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:service_creed/viewmodels/nearby_services/map_model.dart';

class MapView extends StatelessWidget {
  final String service;

  const MapView({Key key, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MapModel(service),
      builder: (context, snapshot) {
        return Scaffold(
          body: Builder(builder: (context) {
            final mapModel = Provider.of<MapModel>(context);
            return Stack(
              children: <Widget>[
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(-33.8587323, 151.2100055), zoom: 10),
                  myLocationEnabled: true,
                  onMapCreated: mapModel.onMapCreate,
                  onCameraMove: mapModel.onCameraMoved,
                  markers: mapModel.markers,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mapModel.nearbyLocations.length,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                        child: SizedBox(
                          width: 200,
                          child: Card(
                            elevation: 2,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4),
                                          topRight: Radius.circular(4)),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              '${mapModel.nearbyLocations[index].icon}'))),
                                )),
                                Expanded(
                                    child: Container(
                                  padding: const EdgeInsets.all(4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${mapModel.nearbyLocations[index].name}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Star(mapModel
                                                  .nearbyLocations[index].rating
                                                  ?.toInt() ??
                                              0),
                                          Text(
                                              ' ${mapModel.nearbyLocations[index].userRatingsTotal}')
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Expanded(
                                        child: Text(
                                            '${mapModel.nearbyLocations[index].vicinity}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey)),
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }
}

class Star extends StatelessWidget {
  final int count;

  const Star(
    this.count, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Row(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: Colors.grey[300],
                        size: 15,
                      ))),
          Row(
              children: List.generate(
                  count,
                  (index) => Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 15,
                      ))),
        ],
      ),
    );
  }
}
