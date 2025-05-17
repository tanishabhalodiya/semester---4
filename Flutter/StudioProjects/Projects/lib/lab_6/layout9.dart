import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout9 extends StatelessWidget{
  const Layout9({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    body: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.greenAccent,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.deepPurple,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.brown,
                      ),
                    )
                  ],
                )
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex:2,
                      child: Container(
                        color: Colors.yellow,
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child: Container(
                        color: Colors.orange,
                      ),
                    )
                  ],
                )
              )
            ],
          )
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child: Container(
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child: Container(
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                )
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      flex:3,
                      child: Container(
                        color: Colors.purple,
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child: Container(
                        color: Colors.orange,
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child: Container(
                        color: Colors.blueAccent,
                      ),
                    )
                  ],
                )
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex:1,
                      child: Container(
                        color: Colors.blueGrey,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          color: Colors.lightBlueAccent,
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child: Container(
                          color: Colors.pinkAccent,
                      ),
                    )
                  ],
                )
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex:3,
                      child: Container(
                        color: Colors.lightGreen,
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child: Container(
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child: Container(
                        color: Colors.yellowAccent,
                      ),
                    )
                  ],
                )
              ),
              Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex:2,
                        child: Container(
                          color: Colors.pink,
                        ),
                      ),
                      Expanded(
                        flex:2,
                        child: Container(
                          color: Colors.green,
                        ),
                      ),
                      Expanded(
                        flex:2,
                        child: Container(
                          color: Colors.deepPurple,
                        ),
                      )
                    ],
                  )
              )
            ],
          )
        )
      ],
    ),
    );

  }
}