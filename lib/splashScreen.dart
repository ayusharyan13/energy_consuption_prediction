import 'dart:async';
import 'package:energy_consumption/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                "राज्य ऊर्जा दर्शन",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Predict Your Energy Requirement",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black
                ),
              ),
              Lottie.asset("assets/animation/animation_green.json",
                  width: double.infinity,
                  height: 500),
            ],
          ),
        ),
      ),
    );
  }
}



