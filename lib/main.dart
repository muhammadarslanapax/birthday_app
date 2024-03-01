import 'package:birthday_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
  // SharedPreferencesHelper.initialize();
//   await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );

  // FirebaseService firebaseService = FirebaseService();
}
