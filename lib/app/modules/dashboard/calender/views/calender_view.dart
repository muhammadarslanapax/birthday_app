import 'package:birthday_app/consts/app_color.dart';
import 'package:birthday_app/consts/const.dart';
import 'package:birthday_app/utils/style.dart';
import 'package:birthday_app/widget/cText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
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
            child: GetBuilder<CalenderController>(
                init: CalenderController(),
                builder: (obj) {
                  return Column(
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
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppStyle.size(context, 12)),
                            color: AppColor.secondary),
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: AppStyle.defaultPadding(context),
                            vertical: height * 0.01),
                        child: const CText(
                            textAlign: TextAlign.start, text: clickInfo),
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      Container(
                        width: width,
                        //height: height * 0.5,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            color: AppColor.secondary,
                            borderRadius: BorderRadius.circular(
                                AppStyle.defaultRadius(context))),
                        child: TableCalendar(
                          firstDay: obj.minDate,
                          lastDay:
                              DateTime.now().add(const Duration(days: 4433)),
                          focusedDay: DateTime.now(),
                          rowHeight: height * 0.044,

                          eventLoader: (day) {
                            // if (day.weekday == DateTime.monday) {
                            //   return [Event('Cyclic event')];
                            // }

                            return [];
                          },
                          calendarStyle: const CalendarStyle(
                              // cellMargin: EdgeInsets.all(4),
                              selectedDecoration: BoxDecoration(
                                  color: AppColor.primary,
                                  shape: BoxShape.rectangle),
                              selectedTextStyle: TextStyle(
                                  fontSize: 13, color: AppColor.white),
                              defaultTextStyle: TextStyle(fontSize: 12)),
                          selectedDayPredicate: (day) =>
                              isSameDay(obj.selectedDay, day),

                          onDaySelected: (selectedDay, focusedDay) {
                            obj.selectedDay = selectedDay;
                            obj.focusedDay = focusedDay;
                            obj.update();
                          },

                          // obj.selectdate(selectedDay, focusedDay),
                          availableGestures: AvailableGestures.all,

                          headerStyle: const HeaderStyle(
                              formatButtonVisible: false, titleCentered: true),
                        ),
                        // child: SfCalendar(
                        //   view: CalendarView.month,
                        //   initialDisplayDate: DateTime.now(),
                        //   controller: obj.calendarController,
                        //   minDate: obj.minDate,
                        //   maxDate: obj.maxDate,
                        //   showNavigationArrow: true,
                        //   monthViewSettings: const MonthViewSettings(
                        //       appointmentDisplayMode:
                        //           MonthAppointmentDisplayMode.appointment),
                        //   dataSource: obj.calendarDataSource,
                        //   loadMoreWidgetBuilder: (BuildContext context,
                        //       LoadMoreCallback loadMoreAppointments) {
                        //     return FutureBuilder(
                        //       future: loadMoreAppointments(),
                        //       builder: (context, snapShot) {
                        //         if (snapShot.connectionState ==
                        //             ConnectionState.waiting) {
                        //           return Container(
                        //             alignment: Alignment.center,
                        //             child: CircularProgressIndicator(
                        //               valueColor:
                        //                   AlwaysStoppedAnimation(Colors.blue),
                        //             ),
                        //           );
                        //         } else if (snapShot.hasError) {
                        //           print(snapShot.error);
                        //           return CText(
                        //               text: snapShot.error.toString());
                        //           // Container(
                        //           //   alignment: Alignment.center,
                        //           //   child: CircularProgressIndicator(
                        //           //     valueColor:
                        //           //         AlwaysStoppedAnimation(Colors.red),
                        //           //   ),
                        //           // );
                        //         } else {
                        //           return CText(text: '');
                        //         }
                        //       },
                        //     );
                        //   },
                        // )
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  AlertDialog adaptiveAlertDialog(
    BuildContext context,
    double width,
    String title,
    String subTitle,
    List list,
  ) {
    return AlertDialog.adaptive(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topRight,
            child: InkWell(
              child: Icon(
                Icons.close,
                size: AppStyle.smallsize(context),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Center(
            child: CText(
              text: title,
              fontsize: AppStyle.headingsize(context),
            ),
          ),
          CText(
            text: subTitle,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 5),
            child: Column(
                children: list.map((e) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: width * 0.016),
                    child: Container(
                      height: width * 0.02,
                      width: width * 0.02,
                      decoration: const BoxDecoration(
                          color: AppColor.black, shape: BoxShape.circle),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  SizedBox(
                      width: width * 0.54,
                      child: CText(
                        text: e,
                        textAlign: TextAlign.start,
                      )),
                ],
              );
            }).toList()),
          ),
          const CText(
            text: 'And much more',
          ),
        ],
      ),
    );
  }
}
