import 'package:flutter/material.dart';
import 'package:sps/utils/dimensions.dart';
import 'package:sps/utils/custom_style.dart';
import 'package:sps/utils/strings.dart';
import 'package:sps/utils/colors.dart';
import 'package:sps/screens/dashboard_screen.dart';
import 'package:sps/widgets/my_rating.dart';

class SubmitReviewScreen extends StatefulWidget {
  @override
  _SubmitReviewScreenState createState() => _SubmitReviewScreenState();
}

class _SubmitReviewScreenState extends State<SubmitReviewScreen> {

  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        SizedBox(height: Dimensions.heightSize * 3),
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
          padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.giveReview,
                style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
              SizedBox(height: Dimensions.heightSize,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.support,
                          style: TextStyle(
                            fontSize: Dimensions.largeTextSize,
                            color: Colors.black
                          ),
                        ),
                        SizedBox(height: Dimensions.heightSize * 0.5,),
                        MyRating(rating: '5',)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.security,
                          style: TextStyle(
                            fontSize: Dimensions.largeTextSize,
                            color: Colors.black
                          ),
                        ),
                        SizedBox(height: Dimensions.heightSize * 0.5,),
                        MyRating(rating: '5',)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.heightSize * 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.communication,
                          style: TextStyle(
                            fontSize: Dimensions.largeTextSize,
                            color: Colors.black
                          ),
                        ),
                        SizedBox(height: Dimensions.heightSize * 0.5,),
                        MyRating(rating: '5',)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.parkingSystem,
                          style: TextStyle(
                            fontSize: Dimensions.largeTextSize,
                            color: Colors.black
                          ),
                        ),
                        SizedBox(height: Dimensions.heightSize * 0.5,),
                        MyRating(rating: '5',)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.heightSize * 3,),
              Text(
                Strings.yourComment,
                style: TextStyle(
                    fontSize: Dimensions.extraLargeTextSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              SizedBox(height: Dimensions.heightSize),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: commentController,
                keyboardType: TextInputType.name,
                validator: (String value){
                  if (value.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.contraryToPopular,
                  contentPadding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: CustomStyle.hintTextStyle,
                  focusedBorder: CustomStyle.focusBorder,
                  enabledBorder: CustomStyle.focusErrorBorder,
                  focusedErrorBorder: CustomStyle.focusErrorBorder,
                  errorBorder: CustomStyle.focusErrorBorder,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.heightSize * 3,),
        Padding(
          padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
          child: Column(
            children: [
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
                      Strings.submitReview.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.largeTextSize,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => DashboardScreen())
                  );
                },
              ),
              SizedBox(height: Dimensions.heightSize,),
            ],
          ),
        ),
      ],
    );
  }
}
