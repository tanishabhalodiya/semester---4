import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseCrud extends StatefulWidget {
  const DatabaseCrud({super.key});

  @override
  State<DatabaseCrud> createState() => _DatabaseState();
}

class _DatabaseState extends State<DatabaseCrud> {
  //making object of class DATABASE
  late Database _database;
  bool isExist = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  //making main list of user
  List<Map<String, dynamic>> data = [];

  //making database if it exits then do change into this otherwise create new databasec
  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'myDatabse.db'),
      onCreate: (db, version) {
        return db.execute(
            'create table myTable(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,desc TEXT)');
      },
      version: 1,
    );
  }

  Future<void> _fetchData() async {
    List<Map<String, dynamic>> userdata = await _database.query('myTable');
    setState(() {
      data = userdata;
    });
    print(data);
  }

  //adding data
  Future<void> _addData({required String title, required String desc}) async {
    await _database.insert('myTable', {'title': title, 'desc': desc});
    print('data is added');
    _fetchData();
  }

  Future<void> _deleteData({required int id}) async {
    await _database.delete(
      'myTable',
      where: 'id=?',
      whereArgs: [id],
    );
    _fetchData();
  }

  Future<void> _updateData({required int? id,required String newTitle,required String newDesc}) async {
    await _database.update(
      'myTable',
      {'title': newTitle, 'desc': newDesc},
      where: 'id=?',
      whereArgs: [id],
    );
    print('Data is updated');
    await _fetchData();
  }
  
  @override
  void initState() {
    super.initState();
    _initDatabase().then((_){
      _fetchData();
    });
  }

  void openModelBottomSheet(BuildContext context, {required int? id,required String? title,required String? desc}) {
    isExist = (id != null) ? true : false;
    String buttonName = isExist ? 'Update' : 'Add';

    if (isExist) {
      titleController.text = title.toString();
      descController.text = desc.toString();
    }

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: "Enter Title",
                      hintText: 'Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      )),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: descController,
                  decoration: InputDecoration(
                      labelText: "Enter Description",
                      hintText: 'Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      )),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      if(isExist){
                        _updateData(
                          id:id,
                          newTitle: titleController.text,
                          newDesc: descController.text,
                        );
                      }
                      else{
                        _addData(
                            title: titleController.text,
                            desc: descController.text
                        );
                      }
                      _fetchData();
                      titleController.text = '';
                      descController.text = '';
                      Navigator.pop(context);
                    },
                    child: Text(buttonName))
              ],
            ),
          );
        });
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD WITH DATABASE'),
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
      return openModelBottomSheet(
          context,
          id: null,
          title: titleController.text,
          desc: descController.text,
      );
    },
      child: Icon(CupertinoIcons.add, size: 30),
      ),

      body: data.isNotEmpty ?
          ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    title: Text(data[index]['title']),
                    subtitle: Text(data[index]['desc']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Edit Button
                        IconButton(
                          onPressed: () {
                            openModelBottomSheet(
                                context,
                                id: data[index]['id'],
                                title: data[index]['title'],
                                desc: data[index]['desc']
                            );
                          },
                          icon: Icon(Icons.mode_edit_outline),
                        ),
                        // Delete Button
                        IconButton(
                          onPressed: () {
                            showCupertinoDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  title: Text("Delete"),
                                  content: Text("Are you sure you want to delete this?"),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    CupertinoDialogAction(
                                      child: Text('yes'),
                                      onPressed: () {
                                        _deleteData(id: data[index]['id']);
                                        _fetchData();
                                        setState(() {});
                                        Navigator.of(context).pop();
                                      },
                                      isDestructiveAction: true,
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(CupertinoIcons.delete_solid),
                        ),
                      ],
                    ),
                  ),
                );
              }
          )
      :Center(child: Text("No data Found")),
    );
  }
}
