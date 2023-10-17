import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_application/features/Home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "Splash";

  @override
  State<SplashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Image.asset(
          "assets/splash.png",
        ),
      ),
    );
  }
}
