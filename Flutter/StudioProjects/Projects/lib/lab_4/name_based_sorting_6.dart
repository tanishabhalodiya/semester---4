//
// WAP to sort an array of names based on the corresponding heights in descending order. The
// names and heights are given as two separate arrays, and the heights are distinct positive
// integers. Example: Input: names = ["Mary","John","Emma"], heights = [180,165,170], Output:
// ["Mary","Emma","John"]; Input: names = ["Alice","Bob","Bob"], heights = [155,185,150],
// Output: ["Bob","Alice","Bob"].

import 'dart:io';
void main(){
  print("enter size of lists : ");
  int n=int.parse(stdin.readLineSync()!);
  print("enter first list of string : ");
  List<String> names=[];
  List<int> heights=[];
  for(int i=0;i<n;i++){
    print("enter name : ");
    names.add(stdin.readLineSync()!);
    print("enter height : ");
    heights.add(int.parse(stdin.readLineSync()!));
  }
  print(names);
  print(heights);
  print("after sorting based on height : ");
  for(int i=0;i<n;i++){
    int max=heights[i];
    for(int j=i;j<n;j++){
      if(max<heights[j]) {
        String swap=names[i];
        names[i]=names[j];
        names[j]=swap;
        break;
      }
    }
  }
  print(names);
}