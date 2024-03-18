import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:birthday_app/consts/const.dart';
import 'package:birthday_app/models/user_model.dart';
import 'package:birthday_app/services/exceptions.dart';
import 'package:birthday_app/services/firebase_consts.dart';
import 'package:birthday_app/services/firebase_instance.dart';
import 'package:birthday_app/utils/dialog_helper.dart';
import 'package:birthday_app/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  static CreateAccountController get to => Get.find();

  final FirebaseInstance _firebaseInstance = FirebaseInstance();
  UserCredential? usercrediential;

  bool showPassword = true;
  bool showPasswordconf = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();

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

  visibilityconfig() {
    showPasswordconf = !showPasswordconf;
    update();
  }

  signUp() async {
    if (formKey.currentState!.validate()) {
      UserModel userModel = UserModel(
          email: emailController.text.trim(),
          name: nameController.text,
          password: passwordController.text);
      try {
        DialogHelper.showLoading();
        // show dialog
        usercrediential = await _firebaseInstance.auth
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        if (usercrediential!.user != null) {
          final uuid = usercrediential?.user?.uid;
          await _firebaseInstance.firestore
              .collection(users)
              .doc(uuid)
              .set(userModel.toMap());

          // show success messege
          showtoast(message: signupsuccess, isError: false);
          Get.offAllNamed(Routes.LOGIN_EMAIL);
        }
      } on FirebaseAuthException catch (e) {
        final error = getException(e.code);
        showtoast(message: error, isError: true);
      } catch (e) {
        showtoast(message: errormessege, isError: true);
      } finally {
        // hide dialog
        DialogHelper.hideLoading();
        clearController();
      }
    }
  }

  clearController() {
    emailController.clear();
    nameController.clear();
    passwordController.clear();
    confPasswordController.clear();
  }
}
