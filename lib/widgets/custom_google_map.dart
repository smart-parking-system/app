
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sps/utils/dimensions.dart';

import '../data/parking_point.dart';
import '../screens/parking_point_details_screen.dart';


class CustomGoogleMap {
  static GoogleMap map;

  static void init(BuildContext context) {
    List<Marker> _markers = ParkingPointList.list().map((element) =>
        Marker(
            icon: element.marker.icon,
            markerId: element.marker.markerId,
            position: element.marker.position,
            infoWindow: element.marker.infoWindow,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                ParkingPointDetailsScreen(
                  name: element.name,
                  amount: element.amount,
                  image: element.image,
                  address: element.address,
                  distance: element.distance,
                ))
              );
            }
        )
    ).toList();

    map = GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(Dimensions.latitude, Dimensions.longitude),
        zoom: 10.0,
      ),
      mapType: MapType.normal,
      markers: Set<Marker>.of(_markers),
      onMapCreated: (GoogleMapController controller) {},
    );
  }
}