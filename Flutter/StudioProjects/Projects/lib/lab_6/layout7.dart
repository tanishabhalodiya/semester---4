import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout7 extends StatelessWidget{
  const Layout7({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text("hello",style:TextStyle(color:Colors.blue
    )
    ),
    ),
    body: Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.yellow,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.lightBlue,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.purple,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.blueAccent,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              )
            ],
          )
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.blueGrey,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                              flex:1,
                              child : Container(
                                color: Colors.blueAccent,
                              )
                          ),
                          Expanded(
                              flex:2,
                              child : Container(
                                color: Colors.greenAccent,
                              )
                          ),
                          Expanded(
                              flex:1,
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
                              flex:1,
                              child : Container(
                                color: Colors.purple,
                              )
                          ),
                          Expanded(
                              flex:1,
                              child : Container(
                                color: Colors.purpleAccent,
                              )
                          ),
                          Expanded(
                              flex:1,
                              child : Container(
                                color: Colors.deepPurple,
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
                                color: Colors.lightBlueAccent,
                              )
                          ),
                          Expanded(
                              flex:4,
                              child : Container(
                                color: Colors.lightGreen,
                              )
                          ),
                          Expanded(
                              flex:2,
                              child : Container(
                                color: Colors.purple,
                              )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
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
                child: Container(
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.pink,
                ),
              )
            ],
          )
        )
      ],
    )
    );

  }
}