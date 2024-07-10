import 'package:get/get.dart';
import 'package:kanban/screen/onboarding/view/onboarding_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigation();
    super.onInit();
  }

  void navigation() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAll(
        () => const OnboardingScreen(),
      ),
    );
  }
}
