import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/controllers/controller.dart';

import '../widgets/todo_item.dart';
import 'edit_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final SQLController control = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(() => EditScreen(), transition: Transition.zoom);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<SQLController>(
        builder: (controller) => ListView.builder(
            itemCount: controller.todoList.length,
            itemBuilder: (context, index) => TodoItem(controller: controller, index: index),
        ),
      )
    );
  }
}
