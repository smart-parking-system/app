import 'package:flutter/material.dart';

import 'package:sps/utils/dimensions.dart';
import 'package:sps/utils/custom_style.dart';
import 'package:sps/utils/strings.dart';
import 'package:sps/utils/colors.dart';
import 'package:sps/data/parking_histoy.dart';

class ParkingHistoryScreen extends StatefulWidget {
  @override
  _ParkingHistoryScreenState createState() => _ParkingHistoryScreenState();
}

class _ParkingHistoryScreenState extends State<ParkingHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize, top: Dimensions.marginSize),
                  child: GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                      color: CustomColor.primaryColor,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(height: Dimensions.heightSize * 2,),
                Padding(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                      right: Dimensions.marginSize
                  ),
                  child: Text(
                    Strings.parkingHistory,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.extraLargeTextSize * 1.5
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.heightSize * 2,),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: ParkingHistoryList.list().length,
                      itemBuilder: (context, index){
                        ParkingHistory parkingHistory = ParkingHistoryList.list()[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: Dimensions.marginSize,
                              right: Dimensions.marginSize,
                              bottom: Dimensions.heightSize
                          ),
                          child: Container(
                            height: 120.0,
                            decoration: BoxDecoration(
                              color: CustomColor.secondaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(parkingHistory.image),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Container(
                                          height: 25,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: parkingHistory.status ? Color(0xFFFFDD7A) :
                                            Color(0xFF8EFF9D),
                                            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius * 0.5))
                                          ),
                                          child: Center(
                                            child: Text(
                                              parkingHistory.status ? Strings.parking :
                                              Strings.finish
                                            )
                                          )
                                      ),
                                      SizedBox(height: Dimensions.heightSize),
                                      Text(
                                        parkingHistory.name,
                                        style: TextStyle(
                                          fontSize: Dimensions.largeTextSize,
                                          color: Colors.black
                                        ),
                                      ),
                                      SizedBox(height: Dimensions.heightSize * 0.5),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Strings.parkingId,
                                                style: CustomStyle.textStyle,
                                              ),
                                              SizedBox(height: Dimensions.heightSize * 0.3),
                                              Text(
                                                parkingHistory.parkingId,
                                                style: TextStyle(
                                                  fontSize: Dimensions.defaultTextSize,
                                                  color: Colors.black
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: Dimensions.widthSize * 2,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                parkingHistory.date,
                                                style: CustomStyle.textStyle,
                                              ),
                                              SizedBox(height: Dimensions.heightSize * 0.3),
                                              Text(
                                                parkingHistory.time,
                                                style: TextStyle(
                                                  fontSize: Dimensions.defaultTextSize,
                                                  color: Colors.black
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
