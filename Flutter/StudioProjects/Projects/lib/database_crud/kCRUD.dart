// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class AddUser_Page extends StatefulWidget {
//   const AddUser_Page({super.key});
//
//   @override
//   State<AddUser_Page> createState() => _AddUser_PageState();
// }
//
// class _AddUser_PageState extends State<AddUser_Page> {
//   late Database _database;
//   bool isTodoExist = false;
//   // File? _image;
//   // final picker = ImagePicker();
//   List<Map<String, dynamic>> todoList = [];
//   var titleController = TextEditingController();
//   var descController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _initDatabase().then(() {
//       getAllTodos();
//       print(todoList);
//     });
//     requestPermission();
//   }
//
//   Future<void> _initDatabase() async {
//     _database = await openDatabase(
//         join(
//             await getDatabasesPath(),
//             'myTodo.db'
//         ),
//         onCreate: (db, version) {
//           return db.execute("CREATE TABLE TODO"
//               "(ID INTEGER PRIMARY KEY AUTOINCREMENT,"
//               "TITLE TEXT,"
//               "DESCRIPTION TEXT)"
//           );
//         },
//         version: 1
//     );
//   }
//
//   Future<void> getAllTodos() async {
//     List<Map<String, dynamic>> todos = await _database.query('TODO');
//     setState(() {
//       todoList = todos;
//     });
//   }
//
//   Future<bool> addTodo({required title, required desc}) async {
//     int newTodo = await _database.insert('TODO', {'TITLE': title, 'DESCRIPTION': desc});
//     if (newTodo > 0) {
//       await getAllTodos();
//     }
//     return newTodo > 0;
//   }
//
//   Future<bool> updateTodo({required todoId, required title, required desc}) async {
//     int updateTodo = await _database.update('TODO', {
//       'TITLE': title,
//       'DESCRIPTION': desc
//     },
//         where: 'ID = ?',
//         whereArgs: [todoId]
//     );
//     if (updateTodo > 0) {
//       await getAllTodos();
//     }
//     return updateTodo > 0;
//   }
//
//   Future<bool> deleteTodo({required int deleteTodoID}) async {
//     int deleted = await _database.delete(
//       'TODO',
//       where: 'ID = ?',
//       whereArgs: [deleteTodoID],
//     );
//     if (deleted > 0) {
//       await getAllTodos();
//     }
//     return deleted > 0;
//   }
//
//   void openModelBottomSheet(BuildContext context, {int? todoID, String? todoTitle, String? todoDesc}) {
//     isTodoExist = (todoID != null) ? true : false;
//     String pageTitle = isTodoExist ? 'Update Todo' : 'Add New Todo';
//
//     if (isTodoExist) {
//       titleController.text = todoTitle.toString();
//       descController.text = todoDesc.toString();
//     }
//
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext context) {
//           return Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(pageTitle, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
//                 TextFormField(
//                   controller: titleController,
//                   decoration: InputDecoration(
//                       labelText: "Enter Title",
//                       hintText: 'Title',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide(
//                           color: Colors.blue,
//                           width: 1.0,
//                         ),
//                       )
//                   ),
//                 ),
//                 TextFormField(
//                   controller: descController,
//                   decoration: InputDecoration(
//                       labelText: "Enter Description",
//                       hintText: 'Description',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide(
//                           color: Colors.blue,
//                           width: 1.0,
//                         ),
//                       )
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (titleController.text.isNotEmpty && descController.text.isNotEmpty) {
//                       if (isTodoExist) {
//                         updateTodo(
//                             todoId: todoID,
//                             title: titleController.text,
//                             desc: descController.text
//                         );
//                       } else {
//                         addTodo(
//                             title: titleController.text,
//                             desc: descController.text
//                         );
//                       }
//                       getAllTodos();
//                       titleController.text = '';
//                       descController.text = '';
//                       Navigator.pop(context);
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text("Fill all fields", style: TextStyle(color: Colors.white, fontSize: 12)),
//                             backgroundColor: Colors.redAccent,
//                           )
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.greenAccent,
//                       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5)
//                   ),
//                   child: Text(pageTitle, style: TextStyle(fontSize: 14, color: Colors.white)),
//                 )
//               ],
//             ),
//           );
//         }
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: Text("Database Demo", style: TextStyle(color: Colors.white)),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             return openModelBottomSheet(
//                 context,
//                 todoID: null,
//                 todoTitle: titleController.text,
//                 todoDesc: descController.text
//             );
//           },
//           child: Icon(CupertinoIcons.add, size: 30, color: Colors.green),
//         ),
//         body: todoList.isNotEmpty ? ListView.builder(
//             itemCount: todoList.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
//                 child: Card(
//                   color: Colors.white,
//                   elevation: 5,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ListTile(
//                       leading: InkWell(
//                         onTap: (){
//                           getImage();
//                         },
//                         child: CircleAvatar(
//                           radius: 22,
//                           backgroundColor: Colors.indigo.shade100,
//                           child: _image == null ?
//                           Icon(Icons.ac_unit_sharp)
//                               : Container(
//                             height: 45,
//                             width: 45,
//                             child: Image.file(_image!,fit: BoxFit.cover,),
//                           ),
//                         ),
//                       ) ,
//                       title: Text(todoList[index]['TITLE']),
//                       subtitle: Text(todoList[index]['DESCRIPTION']),
//                       trailing:
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           // Edit Button
//                           IconButton(
//                             onPressed: () {
//                               openModelBottomSheet(
//                                   context,
//                                   todoID: todoList[index]['ID'],
//                                   todoTitle: todoList[index]['TITLE'],
//                                   todoDesc: todoList[index]['DESCRIPTION']
//                               );
//                             },
//                             icon: Icon(Icons.edit, color: Colors.blue),
//                           ),
//                           // Delete Button
//                           IconButton(
//                             onPressed: () {
//                               showCupertinoDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return CupertinoAlertDialog(
//                                     title: Text("Delete Todo"),
//                                     content: Text("Are you sure you want to delete this todo?"),
//                                     actions: [
//                                       CupertinoDialogAction(
//                                         child: Text('Cancel'),
//                                         onPressed: () {
//                                           Navigator.of(context).pop();
//                                         },
//                                       ),
//                                       CupertinoDialogAction(
//                                         child: Text('Delete'),
//                                         onPressed: () {
//                                           deleteTodo(deleteTodoID: todoList[index]['ID']);
//                                           getAllTodos();
//                                           setState(() {});
//                                           Navigator.of(context).pop();
//                                         },
//                                         isDestructiveAction: true,
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             },
//                             icon: Icon(Icons.delete_forever_rounded, color: Colors.red.shade700),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }
//         ) : Center(child: Text("No Todos Found")),
//       ),
//     );
//   }
// }