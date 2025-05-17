import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class stack extends StatelessWidget {
  const stack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stack'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Image.asset('assets/images/flutter_logo.jpg'),
          Text('Flutter',style: TextStyle(fontSize: 30),)
        ],
      ),
    );
  }
}
