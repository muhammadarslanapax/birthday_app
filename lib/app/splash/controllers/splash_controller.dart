import 'package:birthday_app/app/models/child_model.dart';
import 'package:birthday_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:birthday_app/app/modules/dashboard/home/controllers/home_controller.dart';
import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:birthday_app/services/firebase_service.dart';
import 'package:birthday_app/services/firebase_instance.dart';
import 'package:birthday_app/services/internet_connectivity.dart';
import 'package:birthday_app/static_data.dart';
import 'package:birthday_app/utils/logger.dart';
import 'package:birthday_app/utils/sharepreference_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> logoAnimation;
  late Animation<double> textAnimation;
  String? userid;
  HomeController controller = Get.put(HomeController());

  @override
  void onInit() {
    initAnimationController();
    _goToNextScreen();
    super.onInit();
    Get.put(HomeController());
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
    Future.delayed(Duration(seconds: 3), () async {
      bool isSelectLanguage = SharedPreferencesHelper.getLanguagePref();
      bool isUserLogin = SharedPreferencesHelper.isUserLogin();
      if (isSelectLanguage && isUserLogin) {
        FirebaseService.getChild().then((QuerySnapshot querySnapshot) {
          if (querySnapshot.docs.isEmpty) {
            logger.d("Collection is empty");
            Get.offAllNamed(Routes.ABOUT_CHILD);
          } else {
            Get.offAllNamed(Routes.DASHBOARD);

            controller.childlist.clear();

            querySnapshot.docs.forEach((QueryDocumentSnapshot doc) {
              logger.d("Document data: ${doc.data()}");

              ChildDataModel childData =
                  ChildDataModel.fromJson(doc.data() as Map<String, dynamic>);

              // Add ChildDataModel to the list
              controller.childlist.add(childData);
            });
          }
        }).catchError((error) {
          logger.d("Error fetching data: $error");
        });
      } else if (isUserLogin) {
        Get.offAllNamed(Routes.ABOUT_CHILD);
      } else {
        Get.offAllNamed(Routes.LANGUAGE_SELECTION);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
