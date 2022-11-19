import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timer_app/controller/task_controller.dart';
import 'package:timer_app/theme/color.dart';
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
        margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
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
                  Expanded(child: Container()),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wow! Your daily goals is almost done",
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
                  "Today Tasks",
                  style: UITextStyle.todayTask_black_20_bold,
                )),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: UITextStyle.text_notifical_red_20_bold,
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
                    image: "resources/images/readingbook.png",
                    title: "Read Book",
                    time: "50 minutes",
                    onTap: () {},
                    color: index % 2 == 0 ? UIColor.yellow : UIColor.accentGreen,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 70.w,
        height: 70.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: UIColor.accentWhite,
            border: Border.all(style: BorderStyle.solid, color: UIColor.black, width: 2),
            image: const DecorationImage(
              image: AssetImage("resources/images/images.png"),
            )),
        child: InkWell(
          onTap: () {
            Get.toNamed("/task/addtask");
          },
        ),
      ),
    );
  }
}
