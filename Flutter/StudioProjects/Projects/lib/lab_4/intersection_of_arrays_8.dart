//WAP to find the intersection of two integer arrays, nums1 and nums2. Each element in the
// result should appear as many times as it appears in both arrays, and the result should be
// returned in sorted order. Example: Input: nums1 = [1, 2, 2, 1], nums2 = [2, 2], Output: [2, 2];
// Input: nums1 = [4, 9, 5], nums2 = [9, 4, 9, 8, 4], Output: [4, 9].

import 'dart:io';
void main(){
  print("Enter size of array 1 : ");
  int n=int.parse(stdin.readLineSync()!);
  List<int> arr1=[n];
  for(int i=0;i<n;i++){
    arr1.add(int.parse(stdin.readLineSync()!));
  }

  print("Enter size of array 2 : ");
  int m=int.parse(stdin.readLineSync()!);
  List<int> arr2=[m];
  for(int i=0;i<m;i++){
    arr2.add(int.parse(stdin.readLineSync()!));
  }
  List<int> res=[];
  for(int i=0;i<n;i++){
    if(arr2.contains(arr1[i])){
      res.add(arr1[i]);
    }
  }
  print("The resulted array with intersection of two arrays is : ");
  print(res);
}
