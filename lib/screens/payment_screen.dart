import 'package:flutter/material.dart';

import 'package:sps/utils/dimensions.dart';
import 'package:sps/utils/custom_style.dart';
import 'package:sps/utils/strings.dart';
import 'package:sps/utils/colors.dart';
import 'package:sps/screens/submit_review_screen.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

enum SingingCharacter { cash, card, mobileBanking}

class _PaymentScreenState extends State<PaymentScreen> {

  SingingCharacter _character = SingingCharacter.cash;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
              top: Dimensions.heightSize * 2
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: Dimensions.marginSize,
                      right: Dimensions.marginSize,
                    ),
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
                  SizedBox(height: Dimensions.heightSize * 2,),
                  invoiceWidget(context),
                  SizedBox(height: Dimensions.heightSize * 2,),
                  cardWidget(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  invoiceWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${Strings.parkingId}:',
                    style: CustomStyle.textStyle,
                  ),
                  SizedBox(height: Dimensions.heightSize * 0.5,),
                  Text(
                    '${Strings.demoParkingId}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.defaultTextSize
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.copy
              )
            ],
          ),
          SizedBox(height: Dimensions.heightSize),
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              color: CustomColor.secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
            ),
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.marginSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '2hours Parking',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.defaultTextSize
                        ),
                      ),
                      Text(
                        '\$112',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.defaultTextSize
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tax',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.defaultTextSize
                        ),
                      ),
                      Text(
                        '\$03',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.defaultTextSize
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Service Fee',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.defaultTextSize
                        ),
                      ),
                      Text(
                        '\$45',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.defaultTextSize
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.black.withOpacity(0.5),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.defaultTextSize
                        ),
                      ),
                      Text(
                        '\$160',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.defaultTextSize
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  cardWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.marginSize * 2),
          topRight: Radius.circular(Dimensions.marginSize * 2)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: Dimensions.heightSize * 3,
          left: Dimensions.marginSize,
          right: Dimensions.marginSize
        ),
        child: Column(
          children: [
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.1)),
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
              ),
              child: ListTile(
                title: Text(
                  Strings.cash.toUpperCase(),
                  style: CustomStyle.textStyle,
                ),
                leading: Radio(
                  value: SingingCharacter.cash,
                  toggleable : true,
                  autofocus : true,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                      print('value: '+_character.toString());
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: Dimensions.heightSize,),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
              ),
              child: ListTile(
                title: Row(
                  children: [
                    Image.asset(
                      'assets/images/visa.png',
                      height: 30.0,
                    ),
                    SizedBox(width: Dimensions.widthSize,),
                    Image.asset(
                      'assets/images/credit_card.png',
                      height: 30.0,
                    ),
                  ],
                ),
                leading: Radio(
                  value: SingingCharacter.card,
                  toggleable : true,
                  autofocus : true,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                      print('value: '+_character.toString());
                    });
                  },
                ),
              ),
            ),
            _character.toString() == 'SingingCharacter.card'? Column(
              children: [
                SizedBox(height: Dimensions.heightSize,),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Image.asset(
                            'assets/images/visa.png',
                            height: 100.0,
                            width: 150.0,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(width: Dimensions.widthSize,),
                          Image.asset(
                            'assets/images/credit_card.png',
                            height: 100.0,
                            width: 150.0,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(width: Dimensions.widthSize,),
                          GestureDetector(
                            child: Container(
                              height: 100.0,
                              width: 150.0,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                              ),
                              child: Center(
                                child: Text(
                                  '${Strings.addNewCard.toUpperCase()} + ',
                                  style: CustomStyle.textStyle,
                                ),
                              ),
                            ),
                            onTap: () {
                              /*Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                  AddNewCardScreen()));*/
                            },
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ) : Container(),
            SizedBox(height: Dimensions.heightSize,),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.1)),
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
              ),
              child: ListTile(
                title: Text(
                  Strings.mobileBanking.toUpperCase(),
                  style: CustomStyle.textStyle,
                ),
                leading: Radio(
                  value: SingingCharacter.mobileBanking,
                  toggleable : true,
                  autofocus : true,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                      print('value: '+_character.toString());
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: Dimensions.heightSize * 2,),
            GestureDetector(
              child: Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: CustomColor.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius * 0.5))
                ),
                child: Center(
                  child: Text(
                    Strings.payNow.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.largeTextSize,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              onTap: () {
                _showPaymentSuccessDialog();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _showPaymentSuccessDialog() async {
    return (await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => new AlertDialog(
        content: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/thanks.png'
              ),
              Text(
                Strings.nowCheckYourEmail,
                style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: CustomColor.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                child: Container(
                  height: 60.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F6),
                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                  ),
                  child: Center(
                    child: Text(
                      Strings.giveYourReview.toUpperCase(),
                      style: TextStyle(
                        fontSize: Dimensions.extraLargeTextSize,
                        color: CustomColor.primaryColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
                      SubmitReviewScreen()));
                },
              )
            ],
          ),
        ),

      ),
    )) ?? false;
  }

}
