//WAP to accept a number and check whether the number is prime or not. Use method name
// check (int n). The method returns 1, if the number is prime otherwise, it returns 0.
import 'dart:io';

void main(){
  print("enter number : ");
  int? n = int.parse(stdin.readLineSync()!);
  print("if number is prime retuen 1 otherwise 0");
  int ans=check(n);
  print("ans is $ans");
}
int check(int n){
  for(int i=2;i<= n/2 ;i++){
    if(n%i==0){
      return 0;
    }
  }
  return 1;
}