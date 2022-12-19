import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:timer_app/controller/task_controller.dart';
import 'package:timer_app/extension/translate.dart';
import 'package:timer_app/theme/color.dart';
import 'package:timer_app/theme/locale_keys.g.dart';
import 'package:timer_app/widget/task/all_task.dart';
import 'package:timer_app/widget/task/itemTaskInListView.dart';

import '../../theme/textStyle.dart';

class TaskHomeWidget extends StatefulWidget {
  const TaskHomeWidget({Key? key}) : super(key: key);

  @override
  State<TaskHomeWidget> createState() => _TaskHomeWidgetState();
}

class _TaskHomeWidgetState extends State<TaskHomeWidget> {
  TaskController taskController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.white,
      body: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: UIColor.white,
                boxShadow: [
                  BoxShadow(
                    color: UIColor.black.withOpacity(0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: CircularPercentIndicator(
                        radius: 55.0,
                        lineWidth: 10.0,
                        percent: 0.60,
                        center: Text("60%", style: UITextStyle.percent_black_25_bold),
                        backgroundColor: UIColor.countDown_whiteAccent,
                        progressColor: UIColor.newTask_red,
                        // arcBackgroundColor: UIColor.accentBlue,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.task_notification.trans(),
                          style: UITextStyle.textViewPeecent_black_18_bold,
                        ),
                        Text(
                          "10 of 10 completed",
                          style: UITextStyle.countTask_accantGrey_14_normal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  LocaleKeys.task_today_tasks.trans(),
                  style: UITextStyle.todayTask_black_20_bold,
                )),
                TextButton(
                  onPressed: () {
                    Get.to(() => AllTask());
                  },
                  child: Text(
                    LocaleKeys.task_seeAll.trans(),
                    style: UITextStyle.text_notifical_red_20_bold
                        .copyWith(color: UIColor.newTask_redDark),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Container(
              height: 400.h,
              decoration: const BoxDecoration(
                color: UIColor.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ItemTaskInListView(
                    image: taskController.mapImage[index],
                    title: taskController.mapTitle[index],
                    time: 50,
                    onTap: () {
                      Get.toNamed("/countdown");
                    },
                    color: index % 2 == 0 ? UIColor.yellow : UIColor.accentGreen,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Get.toNamed("/task/addtask");
        },
        child: Container(
          width: 70.w,
          height: 70.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [UIColor.task_yellowDark, UIColor.task_redWhite, UIColor.accentBlue],
              stops: [0.2, 0.6, 0.8],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(style: BorderStyle.solid, color: UIColor.black, width: 1),
          ),
          child: const Icon(
            Icons.add_circle,
            color: UIColor.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
