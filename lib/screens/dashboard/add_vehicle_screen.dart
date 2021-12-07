import 'package:flutter/material.dart';

import 'package:sps/utils/dimensions.dart';
import 'package:sps/utils/custom_style.dart';
import 'package:sps/utils/strings.dart';
import 'package:sps/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

class AddVehicleScreen extends StatefulWidget {
  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {

  File _image;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<dynamic> vehicleTypeList = ['MotorBike', 'Bus', 'Truck', 'Car', 'Pick-Up', 'Bi-Cycle'];
  String selectVehicleType = 'Select Type';

  TextEditingController licenseController = TextEditingController();
  TextEditingController modelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize,
                  top: Dimensions.marginSize
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
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize
                ),
                child: Text(
                  Strings.addVehicle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimensions.extraLargeTextSize * 1.5
                  ),
                ),
              ),
              SizedBox(height: Dimensions.heightSize * 2,),
              bodyWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Column(
      children: [
        addImageWidget(context),
        Padding(
          padding: const EdgeInsets.only(
            left: Dimensions.marginSize,
            right: Dimensions.marginSize,
            top: Dimensions.heightSize * 2,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: 70.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(Dimensions.radius)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: Dimensions.marginSize,
                      right: Dimensions.marginSize,
                      top: 5
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.typeVehicle,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: Dimensions.smallTextSize
                          ),
                        ),
                        DropdownButton<String>(
                          items: vehicleTypeList.map((value) {
                            return DropdownMenuItem<String> (
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.defaultTextSize
                                ),
                              ),
                            );
                          }).toList(),
                          hint: Text(
                            selectVehicleType,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.defaultTextSize
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              selectVehicleType = value;
                            });
                          },
                          underline: Container(),
                          isExpanded: true,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.heightSize,),
                Container(
                  height: 70.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(Dimensions.radius)
                  ),
                  child: TextFormField(
                    style: CustomStyle.textStyle,
                    controller: licenseController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value){
                      if (value.isEmpty) {
                        return Strings.pleaseFillOutTheField;
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: Strings.vehicleLicensePlateNo,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      labelStyle: CustomStyle.textStyle,
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: CustomStyle.listStyle,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.heightSize,),
                Container(
                  height: 70.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(Dimensions.radius)
                  ),
                  child: TextFormField(
                    style: CustomStyle.textStyle,
                    controller: modelController,
                    keyboardType: TextInputType.text,
                    validator: (String value){
                      if (value.isEmpty) {
                        return Strings.pleaseFillOutTheField;
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: Strings.vehicleModelNo,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      labelStyle: CustomStyle.textStyle,
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: CustomStyle.listStyle,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: Dimensions.heightSize * 3,),
        Padding(
          padding: const EdgeInsets.only(
            left: Dimensions.marginSize,
            right: Dimensions.marginSize,
          ),
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
                  Strings.addVehicle.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.largeTextSize
                  ),
                ),
              ),
            ),
            onTap: () {

            },
          ),
        ),
      ]
    );
  }

  addImageWidget(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
          children: <Widget>[
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: CustomColor.secondaryColor,
                borderRadius: BorderRadius.circular(75.0),
              ),
              child: _image == null ? Image.asset('assets/images/vehicle.png') : Image.file(_image, fit: BoxFit.cover,),),
            Positioned(
              right: 0,
              bottom: 20,
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  color: CustomColor.primaryColor,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: IconButton(
                  onPressed: (){
                    _openImageSourceOptions(context);
                  },
                  padding: EdgeInsets.only(left: 5, right: 5),
                  iconSize: 24,
                  icon: Icon(
                    Icons.camera_enhance,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }

  Future<void> _openImageSourceOptions(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Icon(Icons.camera_alt, size: 40.0, color: Colors.blue,),
                  onTap: (){
                    Navigator.of(context).pop();
                    _chooseFromCamera();
                  },
                ),
                GestureDetector(
                  child: Icon(Icons.photo, size: 40.0, color: Colors.green,),
                  onTap: (){
                    Navigator.of(context).pop();
                    _chooseFromGallery();
                  },
                ),
              ],
            ),
          );
        });
  }
  File file;
  void _chooseFromGallery() async{
    // ignore: deprecated_member_use
    file = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 40);

    if (file == null){
      Fluttertoast.showToast(msg: 'No File Selected');
    }else{
      setState(() {
        _image = file;
      });
      //_upload();
    }
  }
  _chooseFromCamera() async{
    print('open camera');
    //ignore: deprecated_member_use
    file = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 20);

    print('picked camera');
    if (file == null){
      Fluttertoast.showToast(msg: 'No Capture Image');
    }else{
      setState(() {
        _image = file;
      });
      //_upload();
    }
  }
}
