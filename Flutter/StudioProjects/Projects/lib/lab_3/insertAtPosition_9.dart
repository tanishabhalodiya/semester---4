//WAP to insert an element at a specific position in an array. The program should modify the
// existing array without creating a new one. Example: Input: array = [1, 2, 4, 5], element = 3,
// position = 2, Output: [1, 2, 3, 4, 5]; Input: array = [10, 20, 30], element = 25, position = 1,
// Output: [10, 25, 20, 30].

import 'dart:io';
void main(){
  List<int> arr=[];
  print("enter size of array : ");
  int n=int.parse(stdin.readLineSync()!);
  for(int i=0;i<n;i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }
  print("Enter element : ");
  int ele=int.parse(stdin.readLineSync()!);
  print("Enter position of element in the array : ");
  int pos=int.parse(stdin.readLineSync()!);
  insertAtPosition(arr,ele,pos);
}

void insertAtPosition(List<int> arr,int ele,int pos){
  arr.add(0);
  for(int i=arr.length-1;i>pos;i--){
    arr[i]=arr[i-1];
  }
  arr[pos]=ele;
  print(arr);
}