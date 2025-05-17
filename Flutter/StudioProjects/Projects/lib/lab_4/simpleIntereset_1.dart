//WAP to calculate simple interest using method.
import 'dart:io';
void main(){
  print("enter principle amount : ");
  double p=double.parse(stdin.readLineSync()!);
  print("enter rate of amount : ");
  double r=double.parse(stdin.readLineSync()!);
  print("enter year : ");
  double t=double.parse(stdin.readLineSync()!);
  double? ans=interest(p,r,t);
  print("The simple interest : $ans");
}
double? interest(double p,double r,double t){
  double? interest=(p*r*t)/100;
  return interest;
}