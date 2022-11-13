import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_app/widget/clock/clock_home.dart';
import 'package:timer_app/widget/note/note_home.dart';
import 'package:timer_app/widget/setting/setting.dart';
import 'package:timer_app/widget/task/task_home.dart';

class HomeMenuController extends GetxController {

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
  }

  final List<Widget> listScreen = [
     ClockHomeWidget(),
     TaskHomeWidget(),
     NoteHomeWidget(),
     SettingWidget()
  ];

  void onTapChange(int index) {
    switch (index) {
      case 0:
        ClockHomeWidget();
        break;
      case 1:
        TaskHomeWidget();
        break;
      case 2:
        NoteHomeWidget();
        break;
      case 3:
        SettingWidget();
        break;
    }
    tabController.index = index;
  }
}
