import 'package:flutter/material.dart';
import 'package:sps/utils/dimensions.dart';
import 'package:sps/utils/strings.dart';
import 'package:sps/utils/colors.dart';
import 'package:sps/widgets/custom_google_map.dart';
import 'package:sps/screens/parking_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ParkingDirectionScreen extends StatefulWidget {
  @override
  _ParkingDirectionScreenState createState() => _ParkingDirectionScreenState();
}

class _ParkingDirectionScreenState extends State<ParkingDirectionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: CustomGoogleMap.map,
                ),
                DraggableScrollableSheet(
                  builder: (context, scrollController){
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions
                              .radius * 3),
                              topRight: Radius.circular(Dimensions.radius * 5))
                      ),
                      child: SingleChildScrollView(
                        child: bodyWidget(context),
                        controller: scrollController,
                      ),
                    );
                  },
                  initialChildSize: 0.35,
                  minChildSize: 0.35,
                  maxChildSize: 1,
                ),
              ],
            ),
          )
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize,
          top: Dimensions.heightSize * 2),
      child: Column(
        children: [
          Text(
            DateFormat('kk:mm').format(DateTime.now()).toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: Dimensions.largeTextSize * 2,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: Dimensions.heightSize * 0.5,),
          Text(
            '6 min 3.2km',
            style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.extraLargeTextSize,
            ),
          ),
          SizedBox(height: Dimensions.heightSize * 2,),
          GestureDetector(
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
              ),
              child: Center(
                child: Text(
                  '${Strings.cancelBooking.toUpperCase()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(height: Dimensions.heightSize),
          GestureDetector(
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: CustomColor.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
              ),
              child: Center(
                child: Text(
                  '${Strings.getParkingCode.toUpperCase()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ParkingCodeScreen()));
            },
          ),
        ],
      ),
    );
  }
}
