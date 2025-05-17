//WAP to calculate the angle between the hour and minute hands of a clock, where the hours
// and minutes are taken from the user. Example: Input: hours = 3, minutes = 15, Output: 7.5
// (angle between the hands is 7.5 degrees).

import 'dart:io';
void main(){
  print("enter the hour : ");
  int hour=int.parse(stdin.readLineSync()!);
  print("Enter the minutes : ");
  int min=int.parse(stdin.readLineSync()!);
  double angle=0;
  angle=(11/2)*min -30*hour;
  if(angle < 0){
    angle=-angle;
  }
  print("angle between hour hand and minute hand is : $angle");
}