//WAP to find maximum number from given two numbers using method.
import 'dart:io';
void main(){
  print("enter number 1 : ");
  int? n1=int.parse(stdin.readLineSync()!);
  print("enter number 2 : ");
  int? n2=int.parse(stdin.readLineSync()!);
  int max=maximum(n1:n1,n2);
  print("maximum number is : $max");
}
int maximum(int? n2,{int? n1}){
  if(n1! > n2!){
    return n1;
  }
  else{
    return n2;
  }
}