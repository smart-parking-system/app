import 'package:flutter/material.dart';
import 'package:sps/utils/dimensions.dart';
import 'package:sps/utils/custom_style.dart';
import 'package:sps/utils/strings.dart';
import 'package:sps/utils/colors.dart';
import 'package:sps/screens/payment_screen.dart';

class ParkingCodeScreen extends StatefulWidget {
  @override
  _ParkingCodeScreenState createState() => _ParkingCodeScreenState();
}

class _ParkingCodeScreenState extends State<ParkingCodeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: bodyWidget(context),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: Dimensions.marginSize, right: Dimensions.marginSize, top:
          Dimensions.heightSize * 2),
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
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: Dimensions.heightSize * 3,
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize
                ),
                child: Text(
                  Strings.parkingCode,
                  style: TextStyle(
                    fontSize: Dimensions.extraLargeTextSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: Dimensions.heightSize),
              Image.asset(
                'assets/images/qrcode.png',
                height: 200.0,
              ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.heightSize * 2,),
        invoiceDetailsWidget(context),
        SizedBox(height: Dimensions.heightSize * 3),
        Padding(
          padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
          child: GestureDetector(
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: CustomColor.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius * 0.5))
              ),
              child: Center(
                child: Text(
                  Strings.finishParking.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
            },
          ),
        ),
      ],
    );
  }

  invoiceDetailsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.name,
                      style: CustomStyle.textStyle,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      Strings.demoName,
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        color: CustomColor.primaryColor
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      Strings.phone,
                      style: CustomStyle.textStyle,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      Strings.demoPhone,
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        color: CustomColor.primaryColor
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.parkingId,
                      style: CustomStyle.textStyle,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      Strings.demoParkingId,
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        color: CustomColor.primaryColor
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      Strings.slot,
                      style: CustomStyle.textStyle,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      '2nd floor - p10',
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        color: CustomColor.primaryColor
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.vehicleModelNo,
                      style: CustomStyle.textStyle,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      Strings.demoModelNo,
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        color: CustomColor.primaryColor
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      Strings.vehiclePlateNo,
                      style: CustomStyle.textStyle,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      Strings.demoPlateNo,
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        color: CustomColor.primaryColor
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.entry,
                      style: CustomStyle.textStyle,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      'Today, 12.00 PM',
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        color: CustomColor.primaryColor
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      Strings.exit,
                      style: CustomStyle.textStyle,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      'Today 3.00 PM',
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        color: CustomColor.primaryColor
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.parkingAddress,
                style: CustomStyle.textStyle,
              ),
              SizedBox(height: Dimensions.heightSize * 0.5,),
              Text(
                Strings.demoParkingAddress,
                style: TextStyle(
                  fontSize: Dimensions.defaultTextSize,
                  color: CustomColor.primaryColor
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
