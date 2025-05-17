import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practise/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('FIRST SCREEN',style: TextStyle(color: Colors.pink)),
      centerTitle: true,
    ),

      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                (context),
                MaterialPageRoute(builder: (context)=>SecondScreen()),
              );
            },
            child: Text('Next screen')),
      ),
    );
  }
}
