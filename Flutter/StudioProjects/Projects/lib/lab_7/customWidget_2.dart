import 'package:flutter/material.dart';

class customWidget_2 extends StatelessWidget {
  const customWidget_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: customText(name: 'Tanisha', color: Colors.deepPurple,size: 50,bgColor: Colors.lightGreen)
    );
  }
  Widget customText({required String name,required Color color,required size,required bgColor}){
    return Text(name,
      style: TextStyle(
          color: color,
          fontSize: size,
          backgroundColor:bgColor,
      ),
    );
  }
}
