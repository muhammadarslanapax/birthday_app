// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:birthday_app/consts/const.dart';
import 'package:birthday_app/models/user_model.dart';
import 'package:birthday_app/services/exceptions.dart';
import 'package:birthday_app/services/firebase_consts.dart';
import 'package:birthday_app/services/firebase_instance.dart';
import 'package:birthday_app/services/internet_connectivity.dart';
import 'package:birthday_app/utils/dialog_helper.dart';
import 'package:birthday_app/utils/sharepreference_helper.dart';
import 'package:birthday_app/utils/toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginEmailController extends GetxController {
  bool showPassword = true;
  UserCredential? usercrediential;
  FirebaseInstance firebaseInstance = FirebaseInstance();

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

  login() async {
    if (formKey.currentState!.validate()) {
      try {
        DialogHelper.showLoading();

        usercrediential = await firebaseInstance.auth
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        if (usercrediential != null) {
          final _uuid = usercrediential?.user?.uid;
          firebaseInstance.firestore
              .collection(users)
              .doc(_uuid)
              .get()
              .then((value) {
            final UserModel usermodel = UserModel.fromMap(value.data()!);
            showtoast(message: signupsuccess, isError: false);
            Get.offAllNamed(Routes.DASHBOARD);
            SharedPreferencesHelper.saveUserInfo(usermodel, _uuid);
          });
        }
      } on FirebaseAuthException catch (e) {
        final error = getException(e.code);
        showtoast(message: error, isError: true);
      } catch (e) {
        showtoast(message: errormessege, isError: true);
      } finally {
        DialogHelper.hideLoading();
        clearController();
      }
    }
  }

  clearController() {
    emailController.clear();
    passwordController.clear();
  }
}
