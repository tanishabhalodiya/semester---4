import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practise/first_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second SCREEN',style: TextStyle(color: Colors.purpleAccent)),
        centerTitle: true,
      ),

      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                (context),
                MaterialPageRoute(builder: (context)=>FirstScreen()),
              );
            },
            child: Text('Last screen')),
      ),
    );
  }
}
