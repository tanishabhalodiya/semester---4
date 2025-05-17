import 'dart:io';

// WAP to convert temperature from Fahrenheit to Celsius.

void main(){
  print("enter temperature in fehrenheit : ");
  double f=double.parse(stdin.readLineSync()!);
  double c=(0.56)*(f-32);
  stdout.write(c);
}