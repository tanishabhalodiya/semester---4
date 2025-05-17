//WAP that prompts the user to enter 5 numbers, stores them in a List, and displays them in
// increasing order.

import 'dart:io';

void main(){
  List<int> arr=[];
  print("enter list with 5 number : ");
  for(int i=0;i<5;i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }
  for(int i=0;i<5;i++){
      for(int j=i;j<5;j++){
        if(arr[i]>arr[j]){
          int swap=arr[i];
          arr[i]=arr[j];
          arr[j]=swap;
        }
      }
  }
  stdout.writeln("Sorted list is : ");
  print(arr);
}