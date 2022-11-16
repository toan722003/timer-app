import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class AddClockController extends GetxController{
  DateTime focusDay =  DateTime.now() ;
  DateTime? selectDay ;
  CalendarFormat calenderFormat = CalendarFormat.month;
}