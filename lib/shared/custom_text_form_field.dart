import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({super.key, required this.controller, required this.validationText});

  final TextEditingController controller;
  final String validationText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        validator: (value) {
          if(value!.isEmpty){
            return validationText;
          }
          return null;
        },
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
        ),
      ),
    );
  }
}
