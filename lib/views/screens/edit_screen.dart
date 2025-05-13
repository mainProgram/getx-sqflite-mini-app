import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/shared/custom_text_form_field.dart';

import '../../controllers/controller.dart';

class EditScreen extends StatefulWidget {
  EditScreen({super.key, this.id, this.title, this.time, this.description});
  final int? id;
  final String? title;
  final String? time;
  final String? description;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  final timeController = TextEditingController();

  final SQLController controller = Get.find();

  @override
  initState(){
    if(controller.updateTaskData){
      titleController.text = widget.title ?? "";
      descriptionController.text = widget.description ?? "";
      timeController.text = widget.time ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.updateTaskData ? "Update Task" : "Add Task"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomFormField(controller: titleController, validationText: "The title must have a value"),
          CustomFormField(controller: descriptionController, validationText: "The description must have a value"),
          CustomFormField(controller: timeController, validationText: "The time must have a value"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MaterialButton(
              onPressed: (){
                if(controller.updateTaskData){
                  controller.updateData(
                      title: titleController.text,
                      description: descriptionController.text,
                      time: timeController.text,
                      id: widget.id ?? 0
                  );
                }
                else{
                  controller.insertData(
                      title: titleController.text,
                      description: descriptionController.text,
                      time: timeController.text
                  );
                }
              },
              color: Colors.red,
              textColor: Colors.white,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Text(controller.updateTaskData ? "Update" : "Save"),
            ),
          )
        ]
      ),
    );
  }
}
