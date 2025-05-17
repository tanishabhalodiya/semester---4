import 'package:flutter/material.dart';

class image_1 extends StatefulWidget {
  const image_1({super.key});

  @override
  State<image_1> createState() => _image_1State();
}

class _image_1State extends State<image_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Image.asset('assets/images/flutter_logo.jpg'),),
    );
  }
}
