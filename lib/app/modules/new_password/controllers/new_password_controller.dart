import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  bool showPassword = false;
  bool startLoading = false;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  showLoading() {
    if (formKey.currentState!.validate()) {
      startLoading = true;
      update();
      Future.delayed(const Duration(seconds: 3), () {
        startLoading = false;
        update();
        Get.offNamed(Routes.LOGIN_EMAIL);
      });
    }
  }
}
