import 'package:get/get.dart';

import '../controllers/about_child_controller.dart';

class AboutChildBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutChildController>(
      () => AboutChildController(),
    );
  }
}
