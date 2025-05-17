//WAP to find the indices of two numbers in an integer array nums that add up to a given target.
// You may assume that each input has exactly one solution, and you cannot use the same
// element twice. The answer can be returned in any order. Example: Input: nums = [2, 7, 11,
// 15], target = 9, Output: [0, 1]; Input: nums = [3, 2, 4], target = 6, Output: [1, 2]; Input:
// nums = [3, 3], target = 6, Output: [0, 1].

import 'dart:io';
void main(){
  print("enter size of array  : ");
  int n=int.parse(stdin.readLineSync()!);

  List<int> arr=[];
  for(int i=0;i<n;i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }

  stdout.writeln("Enter target : ");
  int target=int.parse(stdin.readLineSync()!);
  List<int> res=[0,0];
  for(int i=0;i<arr.length;i++){
    for(int j=i+1;j<arr.length;j++){
        if(arr[i]+arr[j]==target){
          res[0]=i;
          res[1]=j;
          break;
        }
    }
  }
  stdout.writeln(res);
}