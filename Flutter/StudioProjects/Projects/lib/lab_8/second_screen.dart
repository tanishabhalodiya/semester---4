import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/lab_8/birthdayCard_navigate.dart';
import 'package:projects/lab_8/navigate.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second SCREEN',style: TextStyle(color: Colors.purpleAccent)),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),

      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(
                (context)
              );
            },
            child: Text('First screen')),
      ),
    );
  }
}
