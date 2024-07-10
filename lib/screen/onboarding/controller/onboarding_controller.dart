import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/generated/assets.dart';
import 'package:kanban/screen/onboarding/model/onboarding_model.dart';

class OnboardingController extends GetxController {
  List<OnboardingModel> onBoardingData = [
    OnboardingModel(
      image: Assets.imageImage1,
      title: 'Welcome to Our Kanban app!',
      description:
          'Our app helps you manage your project with ease.\nUse our kanban board to stay on the top of your task and visualize your progress.',
    ),
    OnboardingModel(
      image: Assets.imageImage2,
        title: 'Add Board',
        description:
            'Create a board for your project.Add a title and description for your project.'),
    OnboardingModel(
      image: Assets.imageImage3,
        title: 'Drag And Drop',
        description:
            'Drag  and drop your cards to move theme between lists. Move cards from "To do" to "To Progress" When you are ready to start eorking on them.'),
  ];

  PageController pageController = PageController();
  RxInt pageIndex = 0.obs;
}
