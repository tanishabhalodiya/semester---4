import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheet1 extends StatefulWidget {
  const BottomSheet1({super.key});

  @override
  State<BottomSheet1> createState() => _BottomSheet1State();
}

class _BottomSheet1State extends State<BottomSheet1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BOTTOM SHEET'),
      ),
      body: ElevatedButton(onPressed: (){
        showModalBottomSheet(context: context, builder: (context) {
          return Center(
            child: Container(
              height: 200,
              width: double.infinity,
              child: Column(
                children: [
                  Text("Bottom sheet"),
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("close"))
                ],
              ),
            ),
          );
        },);
      }, child: Text("demo"))
    );
  }
}
