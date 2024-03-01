import 'package:get/get.dart';

import '../controllers/edit_child_info_controller.dart';

class EditChildInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditChildInfoController>(
      () => EditChildInfoController(),
    );
  }
}
