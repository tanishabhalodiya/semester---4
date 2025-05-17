import 'dart:io';

void main(){
  print("enter number 1: ");
  int a = int.parse(stdin.readLineSync()!);
  int ans=1;
  for(int i=1;i<=a;i++){
    ans=ans*i;
  }
  print("Factorial of $a! is $ans");
}