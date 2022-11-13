import 'package:get/get.dart';
import 'package:timer_app/controller/task_controller.dart';

class TaskBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TaskController>(() => TaskController());
  }

}