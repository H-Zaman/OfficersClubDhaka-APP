import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:officersclubdhaka/splashScreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          primaryColor: Colors.white
      ),
      home: SplashScreen(),
    );
  }
}