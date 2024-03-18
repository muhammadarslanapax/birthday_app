import 'package:birthday_app/consts/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

showtoast({required String message, required bool isError}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? Colors.red : AppColor.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

showsnackbar({required String message, required bool isError}) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: isError ? Colors.red : AppColor.green,
    duration: const Duration(
      seconds: 2,
    ),
    isDismissible: false,
    // ignore: prefer_const_constructors
    icon: Icon(
      isError ? Icons.info : Icons.check_circle_sharp,
      color: AppColor.white,
    ),
  ));
}
