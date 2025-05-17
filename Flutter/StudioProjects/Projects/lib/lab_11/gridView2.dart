import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Gridview2 extends StatelessWidget {
  List<String> images = [
    'assets/images/dice-2.jpg',
    'assets/images/dice-3.jpg',
    'assets/images/dice-4.jpg',
    'assets/images/dice-5.jpg',
    'assets/images/dice-6.jpg'
  ];

  Gridview2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid-View'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5),
          itemBuilder: (context,index){
            return Center(
              child: Image(image: AssetImage(images[index])),
            );
          },
      itemCount: 6,),
    );
  }
}
