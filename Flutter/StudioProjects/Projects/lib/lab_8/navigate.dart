import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/lab_8/second_screen.dart';

class Navigate extends StatelessWidget {
  const Navigate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('FIRST SCREEN',style: TextStyle(color: Colors.pink)),
        backgroundColor: Colors.blue,
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

