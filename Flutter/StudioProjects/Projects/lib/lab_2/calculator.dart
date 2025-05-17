// WAP to make a Simple Calculator using switch...case
import 'dart:io';
// import 'package:stack/stack.dart';

// void main(){
//   print("Enter number a and b with operator you want to perform : ");
//   String str=(stdin.readLineSync()!);
//   str.trim();
//
//   Stack<String> char=Stack();
//   int len=str.length;
//
//   int? value=0;
//   for(int i=0;i<len;i++){
//     String s=str[i];
//
//     //check coming later is number or not
//     if(int.tryParse(s) != null) {
//       char.push(s);
//     }
//     else{
//       int? op2=int.parse(char.pop());
//       int? op1=int.parse(char.pop());
//       value=operation(op1,op2,s);
//     }
//   }
// }
// int? operation(int op1,int op2,String s){
//   int n=0;
//   switch(s){
//     case '+': n=op1+op2;
//               return n;
//               break;
//     case '-': n=op1-op2;
//               return n;
//               break;
//     case '*': n=op1*op2;
//               return n;
//               break;
//     case '/':
//         if (op2 != 0) {
//           n = (op1~/op2);
//           return n;
//         }
//         else {
//           print("enter correct number");
//         }
//         break;
//     case '^':
//       n=1;
//       for(int i=0;i<op2;i++){
//         n=n*op1;
//       }
//       return n;
//     default:
//       return 0;
//   }
// }

void main() {
  print("Enter number a and b with operator you want to perform : ");
  String str = (stdin.readLineSync()!);
  int len = str.length;

  List<String> list = [];
  double ans = 0;

  for (int i = 1; i < len; i++) {
    list.add(str[i]);
    String op = list[i];
    if (op == '*' || op == '/') {
      double n1 = double.parse(list[i - 1]);
      double n2 = double.parse(list[i + 1]);

      switch (op) {
        case '*':
          ans = n1 * n2;
          break;
        case '/':
          if (n2 != 0) {
            ans = (n1 / n2);
          }
          else {
            print("enter correct number");
          }
          break;
      }
    }
  }
    for(int i=1;i<len;i++) {
      String op = list[i];
      double n1 = double.parse(list[i - 1].toString());
      switch (op) {
        case '+': ans+=n1;
              break;
        case '-': ans-=n1;
              break;
      }
    }
  print(ans);
}
