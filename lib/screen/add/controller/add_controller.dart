import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kanban/global.dart';
import 'package:kanban/screen/home/model/home_model.dart';
import 'package:kanban/screen/todo/model/model_controller.dart';

class AddController extends GetxController {
  final bool isBoard;
  final HomeModel? homeModel;
  final int? index;
  final bool? isInTodo;
  final bool? isInProgress;

  TextEditingController titleCtr = TextEditingController();
  TextEditingController descriptionCtr = TextEditingController();

  int titleCount = 0;
  int descriptionCount = 0;
  RxInt changeTitleCount = 0.obs;
  RxInt changeDescriptionCount = 0.obs;

  AddController(
      {required this.isBoard,
      this.homeModel,
      this.index,
      this.isInTodo,
      this.isInProgress});

  @override
  void onInit() {
    if (isBoard) {
      titleCount = 20;
      descriptionCount = 90;
    } else {
      titleCount = 60;
      descriptionCount = 500;
    }
    changeTitleCount.value = titleCount;
    changeDescriptionCount.value = descriptionCount;
    if (index != null) {
      if (isInTodo ?? false) {
        titleCtr =
            TextEditingController(text: homeModel?.toDoList[index ?? 0].title);
        descriptionCtr = TextEditingController(
            text: homeModel?.toDoList[index ?? 0].description);
        changeTitleCount.value =
            60 - homeModel!.toDoList[index ?? 0].title.length;
        changeDescriptionCount.value =
            500 - homeModel!.toDoList[index ?? 0].description.length;
      } else if (isInProgress ?? false) {
        titleCtr = TextEditingController(
            text: homeModel?.inProgressList[index ?? 0].title);
        descriptionCtr = TextEditingController(
            text: homeModel?.inProgressList[index ?? 0].description);
        changeTitleCount.value =
            60 - homeModel!.inProgressList[index ?? 0].title.length;
        changeDescriptionCount.value =
            500 - homeModel!.inProgressList[index ?? 0].description.length;
      } else {
        titleCtr =
            TextEditingController(text: homeModel?.doneList[index ?? 0].title);
        descriptionCtr = TextEditingController(
            text: homeModel?.doneList[index ?? 0].description);
        changeTitleCount.value =
            60 - homeModel!.doneList[index ?? 0].title.length;
        changeDescriptionCount.value =
            500 - homeModel!.doneList[index ?? 0].description.length;
      }
    }
    super.onInit();
  }

  void titleCountChange({required int count}) {
    changeTitleCount.value = titleCount - count;
  }

  void descriptionCountChange({required int count}) {
    changeDescriptionCount.value = descriptionCount - count;
  }

  void add({required String title, required String description}) {
    if (title == null||title=="") {
      Get.snackbar('Error', 'Title is Empty');
    } else {
      if (description == null||description=="") {
        Get.snackbar('Error', 'Description is Empty');
      } else {
        if (isBoard) {
          boardsList.add(
            HomeModel(
              title: title,
              description: description,
              doneList: RxList([]),
              inProgressList: RxList([]),
              toDoList: RxList([]),
            ),
          );
        } else {
          if (index == null) {
            homeModel?.toDoList.add(
              TodoModel(
                title: title,
                description: description,
                dateTime: DateTime.now(),
                commentList: RxList([]),
              ),
            );
          } else {
            if (isInTodo ?? false) {
              homeModel?.toDoList[index ?? 0] = TodoModel(
                title: title,
                description: description,
                dateTime:
                    homeModel?.toDoList[index ?? 0].dateTime ?? DateTime.now(),
                commentList:
                    RxList(homeModel?.toDoList[index ?? 0].commentList ?? []),
              );
            } else if (isInProgress ?? false) {
              homeModel?.inProgressList[index ?? 0] = TodoModel(
                title: title,
                description: description,
                dateTime: homeModel?.inProgressList[index ?? 0].dateTime ??
                    DateTime.now(),
                commentList: RxList(
                    homeModel?.inProgressList[index ?? 0].commentList ?? []),
              );
            } else {
              homeModel?.doneList[index ?? 0] = TodoModel(
                title: title,
                description: description,
                dateTime:
                    homeModel?.doneList[index ?? 0].dateTime ?? DateTime.now(),
                commentList:
                    RxList(homeModel?.doneList[index ?? 0].commentList ?? []),
              );
            }
          }
        }

        Get.back();
      }
    }
  }
}
