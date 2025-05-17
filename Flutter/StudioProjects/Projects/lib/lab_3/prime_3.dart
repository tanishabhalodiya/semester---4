import 'dart:io';
//WAP to find whether the given number is prime or not.

void main(){
  print("enter number : ");
  int? a = int.parse(stdin.readLineSync()!);
  int count=0;
  for(int i=2;i<= a/2 ;i++){
    if(a%i==0){
      count++;
    }
  }
  if(count==0){
    stdout.writeln("$a is prime number");
  }
  else{
    stdout.writeln("$a is not prime number");
  }
}