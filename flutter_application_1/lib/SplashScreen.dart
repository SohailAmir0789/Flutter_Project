import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/InfoScreen.dart';
import 'package:flutter_application_1/helper/pref.dart';
import 'package:flutter_application_1/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Pref.showOnboarding ? InfoScreen() : Home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 203, 88, 1.000),
      body: Center(
        child: Image(
          image: AssetImage("assets/images/logo.png"),
        ),
      ),
    );
  }
}
