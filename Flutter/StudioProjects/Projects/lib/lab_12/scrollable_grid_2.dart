import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollableGrid2 extends StatelessWidget {
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

  ScrollableGrid2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Scrollable grid view'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,
                child: GridView.builder(
                    itemCount: city.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Center(child: Text(city[index])),
                        color: Colors.indigo.shade100,
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
