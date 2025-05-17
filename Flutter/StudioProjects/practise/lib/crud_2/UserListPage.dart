// import 'package:display_list_crud/pages/add_user_page.dart';
// import 'package:flutter/material.dart';
// @immutable
// class UserListPage extends StatefulWidget {
//   const UserListPage({super.key});
//   @override
//   State<UserListPage> createState() => _UserListPageState();
// }
//
// class _UserListPageState extends State<UserListPage> {
//   List<Map> list = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.greenAccent,
//               title: Text("User List", style: TextStyle(fontFamily: "style2"),),
//               actions: [
//                 InkWell(
//                   onTap: (){
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context)=> AddUserPage(
//                           name: null,
//                           match: null,
//                           imagePath: null,
//                         ))
//                     ).then((value){
//                       setState(() {
//                         list.add(value);
//                       });
//                     });
//                   },
//                   child: Stack(
//                       children:[
//                         Container(
//                           height: 40,
//                           width: 40,
//                           margin: EdgeInsets.only(right: 25),
//                           child: FloatingActionButton(onPressed: (){}),
//                         ),
//                         Container(
//                             margin: EdgeInsets.only(top: 7.5, left: 7.5),
//                             child: Icon(Icons.add)
//                         )
//                       ]
//                   ),
//                 )
//               ],
//             ),
//             body: Container(
//                 child: list.length > 0 ?
//                 ListView.builder(itemBuilder: (context, index){
//                   return InkWell(
//                     onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context){
//                         return AddUserPage(
//                             name: list[index]["Name"],
//                             match: list[index]["Match"],
//                             imagePath: list[index]["ImageUrl"]
//                         );
//                       })
//                       ).then((value){
//                         setState(() {
//                           list[index] = value;
//                         });
//                       });
//                     },
//                     child: Card(
//                       color: Colors.blueGrey.shade200,
//                       margin: EdgeInsets.all(15),
//                       elevation: 15,
//                       shadowColor: Colors.blue,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ListTile(
//                           leading: CircleAvatar(
//                             backgroundImage: list[index]["ImageUrl"] != "None"
//                                 ? NetworkImage(list[index]["ImageUrl"])
//                                 : AssetImage('assets/images/cricketer_logo.webp'),
//                           ),
//                           title: Text(list[index]["Name"]),
//                           subtitle: Text(list[index]["Match"]),
//                           trailing: InkWell(
//                             onTap: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return AlertDialog(
//                                     title: Text("Confirm Delete"),
//                                     content: Text("Are you sure you want to delete this user?"),
//                                     actions: [
//                                       TextButton(
//                                         onPressed: () {
//                                           Navigator.of(context).pop(); // Close the dialog without deleting
//                                         },
//                                         child: Text("Cancel", style: TextStyle(color: Colors.blue)),
//                                       ),
//                                       TextButton(
//                                         onPressed: () {
//                                           setState(() {
//                                             list.removeAt(index); // Delete the user
//                                           });
//                                           Navigator.of(context).pop(); // Close the dialog
//                                         },
//                                         child: Text("Delete", style: TextStyle(color: Colors.red)),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             },
//                             child: Container(
//                               height: 30,
//                               width: 30,
//                               child: Icon(Icons.delete_forever_outlined),
//                             ),
//                           ),
//
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                     itemCount: list.length)
//                     : Center(child: Text("User Data Is Not Available",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54, fontFamily: "style1"),)
//                 )
//             ),
//              ),
//             );
//       }
// }

import 'package:flutter/material.dart';
import '../utils/const_variable.dart';

class AddUser extends StatefulWidget {
  dynamic name;
  dynamic email;
  dynamic age;

  //CONSTRUCTOR
  AddUser({super.key, required this.name, required this.email, required this.age});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  String buttonType = '';

  void initState() {
    super.initState();
    nameController.text = widget.name ?? '' ;
    emailController.text = widget.email ?? '' ;
    ageController.text = widget.age ?? '';
    buttonType = (nameController.text == '' && emailController.text == '' && ageController.text == '' ) ? 'Add user' : 'Update user';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(buttonType),
        ),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: "Enter Name"
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "Enter Email"
                    ),
                  ),
                  TextFormField(
                    controller: ageController,
                    decoration: InputDecoration(
                        labelText: "Enter Age"
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    Map<String,dynamic> userdata = {};
                    userdata[NAME] = nameController.text.isEmpty ? "None" : nameController.text;
                    userdata[EMAIL] = emailController.text.isEmpty ? "No" : emailController.text;
                    userdata[AGE] = ageController.text.isEmpty ? "18" : ageController.text;
                    Navigator.pop(context,userdata);
                  }, child: Text(buttonType))
                ],
              ),
            ),
             ),
            );
      }
}
