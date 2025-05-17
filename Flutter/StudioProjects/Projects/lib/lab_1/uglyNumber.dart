// WAP to check if a given positive integer is an ugly number (a number whose only prime factors are
// 2, 3, and 5). Example: Input: n = 6, Output: true (6 = 2 × 3); Input: n = 14, Output: false (14 includes
// the prime factor 7).
import 'dart:io';

void main(){
  print("enter a number : ");
  double num=double.parse(stdin.readLineSync()!);
  while(num % 2 ==0){
    num=num/2;
  }
  while(num % 3 ==0){
    num=num/3;
  }
  while(num % 5 ==0){
    num=num/5;
  }
  if(num==1){
    stdout.write("number is ugly");
  }
  else{
    stdout.write("number is not ugly");
  }
}