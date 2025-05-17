// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:projects/crud/design/add_edit/user_entry_form.dart';
// //
// // import '../../abc/user.dart';
// // import '../../utils/string_const.dart';
// //
// // class UserListPage extends StatefulWidget {
// //   const UserListPage({super.key});
// //
// //   @override
// //   State<UserListPage> createState() => _UserListPageState();
// // }
// //
// // class _UserListPageState extends State<UserListPage> {
// //   User _user=User();
// //   bool isGrid = false;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //
// //       appBar: AppBar(
// //         title: Text(
// //           'USER LIST',
// //           style: TextStyle(
// //             fontSize:20,
// //             color: Colors.black,
// //           ),
// //         ),
// //         actions: [
// //           IconButton(
// //               onPressed: () {
// //                 setState(() {
// //                   isGrid = false;
// //                 });
// //               },
// //               icon: Icon(
// //                 Icons.list,
// //                 color: Colors.black,
// //               )
// //           ),
// //           IconButton(
// //               onPressed: () {
// //                 setState(() {
// //                   isGrid = true;
// //                 });
// //               },
// //               icon: Icon(
// //                 Icons.grid_3x3,
// //                 color: Colors.black,
// //               )
// //           ),
// //           IconButton(
// //               onPressed: (){
// //                 Navigator.push(context, MaterialPageRoute(
// //                     builder: (context){
// //                       return UserEntryFormPage();
// //                     },
// //                 )).then((value){
// //                   _user.userList.add(value);
// //                   setState(() {});
// //                 });
// //
// //               },
// //               icon: Icon(
// //                 Icons.add,
// //                 color: Colors.black,
// //               )
// //           ),
// //         ],
// //       ),
// //       body: Column(
// //         mainAxisSize: MainAxisSize.max,
// //         children: [
// //           TextFormField(
// //             onChanged: (value) {
// //               print('::CHANGE VALUE :: $value');
// //             },
// //           ),
// //           _user.userList.isEmpty
// //               ? Expanded(
// //             child: Center(
// //                 child: Text(
// //                   'No User Found',
// //                   style: TextStyle(color: Colors.grey, fontSize: 15),
// //                 )),
// //           )
// //               : (isGrid
// //               ? GridView.builder(
// //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                 crossAxisCount: 4),
// //             itemBuilder: (context, index) {
// //               print(':::GRID ITEM BUILDER CALLED:::$index');
// //               return getListGridItem(index);
// //             },
// //             itemCount: _user.userList.length,
// //             // children: getListItem(),
// //           )
// //               : Expanded(
// //             child: ListView.builder(
// //               itemBuilder: (BuildContext context, int index) {
// //                 print(':::LISTVIEW ITEM BUILDER CALLED:::$index');
// //                 return getListGridItem(index);
// //               },
// //               itemCount: _user.userList.length,
// //             ),
// //           )),
// //         ],
// //       ),
// //     );
// // }
// //
// //   List<Widget> getListItem() {
// //     List<Widget> widgets = [];
// //     for (int i = 0; i < _user.userList.length; i++) {
// //       print(':::GRID ITEM BUILDER CALLED:::$i');
// //       widgets.add(getListGridItem(i));
// //     }
// //     return widgets;
// //   }
// //
// //   Widget getListGridItem(i) {
// //     return Card(
// //       elevation: 10,
// //       child: ListTile(
// //         onTap: () {},
// //         leading: Image.asset('assets/images/girl.png'),
// //         trailing: Wrap(
// //           alignment: WrapAlignment.center,
// //           direction: Axis.horizontal,
// //           children: [
// //             IconButton(
// //               onPressed: () {
// //                 showDialog(
// //                   context: context,
// //                   builder: (context) {
// //                     return CupertinoAlertDialog(
// //                       title: Text('DELETE'),
// //                       content: Text('Are you sure want to delete?'),
// //                       actions: [
// //                         TextButton(
// //                           onPressed: () {
// //                             _user.deleteUser(i);
// //                             Navigator.pop(context);
// //                             setState(() {});
// //                           },
// //                           child: Text('yes'),
// //                         ),
// //                         TextButton(
// //                           onPressed: () {
// //                             Navigator.pop(context);
// //                           },
// //                           child: Text('No'),
// //                         )
// //                       ],
// //                     );
// //                   },
// //                 );
// //               },
// //               icon: Icon(
// //                 Icons.delete,
// //                 color: Colors.red,
// //                 size: 25,
// //               ),
// //             ),
// //             Icon(
// //               Icons.arrow_forward_ios,
// //               color: Colors.grey.shade500,
// //             ),
// //           ],
// //         ),
// //         title: Wrap(
// //           direction: Axis.vertical,
// //           children: [
// //             Text(
// //               '${_user.userList[i][NAME]}',
// //               style: TextStyle(fontSize: 25, color: Colors.black),
// //             ),
// //             Text(
// //               '${_user.userList[i][CITY]} | ${_user.userList[i][EMAIL]}',
// //               style: TextStyle(fontSize: 20, color: Colors.grey),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:crud/pages/addUser.dart';
// import 'package:flutter/material.dart';
// import '../utils/const_variable.dart';
//
// class UserList extends StatefulWidget {
//   UserList({super.key});
//
//   @override
//   State<UserList> createState() => _UserListState();
// }
//
// class _UserListState extends State<UserList> {
//   List<Map<String,dynamic>> users = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blueAccent,
//           title: Text("User List"),
//           actions: [
//             IconButton(onPressed: (){
//               Navigator.push(context,
//                   MaterialPageRoute(
//                       builder: (context)=>AddUser(
//                         name: null,
//                         email: null,
//                         age: null,
//                       ))
//               ).then((value){
//                 setState(() {
//                   if(value != null){
//                     users.add(value);
//                   }
//                 });
//               });
//
//             }, icon: Icon(Icons.add_box))
//           ],
//         ),
//         body: users.length > 0 ? (
//             Container(
//               child: ListView.builder(itemBuilder: (context,index){
//                 return InkWell(
//                     onTap: (){
//                       Navigator.push(context,
//                           MaterialPageRoute(
//                               builder: (context)=>AddUser(
//                                   name: users[index][NAME],
//                                   email: users[index][EMAIL],
//                                   age: users[index][AGE]
//                               )
//                           )).then((value){
//                         if(value != null){
//                           setState(() {
//                             users[index] = value;
//                           });
//                         }
//                       });
//                     },
//                     child: Card(
//                       color: Colors.grey.shade200,
//                       child: ListTile(
//                         leading: Icon(Icons.person),
//                         title: Text(users[index][NAME]),
//                         subtitle: Text(users[index][EMAIL]),
//                         trailing: Text(users[index][AGE]),
//                       ),
//                     )
//                 );
//               },
//                 itemCount: users.length,
//               ),
//             )
//         ) : Center(
//             child: (
//                 Text("User data is not available")
//             ),
//             )
//         );
//     }
// }
//
//
//
//
//
//
//
//
//
//
// //
// //
// // import 'package:flutter/material.dart';
// // import 'package:crud/pages/addUser.dart';
// // import '../utils/const_variable.dart';
// //
// // class UserList extends StatefulWidget {
// //   UserList({super.key});
// //
// //   @override
// //   State<UserList> createState() => _UserListState();
// // }
// //
// // class _UserListState extends State<UserList> {
// //   List<Map<String, dynamic>> users = [];
// //   List<Map<String, dynamic>> searchUserList = [];
// //   List<Map<String, dynamic>> currentList = [];
// //   var searchText = TextEditingController();
// //
// //   void searchUser({required String searchText}) {
// //     if (searchText.isEmpty) {
// //       setState(() {
// //         searchUserList.clear();
// //         currentList = users; // Full list of users
// //       });
// //       return;
// //     }
// //
// //     searchUserList.clear(); // Clear previous search results
// //
// //     // Filter the list based on search criteria
// //     for (int i = 0; i < users.length; i++) {
// //       if (users[i][NAME]
// //           .toString()
// //           .toLowerCase()
// //           .contains(searchText.toLowerCase()) ||
// //           users[i][EMAIL]
// //               .toString()
// //               .toLowerCase()
// //               .contains(searchText.toLowerCase()) ||
// //           users[i][AGE]
// //               .toString()
// //               .toLowerCase()
// //               .contains(searchText.toLowerCase())) {
// //         searchUserList.add(users[i]);
// //       }
// //     }
// //
// //     setState(() {
// //       currentList = searchUserList; // Update displayed list with filtered results
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Colors.blueAccent,
// //           title: Text("User List"),
// //           actions: [
// //             IconButton(
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => AddUser(
// //                       name: null,
// //                       email: null,
// //                       age: null,
// //                     ),
// //                   ),
// //                 ).then((value) {
// //                   setState(() {
// //                     if (value != null) {
// //                       users.add(value); // Add new user to the list
// //                       currentList = users; // Reset to the full list
// //                     }
// //                   });
// //                 });
// //               },
// //               icon: Icon(Icons.add_box),
// //             ),
// //           ],
// //         ),
// //         body: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               children: [
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       flex: 3,
// //                       child: TextFormField(
// //                         controller: searchText,
// //                         decoration: InputDecoration(
// //                           prefixIcon: Icon(Icons.search),
// //                           labelText: "Search here...",
// //                           border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(25.0),
// //                           ),
// //                         ),
// //                         onChanged: (text) {
// //                           searchUser(searchText: text); // Trigger search on text change
// //                         },
// //                       ),
// //                     ),
// //                     SizedBox(width: 16),
// //                     // Search button to clear text or reset search
// //                     Expanded(
// //                       flex: 1,
// //                       child: ElevatedButton(
// //                         onPressed: () {
// //                           setState(() {
// //                             searchText.clear(); // Clear the text field
// //                             currentList = users; // Show all users
// //                           });
// //                         },
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: Colors.blueAccent,
// //                           padding: EdgeInsets.symmetric(vertical: 15),
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(20),
// //                           ),
// //                         ),
// //                         child: Text("Clear"),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(height: 20),
// //                 currentList.isNotEmpty
// //                     ? Expanded(
// //                   child: ListView.builder(
// //                     itemCount: currentList.length,
// //                     itemBuilder: (context, index) {
// //                       return GestureDetector(
// //                         onTap: () {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) => AddUser(
// //                                 name: currentList[index][NAME],
// //                                 email: currentList[index][EMAIL],
// //                                 age: currentList[index][AGE],
// //                               ),
// //                             ),
// //                           ).then((value) {
// //                             if (value != null) {
// //                               setState(() {
// //                                 currentList[index] = value; // Update user data
// //                               });
// //                             }
// //                           });
// //                         },
// //                         child: Card(
// //                           elevation: 4,
// //                           shadowColor: Colors.black54,
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(15),
// //                           ),
// //                           margin: EdgeInsets.symmetric(vertical: 5),
// //                           color: Colors.teal.shade100,
// //                           child: ListTile(
// //                             contentPadding: EdgeInsets.all(10),
// //                             leading: Icon(Icons.person,size: 40, color: Colors.blueAccent),
// //                             title: Text(
// //                               currentList[index][NAME],
// //                               style: TextStyle(
// //                                 fontWeight: FontWeight.bold,
// //                                 fontSize: 18,
// //                               ),
// //                             ),
// //                             subtitle: Text(
// //                               currentList[index][EMAIL],
// //                               style: TextStyle(color: Colors.grey),
// //                             ),
// //                             trailing: Text(
// //                               currentList[index][AGE],
// //                               style: TextStyle(
// //                                 fontSize: 16,
// //                                 color: Colors.blueAccent,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 )
// //                     : Center(
// //                   child: Text(
// //                     "User data is not available",
// //                     style: TextStyle(fontSize: 18, color: Colors.grey),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //              ),
// //             );
// //       }
// // }
