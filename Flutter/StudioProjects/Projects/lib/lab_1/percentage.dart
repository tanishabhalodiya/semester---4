import 'dart:io';

// WAP to find percentage of 5 subject.

void main(){
  int sum=0;
  for(int i=1;i<=5;i++){
    print("enter marks of subject  : ");
    sum+=int.parse(stdin.readLineSync()!);
  }
  double ?per=(sum/500)*100;
  stdout.write("percentage is : " + per.toStringAsFixed(2)+"%");
}