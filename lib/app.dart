import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:officersclubdhaka/splashScreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        )
      ),
      defaultTransition: Transition.cupertino,
      home: DateTime.now().isAfter(DateTime(2021,4,22)) ? PayUp() : SplashScreen(),
    );
  }
}


class PayUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Pay UP'
        ),
      ),
    );
  }
}
