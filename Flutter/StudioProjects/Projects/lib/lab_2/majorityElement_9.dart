//WAP to find the majority element in a given array, where the majority element is the one that
// appears more than [n / 2] times. You may assume that the majority element always exists in
// the array. Example: Input: nums = [3, 2, 3], Output: 3; Input: nums = [2, 2, 1, 1, 1, 2, 2], Output: 2.

import 'dart:io';
void main(){
  List<int> arr=[];
  print("enter size of array : ");
  int n=int.parse(stdin.readLineSync()!);
  for(int i=0;i<n;i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }
  majority(arr,n);
}
void majority(List<int> arr,int n){
  int result=arr[0];
  int count=1;
  for(int i=0;i<n;i++){
      if(arr[i]==result){
        count++;
      }
      else{
        count--;
      }
      if(count==0){
        result=arr[i];
        count=1;
      }
  }
  stdout.writeln("majority element in array is : $result");
}
