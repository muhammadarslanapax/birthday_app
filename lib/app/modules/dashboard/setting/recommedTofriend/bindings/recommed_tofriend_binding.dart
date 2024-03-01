import 'package:get/get.dart';

import '../controllers/recommed_tofriend_controller.dart';

class RecommedTofriendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecommedTofriendController>(
      () => RecommedTofriendController(),
    );
  }
}
