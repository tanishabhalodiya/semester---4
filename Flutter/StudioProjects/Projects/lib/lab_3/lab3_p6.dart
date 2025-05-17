// WAP program to calculate the sum of all positive even numbers and the sum of all negative
// odd numbers from a set of numbers. you can enter 0 (zero) to quit the program and thus it
// displays the result.

import 'dart:io';
void main(){
  int pos=0;
  int neg=0;
  List<int>? list=[];
  int i=0;
  print("enter number in list and enter 0 to quit the program : ");
  while(!list.contains(0)){
    int n=(int.parse(stdin.readLineSync()!));
    list.add(n);
    if(n>0 && n%2==0){
      pos=pos+n;
    }
    else if(n<0 && n%2==1){
      neg=neg+n;
    }
  }
  stdout.writeln(list);
  stdout.writeln("the sum of all positive even numbers : $pos");
  stdout.writeln("the sum of all negative odd numbers : $neg");

}