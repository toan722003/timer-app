import 'package:get/get.dart';
import 'package:timer_app/controller/add_task_controllrer.dart';

class AddTaskBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddTaskController>(() => AddTaskController());
  }
}