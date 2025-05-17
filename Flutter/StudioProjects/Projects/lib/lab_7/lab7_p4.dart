import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class lab7_p4 extends StatefulWidget {
  @override
  State<lab7_p4> createState() => _lab7_p4State();
}

class _lab7_p4State extends State<lab7_p4> {
  TextEditingController name=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(2.0))),
                floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              hintText:'hint text'
            ),
          ),
          ElevatedButton(onPressed: (){
            print(name.text);
            setState(() {

            });
          }, child: Text("Submit")
          ),
          Text(name.text),
        ],
      ),
    );
  }
}
