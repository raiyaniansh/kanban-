import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:kanban/screen/add/view/add_screen.dart';
import 'package:kanban/screen/home/model/home_model.dart';
import 'package:kanban/screen/task/controller/task_controller.dart';

import '../../../global.dart';

class TaskScreen extends StatelessWidget {
  final HomeModel homeModel;
  final int index;
  final bool? isInTodo;
  final bool? isInProgress;
  final bool? isInDone;

  const TaskScreen({
    super.key,
    required this.homeModel,
    required this.index,
    this.isInTodo,
    this.isInProgress,
    this.isInDone,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      init: TaskController(),
      builder: (TaskController controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: selectedColor.value,
            title: const Text("Task"),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: selectedColor.value.withOpacity(0.05),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Title',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: FloatingActionButton(
                                backgroundColor: selectedColor.value,
                                onPressed: () {
                                  Get.to(() => AddScreen(
                                        isBoard: false,
                                        homeModel: homeModel,
                                        index: index,
                                        isInTodo: isInTodo,
                                        isInProgress: isInProgress,
                                      ));
                                },
                                child: const Icon(
                                  Icons.edit,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Obx(
                          () => Text(
                            maxLines: 2,
                            isInTodo ?? false
                                ? homeModel.toDoList[index].title
                                : isInProgress ?? false
                                    ? homeModel.inProgressList[index].title
                                    : homeModel.doneList[index].title,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        const Text(
                          'Created At',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                        Row(
                          children: [
                            Obx(
                              () => Text(
                                isInTodo ?? false
                                    ? DateFormat('jm').format(
                                        homeModel.toDoList[index].dateTime)
                                    : isInProgress ?? false
                                        ? DateFormat('jm').format(homeModel
                                            .inProgressList[index].dateTime)
                                        : DateFormat('jm').format(
                                            homeModel.doneList[index].dateTime),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Obx(
                              () => Text(
                                isInTodo ?? false
                                    ? DateFormat(', d-MM-yyyy').format(
                                        homeModel.toDoList[index].dateTime)
                                    : isInProgress ?? false
                                        ? DateFormat(', d-MM-yyyy').format(
                                            homeModel
                                                .inProgressList[index].dateTime)
                                        : DateFormat(', d-MM-yyyy').format(
                                            homeModel.doneList[index].dateTime),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                        Obx(
                          () => Text(
                            maxLines: 2,
                            isInTodo ?? false
                                ? homeModel.toDoList[index].description
                                : isInProgress ?? false
                                    ? homeModel
                                        .inProgressList[index].description
                                    : homeModel.doneList[index].description,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isInProgress ?? false,
                          child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                        ),
                        Visibility(
                          visible: isInProgress ?? false,
                          child: const Text(
                            'Time Log',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isInProgress ?? false,
                          child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                        ),
                        Visibility(
                          visible: isInProgress ?? false,
                          child: SizedBox(
                            height: 30,
                            child: Row(
                              children: [
                                Obx(
                                  () => Visibility(
                                    visible: controller.time.value.inSeconds!=0,
                                    child: Text(
                                      style: TextStyle(fontSize: 25),
                                      controller.time.value.toString().substring(0,4),
                                    ).marginOnly(right: 10),
                                  ),
                                ),
                                FloatingActionButton.extended(
                                  heroTag: 'btn5',
                                  backgroundColor: selectedColor.value,
                                  onPressed: () {
                                    Get.dialog(
                                      Dialog(
                                        insetPadding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.15,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05),
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: 120,
                                              height: 200,
                                              child: CupertinoTimerPicker(
                                                mode:
                                                    CupertinoTimerPickerMode.hm,
                                                onTimerDurationChanged:
                                                    (value) {
                                                  controller.duration = value;
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            SizedBox(
                                              width: 120,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      controller.time.value =
                                                          controller.duration;
                                                      Get.back();
                                                    },
                                                    child: const Text(
                                                      "Ok",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: const Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.watch_later),
                                  label: Obx(() =>  Text(controller.time.value.inSeconds!=0? "Update Time" :"Add Time")),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        itemCount: isInTodo ?? false
                            ? homeModel.toDoList[index].commentList.length
                            : isInProgress ?? false
                                ? homeModel
                                    .inProgressList[index].commentList.length
                                : homeModel.doneList[index].commentList.length,
                        itemBuilder: (context, indexs) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(height: 5),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      ),
                                      color:
                                          selectedColor.value.withOpacity(0.10),
                                    ),
                                    child: Text(
                                      isInTodo ?? false
                                          ? homeModel.toDoList[index]
                                              .commentList[indexs].message
                                          : isInProgress ?? false
                                              ? homeModel.inProgressList[index]
                                                  .commentList[indexs].message
                                              : homeModel.doneList[index]
                                                  .commentList[indexs].message,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    children: [
                                      Text(
                                        isInTodo ?? false
                                            ? DateFormat('jm').format(homeModel
                                                .toDoList[index]
                                                .commentList[indexs]
                                                .time)
                                            : isInProgress ?? false
                                                ? DateFormat('jm').format(
                                                    homeModel
                                                        .inProgressList[index]
                                                        .commentList[indexs]
                                                        .time)
                                                : DateFormat('jm').format(
                                                    homeModel
                                                        .doneList[index]
                                                        .commentList[indexs]
                                                        .time),
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        isInTodo ?? false
                                            ? DateFormat(', d-MM-yyyy').format(
                                                homeModel
                                                    .toDoList[index].dateTime)
                                            : isInProgress ?? false
                                                ? DateFormat(', d-MM-yyyy')
                                                    .format(homeModel
                                                        .inProgressList[index]
                                                        .dateTime)
                                                : DateFormat(', d-MM-yyyy')
                                                    .format(homeModel
                                                        .doneList[index]
                                                        .dateTime),
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: TextField(
                          onChanged: (value) {
                            controller.count.value = value.length;
                          },
                          controller: controller.commentController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            hintText: 'Write here...',
                          ),
                        ),
                      ),
                      Obx(
                        () => FloatingActionButton(
                          heroTag: 'btn3',
                          elevation: 0,
                          backgroundColor: controller.count.value == 0
                              ? Colors.black12
                              : selectedColor.value,
                          onPressed: () {
                            controller.addComment(
                              message: controller.commentController.text,
                              homeModel: homeModel,
                              index: index,
                              isInDone: isInDone ?? false,
                              isInProgress: isInProgress ?? false,
                              isInToDo: isInTodo ?? false,
                            );
                          },
                          child: Icon(Icons.send,
                              color: controller.count.value == 0
                                  ? Colors.black54
                                  : null),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
