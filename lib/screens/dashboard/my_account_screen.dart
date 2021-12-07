import 'package:flutter/material.dart';

import 'package:sps/utils/dimensions.dart';
import 'package:sps/utils/custom_style.dart';
import 'package:sps/utils/strings.dart';
import 'package:sps/utils/colors.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {

  File _image;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
                  Strings.myAccount,
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
          SizedBox(height: Dimensions.heightSize,),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
            ),
            child: Column(
              children: [
                Text(
                  Strings.demoName,
                  style: TextStyle(
                    fontSize: Dimensions.extraLargeTextSize * 1.5,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: Dimensions.heightSize * 0.5,),
                Text(
                  Strings.demoParkingAddress,
                  style: TextStyle(
                    fontSize: Dimensions.largeTextSize,
                    color: Colors.black
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
              top: Dimensions.heightSize * 3,
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
                    child: TextFormField(
                      style: CustomStyle.textStyle,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String value){
                        if (value.isEmpty) {
                          return Strings.pleaseFillOutTheField;
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: Strings.email,
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
                      controller: phoneController,
                      keyboardType: TextInputType.text,
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
                      controller: addressController,
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
                  color: CustomColor.secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                ),
                child: Center(
                  child: Text(
                    Strings.updateAccount.toUpperCase(),
                    style: TextStyle(
                      color: CustomColor.primaryColor,
                      fontSize: Dimensions.largeTextSize,
                      fontWeight: FontWeight.bold
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
              child: _image == null ? Image.asset('assets/images/profile.png') : Image.file(_image, fit: BoxFit.cover,),),
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
                  padding: EdgeInsets.only(left: 5,right: 5),
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
  void _chooseFromGallery() async {
    file = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 40);

    if (file == null) {
      Fluttertoast.showToast(msg: 'No File Selected');
    } else {
      setState(() {
        _image = file;
      });
    }
  }
  _chooseFromCamera() async{
    print('open camera');
    file = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 20);

    print('picked camera');
    if (file == null) {
      Fluttertoast.showToast(msg: 'No Capture Image');
    } else {
      setState(() {
        _image = file;
      });
    }
  }

}
