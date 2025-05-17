import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOfCity extends StatelessWidget {
  final List<String> city = [
    'Rajkot',
    'Ahmedabad',
    'Surat',
    'Jamnagar',
    'Gandhinagar',
    'Baroda'
  ];

  ListOfCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of City'),
      ),
      body: ListView.builder(
        itemCount: city.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(city[index]),
              leading: Icon(Icons.location_city),
            );
          }),
    );
  }
}
