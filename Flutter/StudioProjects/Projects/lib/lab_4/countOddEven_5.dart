//WAP to count number of even or odd number from an array of n numbers.

import 'dart:io';
void main(){
  List<int> arr=[];
  print("enter size of array : ");
  int n=int.parse(stdin.readLineSync()!);
  for(int i=0;i<n;i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }
  count(arr);
}
void count(List<int> arr){
  int odd=0;
  int even=0;
  for(int n in arr){
    if (n % 2 == 0) {
      even += 1;
    } else {
      odd += 1;
    }
  }
  stdout.writeln("number of odd : $odd");
  stdout.writeln("number of even : $even");
}