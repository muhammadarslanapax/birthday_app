import 'package:birthday_app/app/models/child_model.dart';
import 'package:birthday_app/utils/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  List<ChildDataModel> childlist = [];
  List<DateTime> milestoneDate = [];

  List<String> timeDifferences = [];

  final now = DateTime.now();

  ChildDataModel? selected;

  changeselected(ChildDataModel? val) {
    selected = val;
    milestoneDate.clear();
    milestoneDate = _getNext5Milestones(val!.bornDate!);
    timeDifferences.clear();
    _calculateTimeDifference(milestoneDate);
    logger.d(timeDifferences[0]);

    update();
  }

  late PageController pageController;
  int currentPage = 0;
  changePage(int val) {
    currentPage = val;
    update();
  }

  List upcomingReminders = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
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

  List<DateTime> _getNext5Milestones(String borndateString) {
    // Parse the birth date string into a DateTime object
    final borndate = DateFormat('MMM dd yyyy').parse(borndateString);

    // Define the list to store the next five milestone dates
    List<DateTime> milestones = [];

    // Calculate the next five milestones
    for (int i = 1; i <= 18; i++) {
      // Add i years to the birth date to get the milestone date
      DateTime milestoneDate = borndate.add(Duration(days: i * 365));
      milestones.add(milestoneDate);
    }

    return milestones;
  }

  List<String> _calculateTimeDifference(List<DateTime> milestones) {
    timeDifferences.clear();

    for (DateTime milestoneDate in milestones) {
      // Calculate the time difference
      final difference = now.difference(milestoneDate);

      // Calculate the years, months, and days
      int years = difference.inDays ~/ 365;
      int months = (difference.inDays % 365) ~/ 30;
      int days = difference.inDays % 30;

      // Format the time difference as a string
      String timeDiff = '';
      if (years > 0) timeDiff += '$years year';
      if (years > 1) timeDiff += 's'; // Pluralize "year"
      if (months > 0) timeDiff += ' $months month';
      if (months > 1) timeDiff += 's'; // Pluralize "month"
      if (days > 0) timeDiff += ' $days day';
      if (days > 1) timeDiff += 's'; // Pluralize "day"

      timeDifferences.add(timeDiff.trim());
    }

    return timeDifferences;
  }
}
