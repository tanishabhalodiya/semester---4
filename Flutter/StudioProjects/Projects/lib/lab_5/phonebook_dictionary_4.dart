//WAP to create and read phonebook dictionary.

import 'dart:io';
 void main(){
  print("Enter size of map : ");
  int n=int.parse(stdin.readLineSync()!);
  Map<String,int> contacts={};
  print("enter map : ");
  for(int i=0;i<n;i++){
    print("enter $i th entry : ");
    String name=stdin.readLineSync()!;
    print("Enter phone number: ");
    int num=int.parse(stdin.readLineSync()!);
    contacts[name]=num;
  }
  stdout.writeln("Map is : ");
  stdout.writeln(contacts);
  stdout.writeln("enter name to find number : ");
  String str=stdin.readLineSync()!;
  for (var i in contacts.entries){
    if(contacts.containsKey(str)){
      print("Number of $str is : ${contacts[str]}" );
      break;
    }
  }
  //we can also do like this
  // for(int i=0;i<n;i++){
  //   if(contacts.containsKey(str)){
  //     print(contacts[str]);
  //   }
  // }
}