import 'dart:math';

import 'package:birthday_app/app/modules/dashboard/calender/views/calender_view.dart';
import 'package:birthday_app/consts/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderController extends GetxController {
  DateTime? selectedDay;
  DateTime? focusedDay;
  DateTime minDate = DateTime.parse(
      '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-01');

  DateTime maxDate = DateTime(2100);
  late var calendarDataSource;
  CalendarController calendarController = CalendarController();
  late Map<DateTime, List<Appointment>> dataCollection = getAppointments();

  @override
  void onInit() {
    // dataCollection = ;
    calendarDataSource = MeetingDataSource(_getDataSource());
    print(dataCollection);
    super.onInit();
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9).add(Duration(days: 20));
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }

  Map<DateTime, List<Appointment>> getAppointments() {
    final List<String> subjectCollection = <String>[];
    subjectCollection.add('General Meeting');
    subjectCollection.add('Plan Execution');
    subjectCollection.add('Project Plan');
    subjectCollection.add('Consulting');
    subjectCollection.add('Support');
    subjectCollection.add('Development Meeting');
    subjectCollection.add('Scrum');
    subjectCollection.add('Project Completion');
    subjectCollection.add('Release updates');
    subjectCollection.add('Performance Check');

    final List<Color> colorCollection = <Color>[];
    colorCollection.add(const Color(0xFF0F8644));
    colorCollection.add(const Color(0xFF8B1FA9));
    colorCollection.add(const Color(0xFFD20100));
    colorCollection.add(const Color(0xFFFC571D));
    colorCollection.add(const Color(0xFF36B37B));
    colorCollection.add(const Color(0xFF01A1EF));
    colorCollection.add(const Color(0xFF3D4FB5));
    colorCollection.add(const Color(0xFFE47C73));
    colorCollection.add(const Color(0xFF636363));
    colorCollection.add(const Color(0xFF0A8043));

    final Random random = Random();
    var dataCollection = <DateTime, List<Appointment>>{};
    final DateTime today = DateTime.now();
    final DateTime rangeStartDate = DateTime(today.year, today.month, today.day)
        .add(const Duration(days: 2));
    final DateTime rangeEndDate = DateTime(today.year, today.month, today.day)
        .add(const Duration(days: 100));
    for (DateTime i = rangeStartDate;
        i.isBefore(rangeEndDate);
        i = i.add(Duration(days: 1 + random.nextInt(2)))) {
      final DateTime date = i;
      final int count = 1 + random.nextInt(3);
      for (int j = 0; j < count; j++) {
        final DateTime startDate = DateTime(
            date.year, date.month, date.day, 8 + random.nextInt(8), 0, 0);
        final int duration = random.nextInt(3);
        final Appointment meeting = Appointment(
            subject: subjectCollection[random.nextInt(7)],
            startTime: startDate,
            endTime:
                startDate.add(Duration(hours: duration == 0 ? 1 : duration)),
            color: colorCollection[random.nextInt(9)],
            isAllDay: false);

        if (dataCollection.containsKey(date)) {
          final List<Appointment> meetings = dataCollection[date]!;
          meetings.add(meeting);
          dataCollection[date] = meetings;
        } else {
          dataCollection[date] = [meeting];
        }
      }
    }
    return dataCollection;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  showDialog(
    BuildContext context,
    double width,
    String title,
    String subTitle,
    List list,
  ) {
    showAdaptiveDialog(
        barrierColor: AppColor.white.withOpacity(0.6),
        context: context,
        builder: (BuildContext context) {
          return const CalenderView().adaptiveAlertDialog(
            context,
            width,
            title,
            subTitle,
            list,
          );
        });
  }
}

// class MeetingDataSource extends CalendarDataSource {
//   MeetingDataSource(List<Appointment> source) {
//     appointments = source;
//   }

//   @override
//   Future<void> handleLoadMore(DateTime startDate, DateTime endDate) async {
//     await Future.delayed(const Duration(seconds: 1));
//     final List<Appointment> meetings = <Appointment>[];
//     DateTime appStartDate = startDate;
//     DateTime appEndDate = endDate;

//     while (appStartDate.isBefore(appEndDate)) {
//       final List<Appointment>? data =
//           CalenderController().dataCollection[appStartDate];
//       if (data == null) {
//         appStartDate = appStartDate.add(const Duration(days: 1));
//         continue;
//       }
//       for (final Appointment meeting in data) {
//         if (appointments!.contains(meeting)) {
//           continue;
//         }
//         meetings.add(meeting);
//       }
//       appStartDate = appStartDate.add(const Duration(days: 1));
//     }
//     appointments!.addAll(meetings);
//     notifyListeners(CalendarDataSourceAction.add, meetings);
//   }
// }

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
