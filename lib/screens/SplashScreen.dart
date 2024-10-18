import 'package:flutter/material.dart';
import 'package:pavilion/Bottom%20Nav/bottom_nav.dart';
import 'dart:async';

import 'package:pavilion/components/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer to navigate to the next screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      // Replace this with the route to your next screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> BottomNav()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          padding: EdgeInsets.only(left: 40 , right: 40 , bottom: 60),
          color: Colors.black,
          child: Image.asset(
            'assets/svgIcons/logo.png', // Display the image from assets
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}
