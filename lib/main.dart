import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/screen/splash/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kanban',
      theme: ThemeData(useMaterial3: false),
      home: const SplashScreen(),
    );
  }
}
