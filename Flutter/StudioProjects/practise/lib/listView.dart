import 'package:flutter/material.dart';

class listView extends StatefulWidget {
  const listView({super.key});

  @override
  State<listView> createState() => _State();
}

class _State extends State<listView> {
  var array=['t','a','n','i','s','h','a'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
        
        //for dynamic data
      ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(array[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
        );
        },
        itemCount: array.length,
      )

    // ListView.separated(itemBuilder: (context,index){
    //   return Text(array[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100));
    // },
    // itemCount: array.length,
    //   separatorBuilder: (BuildContext context, int index) {
    //     return Divider(height: 100,thickness: 2);
    //   },
    // ),


      //----------------------------------------------------------------------------------
    //for static data
    // ListView(
    //   children: [
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Text('1',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Text('2',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Text('3',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Text('4',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Text('5',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
    //         )
    //   ],
    // )
        
    );
  }
}
