import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/screen/home/model/home_model.dart';

RxList<HomeModel> boardsList = <HomeModel>[].obs;
Rx<Color> selectedColor = Colors.blue.obs;