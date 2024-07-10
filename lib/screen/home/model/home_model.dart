import 'package:get/get.dart';
import 'package:kanban/screen/todo/model/model_controller.dart';

class HomeModel {
  final String title;
  final String description;
  final RxList<TodoModel> toDoList;
  final RxList<TodoModel> inProgressList;
  final RxList<TodoModel> doneList;

  HomeModel({
    required this.title,
    required this.description,
    required this.toDoList,
    required this.doneList,
    required this.inProgressList,
  });
}
