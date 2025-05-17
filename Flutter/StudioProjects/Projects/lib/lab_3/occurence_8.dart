//WAP to count the occurrences of each word in a given sentence. Return a map where the keys
// are the words, and the values are the number of occurrences of each word. Example: Input:
// "this is a test this is a", Output: {'this': 2, 'is': 2, 'a': 2, 'test': 1}.

import 'dart:io';
void main(){
  print("enter string : ");
  String str=stdin.readLineSync()!;
  int n=str.length;
  Map<String,int> map={};
  int count=1;
  List<String> words=str.split(" ");
  for(int i=0;i<words.length;i++){
    if(map.containsKey(words[i])){
      count=map[words[i]]! + 1;
      map[words[i]]=count;
    }
    else{
      map[words[i]]=1;
    }
  }
  print("Output : ");
  stdout.writeln(map);
}