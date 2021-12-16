
import 'dart:convert';

import 'package:http/http.dart';
import 'package:sps/data/parking_lot.dart';


class HttpRequests {
  static final String serverURL = "http://68.183.240.247";

  static Future<List<ParkingLot>> getParkingLots() async {
    Response res = await get(serverURL + '/lot');

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<ParkingLot> posts = body.map((dynamic item) => ParkingLot.fromJson(item),).toList();
      print(posts);
      return posts;
    } else {
      throw "Unable to retrieve lots.";
    }
  }
}
