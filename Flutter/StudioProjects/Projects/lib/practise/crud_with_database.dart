import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CrudWithDatabase extends StatefulWidget {
  const CrudWithDatabase({super.key});

  @override
  State<CrudWithDatabase> createState() => _CrudWithDatabaseState();
}

class _CrudWithDatabaseState extends State<CrudWithDatabase> {
  late Database database;
  List<Map<String, dynamic>> dataList = [];
  TextEditingController nameController = TextEditingController();

  Future<void> initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'localDatabase'),
      onCreate: (db, version) {
        return db.execute('CREATE TABLE localTable(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)');
      },
      version: 1,
    );
    fetchData();
  }
  Future<void> fetchData() async {
    List<Map<String, dynamic>> data = await database.query('localTable');
    setState(() {
      dataList = data;
    });
  }
  Future<void> addData(String name) async {
    await database.insert('localTable', {'name': name});
    fetchData();
  }
  Future<void> deleteData(int id) async {
    await database.delete('localTable', where: 'id=?', whereArgs: [id]);
    fetchData();
  }

  Future<void> updateData(int id, String name) async {
    await database.update('localTable', {'name': name}, where: 'id=?', whereArgs: [id]);
    fetchData();
  }

  void showSheet(BuildContext context, {int? id, String? name}) {
    nameController.text = name ?? '';
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration:InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  String newName = nameController.text.trim();
                    if (id == null) {
                      await addData(newName);
                    } else {
                      await updateData(id, newName);
                    }
                    Navigator.pop(context);
                },
                child: Text(id == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CRUD')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(dataList[index]['id'].toString()),
                    ),
                    title: Text(dataList[index]['name']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            showSheet(context, id: dataList[index]['id'], name: dataList[index]['name']);
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () async {
                            await deleteData(dataList[index]['id']);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showSheet(context);
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}