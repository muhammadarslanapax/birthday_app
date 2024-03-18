// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:birthday_app/app/modules/dashboard/home/controllers/home_controller.dart';
import 'package:birthday_app/consts/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return GetBuilder<DashboardController>(builder: (obj) {
      return Platform.isAndroid
          ? PopScope(
              canPop: false,
              onPopInvoked: (didpop) async {
                if (!didpop) {
                  await showDialog(
                    context: context,
                    builder: (context) => ExitDialog(context),
                  );
                }
              },
              child: body(width, height, obj),
            )
          : GestureDetector(
              onHorizontalDragEnd: (details) async {
                await showDialog(
                  context: context,
                  builder: (context) => ExitDialog(context),
                );
              },
              child: body(width, height, obj),
            );
    });
  }

  Scaffold body(double width, double height, DashboardController obj) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
          width: width,
          height: height * 0.12,
          child: BottomNavigationBar(
            currentIndex: obj.currentIndex.value,
            onTap: (val) {
              obj.changeIndex(val);
            },
            type: BottomNavigationBarType.fixed,
            items: controller.icons,
            fixedColor: AppColor.icon,
          ),
        ),
        body: IndexedStack(
          children: obj.pages,
          index: obj.currentIndex.value,
        ));
  }

  // ignore: non_constant_identifier_names
  AlertDialog ExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Exit App'),
      content: const Text('Are you sure you want to exit the application ?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); // No, do not exit
          },
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop(animated: true);
            } else if (Platform.isIOS) {
              exit(0);
            }
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
