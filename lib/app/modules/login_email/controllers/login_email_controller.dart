import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginEmailController extends GetxController {
  bool showPassword = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  visibility() {
    showPassword = !showPassword;
    update();
  }

  login() {
    if (formKey.currentState!.validate()) {
      Get.offAllNamed(Routes.ABOUT_CHILD);
    }
  }
}
