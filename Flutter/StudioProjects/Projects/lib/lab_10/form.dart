import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  final _formKey=GlobalKey<FormState>();
  final nameController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController pwdController=TextEditingController();
  bool isPasswordVisible=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(child: Text('Regestration')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
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
                  if(!RegExp(r'^[A-Z]{1}[a-z]+$').hasMatch(value!)){
                    return 'Enter Valid user name';
                  }
                },
              ),
              SizedBox.fromSize(size: Size.fromHeight(20)),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    fillColor: Colors.pink,
                    labelText: 'Enter phone number',
                ),
                // inputFormatters: [
                //   FilteringTextInputFormatter.allow(
                //     RegExp(r'^[0-9]'),
                //   )
                // ],
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter phone number please';
                  }
                  if(!RegExp(r'^\+?[0-9]{10}$').hasMatch(value!)){
                    return 'Enter a valid phone number';
                  }
                },
              ),

              SizedBox.fromSize(size: Size.fromHeight(20)),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.pink,
                    labelText: 'Enter email',
                  helperText: 'Ex : admin@gmail.com'
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter email please';
                  }
                  if(!RegExp(r'^[a-z]+@gmail.com$').hasMatch(value!)){
                    return 'please enter valid email iin correct format';
                  }
                },
              ),
              SizedBox.fromSize(size: Size.fromHeight(20)),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Enter your phone number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter phone number please';
                  }
                  if(!RegExp(r'^\+?[0-9]{10}$').hasMatch(value!)){
                    return 'Enter a valid phone number';
                  }
                },
              ),
              SizedBox.fromSize(size: Size.fromHeight(20),),
              TextFormField(
                obscureText: !isPasswordVisible,
                controller: pwdController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isPasswordVisible=!isPasswordVisible;
                          });
                        }, icon: Icon(isPasswordVisible ? CupertinoIcons.eye:CupertinoIcons.eye_slash))
                ),
              ),
              SizedBox.fromSize(size: Size.fromHeight(20)),
              ElevatedButton(onPressed: (){
                print('Name : ${nameController.text}');
                print('Phone number : ${phoneController.text}');
                print('Email : ${emailController.text}');
                print(_formKey.currentState!.validate());
                setState(() {

                });
              },
                child: Text('Submit',style: TextStyle(
                    color: Colors.blue,
                ),
                )
              ),
            Card(
              shadowColor: Colors.pink.shade500,
              child: Text(nameController.text)
            ),
              Card(
                  shadowColor: Colors.pink.shade500,
                  child: Text(phoneController.text)
              ),
              Card(
                  shadowColor: Colors.pink.shade500,
                  child: Text(emailController.text)
              )
            ],
          ),
        ),
      ),
    );
  }
}
