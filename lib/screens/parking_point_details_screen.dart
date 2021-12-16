import 'package:flutter/material.dart';

import 'package:sps/utils/colors.dart';
import 'package:sps/utils/custom_style.dart';
import 'package:sps/utils/dimensions.dart';
import 'package:sps/utils/strings.dart';
import 'package:sps/widgets/custom_google_map.dart';
import 'package:sps/widgets/my_rating.dart';
import 'package:sps/data/review.dart';
import 'package:sps/screens/choose_slot_screen.dart';

class ParkingPointDetailsScreen extends StatefulWidget {
  final String name, amount, image, address, distance;

  ParkingPointDetailsScreen({Key key, this.name, this.amount, this.image, this.address, this.distance}) : super(key: key);

  @override
  _ParkingPointDetailsScreenState createState() => _ParkingPointDetailsScreenState();
}

class _ParkingPointDetailsScreenState extends State<ParkingPointDetailsScreen> {

  PageController _pageController = PageController(viewportFraction: 1, keepPage: true);
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: Dimensions.marginSize, top: Dimensions.marginSize, bottom: Dimensions.marginSize),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          color: CustomColor.primaryColor,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(height: Dimensions.heightSize * 2,),
                      Text(
                        widget.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.extraLargeTextSize * 1.5
                        ),
                      ),
                      SizedBox(height: Dimensions.heightSize * 2,),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.address,
                                  style: CustomStyle.textStyle,
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Row(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.bus_alert,
                                          color: CustomColor.primaryColor,
                                        ),
                                        SizedBox(width: Dimensions.widthSize,),
                                        Text(
                                          '${widget.distance} km',
                                          style: TextStyle(
                                            color: Colors.black
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: Dimensions.widthSize * 3,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.space_bar,
                                          color: CustomColor.primaryColor,
                                        ),
                                        SizedBox(width: Dimensions.widthSize,),
                                        Text(
                                          '18 slots',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Image.asset(widget.image),
                          )
                        ],
                      ),
                      SizedBox(height: Dimensions.heightSize * 2,),
                      serviceWidget(context),
                      SizedBox(height: Dimensions.heightSize * 2,),
                      detailsWidget(context)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: Dimensions.heightSize,
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                child: GestureDetector(
                  child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: CustomColor.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                    ),
                    child: Center(
                      child: Text(
                        '${Strings.bookFor.toUpperCase()} \$${widget.amount}/hr',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.largeTextSize,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChooseSlotScreen()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  serviceWidget(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius)),
            color: CustomColor.secondaryColor
          ),
          child: Image.asset(
            'assets/images/cc.png'
          ),
        ),
        SizedBox(width: Dimensions.widthSize,),
        Container(
          height: 60,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius)),
            color: CustomColor.secondaryColor
          ),
          child: Image.asset(
              'assets/images/guard.png'
          ),
        ),
        SizedBox(width: Dimensions.widthSize,),
        Container(
          height: 60,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius)),
            color: CustomColor.secondaryColor
          ),
          child: Image.asset(
              'assets/images/secure.png'
          ),
        ),
        SizedBox(width: Dimensions.widthSize,),
        Container(
          height: 60,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius)),
            color: CustomColor.secondaryColor
          ),
          child: Image.asset(
            'assets/images/automation.png'
          ),
        ),
        SizedBox(width: Dimensions.widthSize,),
      ],
    );
  }

  detailsWidget(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Dimensions.heightSize * 2,
            right: Dimensions.marginSize,
            left: Dimensions.marginSize
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        Strings.info,
                        style: TextStyle(
                          fontSize: Dimensions.largeTextSize,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        Strings.direction,
                        style: TextStyle(
                          fontSize: Dimensions.largeTextSize,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        Strings.review,
                        style: TextStyle(
                          fontSize: Dimensions.largeTextSize,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.heightSize,),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: Dimensions.marginSize,
            left: Dimensions.marginSize
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: index == 0 ? 5 : 1,
                            color: index == 0 ? CustomColor.primaryColor : Colors.grey,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: index == 1 ? 5 : 1,
                            color: index == 1 ? CustomColor.primaryColor : Colors.grey,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: index == 2 ? 5 : 1,
                            color: index == 2 ? CustomColor.primaryColor : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    goToPageView(index)
                  ],
                );
              }
            ),
          ),
        ),
      ],
    );
  }

  goToPageView(int index) {
    pageNumber = index;
    print(pageNumber.toString());
    switch (index) {
      case 0:
        return infoWidget(context);
      case 1:
        return directionWidget(context);
      case 2:
        return reviewWidget(context);
    }
  }

  infoWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.heightSize),
      child: Text(
        Strings.infoDetails,
        style: CustomStyle.textStyle,
      ),
    );
  }

  directionWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.heightSize),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        child: CustomGoogleMap.map,
      ),
    );
  }

  reviewWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.heightSize),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  Strings.parkingSystem,
                  style: TextStyle(
                    fontSize: Dimensions.largeTextSize,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: MyRating(rating: '5',)
              )
            ],
          ),
          SizedBox(height: Dimensions.heightSize,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  Strings.security,
                  style: TextStyle(
                    fontSize: Dimensions.largeTextSize,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: MyRating(rating: '5',)
              )
            ],
          ),
          SizedBox(height: Dimensions.heightSize,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  Strings.communication,
                  style: TextStyle(
                    fontSize: Dimensions.largeTextSize,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: MyRating(rating: '5',)
              )
            ],
          ),
          SizedBox(height: Dimensions.heightSize,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  Strings.support,
                  style: TextStyle(
                    fontSize: Dimensions.largeTextSize,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: MyRating(rating: '5',)
              )
            ],
          ),
          SizedBox(height: Dimensions.heightSize * 2,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
                child: Text(
                  Strings.today,
                  style: CustomStyle.textStyle,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize * 2,),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: ReviewList.list().length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Review review = ReviewList.list()[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: Dimensions.heightSize),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius * 2))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.radius),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.asset(
                                review.image,
                                height: 80.0,
                              ),
                            ),
                            SizedBox(width: Dimensions.widthSize,),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        review.title,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Dimensions.defaultTextSize,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        '${review.time}',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.heightSize,),
                                  Text(
                                    review.subtitle,
                                    style: CustomStyle.textStyle,
                                  ),
                                  SizedBox(height: Dimensions.heightSize,),
                                  MyRating(rating: review.rating,)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
