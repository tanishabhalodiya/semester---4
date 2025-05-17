import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BirthdayCard extends StatefulWidget {
  const BirthdayCard({super.key});

  @override
  State<BirthdayCard> createState() => _BirthdayCardState();
}

class _BirthdayCardState extends State<BirthdayCard> {
  final nameController=TextEditingController();
  @override
  bool flag=false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: flag ? Stack(
          children: [
            Center(
                child: Image.asset('assets/images/bday1.png')
            ),
            Center(child: Text(nameController.text,style:TextStyle(color: Colors.purpleAccent,fontSize: 35),))
          ]
      ) :
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Form(child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.pink,
                    labelText: 'Enter name'
                ),
              ),
              ),
            ),
              ElevatedButton(onPressed: ()
              {
                setState(() {
                  flag=true;
                });
              }, child: Text('Add Name')),
          ],
        ),
      )

    );
  }
}
