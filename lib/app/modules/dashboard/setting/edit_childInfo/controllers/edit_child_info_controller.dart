// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:birthday_app/app/routes/app_pages.dart';

class EditChildInfoController extends GetxController {
  bool? isBorn;
  bool? isBoy;
  bool isPremie = false;
  DateTime? selectedDate;
  bool startLoading = false;
  String? title = Get.arguments;
  String dropDownValue = 'Select Child';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController expectedDeliveryDateController =
      TextEditingController();

  List<ChildModel> childList = [
    ChildModel(
        name: 'Select Child',
        isBorn: null,
        isBoy: null,
        isPremie: false,
        dateOfBirth: ''),
    ChildModel(
        name: 'Kyle',
        isBorn: true,
        isBoy: true,
        isPremie: false,
        dateOfBirth: 'Mar 9 2018'),
    ChildModel(
        name: 'Eva',
        isBorn: true,
        isBoy: false,
        isPremie: false,
        dateOfBirth: 'Nov 23 2020'),
    ChildModel(
      name: 'Susan',
      isBorn: true,
      isBoy: false,
      isPremie: true,
      dateOfBirth: 'Jun 17 2023',
      expectedDateOfBirth: 'Jun 17 2023',
    ),
  ];
  List? dropDown;
  @override
  void onInit() {
    dropDown = childList.map((child) => child.name).toList();

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

  onChildSelect(value) {
    dropDownValue = value;
    if (dropDownValue != 'Select Child') {
      for (ChildModel child in childList) {
        if (child.name == dropDownValue) {
          isBorn = child.isBorn;
          isBoy = child.isBoy;
          isPremie = child.isPremie;
          nameController.text = child.name;
          dateOfBirthController.text = child.dateOfBirth;
          expectedDeliveryDateController.text = child.expectedDateOfBirth ?? '';
        }
      }
    }
    update();
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

class ChildModel {
  String name;
  bool? isBorn;
  bool? isBoy;
  bool isPremie;
  String dateOfBirth;
  String? expectedDateOfBirth;
  ChildModel({
    required this.name,
    required this.isBorn,
    required this.isBoy,
    required this.isPremie,
    required this.dateOfBirth,
    this.expectedDateOfBirth,
  });
}
