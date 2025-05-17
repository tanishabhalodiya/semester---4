import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class card extends StatelessWidget {
  const card({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          shadowColor: Colors.blue,
          elevation: 20,
          child: Text('tanisha',style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }
}
