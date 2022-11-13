import 'package:get/get.dart';
import 'package:timer_app/controller/clock_controller.dart';
import 'package:timer_app/controller/home_menu_controller.dart';
import 'package:timer_app/controller/note_controller.dart';
import 'package:timer_app/controller/setting_controller.dart';
import 'package:timer_app/controller/task_controller.dart';

class HomeMenuBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeMenuController>(() => HomeMenuController());
    Get.lazyPut<ClockController>(() => ClockController());
    Get.lazyPut<TaskController>(() => TaskController());
    Get.lazyPut<NoteController>(() => NoteController());
    Get.lazyPut<SettingController>(() => SettingController());
  }

}