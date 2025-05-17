import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout8 extends StatelessWidget{
  const Layout8({super.key});

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
                    color: Colors.brown,
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            )
          ),
          Expanded(
            flex: 2,
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
                                  color: Colors.black54,
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
                ),
                Expanded(
                  child: Container(
                    color: Colors.blueAccent,
                  ),
                )
              ],
            )
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                )
              ],
            )
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
                                  color: Colors.blue,
                                )
                            ),
                            Expanded(
                                child: Container(
                                  color: Colors.red,
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
                                              color: Colors.yellow,
                                            )
                                        ),
                                        Expanded(
                                            child: Container(
                                              color: Colors.green,
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
                                              color: Colors.red,
                                            )
                                        ),
                                        Expanded(
                                            child: Container(
                                              color: Colors.yellowAccent,
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
                                  color: Colors.orange,
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
                                child: Container(
                                  color: Colors.blue,
                                )
                            ),
                            Expanded(
                                child: Container(
                                  color: Colors.red,
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
                                              color: Colors.yellow,
                                            )
                                        ),
                                        Expanded(
                                            child: Container(
                                              color: Colors.green,
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
                                              color: Colors.red,
                                            )
                                        ),
                                        Expanded(
                                            child: Container(
                                              color: Colors.yellowAccent,
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
                                  color: Colors.orange,
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