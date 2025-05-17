import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rollthedice extends StatefulWidget {
  const Rollthedice({super.key});

  @override
  State<Rollthedice> createState() => _RollthediceState();
}

class _RollthediceState extends State<Rollthedice> {
  // final List<int> list=[1,2,3,4,5,6];
  int index1=1;
  int index2=2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center(child: Text('ROLL THE DICE'),),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child:
              Container(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/dice-$index1.jpg'),
              ),
            ),
            Expanded(
              child:
              Container(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/dice-$index2.jpg'),
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                index1=Random().nextInt(6);
                index2=Random().nextInt(6);
              });
            }, child: Text('ROLL',style: TextStyle(fontSize: 20)))
          ],
        ),
      ),
    );
  }
}
