import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaperLayout1 extends StatelessWidget {
  const PaperLayout1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('App Bar'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1)
                        ),
                      )
                  ),
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1)
                        ),                      )
                  ),
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1)
                        ),                      )
                  ),
                ],
              )
          ),
          Expanded(
            flex: 1,
              child:Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1)
                ),
              )
          ),
          Expanded(
            flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                      child:Column(
                        children: [
                          Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1)
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1)
                                        ),
                                      )
                                  ),
                                ],
                              )
                          ),
                          Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1)
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1)
                                        ),
                                      )
                                  ),
                                ],
                              )
                          )
                        ],
                      )
                      ),
                  Expanded(
                    flex: 1,
                      child:Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1)
                        ),
                      )
                  )
                ],
              )
          ),
        ],
      ),
   
    );
  }
}
