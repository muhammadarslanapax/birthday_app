import 'package:birthday_app/app/models/child_model.dart';
import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:birthday_app/consts/const.dart';
import 'package:birthday_app/services/firebase_service.dart';
import 'package:birthday_app/static_data.dart';
import 'package:birthday_app/utils/logger.dart';
import 'package:birthday_app/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutChildController extends GetxController {
  bool? isBorn;
  bool? isBoy;
  bool isPremie = false;
  bool startLoading = false;
  String? title = Get.arguments;
  DateTime selectedDate = DateTime.now();
  DateTime expectedDate = DateTime.now();

  changeborn(val) {
    isBorn = val;
    update();
  }

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

      ChildDataModel childDataModel = ChildDataModel(
          uuid: StaticData.uuid,
          isBornyet: isBorn,
          gender: isBorn,
          name: nameController.text.capitalize,
          bornDate: dateOfBirthController.text,
          premine: isPremie,
          expectedDate: expectedDeliveryDateController.text);

      try {
        FirebaseService.addChild(childDataModel);
        Get.offNamed(Routes.DASHBOARD);
        showtoast(message: childadd, isError: false);
      } catch (e) {
        showtoast(message: errormessege, isError: true);
      } finally {
        startLoading = false;
        update();
      }
    }
  }

//.....................Select Date................................

  Future<void> selectDate(BuildContext context,
      TextEditingController controller, DateTime dateTime) async {
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
        firstDate: DateTime(2010),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());

    if (picked != null) {
      dateTime = picked;

      controller.text =
          '${monthName(dateTime!.month)} ${dateTime!.day} ${dateTime!.year}';
      update();
    }
  }
}
