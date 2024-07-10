import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/global.dart';
import 'package:kanban/screen/add/view/add_screen.dart';
import 'package:kanban/screen/home/controller/home_controller.dart';
import 'package:kanban/screen/setting/view/setting_screen.dart';
import 'package:kanban/screen/todo/view/todo_screen.dart';

import '../../../generated/assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Obx(
          () => Scaffold(
            appBar: AppBar(
              backgroundColor: selectedColor.value,
              title: const Text("Kanban Board"),
              actions: [
                IconButton(
                  onPressed: () {
                    Get.to(() => const SettingScreen());
                  },
                  icon: const Icon(Icons.settings),
                )
              ],
            ),
            body: SafeArea(
              child: Obx(
                () => boardsList.isEmpty
                    ? Center(
                        child: Image.asset(
                        Assets.imageNoData,
                        color: selectedColor.value,
                        height: 120,
                      ))
                    : GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10),
                        itemCount: boardsList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1 / 1.7),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => TodoScreen(
                                    data: boardsList[index],
                                  ));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              decoration: BoxDecoration(
                                  color: selectedColor.value.withOpacity(0.10),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: Text(
                                      maxLines: 2,
                                      boardsList[index].title,
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: selectedColor.value
                                            .withOpacity(0.15),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: Text(
                                      maxLines: 2,
                                      boardsList[index].description,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: selectedColor.value
                                            .withOpacity(0.15),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "To-Do - ",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Obx(
                                          () => Text(
                                            "${boardsList[index].toDoList.length}",
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: selectedColor.value
                                            .withOpacity(0.15),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "In-Progress - ",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Obx(
                                          () => Text(
                                            "${boardsList[index].inProgressList.length}",
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: selectedColor.value
                                            .withOpacity(0.15),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "Done - ",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Obx(
                                          () => Text(
                                            "${boardsList[index].doneList.length}",
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
            floatingActionButton: Obx(
              () => FloatingActionButton(
                backgroundColor: selectedColor.value,
                onPressed: () {
                  Get.to(
                    () => const AddScreen(
                      isBoard: true,
                    ),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
        );
      },
    );
  }
}
