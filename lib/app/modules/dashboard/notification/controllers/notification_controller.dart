import 'package:birthday_app/app/modules/dashboard/notification/views/notification_view.dart';
import 'package:birthday_app/consts/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  bool food = true;
  bool milk = true;
  bool sleep = false;
  bool doctorCheckup = false;
  bool play = false;
  bool vaccine = false;

  List<String> dialogList = [
    'Stop swaddling ',
    'Move baby to their own Room and what to buy',
    'When to start sleep training and different methods to do it',
    'When to stop dream feeding.',
    'When to buy night time diapers'
  ];

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

  showDialog(
    BuildContext context,
    double width,
    String title,
    List list,
  ) {
    showAdaptiveDialog(
        barrierColor: AppColor.white.withOpacity(0.6),
        context: context,
        builder: (BuildContext context) {
          return const NotificationView().adptiveAlertDialog(
            context,
            width,
            title,
            list,
          );
        });
  }
}
