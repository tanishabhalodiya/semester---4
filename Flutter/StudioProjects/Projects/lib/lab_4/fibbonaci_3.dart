// WAP to generate Fibonacci series of N given number using method.
import 'dart:io';

void main(){
  print("enter number : ");
  int n=int.parse(stdin.readLineSync()!);
  print("fibbonaci series : ");
  fibbonaci(n);
}
void fibbonaci(int n){
  int first=0;
  int second=1;
  int sum=0;
  stdout.write(" $first + $second +");

    for (int i = 3; i <= n; i++) {
      sum = first + second;
      stdout.write(" $sum + ");
      first = second;
      second = sum;
    }
}