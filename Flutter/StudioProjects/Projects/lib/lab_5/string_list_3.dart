//WAP that creates List with following value:“Delhi”, “Mumbai”, “Bangalore”, “Hyderabad” and
// “Ahmedabad” Replace “Ahmedabad” with “Surat” in above List.

import 'dart:io';
void main(){
  print("enter size of list : ");
  int n=int.parse(stdin.readLineSync()!);
  print("Enter list of String  : ");
  List<String> l1=[];
  for(int i=0;i<n;i++){
    l1.add(stdin.readLineSync()!);
  }
  print("enter the word to replace : ");
  String word=stdin.readLineSync()!;
  print("enter the change word : ");
  String rep=stdin.readLineSync()!;
  if(l1.contains(word)){
    int i=l1.indexOf(word);
    print(i);
    l1[i]=rep;
  }
  stdout.writeln("Replaced list is : ");
  stdout.writeln(l1);
}