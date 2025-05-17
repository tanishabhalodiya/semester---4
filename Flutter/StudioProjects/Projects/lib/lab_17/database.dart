import 'dart:core';

import 'package:sqflite/sqflite.dart';

class Database_todo{
  static const String TABLE='todo_table';
  static const String ID='userID';
  static const String TITLE='title';
  static const String DESC='description';
  static const String PRIO='priority';

static List<Map<String,dynamic>> todoList=[];

  Future<Database> initDatabase() async {
    Database db = await openDatabase(

      '${await getDatabasesPath()}/To_do.db',
      onCreate: (db, version) {
        db.execute(
          '''CREATE TABLE $TABLE
              ($ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
              $TITLE TEXT NOT NULL,
              $DESC TEXT ,
              $PRIO INTEGER
              );''',
        );
      },
      version: 2,
    );
    return db;
  }

  Future<void> addTask({required title,required desc,required prio}) async {
    Database db=await initDatabase();
    Map<String , dynamic> map={};

    map[TITLE]=title;
    map[DESC]=desc;
    map[PRIO]=prio;

    int number=await db.insert(TABLE, map);
    if(number==-1){
      print('################Insertion is failed');
    }
    else{
      print('########################################Data insedted successfully with id : $number');
      todoList.add(map);
      print("+++++++++++++++++++++++I am Added++++++++++++++++++++++++++++");
      todoList=await getTasks();
    }
  }
  // get print details of all User
  Future<List<Map<String, dynamic>>> getTasks() async {
    Database db = await initDatabase();
    todoList.clear();
    todoList.addAll(
        await db.rawQuery('SELECT * FROM ${TABLE}')
    );

    return todoList;
  }

  Future<int> updateTask(int? id, Map<String, dynamic> user) async {
    Database db = await initDatabase();

    //remove id from user map because it gives error in updating
    // user.remove(ID);
    print("$id frommmmmmmmmmmmmmmmmmmmmmmmmm $user");
    int number = await db.update(
      TABLE,
      user,
      where: "${ID} = ?",
      whereArgs: [id],
    );
    // User.userList=await getUserList();
    // User.userList = List.from(User.userList); // Change reference to trigger rebuild
    return number;
  }


  //delete User
  Future<int> deleteTask(int id) async{
    Database db=await initDatabase();
    return await db.delete(TABLE, where: "$ID = ?", whereArgs: [id]);
  }
}