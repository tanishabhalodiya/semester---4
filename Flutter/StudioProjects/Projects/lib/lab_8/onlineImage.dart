import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class onlineImage extends StatelessWidget {
  const onlineImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          'https://cdn.pixabay.com/photo/2023/06/08/11/34/ai-generated-8049391_1280.jpg', // Replace with your image URL
        ),
      ),
    );
  }
}
