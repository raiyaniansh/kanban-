import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kanban/global.dart';
import 'package:kanban/screen/add/view/add_screen.dart';
import 'package:kanban/screen/task/view/task_screen.dart';
import 'package:kanban/screen/todo/controller/todo_controller.dart';
import 'package:kanban/screen/todo/model/model_controller.dart';

import '../../../generated/assets.dart';
import '../../home/model/home_model.dart';

class TodoScreen extends StatelessWidget {
  final HomeModel data;

  const TodoScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      init: TodoController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: selectedColor.value,
            title: Text(data.title),
          ),
          body: SafeArea(
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              children: [
                Container(
                  width: 220,
                  decoration: BoxDecoration(
                      color: selectedColor.value.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                        width: 220,
                        height: 50,
                        decoration: BoxDecoration(
                          color: selectedColor.value.withOpacity(0.10),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'To - Do',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Obx(
                                () => Text(
                                  data.toDoList.length.toString(),
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => ListView.builder(
                            itemCount: data.toDoList.length,
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(
                                    () => TaskScreen(
                                      isInTodo: true,
                                      homeModel: data,
                                      index: index,
                                    ),
                                  );
                                },
                                child: Draggable<TodoModel>(
                                  data: data.toDoList[index],
                                  childWhenDragging: Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 4),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              maxLines: 2,
                                              data.toDoList[index].title,
                                              style: const TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            const Text(
                                              'Created At',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  DateFormat('jm').format(data
                                                      .toDoList[index]
                                                      .dateTime),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                Text(
                                                  DateFormat(', d-MM-yyyy')
                                                      .format(data
                                                          .toDoList[index]
                                                          .dateTime),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 67,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 4),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                      ),
                                    ],
                                  ),
                                  feedback: Container(
                                    width: 212,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          maxLines: 2,
                                          data.toDoList[index].title,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        const Text(
                                          'Created At',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              DateFormat('jm').format(data
                                                  .toDoList[index].dateTime),
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              DateFormat(', d-MM-yyyy').format(
                                                  data.toDoList[index]
                                                      .dateTime),
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 4),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          maxLines: 2,
                                          data.toDoList[index].title,
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        const Text(
                                          'Created At',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              DateFormat('jm').format(data
                                                  .toDoList[index].dateTime),
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            Text(
                                              DateFormat(', d-MM-yyyy').format(
                                                  data.toDoList[index]
                                                      .dateTime),
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87,
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
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                            () => AddScreen(isBoard: false, homeModel: data),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: 220,
                          height: 50,
                          child: const Row(
                            children: [
                              Icon(Icons.add),
                              SizedBox(width: 10),
                              Text(
                                "New",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: 220,
                  decoration: BoxDecoration(
                      color: selectedColor.value.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(20)),
                  child: DragTarget<TodoModel>(
                    onAcceptWithDetails: (details) {
                      int index = data.toDoList.indexWhere(
                          (element) => element.title == details.data.title);
                      data.inProgressList.add(data.toDoList[index]);
                      data.toDoList.removeAt(index);
                    },
                    builder: (BuildContext context, List<Object?> candidateData,
                        List<dynamic> rejectedData) {
                      return Column(
                        children: [
                          Container(
                            width: 220,
                            height: 50,
                            decoration: BoxDecoration(
                              color: selectedColor.value.withOpacity(0.10),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'To - Progress',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Obx(
                                    () => Text(
                                      data.inProgressList.length.toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Obx(
                              () => ListView.builder(
                                itemCount: data.inProgressList.length,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(
                                        () => TaskScreen(
                                          isInProgress: true,
                                          homeModel: data,
                                          index: index,
                                        ),
                                      );
                                    },
                                    child: Draggable<TodoModel>(
                                      data: data.inProgressList[index],
                                      feedback: Container(
                                        width: 212,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              maxLines: 2,
                                              data.inProgressList[index].title,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            const Text(
                                              'Created At',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.normal,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  DateFormat('jm').format(data
                                                      .inProgressList[index]
                                                      .dateTime),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black87,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  DateFormat(', d-MM-yyyy')
                                                      .format(data
                                                          .inProgressList[index]
                                                          .dateTime),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black87,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      childWhenDragging: Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2, horizontal: 4),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  maxLines: 2,
                                                  data.inProgressList[index]
                                                      .title,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.01),
                                                const Text(
                                                  'Created At',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      DateFormat('jm').format(
                                                          data
                                                              .inProgressList[
                                                                  index]
                                                              .dateTime),
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    Text(
                                                      DateFormat(', d-MM-yyyy')
                                                          .format(data
                                                              .inProgressList[
                                                                  index]
                                                              .dateTime),
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 67,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2, horizontal: 4),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.black54,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 4),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              maxLines: 2,
                                              data.inProgressList[index].title,
                                              style: const TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            const Text(
                                              'Created At',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  DateFormat('jm').format(data
                                                      .inProgressList[index]
                                                      .dateTime),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                Text(
                                                  DateFormat(', d-MM-yyyy')
                                                      .format(data
                                                          .inProgressList[index]
                                                          .dateTime),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black87,
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
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: 220,
                  decoration: BoxDecoration(
                      color: selectedColor.value.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(20)),
                  child: DragTarget<TodoModel>(
                    onAcceptWithDetails: (details) {
                      if (data.inProgressList.indexWhere((element) =>
                              element.title == details.data.title) >
                          -1) {
                        int index = data.inProgressList.indexWhere(
                            (element) => element.title == details.data.title);
                        data.doneList.add(data.inProgressList[index]);
                        data.inProgressList.removeAt(index);
                      } else {
                        Get.dialog(
                          barrierDismissible: false,
                          AlertDialog(
                            content: Container(
                              width: 300,
                              height: 210,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    Assets.imageAlert,
                                    width: 100,
                                    height: 100,
                                  ),
                                  const Text(
                                    "A task's status cannot be changed to Done until the time is logged.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 19,
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  FloatingActionButton.extended(
                                    backgroundColor: selectedColor.value,
                                    onPressed: () {
                                      Get.back();
                                    },
                                    label: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Close"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Column(
                        children: [
                          Container(
                            width: 220,
                            height: 50,
                            decoration: BoxDecoration(
                              color: selectedColor.value.withOpacity(0.10),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'Done',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Obx(
                                    () => Text(
                                      data.doneList.length.toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Obx(
                              () => ListView.builder(
                                itemCount: data.doneList.length,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(
                                        () => TaskScreen(
                                          isInDone: true,
                                          homeModel: data,
                                          index: index,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 4),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            maxLines: 2,
                                            data.doneList[index].title,
                                            style: const TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01),
                                          const Text(
                                            'Created At',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                DateFormat('jm').format(data
                                                    .doneList[index].dateTime),
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              Text(
                                                DateFormat(', d-MM-yyyy')
                                                    .format(data.doneList[index]
                                                        .dateTime),
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
