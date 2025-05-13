import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/controllers/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(SQLController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              controller.deleteAppDatabase();
            },
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: (){
              controller.insertData();
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () {
                controller.updateData();
              },
              icon: const Icon(Icons.share)
          ),
          IconButton(
              onPressed: () {
                controller.deleteData();
              },
              icon: const Icon(Icons.delete_forever)
          )
        ],
      ),
    );
  }
}
