//WAP to remove duplicates from a sorted integer array in-place such that each unique element
// appears only once. The relative order of the elements should be kept the same. The function
// should return the number of unique elements in the array. Example: Input: nums = [1, 1, 2],
// Output: 2, nums = [1, 2, _]; Input: nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4], Output: 5, nums = [0, 1, 2,
// 3, 4, _, _, _, _, _].


import 'dart:io';
void main(){
  print("Enter size of array : ");
  int n=int.parse(stdin.readLineSync()!);
  List<int> arr=[];
  for(int i=0;i<n;i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }
  int count=remove_duplicate(arr,n);
  print("the number of unique elements in the array : $count");
}
int remove_duplicate(List<int> arr,int n){
  int count =n;
  for(int i=0;i<arr.length;i++){
    for(int j=i+1;j<arr.length;) {
      if (arr[i] == arr[j]) {
        arr.removeAt(j);
        count--;
      }
      else{
        j++;
      }
    }
  }
  print(arr);
  return count;
}