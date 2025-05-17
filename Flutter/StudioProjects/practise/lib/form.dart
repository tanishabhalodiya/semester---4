import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey=GlobalKey();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Regestration'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Colors.pink,
                  labelText: 'Enter name'
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter name please';
                  }
                },
              ),
              SizedBox.fromSize(size: Size.fromHeight(20)),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                    fillColor: Colors.pink,
                    labelText: 'Enter phone number'
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^[0-9]{10}'),
                  )
                ],
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter Phone number please';
                  }
                  if(value.length>10 || value.length<10){
                    return 'enter 10 digit phone number please';
                  }
                  return null;
                },
              ),

              SizedBox.fromSize(size: Size.fromHeight(20)),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.pink,
                    labelText: 'Enter email'
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter email please';
                  }
                },
              ),
              SizedBox.fromSize(size: Size.fromHeight(20)),
              ElevatedButton(onPressed: (){
                print(_formKey.currentState!.validate());
              },
              child: Text('Submit',style: TextStyle(color: Colors.blue)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
