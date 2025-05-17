import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Gridview3 extends StatelessWidget {

  final List<Map<String, String>> items = [
    {'image': 'assets/images/dice-2.jpg', 'title': 'Image 2'},
    {'image': 'assets/images/dice-3.jpg', 'title': 'Image 3'},
    {'image': 'assets/images/dice-4.jpg', 'title': 'Image 4'},
    {'image': 'assets/images/dice-5.jpg', 'title': 'Image 5'},
    {'image': 'assets/images/dice-6.jpg', 'title': 'Image 6'}
  ];

  Gridview3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid_View'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
          itemCount: 5,
          itemBuilder: (context,index){
            return Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage(items[index]['image']!)),
                  SizedBox(width: 10,),
                  Text(items[index]['title']!)
                ],
              ),
            );
          }),
    );
  }
}
