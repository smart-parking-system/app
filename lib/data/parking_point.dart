
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import '../screens/parking_point_details_screen.dart';

class ParkingPoint {
  final int id;
  final String name;
  final String amount;
  final String image;
  final String address;
  final String distance;
  final Marker marker;

  int get getId => id;
  String get getName => name;
  String get getImage => image;
  String get getAddress => address;
  String get getDistance => distance;
  Marker get getMarker => marker;

  const ParkingPoint({this.id, this.name, this.amount, this.image, this.address, this.distance, this.marker});

}

class ParkingPointList {

  static List<ParkingPoint> list() {
    var list = <ParkingPoint> [
      ParkingPoint(
        id: 1,
        name: 'Pivdennyy',
        amount: '4',
        image: 'assets/images/parking_point/pivdennyy.jpeg',
        address: 'Shchyretska Street, 36, Lviv, Lviv Region, 79000',
        distance: '5',
        marker: Marker(
          icon: BitmapDescriptor.defaultMarker,
          markerId: MarkerId('pivdenny'),
          position: LatLng(
            49.812035736102374,
            23.975043716797924
          ),
        )
      ),
      ParkingPoint(
        id: 2,
        name: 'Victoria Gardens',
        amount: '4',
        image: 'assets/images/parking_point/vg.jpg',
        address: 'Kulparkivska street, 226a, Lviv, Lviv region, 79000',
        distance: '9',
        marker: Marker(
          markerId: MarkerId('victoria_gardens'),
          position: LatLng(
            49.8076266782694,
            23.978175013690183
          ),
        )
      ),
      ParkingPoint(
        id: 3,
        name: 'Forum Lviv',
        amount: '6',
        image: 'assets/images/parking_point/forum.jpeg',
        address: 'Pid Dubom Street, 7B, Lviv, Lviv Region, 79000',
        distance: '4',
        marker: Marker(
          markerId: MarkerId('forum'),
          position: LatLng(
            49.850068007987026,
            24.022347278091928
          ),
        )
      ),
      ParkingPoint(
        id: 4,
        name: 'King Cross',
        amount: '4',
        image: 'assets/images/parking_point/king_cross.jpeg',
        address: 'Stryjska Street, 30 King Cross Leopolis shopping mall, Sokilnyky, Lviv region, 81130',
        distance: '5',
        marker: Marker(
          markerId: MarkerId('king_cross'),
          position: LatLng(
            49.77364673963718,
            24.00997120903318
          ),
        )
      ),
      ParkingPoint(
        id: 5,
        name: 'Spartak',
        amount: '3',
        image: 'assets/images/parking_point/spartak.jpeg',
        address: 'Hetman Mazepa Street, 1B, Lviv, Lviv Region, 79068',
        distance: '3',
        marker: Marker(
          markerId: MarkerId('spartak'),
          position: LatLng(
            49.87010143916262,
            24.022708176238133
          ),
        )
      ),
    ];
    return list;
  }
}