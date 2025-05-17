//WAP to find friends detail by their name using dictionary. (Create local dictionary and search
// from it using Map<String,Object?> & Model Class).

import 'dart:io';
void main(){
  Map<String,Object> contacts={};
  print("enter the size of map : ");;
  int n=int.parse(stdin.readLineSync()!);
  print("enter map : ");
  String? name;
  for(int i=0;i<n;i++){
    print("enter name : ");
    name=stdin.readLineSync()!;
    print("enter $i th entry -----------------: ");
    print("enter age : ");
    int age=int.parse(stdin.readLineSync()!);
    print("enter mail : ");
    String gmail=stdin.readLineSync()!;
    print("enter number : ");
    int num=int.parse(stdin.readLineSync()!);
    contacts[name]=Friend(age:age, gmail:gmail ,number:num);
  }

  print("enter name to find details of friend : ");
  String str=stdin.readLineSync()!;

  //instance of map
  Friend f=contacts[str] as Friend;
  if(contacts.containsKey(str)){
    print("Th detail of $str is : ");
    print(f.age);
    print(f.gmail);
    print(f.number);
  }
}

class Friend{
  late int age;
  late int number;
  late String gmail;

  Friend({required int age,required int number,required String gmail }){
    this.age=age;
    this.number=number;
    this.gmail=gmail;
  }
}
