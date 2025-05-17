import 'dart:io';

import 'package:crud_with_dart/user.dart';
import 'package:flutter/material.dart';

void main() {
  User user=User();

  int choice;
  do{
    print("Enter choice from doing crud..."
        "\n : 1 for add user"
        "\n : 2 for list usr map"
        "\n : 3 for update user"
        "\n : 4 for delete user"
        "\n : 5 for serach user"
        "\n : 6 for exit");
    choice=int.parse(stdin.readLineSync()!);

    switch(choice){
      case 1:
        print("Enter name");
        String name=stdin.readLineSync()!;
        print("Enter email");
        String email=stdin.readLineSync()!;
        print("Enter age");
        int age=int.parse(stdin.readLineSync()!);
        user.addUser(name: name, email: email, age: age);
        break;
      case 2:
        print("Your list is : ");
        List<Map<String,dynamic>> list=[];
        list=user.listUser();
        break;
      case 3:
        print("Enter index to update");
        int index=int.parse(stdin.readLineSync()!);
        print("Enter name");
        String name=stdin.readLineSync()!;
        print("Enter email");
        String email=stdin.readLineSync()!;
        print("Enter age");
        int age=int.parse(stdin.readLineSync()!);
        user.updateUSer(name: name, email: email, age: age, index: index);
        break;
      case 4:
        print("Enter index to delete : ");
        int id=int.parse(stdin.readLineSync()!);
        user.deleteUSer(id: id);
      case 5:
        print("enter data to search : ");
        String searchData=stdin.readLineSync()!;
        // user.searchUser(str: searchData);
      default:
        print("invalid choice");
    }
  }
  while(choice != 6);
}
