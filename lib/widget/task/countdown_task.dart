import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timer_app/controller/count_down_task%20_controller.dart';

import '../../theme/color.dart';
import '../../theme/textStyle.dart';

class CountDownTask extends StatelessWidget {
  CountDownTask({Key? key}) : super(key: key);
  CountDownTaskController countDownTaskController = Get.find();

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
          "Reading Book",
          style: UITextStyle.newTask_black_24_bold,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            CircularCountDownTimer(
              duration: countDownTaskController.duration,
              initialDuration: 0,
              controller: countDownTaskController.controller,
              width: 300.w,
              height: 300.h,
              ringColor: Colors.grey[300]!,
              ringGradient: null,
              fillColor: UIColor.accentBlue,
              fillGradient: null,
              backgroundColor: UIColor.white,
              backgroundGradient: null,
              strokeWidth: 20.0,
              strokeCap: StrokeCap.round,
              textStyle: UITextStyle.time_black_70_bold,
              textFormat: CountdownTextFormat.S,
              isReverse: true,
              isReverseAnimation: true,
              isTimerTextShown: true,
              autoStart: false,
            ),
            SizedBox(height: 70.h),
            Row(
              children: [
                Obx(
                  () => Expanded(
                      child: countDownTaskController.isVisiable.value
                          ? InkWell(
                              onTap: () {
                                countDownTaskController.controller.start();
                                countDownTaskController.isVisiable.value = false;
                                countDownTaskController.isResume.value = true;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 70.h,
                                width: 70.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: UIColor.accentGreen,
                                ),
                                child: Text(
                                  "Start",
                                  style: UITextStyle.newTask_black_24_bold
                                      .copyWith(color: UIColor.white, fontSize: 20),
                                ),
                              ),
                            )
                          : Container()),
                ),
                Obx(
                  () => countDownTaskController.isResume.value
                      ? Expanded(
                          child: button(
                              onPressed: countDownTaskController.checkResume,
                              image: "resources/images/stop.png"),
                        )
                      : Expanded(
                          child: button(
                              onPressed: countDownTaskController.checkResume,
                              image: "resources/images/tritangleicon.png"),
                        ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => countDownTaskController.controller
                        .restart(duration: countDownTaskController.duration),
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("resources/images/replace.png"),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button({String? title, VoidCallback? onPressed, String? image}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 70.h,
        width: 70.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: UIColor.accentGreen,
        ),
        child: Image(
          width: 40.w,
          height: 40.h,
          image: AssetImage("$image"),
        ),
      ),
    );
  }
}
