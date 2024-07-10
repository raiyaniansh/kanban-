import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/global.dart';

class SettingController extends GetxController{
  List<Color> colorsList = [
    Colors.blue,
    Colors.purple,
    Colors.red,
    Colors.orange,
    Colors.green,
  ];

  void changeColor({required int index})
  {
    selectedColor.value = colorsList[index];
    update();
  }
}