import 'package:get/get.dart';

import '../controllers/termand_policy_controller.dart';

class TermandPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermandPolicyController>(
      () => TermandPolicyController(),
    );
  }
}
