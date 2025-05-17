import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/lab_8/second_screen.dart';

import 'birthdayImage.dart';

class BirthdaycardNavigate extends StatelessWidget {
  final nameController=TextEditingController();
  BirthdaycardNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FIRST SCREEN',style: TextStyle(color: Colors.pink)),
        centerTitle: true,
      ),

      body: Center(
        child:Column(
        children: [
          Expanded(
              child: Form(child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Colors.pink,
                      labelText: 'Enter name'
                  ),
            )
          ),
          ),
          Expanded(

            child: Row(
              children: [
                Expanded(
                    child:Center(
                      child: ElevatedButton(onPressed:
                          () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BirthdayImage(name:nameController.text)));
                      }
                          , child: Text('CREATE')),
                    )
                )
              ],
            )
          )
        ],
      ),
      )
    );
  }
}
