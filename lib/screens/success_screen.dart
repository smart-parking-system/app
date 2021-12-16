import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sps/utils/colors.dart';
import 'package:sps/utils/dimensions.dart';
import 'package:sps/utils/strings.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: CustomColor.secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(75.0))
                  ),
                  child: Icon(
                    FontAwesomeIcons.check,
                    size: 100,
                    color: CustomColor.primaryColor,
                  ),
                ),
                SizedBox(height: Dimensions.heightSize * 3,),
                Text(
                  Strings.success,
                  style: TextStyle(
                    fontSize: Dimensions.extraLargeTextSize * 2
                  ),
                ),
                SizedBox(height: Dimensions.heightSize),
                Text(
                  Strings.nowCheckYourEmail,
                  style: TextStyle(
                    fontSize: Dimensions.largeTextSize
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
