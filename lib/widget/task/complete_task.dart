import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timer_app/extension/translate.dart';
import 'package:timer_app/theme/locale_keys.g.dart';

import '../../theme/color.dart';
import '../../theme/textStyle.dart';

class CompleteAllTask extends StatelessWidget {
  const CompleteAllTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Image(
              image: const AssetImage(
                "resources/images/cup3.png",
              ),
              height: 300.h,
            ),
            SizedBox(height: 30.h),
            Container(
              child: Text(LocaleKeys.task_congratulations.trans(), style: UITextStyle.text_notifical_red_28_bold),
              alignment: Alignment.center,
            ),
            SizedBox(height: 20.h),
            Container(
              width: 200.w,
              alignment: Alignment.center,
              child: Text(
                LocaleKeys.task_content_congratulations.trans(),
                style: UITextStyle.textViewPeecent_black_18_bold,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 30.w),
        height: 40.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: UIColor.red.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: TextButton(
          onPressed: () {
            Get.toNamed("/taskhome");
          },
          child: Text(
            LocaleKeys.task_home.trans(),
            style: UITextStyle.button_select_accentWhite_16_bold
                .copyWith(color: UIColor.red.withOpacity(0.65)),
          ),
        ),
      ),
    );
  }
}
