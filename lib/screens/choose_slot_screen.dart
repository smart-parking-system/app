import 'package:flutter/material.dart';
import 'package:sps/utils/colors.dart';
import 'package:sps/utils/custom_style.dart';
import 'package:sps/utils/dimensions.dart';
import 'package:sps/utils/strings.dart';
import 'package:sps/data/slot.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sps/screens/parking_direction_screen.dart';

class ChooseSlotScreen extends StatefulWidget {
  @override
  _ChooseSlotScreenState createState() => _ChooseSlotScreenState();
}

enum SingingCharacter { firstFloor, secondFloor, thirdFloor}

class _ChooseSlotScreenState extends State<ChooseSlotScreen> {

  SingingCharacter _character = SingingCharacter.firstFloor;

  List list = [];
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getSlotList();
  }
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
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: Dimensions.marginSize,
                          right: Dimensions.marginSize,
                          top: Dimensions.marginSize),
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
                        Strings.chooseYourSlot,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.extraLargeTextSize * 1.5
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.heightSize * 2,),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Dimensions.marginSize,
                        right: Dimensions.marginSize
                      ),
                      child: Container(
                        height: 20.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Radio(
                              value: SingingCharacter.firstFloor,
                              toggleable: true,
                              autofocus: true,
                              groupValue: _character,
                              onChanged: (SingingCharacter value) {
                                setState(() {
                                  _character = value;
                                  index = 0;
                                });
                              },
                            ),
                            Text(
                              Strings.firstFloor,
                              style: CustomStyle.textStyle,
                            ),
                            SizedBox(width: Dimensions.widthSize,),
                            Radio(
                              value: SingingCharacter.secondFloor,
                              toggleable: true,
                              autofocus: true,
                              groupValue: _character,
                              onChanged: (SingingCharacter value) {
                                setState(() {
                                  _character = value;
                                  index = 1;
                                });
                              },
                            ),
                            Text(
                              Strings.secondFloor,
                              style: CustomStyle.textStyle,
                            ),
                            SizedBox(width: Dimensions.widthSize,),
                            Radio(
                              value: SingingCharacter.thirdFloor,
                              toggleable: true,
                              autofocus: true,
                              groupValue: _character,
                              onChanged: (SingingCharacter value) {
                                setState(() {
                                  _character = value;
                                  index = 2;
                                });
                              },
                            ),
                            Text(
                              Strings.thirdFloor,
                              style: CustomStyle.textStyle,
                            ),
                            SizedBox(width: Dimensions.widthSize,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.heightSize * 2,),
                    floorWidget(context, index)
                  ],
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
                        '${Strings.proceedWithSlot.toUpperCase()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.largeTextSize,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ParkingDirectionScreen()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getSlotList() {
    int data = SlotList.list().length;
    for(int i = 0; i < data; i++){
      Slot slot = SlotList.list()[i];
      list.add(slot.isAvailable);
      print('list: ' + list.toString());
    }
  }

  // ignore: missing_return
  Widget floorWidget(BuildContext context, int index){
    switch (index) {
      case 0:
        return firstFloor();
      case 1:
        return secondFloor();
      case 2:
        return thirdFloor();
    }
  }

  Widget firstFloor(){
    return Column(
      children: [
        Text(
          Strings.firstFloor,
          style: TextStyle(
            fontSize: Dimensions.extraLargeTextSize,
            color: CustomColor.primaryColor
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GridView.count(
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(SlotList.list().length, (index) {
              Slot slot = SlotList.list()[index];
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: FlatButton(
                  //color: isSelected ? Colors.blue : Colors.red,
                  splashColor: Colors.blue.withOpacity(0.5),
                  child: Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                      color: slot.isAvailable ? list[index] ? Colors.white : CustomColor.primaryColor : CustomColor.accentColor,
                      border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                    ),
                    child: Center(
                      child: Text(
                        '${slot.name}',
                        style: TextStyle(
                          fontSize: Dimensions.extraLargeTextSize,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (!slot.isAvailable) {
                      print('already booked');
                      Fluttertoast.showToast(
                          msg: Strings.slotIsNotAvailable,
                          backgroundColor: Colors.red,
                          textColor: Colors.white
                      );
                    } else {
                      setState(() {
                        list[index] = !list[index];
                      });
                      print('you can book this slot: ' + list.toString());
                    }
                  },
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
  Widget secondFloor(){
    return Column(
      children: [
        Text(
          Strings.secondFloor,
          style: TextStyle(
            fontSize: Dimensions.extraLargeTextSize,
            color: CustomColor.primaryColor
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GridView.count(
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(SlotList
                .list()
                .length, (index) {
              Slot slot = SlotList.list()[index];
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: FlatButton(
                  splashColor: Colors.blue.withOpacity(0.5),
                  child: Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                      color: slot.isAvailable ? list[index] ? Colors.white :
                      CustomColor.primaryColor:
                      CustomColor.accentColor,
                      border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                    ),
                    child: Center(
                      child: Text(
                        '${slot.name}',
                        style: TextStyle(
                          fontSize: Dimensions.extraLargeTextSize,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (!slot.isAvailable) {
                      print('already booked');
                      Fluttertoast.showToast(
                          msg: Strings.slotIsNotAvailable,
                          backgroundColor: Colors.red,
                          textColor: Colors.white
                      );
                    } else {
                      setState(() {
                        list[index] = !list[index];
                      });
                      print('you can book this slot: ' + list.toString());
                    }
                  },
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
  Widget thirdFloor(){
    return Column(
      children: [
        Text(
            Strings.thirdFloor,
          style: TextStyle(
            fontSize: Dimensions.extraLargeTextSize,
            color: CustomColor.primaryColor
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GridView.count(
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(SlotList.list().length, (index) {
              Slot slot = SlotList.list()[index];
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: FlatButton(
                  splashColor: Colors.blue.withOpacity(0.5),
                  child: Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                      color: slot.isAvailable ? list[index] ? Colors.white :
                      CustomColor.primaryColor:
                      CustomColor.accentColor,
                      border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                    ),
                    child: Center(
                      child: Text(
                        '${slot.name}',
                        style: TextStyle(
                          fontSize: Dimensions.extraLargeTextSize,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (!slot.isAvailable) {
                      print('already booked');
                      Fluttertoast.showToast(
                        msg: Strings.slotIsNotAvailable,
                        backgroundColor: Colors.red,
                        textColor: Colors.white);
                    } else {
                      setState(() {
                        list[index] = !list[index];
                      });
                      print('you can book this slot: ' + list.toString());
                    }
                  },
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}