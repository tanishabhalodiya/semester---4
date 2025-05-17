import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/lab_8/birthdayImage.dart';

import 'birthdayCard_navigate.dart';

class SplashScreen6 extends StatefulWidget {
  const SplashScreen6({super.key});

  @override
  State<SplashScreen6> createState() => _SplashScreen6State();
}

class _SplashScreen6State extends State<SplashScreen6> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => (BirthdaycardNavigate())),
      );
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/images/cake_2.jpg'
        ),
      ),
    );
  }
}
