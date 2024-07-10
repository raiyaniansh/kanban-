import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kanban/screen/task/model/comment_model.dart';

import '../../home/model/home_model.dart';

class TaskController extends GetxController {
  RxInt count = 0.obs;
  TextEditingController commentController = TextEditingController();
  Rx<Duration> time =  const Duration().obs;
  Duration duration = const Duration();

  void addComment({
    required String message,
    required HomeModel homeModel,
    required int index,
    required bool isInToDo,
    required bool isInProgress,
    required bool isInDone,
  }) {
    if (isInToDo) {
      print(homeModel.toDoList[index].title);

      homeModel.toDoList[index].commentList
          .add(CommentModel(message: message, time: DateTime.now()));
    } else if (isInProgress) {
      homeModel.inProgressList[index].commentList
          .add(CommentModel(message: message, time: DateTime.now()));
    } else if(isInDone) {
      homeModel.doneList[index].commentList
          .add(CommentModel(message: message, time: DateTime.now()));
    }
    commentController.clear();
    count.value = 0;
  }
}
