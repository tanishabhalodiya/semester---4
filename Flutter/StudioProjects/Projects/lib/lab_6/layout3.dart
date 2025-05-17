import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
class Layout3 extends StatelessWidget {
  const Layout3({super.key});

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
            child: Column(
              children: [
                Expanded(
                    child : Container(
                      color: Colors.red,
                    )
                ),
                Expanded(
                    child : Container(
                      color: Colors.brown,
                    )
                ),
                Expanded(
                    child : Container(
                      color: Colors.black,
                    )
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child : Container(
                      color: Colors.lightGreen,
                    )
                ),
                Expanded(
                    child : Container(
                      color: Colors.grey,
                    )
                ),
                Expanded(
                    child : Container(
                      color: Colors.red,
                    )
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child : Container(
                      color: Colors.lightBlue,
                    )
                ),
                Expanded(
                    child : Container(
                      color: Colors.purple,
                    )
                ),
                Expanded(
                    child : Container(
                      color: Colors.orange,
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );

  }
}


