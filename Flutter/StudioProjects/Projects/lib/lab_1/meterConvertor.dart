import 'dart:io';

// WAP that reads a number in meters, converts it to feet, and display the result.

void main(){
  print("enter meter : ");
  double meter=double.parse(stdin.readLineSync()!);
  double ?feet = meter*3.2808;
  stdout.write(feet);
}