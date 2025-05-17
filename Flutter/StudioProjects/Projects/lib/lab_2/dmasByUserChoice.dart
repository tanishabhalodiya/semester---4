import 'dart:io';

// WAP to perform Addition, Subtraction, Multiplication, Division based on user choice using if,
// if..else..if, & switch.

void main() {
  print("enter number 1 : ");
  double a = double.parse(stdin.readLineSync()!);

  print("enter number 2 : ");
  double b = double.parse(stdin.readLineSync()!);

  print(
      "enter 1 for addition , 2 for subtraction , 3 for multiplication and 4 for division : ");
  int n = int.parse(stdin.readLineSync()!);
  double ans = 0;

  switch (n) {
    case 1:
      ans = a + b;
      break;
    case 2:
      ans = a - b;
      break;
    case 3:
      ans = a * b;
      break;
    case 4:
      if (b != 0) {
        ans = a / b;
      }
      else {
        print("enter correct number");
      }
      break;
    default:
      print("invalid number");
      break;
  }
  stdout.writeln("Answer with switch case is : $ans");

  //with switch case......
  if(n==1){
    ans=a+b;
  }
  else if(n==2){
    ans=a-b;
  }
  else if(n==3){
    ans=a*b;
  }
  else{
    if(b !=0){
      ans=a/b;
    }
    else{
      print("Enter valid number");
    }
  }
  stdout.writeln("Answer with if else is : $ans");
}