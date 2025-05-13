import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/models/todo_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLController extends GetxController {
  late Database db;

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
          db = database;
          getAllData();
          debugPrint('Database opened');
        }
    );
  }

  List<Todo> todoList = [];
  void getAllData() async{
    todoList = [];
    var result = await db.query('todo');
    for(var i in result){
      todoList.add(Todo.fromJson(i));
    }
    update();
  }

  void insertData({
    required String title,
    required String description,
    required String time,
  }) async{
    try{
      var insertedData = await db.insert('todo', {
        'title': title,
        'description': description,
        'time': time,
        'favorite': 0,
        'completed': 0
      });
      Get.back();
      debugPrint("$insertedData data inserted");
      getAllData();
    }catch(e){
      debugPrint(e.toString());
    }
  }

  bool updateTaskData = false;
  void updateData({
    required String title,
    required String description,
    required String time,
    required int id
  }) async{
    try{
      var updatedData = await db.update(
        'todo',
        {
          'title': title,
          'description': description,
          'time': time,
        },
        where: 'id = $id',
      );
      debugPrint(updatedData.toString());
      Get.back();
      getAllData();
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

  void deleteData({required int id}) async{
    var deletedData = await db.delete('todo', where: 'id = $id');
    debugPrint(deletedData.toString());
    getAllData();
  }

  void updateFavorite({
    required int favorite,
    required int id
  }) async{
    try{
      var updatedData = await db.update(
        'todo',
        {
          'favorite': favorite == 0 ? 1 : 0,
        },
        where: 'id = $id',
      );
      debugPrint(updatedData.toString());
      Get.back();
      getAllData();
    }
    catch(e){
      debugPrint(e.toString());
    }
  }
}