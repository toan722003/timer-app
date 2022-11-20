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
          child: const Icon(
            Icons.arrow_left,
            color: UIColor.black,
            size: 50,
          ),
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          "Today Tasks (10)",
          style: UITextStyle.newTask_black_24_bold,
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
                Get.to(()=>CountDownTask());
              },
            );
          },
          itemCount: 15,
        ),
      ),
    );
  }
}
