import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timer_app/controller/add_clock_controller.dart';
import 'package:timer_app/theme/color.dart';
import 'package:timer_app/theme/textStyle.dart';

class AddClockWidget extends StatefulWidget {
  const AddClockWidget({Key? key}) : super(key: key);

  @override
  _AddClockWidgetState createState() => _AddClockWidgetState();
}

class _AddClockWidgetState extends State<AddClockWidget> {

  AddClockController addClockController = Get.find();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 130.w,
        backgroundColor: UIColor.white,
        leading: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20.w, top: 8.h, bottom: 8.h),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: UIColor.accentRed,
          ),
          child: InkWell(
            child: Text(
              "Cancel",
              style: UITextStyle.cancel_black_24_normal.copyWith(fontSize: 20.sp),
            ),
            onTap: () {
              Get.back();
            },
          ),
        ),
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            height: 35.h,
            margin: EdgeInsets.only(left: 20.w, top: 8.h, bottom: 8.h),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: UIColor.accentGreen,
            ),
            child: InkWell(
              onTap: () {
              },
              child: Text(
                "Done",
                style: UITextStyle.cancel_black_24_normal.copyWith(fontSize: 20.sp,color: UIColor.white),
              ),
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
