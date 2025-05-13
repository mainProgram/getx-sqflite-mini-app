import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLController extends GetxController {

  @override
  void onInit() {
    createDatabase();
    super.onInit();
  }

  void createDatabase() async{
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    openAppDatabase(path: path);
  }

  void deleteAppDatabase() async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    await deleteDatabase(path);
    print("deleted !");
  }


  void openAppDatabase({required String path}) async{
    // open the database
     await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute('CREATE TABLE todo (id INTEGER PRIMARY KEY, title TEXT, description TEXT, time TEXT, favorite INTEGER, completed INTEGER)');
          debugPrint('Database created');
        },
        onOpen: (Database database) async {
          debugPrint('Database opened');
        }
    );
  }

  void getAllData() async{
    // Database db = await openAppDatabase(path: 'todo.db');
    // List<Map> result = await db.query('todo');
    // print(result);
  }

  void insertData() async{
    // Database db = await openAppDatabase(path: 'todo.db');
    // await db.insert('todo', {
    //   'title': 'title',
    //   'description': 'description',
    //   'favorite': 0,
    //   'completed': 0
    // });
  }

  void updateData() async{
    // Database db = await openAppDatabase(path: 'todo.db');
    // await db.update('todo', {
    //   'title': 'title',
    //   'description': 'description',
    //   'favorite': 0,
    //   'completed': 0
    // });
  }

  void deleteData() async{
    // Database db = await openAppDatabase(path: 'todo.db');
    // await db.delete('todo');
  }
}