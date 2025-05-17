import 'package:flutter/material.dart';

class helloWithText_1 extends StatelessWidget {
  const helloWithText_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hello World",style:TextStyle(color: Colors.black,backgroundColor:Colors.pink,fontSize: 60)
    )
    );
  }
}
