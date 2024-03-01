import 'package:birthday_app/consts/const.dart';
import 'package:birthday_app/utils/style.dart';
import 'package:birthday_app/widget/cText.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Wrap the Image in a FadeTransition for the logo
            FadeTransition(
              opacity: controller.logoAnimation,
              child: Image.asset(
                "assets/images/applogo.png",
                fit: BoxFit.cover,
                width: AppStyle.size(context, 204),
                height: AppStyle.size(context, 173),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            // Wrap the CText in a FadeTransition for the text
            FadeTransition(
              opacity: controller.textAnimation,
              child: CText(
                text: app_name,
                fontsize: AppStyle.headingsize(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
