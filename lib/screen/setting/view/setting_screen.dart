import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/global.dart';
import 'package:kanban/screen/setting/controller/setting_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: selectedColor.value,
          title: const Text("Settings"),
        ),
        body: GetBuilder<SettingController>(
          init: SettingController(),
          builder: (SettingController controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "App Theme",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.14,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.colorsList.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          controller.changeColor(index: index);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: MediaQuery.of(context).size.width * 0.1,
                          width: MediaQuery.of(context).size.width * 0.14,
                          color: controller.colorsList[index],
                          alignment: Alignment.center,
                          child: Visibility(
                              visible: controller.colorsList[index] ==
                                  selectedColor.value,
                              child:
                                  const Icon(Icons.done, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
