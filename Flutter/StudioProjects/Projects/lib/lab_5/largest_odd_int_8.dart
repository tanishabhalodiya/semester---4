//WAP to find the largest odd integer (as a string) that is a non-empty substring of a given string
// num, which represents a large integer. If no odd integer exists, return an empty string "".
// Example: Input: num = "52", Output: "5"; Input: num = "4206", Output: ""; Input: num =
// "35427", Output: "35427".

import 'dart:io';
void main(){
  print("Enter string with number : ");
  String num=stdin.readLineSync()!;
  String largeOdd='';
  String str='';
  for(int i=num.length-1;i>=0;i--){
    if((int.parse(num[i])) % 2 != 0){
      largeOdd=num.substring(0,i+1);
      break;
    }
  }
  // for(int i=0;i<num.length;i++){
  //   for(int j=i+1;j<num.length;j++){
  //     str=num.substring(i,j);
  //     int n=int.parse(str);
  //     if(n % 2 != 0){
  //         if(str.length > largeOdd.length) {
  //           largeOdd=str;
  //         }
  //     }
  //   }
  // }
  print("The largest odd integer number is : $largeOdd");
}