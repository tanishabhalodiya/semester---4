import 'dart:io';

// WAP to find out largest number from given three numbers without using Logical Operator.

void main() {
  print("enter number 1: ");
  int a = int.parse(stdin.readLineSync()!);

  print("enter number 2: ");
  int b = int.parse(stdin.readLineSync()!);

  print("enter number 3: ");
  int c = int.parse(stdin.readLineSync()!);

  int largest=(a >= b && a >= c) ? a : (b >= c ? b : c);
  stdout.writeln("Largest number is $largest");

}