
import 'package:flutter/cupertino.dart';
import 'package:sps/utils/requests.dart';

import 'slot.dart';

class ParkingLot {
  final int id;
  final int parkingId;
  final int status;
  final int internalId;

  ParkingLot({
    @required this.id,
    @required this.parkingId,
    @required this.status,
    @required this.internalId
  });

  factory ParkingLot.fromJson(Map<String, dynamic> json) {
    return ParkingLot(
      id: json['id'] as int,
      parkingId: json['parkingId'] as int,
      status: json['status'] as int,
      internalId: json['internalId'] as int,
    );
  }
}

class ParkingLots {
  static List<ParkingLot> _list = <ParkingLot> [];

  static List<ParkingLot> list() {
    return _list;
  }
  
  static void fetch() {
    HttpRequests.getParkingLots().then((value) => {
      value.sort((a, b) => a.id - b.id),
      for (var i = 0; i < value.length; i++) {
        SlotList.list()[i].isAvailable = (value[i].status == 1)
      }
    });
  }
}

