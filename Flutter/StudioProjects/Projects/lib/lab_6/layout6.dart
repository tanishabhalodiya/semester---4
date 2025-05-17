import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
class Layout6 extends StatelessWidget {
  const Layout6({super.key});

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
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex:3,
                    child: Container(
                      color: Colors.red,
                    )
                ),
                Expanded(
                    flex:1,
                    child: Container(
                      color: Colors.black,
                    )
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
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
                            )
                            ),
                            Expanded(
                                child: Container(
                                  color: Colors.redAccent,
                                )
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                                  color: Colors.pink,
                                )
                            ),
                            Expanded(
                                child: Container(
                                  color: Colors.purpleAccent,
                                )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.brown,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black12,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.brown,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black12,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                                  color: Colors.blueGrey,
                                )
                            ),
                            Expanded(
                                child: Container(
                                  color: Colors.redAccent,
                                )
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Container(
                                              color: Colors.lightBlue,
                                            )
                                        ),
                                        Expanded(
                                            child: Container(
                                              color: Colors.redAccent,
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Container(
                                              color: Colors.pink,
                                            )
                                        ),
                                        Expanded(
                                            child: Container(
                                              color: Colors.purpleAccent,
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  color: Colors.lightGreen,
                                )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Container(
                                              color: Colors.lightBlue,
                                            )
                                        ),
                                        Expanded(
                                            child: Container(
                                              color: Colors.redAccent,
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Container(
                                              color: Colors.pink,
                                            )
                                        ),
                                        Expanded(
                                            child: Container(
                                              color: Colors.purpleAccent,
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  color: Colors.black,
                                )
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                                  color: Colors.pink,
                                )
                            ),
                            Expanded(
                                child: Container(
                                  color: Colors.purpleAccent,
                                )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

  }
}


