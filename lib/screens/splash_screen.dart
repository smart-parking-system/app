import 'package:flutter/material.dart';
import 'package:sps/utils/colors.dart';
import 'package:sps/screens/onboard/on_board_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        Duration(
          seconds: 3
        ),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnBoardScreen()
        ))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/images/splash_logo.png'
        ),
      ),
    );
  }
}
