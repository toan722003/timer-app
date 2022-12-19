import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTaskController extends GetxController {
  RxDouble countLongBreak = 0.0.obs;
  RxDouble countShortBreak = 0.0.obs;
  List<String> suggestions = [
    "Read Book",
    "Listen Music",
    "Learn Programming",
    "Do Exercise",
    "Play Game",
    "Meditation",
    "Fixing SmartPhone",
    "Study English",
    "Do Homework"
  ];
  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController startTimeController =
      TextEditingController(text: "${DateTime.now().hour} : ${DateTime.now().minute}");
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool checkNull(String text) {
    if (text.isEmpty) return true;
    return false;
  }

  bool checkValidator(String text) {
    for (int i = 0; i < text.length; i++) {
      if (text.codeUnitAt(i) < 48 || text.codeUnitAt(i) > 57) {
        return true;
      }
    }
    return false;
  }

  void onCreateTask() {
    if (globalKey.currentState?.validate() == true) {
      Get.back();
    }
  }
}
