//WAP to print reverse string.
import 'dart:io';
void main(){
  print("Enter a string : ");
  String str=stdin.readLineSync()!;

  String rev='';
  for(int i=str.length-1;i>=0;i--){
    rev=rev+str[i];
  }
  rev=rev.toString();
  stdout.writeln("Reverse string of $str is $rev");
}
