import 'dart:io';
// WAP to print your name in console.
void main(){
  print("enter first number : ");
  int num1=int.parse(stdin.readLineSync()!);
  print("enter second number : ");
  int num2=int.parse(stdin.readLineSync()!);
  int ?sum=num1+num2;
  print("your sum is : ");
  stdout.write(sum);
}