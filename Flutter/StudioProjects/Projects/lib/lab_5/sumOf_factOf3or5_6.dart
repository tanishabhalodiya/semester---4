//WAP to accept n numbers in an array. Display the sum of all the numbers which are divisible
// by either 3 or 5.

import 'dart:io';
void main(){
  print("enter size of array : ");
  int n=int.parse(stdin.readLineSync()!);
  stdout.writeln("enter array : ");
  int sum=0;
  List<int> arr=[n];
  for(int i=0;i<n;i++){
    arr[i]=int.parse(stdin.readLineSync()!);
    arr.add(arr[i]);
    if(arr[i]%3==0 || arr[i]%5==0){
      sum =sum + arr[i];
    }
  }
  stdout.writeln("The sum of numbers which is divisible by either 3 or 5 is : $sum");
}