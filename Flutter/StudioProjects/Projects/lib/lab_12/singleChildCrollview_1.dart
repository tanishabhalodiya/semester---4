import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Singlechildcrollview extends StatelessWidget {
  const Singlechildcrollview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SCROLLABLE SCREEN'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.pink,
              height: 300,
            ),
            Container(
              color: Colors.black,
              height: 300,
            ),
            Container(
              color: Colors.blue,
              height: 300,
            ),
            Container(
              color: Colors.green,
              height: 300,
            ),
            Container(
              color: Colors.purple,
              height: 300,
            ),
            Container(
              color: Colors.indigo,
              height: 300,
            ),
            Container(
              color: Colors.red,
              height: 300,
            ),
            Container(
              color: Colors.yellow,
              height: 300,
            ),
          ],
        ),
      )
    );
  }
}
