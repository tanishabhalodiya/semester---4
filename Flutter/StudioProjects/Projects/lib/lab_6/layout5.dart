import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
class Layout5 extends StatelessWidget {
  const Layout5({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("hello",style:TextStyle(color:Colors.blue)
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex:1,
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            flex:1,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.pink,
                  ),
                ),
                Expanded(
                  flex: 1,
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.purple,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.greenAccent,
                            ),
                          )
                        ],
                      ),
                    ),
                )
              ],
            ),
          ),
          Expanded(
            flex:1,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.orange,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          )
        ],

      ),
    );

  }
}


