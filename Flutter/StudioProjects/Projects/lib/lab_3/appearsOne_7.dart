//WAP to find the element that appears only once in a non-empty array of integers, where every
// other element appears twice. The solution should have linear runtime complexity and use only
// constant extra space. Example: Input: nums = [2, 2, 1], Output: 1; Input: nums = [4, 1, 2, 1, 2],
// Output: 4; Input: nums = [1], Output: 1.

import 'dart:io';
void main(){
  List<int> arr=[];
  print("enter size of array : ");
  int n=int.parse(stdin.readLineSync()!);
  for(int i=0;i<n;i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }
  minority(arr,n);
}
void minority(List<int> arr,int n){
  int result=arr[0];
  int count=1;
  for(int i=1;i<n-1;i++){
    if(arr[i]==result){
      count++;
    }
    else{
      count--;
    }
    if(count>=2){
      result=arr[i+1];
      count=1;
    }
  }
  stdout.writeln("element appears once in array is : $result");
}