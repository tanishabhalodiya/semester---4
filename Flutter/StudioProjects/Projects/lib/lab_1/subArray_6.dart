//WAP to find the subarray with the largest sum from a given integer array. Example: Input: nums =
// [-2, 1, -3, 4, -1, 2, 1, -5, 4], Output: 6 (subarray [4, -1, 2, 1]).

import 'dart:io';
void main(){
  // print("enter array with negative and positive integer : ");
  List<int> arr=[-2, 1, -3, 4, -1, 2, 1, -5, 4];
  // print("enter size of array : ");
  // int? n=int.parse(stdin.readLineSync()!);
  int n=arr.length;
  int sum=0;
  int minIndex=0;
  int maxIndex=0;
  int ans=arr[0];
  for(int i=0;i<n;i++){
    sum=0;
      for(int j=i;j<n;j++) {
        sum = sum + arr[j];
        if(sum>ans){
          ans=sum;
          minIndex=i;
          maxIndex=j;
        }
      }
  }
  stdout.writeln("the subarray of the largest sum from a given integer array : $ans");
  stdout.writeln("Subarray is : ");
  stdout.write("[ ");
  for(int i=minIndex;i<=maxIndex;i++){
    stdout.write(arr[i]);
    stdout.write(" ,");
  }
  stdout.write(" ]");
}