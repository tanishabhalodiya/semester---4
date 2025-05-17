// WAP to read marks of five subjects. Calculate percentage and print class accordingly. Fail
// below 35, Pass Class between 35 to 45, Second Class between 45 to 60, First Class between 60
// to 70, Distinction if more than 70.
import 'dart:io';
void main(){
  List<int> arr=[5];
  int sum=0;
  for(int i=0;i<5;i++){
    print("enter mark of subject $i : ");
    arr[i]=int.parse(stdin.readLineSync()!);
    arr.add(arr[i]);
    sum=sum+arr[i];
  }
  double per = (sum/500) * 100;
  if(per < 35){
    print("Failll");
  }
  else if(per >= 35 && per < 45){
    print("Pass class");
  }
  else if(per >=45 && per <60){
    print("Second class");
  }
  else if(per >=60 && per < 70){
    print("First class");
  }
  else{
    print("Distinction class");
  }
}
