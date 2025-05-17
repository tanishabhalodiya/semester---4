import 'dart:io';

// WAP to print your name in console.

void main(){
  print('enter your name : ');
  String name=stdin.readLineSync()!;
  stdout.write("your name is : "+name);
}