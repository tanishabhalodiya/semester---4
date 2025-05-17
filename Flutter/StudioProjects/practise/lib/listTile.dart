import 'package:flutter/material.dart';

class listTile extends StatefulWidget {
  const listTile({super.key});

  @override
  State<listTile> createState() => _State();
}

class _State extends State<listTile> {
  var array=['tanisha','virangi','pushti','harmi','tanisha','virangi','pushti','harmi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        // ListView.separated(itemBuilder: (context,index){
          //   return ListTile(
          //     leading: Text('$index'),
          //     title: Text(array[index]),
          //     subtitle: Text('tanisha'),
          //     trailing: Icon(Icons.add),
          //   );
          // },
          //   itemCount: array.length,
          //   separatorBuilder: (BuildContext context, int index) {
          //     return Divider(height: 100,thickness: 2);
          //   },
          // ),
          Center(
            child:Container(
              child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/th.jpg'),
                backgroundColor: Colors.blue.shade100,
                radius: 100,
            ),
          )
          )
    );
  }
}
