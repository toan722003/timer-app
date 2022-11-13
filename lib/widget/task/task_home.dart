import 'package:flutter/cupertino.dart';
import 'package:timer_app/controller/task_controller.dart';
import 'package:timer_app/theme/color.dart';
import 'package:get/get.dart';

class TaskHomeWidget extends StatefulWidget {
  const TaskHomeWidget({Key? key}) : super(key: key);

  @override
  State<TaskHomeWidget> createState() => _TaskHomeWidgetState();
}

class _TaskHomeWidgetState extends State<TaskHomeWidget> {
  TaskController taskController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: UIColor.red,
    );
  }
}

