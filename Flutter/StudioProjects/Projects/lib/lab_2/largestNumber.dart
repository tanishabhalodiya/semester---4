import 'dart:io';

// WAP to find out largest number from given three numbers without using Logical Operator.

void main(){
  print("enter number 1: ");
  int a=int.parse(stdin.readLineSync()!);

  print("enter number 2: ");
  int b=int.parse(stdin.readLineSync()!);

  print("enter number 3: ");
  int c=int.parse(stdin.readLineSync()!);

  if(a>b){
    if(a>c){
      print("$a is largest");
    }
    else{
      print("$b is largest");
    }
  }
  else{
    if(b>c){
      print("$b is largest");
    }
    else{
      print("$c is largest");
    }
  }
}