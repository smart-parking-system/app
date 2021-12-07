import 'package:flutter/material.dart';
import 'package:sps/utils/dimensions.dart';
import 'package:sps/utils/strings.dart';
import 'package:sps/utils/colors.dart';
import 'data.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int totalPages = OnBoardingItems.loadOnboardItem().length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: PageView.builder(
        itemCount: totalPages,
          itemBuilder: (context, index){
          OnBoardingItem oi = OnBoardingItems.loadOnboardItem()[index];
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: Dimensions.marginSize * 2.5, right:
                    Dimensions.marginSize * 2.5),
                    child: Text(
                      oi.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.extraLargeTextSize * 1.5,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: Dimensions.marginSize * 2, right:
                    Dimensions.marginSize * 2),
                    child: Text(
                      oi.subTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.extraLargeTextSize
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 60.0,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.center,
                      child: index != (totalPages - 1) ? Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Container(
                          width: 100.0,
                          height: 10.0,
                          child: ListView.builder(
                            itemCount: totalPages,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i){
                              return Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  width: index == i ? 10 : 10.0,
                                  decoration: BoxDecoration(
                                    color: index == i ? CustomColor.yellowColor : Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ) : GestureDetector(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              color: CustomColor.secondaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius * 0.5))
                            ),
                            child: Center(
                              child: Text(
                                Strings.getStarted.toUpperCase(),
                                style: TextStyle(
                                  color: CustomColor.primaryColor,
                                  fontSize: Dimensions.largeTextSize,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.heightSize * 3,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Image.asset(
                      oi.image,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                    ),
                  ),
                ],
              )
            );
          }),
    );
  }
}
