import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PROGRAM SUCCESSFULLY RUN',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          getExpandedColoredWidget(
            Colors.black,
            childWidget: Row(
              children: [
                getExpandedColoredWidget(Colors.black),
                getExpandedColoredWidget(Colors.deepOrange),
                getExpandedColoredWidget(Colors.indigoAccent),
              ],
            ),
          ),
          getExpandedColoredWidget(Colors.red, userFlex: 2),
          getExpandedColoredWidget(Colors.yellow, userFlex: 3),
        ],
      ),
    );
  }

  Widget getExpandedColoredWidget(
      Color displayColor, {
        Widget? childWidget,
        int? userFlex,
      }) {
    return Expanded(
      flex: userFlex ?? 1,
      child: Container(
        color: displayColor,
        child: childWidget,
      ),
    );
  }
}

