// ignore_for_file: depend_on_referenced_packages

import 'package:birthday_app/services/firebase_instance.dart';
import 'package:birthday_app/services/internet_connectivity.dart';
import 'package:birthday_app/theme/theme.dart';
import 'package:birthday_app/utils/sharepreference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    GetMaterialApp(
      title: "babyfeedapp",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Themes.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    ),
  );
  SharedPreferencesHelper.initialize();
}
