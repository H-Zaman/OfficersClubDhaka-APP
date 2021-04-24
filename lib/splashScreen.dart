import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:officersclubdhaka/authentication/view/authScreen.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/mainApp/util/resources/images.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData(){
    Future.delayed(Duration(seconds: 2),()=>Get.to(()=>AuthScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.purple,
              AppColor.blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Center(
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Hero(
                tag: Images.appLogo,
                child: Image.asset(
                  Images.appLogo,
                  height: 75,
                  width: 75,
                ),
              ),
            )
          ),
        ),
      )
    );
  }
}