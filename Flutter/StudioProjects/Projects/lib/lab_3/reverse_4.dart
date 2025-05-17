//WAP to print given number in reverse order.
import 'dart:io';

void main(){
  print("enter number : ");
  int num = int.parse(stdin.readLineSync()!);
  int a=num;
  int rev=0;
  if(num<0){
    num=-num;;
  }
  while(num != 0){
    int r=num % 10;
    rev = rev*10 + r;
    num~/=10;
  }
  if(a<0){
    rev=-rev;
    stdout.writeln("Reversed number of $a is $rev");
  }
  else{
    stdout.writeln("Reversed number of $a is $rev");
  }
}