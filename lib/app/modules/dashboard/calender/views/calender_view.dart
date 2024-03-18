import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:birthday_app/consts/app_color.dart';
import 'package:birthday_app/consts/const.dart';
import 'package:birthday_app/services/firebase_service.dart';
import 'package:birthday_app/utils/style.dart';
import 'package:birthday_app/utils/toast.dart';
import 'package:birthday_app/widget/cText.dart';
import 'package:birthday_app/widget/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../controllers/calender_controller.dart';

class CalenderView extends GetView<CalenderController> {
  const CalenderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppStyle.defaultPadding(context),
              vertical: AppStyle.defaultPadding(context)),
          child: SizedBox(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CText(
                  text: calender,
                  fontsize: AppStyle.headingsize(context),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppStyle.size(context, 12)),
                      color: AppColor.secondary),
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: AppStyle.defaultPadding(context),
                      vertical: height * 0.01),
                  child: CText(textAlign: TextAlign.start, text: clickInfo),
                  width: width,
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Container(
                  width: width,
                  //height: height * 0.5,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: AppColor.secondary,
                      borderRadius: BorderRadius.circular(
                          AppStyle.defaultRadius(context))),
                  child: TableCalendar(
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(Duration(days: 4433)),
                    focusedDay: DateTime.now(),
                    rowHeight: height * 0.043,
                    calendarStyle: const CalendarStyle(
                        cellMargin: EdgeInsets.all(4),
                        selectedDecoration: BoxDecoration(
                            color: AppColor.primary, shape: BoxShape.rectangle),
                        selectedTextStyle:
                            TextStyle(fontSize: 13, color: AppColor.white),
                        defaultTextStyle: TextStyle(fontSize: 12)),
                    selectedDayPredicate: (day) =>
                        isSameDay(day, DateTime.now()),
                    onDaySelected: (selectedDay, focusedDay) => true,
                    // obj.selectdate(selectedDay, focusedDay),
                    availableGestures: AvailableGestures.all,
                    headerStyle: const HeaderStyle(
                        formatButtonVisible: false, titleCentered: true),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
