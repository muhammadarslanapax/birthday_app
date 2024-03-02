import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:birthday_app/utils/toast.dart';
import 'package:get/get.dart';

class LanguageSelectionController extends GetxController {
  String language = '';

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

  selectededLanguage(value) {
    language = value;
    update();
  }

  goToLogin() {
    if (language == '') {
      showtoast(message: 'Please Select a Languge', isError: true);
    } else {
      // Get.to(() => const LoginMethodScreen());
      Get.toNamed(Routes.LOGIN);
    }
  }
}
