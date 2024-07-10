import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/global.dart';
import 'package:kanban/screen/add/controller/add_controller.dart';
import 'package:kanban/screen/home/model/home_model.dart';

class AddScreen extends StatelessWidget {
  final bool isBoard;
  final HomeModel? homeModel;
  final int? index;
  final bool? isInTodo;
  final bool? isInProgress;

  const AddScreen(
      {super.key,
      required this.isBoard,
      this.homeModel,
      this.index,
      this.isInProgress,
      this.isInTodo});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddController>(
      init: AddController(isBoard: isBoard, homeModel: homeModel, index: index,isInTodo: isInTodo,isInProgress: isInProgress),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: selectedColor.value,
            title: Text(isBoard ? "Create Board" : "Create New Task"),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Text(
                    "Title",
                    style: TextStyle(fontSize: 16, color: Colors.black45),
                  ),
                  TextField(
                    onChanged: (value) {
                      controller.titleCountChange(count: value.length);
                    },
                    controller: controller.titleCtr,
                    maxLength: controller.titleCount,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(),
                      counter: const Text(''),
                      suffix: Obx(() =>
                          Text(controller.changeTitleCount.value.toString())),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 16, color: Colors.black45),
                  ),
                  TextField(
                    onChanged: (value) {
                      controller.descriptionCountChange(count: value.length);
                    },
                    controller: controller.descriptionCtr,
                    minLines: 1,
                    maxLines: 10,
                    maxLength: controller.descriptionCount,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(),
                      counter: const Text(''),
                      suffix: Obx(() => Text(
                          controller.changeDescriptionCount.value.toString())),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: selectedColor.value,
            onPressed: () {
              controller.add(
                title: controller.titleCtr.text,
                description: controller.descriptionCtr.text,
              );
            },
            label: Text(index == null ? 'Create' : 'Update'),
            icon: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
