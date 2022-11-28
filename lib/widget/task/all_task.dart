import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timer_app/widget/task/countdown_task.dart';
import 'package:timer_app/widget/task/itemTaskInListView.dart';

import '../../theme/color.dart';
import '../../theme/textStyle.dart';

class AllTask extends StatelessWidget {
   const AllTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.white,
      appBar: AppBar(
        backgroundColor: UIColor.white,
        elevation: 0.0,
        leading: InkWell(
          child: Icon(
            Icons.arrow_left,
            color: UIColor.black.withOpacity(0.75),
            size: 50,
          ),
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          "Today Tasks (10)",
          style: UITextStyle.newTask_black_24_bold.copyWith(color: UIColor.black.withOpacity(0.75)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ItemTaskInListView(
              title: "Learn Programing",
              time: 50,
              image: "resources/images/learn_programming.png",
              color: UIColor.black.withOpacity(0.25),
              onTap: (){
                Get.toNamed("/countdown");
              },
            );
          },
          itemCount: 15,
        ),
      ),
    );
  }
}
