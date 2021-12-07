import 'package:flutter/material.dart';
import 'package:sps/utils/dimensions.dart';
import 'package:sps/utils/custom_style.dart';
import 'package:sps/utils/strings.dart';
import 'package:sps/utils/colors.dart';
import 'package:sps/widgets/custom_google_map.dart';
import 'package:sps/data/vehichle.dart';
import 'package:sps/data/parking_point.dart';
import 'package:sps/screens/parking_point_details_screen.dart';
import 'package:sps/screens/dashboard/parking_history_screen.dart';
import 'package:sps/screens/dashboard/my_account_screen.dart';

String selectedVehicle = 'assets/images/vehicle/car.png';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  TextEditingController searchController = TextEditingController();

  TimeOfDay selectedEntranceTime = TimeOfDay.now();
  String entranceTime = '00:00';

  TimeOfDay selectedExitTime = TimeOfDay.now();
  String exitTime = '01:00';

  bool isConfirm = true;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    CustomGoogleMap.init(context);
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: profileWidget(context),
                  decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                  ),
                ),
                ListTile(
                  title: Text(
                    Strings.parkingHistory,
                    style: CustomStyle.listStyle,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ParkingHistoryScreen()));
                  },
                ),
                ListTile(
                  title: Text(
                    Strings.parkingMeterTickets,
                    style: CustomStyle.listStyle,
                  ),
                  onTap: () {
                    // Navigator.of(context).pop();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
                  child: Divider(color: Colors.black.withOpacity(0.4),),
                ),
                ListTile(
                  title: Text(
                    Strings.myAccount,
                    style: CustomStyle.listStyle,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyAccountScreen()));
                  },
                ),
                ListTile(
                  title: Text(
                    Strings.settings,
                    style: CustomStyle.listStyle,
                  ),
                  onTap: () {
                    // Navigator.of(context).pop();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
                  child: Divider(color: Colors.black.withOpacity(0.4),),
                ),
                ListTile(
                  title: Text(
                    Strings.support,
                    style: CustomStyle.textStyle,
                  ),
                  onTap: () {
                    // Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text(
                    Strings.contact,
                    style: CustomStyle.textStyle,
                  ),
                  onTap: () {
                    // Navigator.of(context).pop();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize
                  ),
                  child: Divider(color: Colors.black.withOpacity(0.4),),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize,
                    top: Dimensions.heightSize,
                    bottom: Dimensions.heightSize * 2
                  ),
                  child: Text(
                    Strings.versionString,
                    style: CustomStyle.textStyle,
                  ),
                ),
              ],
            ),
          ),
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
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius * 3),
                      topRight: Radius.circular(Dimensions.radius * 5))
                    ),
                    child: SingleChildScrollView(
                      child: isConfirm ? bodyWidget(context) : parkingPointWidget(context),
                      controller: scrollController,
                    ),
                  );
                },
                initialChildSize: 0.30,
                minChildSize: 0.30,
                maxChildSize: 1,
              ),
              Positioned(
                top: Dimensions.heightSize * 2,
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (scaffoldKey.currentState.isDrawerOpen) {
                          scaffoldKey.currentState.openEndDrawer();
                        } else {
                          scaffoldKey.currentState.openDrawer();
                        }
                      },
                      child: Icon(
                        Icons.menu,
                        color: CustomColor.primaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.search,
                        color: CustomColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  profileWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.heightSize * 3,),
      child: ListTile(
        leading: Image.asset('assets/images/user0.png',),
        title: Text(
          Strings.demoName,
          style: TextStyle(
            color: Colors.white,
            fontSize: Dimensions.largeTextSize,
            fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          Strings.demoEmail,
          style: TextStyle(
            color: Colors.white,
            fontSize: Dimensions.defaultTextSize,
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        top: Dimensions.heightSize * 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.greeting,
            style: CustomStyle.textStyle
          ),
          Text(
            Strings.whereDoYouWantToPark,
            style: TextStyle(
              fontSize: Dimensions.largeTextSize * 1.5,
              color: Colors.black,
            ),
          ),
          SizedBox(height: Dimensions.heightSize,),
          SizedBox(height: Dimensions.heightSize,),
          Divider(color: Colors.black.withOpacity(0.50),),
          SizedBox(height: Dimensions.heightSize,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.entrance.toUpperCase(),
                          style: TextStyle(
                            color: CustomColor.primaryColor,
                            fontSize: Dimensions.largeTextSize
                          ),
                        ),
                        SizedBox(height: Dimensions.heightSize * 0.5,),
                        Text(
                          '${Strings.today.toUpperCase()}, $entranceTime',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.largeTextSize,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    _selectEntranceTime(context);
                  },
                ),
              ),
              Container(
                height: 50.0,
                width: 2,
                color: Colors.grey,
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          Strings.exit.toUpperCase(),
                          style: TextStyle(
                            color: CustomColor.primaryColor,
                            fontSize: Dimensions.largeTextSize
                          ),
                        ),
                        SizedBox(height: Dimensions.heightSize * 0.5,),
                        Text(
                          '${Strings.today.toUpperCase()}, $exitTime',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.largeTextSize,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    _selectExitTime(context);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize,),
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
                  Strings.find.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.largeTextSize
                  ),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                isConfirm = !isConfirm;
                print(isConfirm.toString());
              });
            },
          ),
        ],
      ),
    );
  }

  parkingPointWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Dimensions.heightSize * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back
                      ),
                      onTap: () {
                        setState(() {
                          isConfirm = !isConfirm;
                          print(isConfirm.toString());
                        });
                      },
                    ),
                    Text(
                        Strings.swipeUpForMore,
                        style: CustomStyle.textStyle
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.heightSize,),
                Text(
                  Strings.chooseYourParkingPoint,
                  style: TextStyle(
                    fontSize: Dimensions.largeTextSize * 1.5,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.heightSize,),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: ParkingPointList.list().length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                ParkingPoint parkingPoint = ParkingPointList.list()[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: Dimensions.heightSize),
                    child: GestureDetector(
                      child: Container(
                        height: 100,
                        color: CustomColor.secondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.only(left: Dimensions.marginSize, right:
                          Dimensions.marginSize),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  parkingPoint.image
                                ),
                              ),
                              SizedBox(width: Dimensions.widthSize,),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      parkingPoint.name,
                                      style: TextStyle(
                                        fontSize: Dimensions.largeTextSize,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(height: Dimensions.heightSize * 0.5,),
                                    Text(
                                      parkingPoint.address,
                                      style: CustomStyle.textStyle,
                                    ),
                                    SizedBox(height: Dimensions.heightSize * 0.5,),
                                    Text(
                                      '\$${parkingPoint.amount} / hr',
                                      style: TextStyle(
                                        fontSize: Dimensions.largeTextSize,
                                        color: CustomColor.primaryColor
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            ParkingPointDetailsScreen(name: parkingPoint.name,
                              amount: parkingPoint.amount,
                              image: parkingPoint.image,
                              address: parkingPoint.address,
                              distance: parkingPoint.distance,
                            )));
                      },
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Future<void> _selectEntranceTime(BuildContext context) async {
    final TimeOfDay pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedEntranceTime, builder: (BuildContext context, Widget child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child,
      );
    });

    if (pickedTime != null && pickedTime != selectedEntranceTime )
      setState(() {
        selectedEntranceTime = pickedTime;
        entranceTime = selectedEntranceTime.toString().split('TimeOfDay(')[1].split(')')[0];
        print('2 : '+entranceTime);
      });
  }

  Future<void> _selectExitTime(BuildContext context) async {
    final TimeOfDay pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedExitTime, builder: (BuildContext context, Widget child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child,
      );
    });

    if (pickedTime != null && pickedTime != selectedExitTime )
      setState(() {
        selectedExitTime = pickedTime;
        exitTime = selectedExitTime.toString().split('TimeOfDay(')[1].split(')')[0];
        print('2 : '+exitTime);
      });
  }

  void showVehicleBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return VehicleBottomSheet();
      }
    );
  }
}

class VehicleBottomSheet extends StatefulWidget {
  @override
  _VehicleBottomSheetState createState() => _VehicleBottomSheetState();
}

class _VehicleBottomSheetState extends State<VehicleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      color: Color(0xFF737373),
      child: new Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0)
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0)
                    )
                ),
                child: Center(
                  child: Container(
                    height: 5.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: CustomColor.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                    ),
                  ),
                ),
              ),
              vehicleWidget(context)
            ],
          )
      ),
    );
  }

  vehicleWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        top: Dimensions.heightSize * 3),
      child: Column(
        children: [
          Text(
            Strings.chooseYourVehicle,
            style: TextStyle(
              fontSize: Dimensions.extraLargeTextSize * 1.5,
            ),
          ),
          SizedBox(height: Dimensions.heightSize * 2,),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
                crossAxisCount: 4,
              children: List.generate(VehicleList.list().length, (index) {
                Vehicle vehicle = VehicleList.list()[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black.withOpacity(0.1)),
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                      ),
                      child: Image.asset(vehicle.image),
                    ),
                    onTap: () {
                      print('data: '+vehicle.image);
                      setState(() {
                        selectedVehicle = vehicle.image;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: Dimensions.heightSize * 2,),
        ],
      ),
    );
  }
}
