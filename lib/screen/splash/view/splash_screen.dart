import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/screen/splash/controller/splash_controller.dart';
import 'package:lottie/lottie.dart';

import '../../../generated/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Image.asset(
                      Assets.logoAppIcon,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Lottie.asset(Assets.lottieLoading,
                        width: MediaQuery.of(context).size.width * 0.3),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
