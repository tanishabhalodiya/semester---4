//WAP to remove duplicates from a list of integers. Return a new list that contains only the
// unique elements, with duplicates removed, using a map. Example: Input: nums = [1, 2, 2, 3,
// 4, 4], Output: [1, 2, 3, 4].

import 'dart:io';
void main(){
  print("enter size of list : ");
  int n=int.parse(stdin.readLineSync()!);
  List<int> list=[];
  List<int> res=list;
  for(int i=0;i<n;i++){
    list.add(int.parse(stdin.readLineSync()!));
  }

  for(int i=0;i<list.length;i++){
    for(int j=i+1;j<list.length;) {
      if (list[i] == list[j]) {
        res.removeAt(j);
      }
      else{
        j++;
      }
    }
  }
  print("array only c"
      "ontains unique elements is : ");
  print(res);
}