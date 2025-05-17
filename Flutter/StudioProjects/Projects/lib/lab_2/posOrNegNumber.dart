import 'dart:io';

// WAP to check whether the given number is positive or negative.

void main(){
  print("Enter number : ");
  int num=int.parse(stdin.readLineSync()!);
  if(num > 0){
    stdout.write("given number is positive");
  }
  else{
    stdout.write("given number is negative");
  }
}