import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class lab7_p5 extends StatefulWidget {
  const lab7_p5({super.key});

  @override
  State<lab7_p5> createState() => _lab7_p5State();
}

class _lab7_p5State extends State<lab7_p5> {
  TextEditingController name=TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: name,
          ),
          ElevatedButton(onPressed: (){
            print(name.text);
            setState(() {

            });
            },child: Text("Submit")
          ),
          Text(name.text)
        ],
      ),
    );
  }
}
