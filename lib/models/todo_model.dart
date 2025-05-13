// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

String todoToJson(Todo data) => json.encode(data.toJson());

class Todo {
  int id;
  String title;
  String description;
  String time;
  int favorite;
  int completed;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.favorite,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    time: json["time"],
    favorite: json["favorite"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "time": time,
    "favorite": favorite,
    "completed": completed,
  };
}
