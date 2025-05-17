//WAP to find all the prime numbers within a given range [start, end]. Example: Input: start = 10,
// end = 20, Output: [11, 13, 17, 19]; Input: start = 1, end = 10, Output: [2, 3, 5, 7].

import 'dart:io';
void main(){
  print("enter the first number of range : ");
  int n1=int.parse(stdin.readLineSync()!);
  print("enter the last number of range : ");
  int n2=int.parse(stdin.readLineSync()!);


  for (int i = n1; i <= n2; i++) {
    int count=0;
    if (i <= 1) {
      i++;
    }
    for (int j = 2; j <= (i / 2); j++) {
      if (i % j == 0) {
        count=1;
        break;
      }
    }

    if (count==0) {
      stdout.write("$i , "); // Print the prime number
    }
  }
}