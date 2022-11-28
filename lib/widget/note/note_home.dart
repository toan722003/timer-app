import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/color.dart';
import '../../theme/textStyle.dart';

DateTime get getNow => DateTime.now();

class NoteHomeWidget extends StatefulWidget {
  NoteHomeWidget({Key? key}) : super(key: key);

  @override
  State<NoteHomeWidget> createState() => _NoteHomeWidgetState();
}

class _NoteHomeWidgetState extends State<NoteHomeWidget> {
  final List<CalendarEventData<Event>> _events = [
    CalendarEventData(
        title: "1",
        date: DateTime(2022, 11, 23, 1, 30),
        startTime: DateTime(2022, 11, 23, 1, 30),
        endTime: DateTime(2022, 11, 23, 2, 30),
        endDate: DateTime(2022, 11, 23, 1, 30),
        event: Event(title: "quite")),
    CalendarEventData(
        title: "2",
        date: getNow,
        startTime: DateTime(2022, 11, 23, 3, 30),
        endTime: DateTime(2022, 11, 23, 4, 30),
        endDate: getNow.subtract(const Duration(days: 1)),
        event: Event(title: "quite1")),
    CalendarEventData(
        title: "2",
        date: getNow,
        startTime: DateTime(2022, 11, 23, 6, 30),
        endTime: DateTime(2022, 11, 23, 7, 30),
        endDate: getNow.subtract(const Duration(days: 1)),
        event: Event(title: "quite2")),
    CalendarEventData(
        title: "3",
        date: getNow,
        startTime: DateTime(2022, 11, 23, 12, 30),
        endTime: DateTime(2022, 11, 23, 13, 30),
        endDate: getNow.subtract(const Duration(days: 1)),
        event: Event(title: "quite3")),
    CalendarEventData(
        title: "4",
        date: getNow,
        startTime: DateTime(2022, 11, 23, 18, 30),
        endTime: DateTime(2022, 11, 23, 20, 30),
        endDate: getNow.subtract(const Duration(days: 1)),
        event: Event(title: "quite4")),
  ];

  @override
  Widget build(BuildContext context) {
    EventController<Event> controller = EventController();
    return CalendarControllerProvider(
        controller: controller,
        child: Scaffold(
          body: DayView(
            controller: controller..addAll(_events),
            eventTileBuilder: (date, events, rect, start, end) {
              CalendarEventData calendarEventData = events.elementAt(0);
              // date = calendarEventData.endDate;
              // start = calendarEventData.startTime!;
              // end = calendarEventData.endTime!;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                height: 30,
                decoration: const BoxDecoration(
                  color: UIColor.accentRed,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        calendarEventData.title,
                        style: UITextStyle.note_white_16_bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "$start",
                        style: UITextStyle.note_white_12_normal,
                      ),
                    )
                  ],
                ),
              );
            },
            showVerticalLine: false,
            // To display live time line in day view.
            showLiveTimeLineInAllDays: false,
            // To display live time line in all pages in day view.
            minDay: DateTime(2020),
            maxDay: DateTime(2023),
            initialDay: DateTime.now(),
            heightPerMinute: 1,
            // height occupied by 1 minute time span.
            eventArranger: const SideEventArranger(),
            // To define how simultaneous events will be arranged.
            onEventTap: (events, date) {
              print(events.elementAt(0).startTime);
            },
            onDateLongPress: (date) => {},
          ),
        ));
  }
}

class Event {
  String title;

  Event({required this.title});
}
