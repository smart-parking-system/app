import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sps/data/parking_lot.dart';
import 'package:sps/utils/colors.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(new Duration(seconds: 1), (timer) {
      ParkingLots.fetch();
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CustomColor.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Ubuntu'
      ),
      home: DashboardScreen()
    );
  }
}

