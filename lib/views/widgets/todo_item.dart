import 'package:flutter/material.dart';
import 'package:getx_sqflite/controllers/controller.dart';
import 'package:get/get.dart';
import '../screens/edit_screen.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.controller, required this.index});
  final SQLController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  Expanded(child: Text(controller.todoList[index].title)),
                  Expanded(child: Text(controller.todoList[index].time)),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(controller.todoList[index].description),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (){
                        controller.deleteData(id: controller.todoList[index].id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        controller.updateFavorite(
                            id: controller.todoList[index].id,
                            favorite: controller.todoList[index].favorite
                        );
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: (controller.todoList[index].favorite == 1) ? Colors.pink : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        controller.updateTaskData = true;
                        Get.to(() => EditScreen(
                            id: controller.todoList[index].id,
                            title: controller.todoList[index].title,
                            description: controller.todoList[index].description,
                            time: controller.todoList[index].time
                        )
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                    )
                  ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
