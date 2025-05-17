import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollableList2 extends StatelessWidget {
  final List<String> city = [
    'Rajkot',
    'Ahmedabad',
    'Surat',
    'Jamnagar',
    'Gandhinagar',
    'Baroda',
    'Rajkot',
    'Ahmedabad',
    'Surat',
    'Jamnagar',
    'Gandhinagar',
    'Baroda',
    'Rajkot',
    'Ahmedabad',
    'Surat',
    'Jamnagar',
    'Gandhinagar',
    'Baroda',
    'Rajkot',
    'Ahmedabad',
    'Surat',
    'Jamnagar',
    'Gandhinagar',
    'Baroda',
  ];

  ScrollableList2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollable List View'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              child: ListView.builder(
                  itemCount: city.length,
                  itemBuilder: (context,index){
                    return Container(
                      height: 300,
                      child: ListTile(
                        title: Text(city[index]),
                        leading: Icon(Icons.location_city),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
