import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutChildController extends GetxController {
  bool? isBorn;
  bool? isBoy;
  bool isPremie = false;
  bool startLoading = false;
  String? title = Get.arguments;
  DateTime? selectedDate;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController expectedDeliveryDateController =
      TextEditingController();
  @override
  void onInit() {
    print(title);
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

  addChild() {
    if (formKey.currentState!.validate()) {
      startLoading = true;
      update();
      Future.delayed(const Duration(seconds: 3), () {
        startLoading = false;
        update();
        Get.offNamed(Routes.DASHBOARD);
      });
    }
  }

//.....................Select Date................................

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    String monthName(int month) {
      const monthNames = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return monthNames[month - 1];
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Column(
          children: <Widget>[
            Spacer(),
            SizedBox(
              height: 400,
              child: child,
            ),
            Spacer(),
          ],
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      controller.text =
          '${monthName(selectedDate!.month)} ${selectedDate!.day} ${selectedDate!.year}';
      update();
    }
  }
}
