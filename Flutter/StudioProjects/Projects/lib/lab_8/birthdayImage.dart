import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BirthdayImage extends StatelessWidget {
  var name;
  BirthdayImage({super.key, required String this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Center(
                child: Image.asset('assets/images/bday1.png')
            ),
            Center(child: Text(name,style:TextStyle(color: Colors.purpleAccent,fontSize: 35),))
          ]
      ),
    );
  }
}
