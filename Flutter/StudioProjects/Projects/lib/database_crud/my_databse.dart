import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase{
  // late Database db;

  Future<Database> initDatabase() async {
    Database db = await openDatabase(
      join(await getDatabasesPath(), 'myNewDatabase.db'),
      onCreate: (db, version) {
        return db.execute(
            'create table myTable('
                'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                'title TEXT,desc TEXT)');
      },
      version: 1,
    );
    return db;
  }

  Future<List<Map<String,dynamic>>> fetchData() async {
    Database db=await initDatabase();
    List<Map<String, dynamic>> userdata = await db.query('myTable');
    print(":::::::::::::::::::::::::::Fetched Data: $userdata");
    return userdata;
  }

  Future<void> insertData(Map<String, dynamic> user) async {
    Database db = await initDatabase();
    int id = await db.insert("myTable", user);
  }

  Future<void> updateData(Map<String, dynamic> user) async {
    Database db = await initDatabase();
    int id = await db.update("myTable", user,
        where: "id = ?", whereArgs: [user["id"]]);
  }

  Future<void> deleteData(int id) async {
    Database db = await initDatabase();
    await db.delete("myTable", where: "id = ?", whereArgs: [id]);
  }

}

