import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kanban/global.dart';
import 'package:kanban/screen/home/view/home_screen.dart';
import 'package:kanban/screen/onboarding/controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      init: OnboardingController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.pageController,
                      itemCount: controller.onBoardingData.length,
                      onPageChanged: (value) {
                        controller.pageIndex.value = value;
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              controller.onBoardingData[index].image,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Text(
                              controller.onBoardingData[index].title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Text(
                              controller.onBoardingData[index].description,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Visibility(
                          visible: controller.pageIndex.value != 0,
                          child: FloatingActionButton(
                            backgroundColor: selectedColor.value,
                            heroTag: 'btn1',
                            onPressed: () {
                              controller.pageController.animateToPage(
                                  --controller.pageIndex.value,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.ease);
                            },
                            child: const Icon(Icons.arrow_back_ios),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: selectedColor.value,
                        heroTag: 'btn2',
                        onPressed: () {
                          if (controller.pageIndex != 2) {
                            controller.pageController.animateToPage(
                                ++controller.pageIndex.value,
                                duration: const Duration(seconds: 1),
                                curve: Curves.ease);
                          } else {
                            Get.offAll(() => const HomeScreen());
                          }
                        },
                        child: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
