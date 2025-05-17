import 'dart:io';
// WAP to print numbers between two given numbers which is divisible by 2 but not divisible by 3.

void main(){
  print("enter number 1: ");
  int a = int.parse(stdin.readLineSync()!);

  print("enter number 2: ");
  int b = int.parse(stdin.readLineSync()!);

  if(a>b){
    print("enter valid numbers");
    return;
  }
  print("number which divisibe by 2 but not 3 are : ");
  for(int i=a;i<=b;i++){
    if(i%2==0 && i%3!=0){
      stdout.write("$i  ");
    }
  }
}