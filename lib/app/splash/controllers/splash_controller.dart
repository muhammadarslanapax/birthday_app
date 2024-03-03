import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> logoAnimation;
  late Animation<double> textAnimation;

  @override
  void onInit() {
    initAnimationController();
    _goToNextScreen();
    super.onInit();
  }

  void initAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Create Tween for logo opacity
    logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // Create Tween for text opacity
    textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    // Start the animation
    _animationController.forward();
  }

  _goToNextScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(Routes.LANGUAGE_SELECTION);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
