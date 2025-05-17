import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/lab_8/image_1.dart';
import 'package:projects/lab_9/tab_view.dart';

import '../lab_8/onlineImage.dart';

class DrawerView2 extends StatelessWidget {
  List<String> list = ['tanisha', 'vruta', 'kunj'];

  DrawerView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Drawer')),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Center(child: Text('DRAWER HEAD',style: TextStyle(fontSize: 20))),
            ),
           ListTile(
             title: Text('pages'),
             onTap: (){
               Navigator.pop(context);
               Navigator.push(
                 context, MaterialPageRoute(builder: (context)=>TabView()));
             },
           ),
            ListTile(
              title: Text('Image'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>image_1()));
              },
            )
          ],
        ),
      ),
    );
  }
}
