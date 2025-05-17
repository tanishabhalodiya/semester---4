//WAP to read 2 list and return list that contains only the elements that are common between
// them.

import 'dart:io';

void main(){
  print("enter size of list 1 : ");
  int n=int.parse(stdin.readLineSync()!);
  print("enter size of list 2 : ");
  int m=int.parse(stdin.readLineSync()!);
  List<int> l1=[n];
  List<int> l2=[m];
  print("enter list 1 : ");
  for(int i=0;i<n;i++){
    l1.add(int.parse(stdin.readLineSync()!));
  }
  print("Enter list 2 : ");
  for(int i=0;i<m;i++){
    l2.add(int.parse(stdin.readLineSync()!));
  }
  stdout.writeln("Common elements are : ");

  List<int> common=(l1.toSet().intersection(l2.toSet())).toList();

  print(common);
  for(int i=0;i<n;i++){
    if(l2.contains(l1[i])){
      stdout.write(" ${l1[i]} , ");
    }
  }
}