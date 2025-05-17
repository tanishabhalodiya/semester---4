import 'dart:io';
void main() {
  User user=User();

  int choice;
  do{
    print("Enter choice from doing crud..."
        "\n : 1 for add user"
        "\n : 2 for list usr map"
        "\n : 3 for update user"
        "\n : 4 for delete user"
        "\n : 5 for search user"
        "\n : 6 for exit");
    choice=int.parse(stdin.readLineSync()!);

    switch(choice){
      case 1:
        stdout.writeln("You are going to add user : ");
        print("Enter name");
        String name=stdin.readLineSync()!;
        print("Enter email");
        String email=stdin.readLineSync()!;
        print("Enter age");
        int age=int.parse(stdin.readLineSync()!);
        user.addUser(name: name, email: email, age: age);
        break;
      case 2:
        stdout.writeln("You are going to update user : ");
        print("Your list is : ");
        List<Map<String,dynamic>> list=[];
        list=user.listUser();
        print(list);
        break;
      case 3:
        stdout.writeln("You are going to update user : ");
        print("Enter index to update");
        int index=int.parse(stdin.readLineSync()!);
        print("Enter name");
        String name=stdin.readLineSync()!;
        print("Enter email");
        String email=stdin.readLineSync()!;
        print("Enter age");
        int age=int.parse(stdin.readLineSync()!);
        user.updateUSer(name: name, email: email, age: age, index: index);
        break;
      case 4:
        stdout.writeln("You are going to delete user : ");
        print("Enter id to delete : ");
        int id=int.parse(stdin.readLineSync()!);
        user.deleteUSer(id: id);
        break;
      case 5:
        print("enter data to search : ");
        String searchData=stdin.readLineSync()!;
        user.searchUser(str: searchData);
        break;
      default:
        print("invalid choice");
    }
  }
  while(choice != 6);
}

class User {

  List<Map<String, dynamic>> list = [];

  void addUser({required var name, required var email, required int age}) {
    Map<String, dynamic> map = {};
    map['name'] = name;
    map['email'] = email;
    map['age'] = age;
    list.add(map);
  }

  List<Map<String, dynamic>> listUser() {
    return list;
  }

  void updateUSer(
      {required index, required name, required email, required age}) {
    Map<String, dynamic> map = {};
    map['name'] = name;
    map['email'] = email;
    map['age'] = age as int;
    list[index] = map;
  }

  void deleteUSer({required id}) {
    list.removeAt(id);
  }

  void searchUser({required str}) {
    User u = User();
    Map<String, dynamic> map = {};
    for (var ele in list) {
      if ((ele['name'].toString().toLowerCase().contains(
          str.toString().toLowerCase())) ||
          (ele['age'].toString().toLowerCase().contains(
              str.toString().toLowerCase()))||
          (ele['email'].toString().toLowerCase().contains(
              str.toString().toLowerCase()))) {
          print("is found");
      }
      else{
        print("Is not foundd");
      }
    }
  }
}

