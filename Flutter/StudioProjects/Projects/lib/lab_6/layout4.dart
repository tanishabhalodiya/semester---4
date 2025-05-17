import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
class Layout4 extends StatelessWidget {
  const Layout4({super.key});

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
                    flex:1,
                    child : Container(
                      color: Colors.grey,
                    )
                ),
                Expanded(
                    flex:2,
                    child : Container(
                      color: Colors.orange,
                    )
                ),
                Expanded(
                    flex:3,
                    child : Container(
                      color: Colors.blue,
                    )
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    flex:3,
                    child : Container(
                      color: Colors.red,
                    )
                ),
                Expanded(
                    flex:2,
                    child : Container(
                      color: Colors.lightGreen,
                    )
                ),
                Expanded(
                    flex:1,
                    child : Container(
                      color: Colors.grey,
                    )
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    flex:2,
                    child : Container(
                      color: Colors.red,
                    )
                ),
                Expanded(
                    flex:4,
                    child : Container(
                      color: Colors.yellow,
                    )
                ),
                Expanded(
                    flex:1,
                    child : Container(
                      color: Colors.purple,
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


