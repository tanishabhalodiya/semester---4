import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
class Layout1 extends StatelessWidget {
  const Layout1({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("hello",style:TextStyle(color:Colors.blue
        )
        ),
      ),
      body: Row(
        children: [
          Expanded(
              child : Container(
                color: Colors.orange,
              )
          ),
          Expanded(
              child : Container(
                color: Colors.white,
              )
          ),
          Expanded(
              child : Container(
                color: Colors.green,
              )
          )
        ],
      ),
    );

  }
}


