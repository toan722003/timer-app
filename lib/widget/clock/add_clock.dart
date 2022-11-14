import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 130,
        backgroundColor: UIColor.white,
        leading: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, top: 8, bottom: 8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: UIColor.accentRed,
          ),
          child: InkWell(
            child: Text(
              "Cancel",
              style: UITextStyle.cancel_black_24_normal.copyWith(fontSize: 20),
            ),
            onTap: () {
              Get.back();
            },
          ),
        ),
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 35.h,
            margin: EdgeInsets.only(right: 20, top: 8, bottom: 8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: UIColor.accentGreen,
            ),
            child: InkWell(
              onTap: () {},
              child: Text(
                "Done",
                style:
                    UITextStyle.cancel_black_24_normal.copyWith(fontSize: 20, color: UIColor.white),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        color: UIColor.white,
        child: Column(
          children: [
            Container(
              child: TimePickerSpinner(
                alignment: Alignment.center,
                is24HourMode: true,
                normalTextStyle: TextStyle(fontSize: 24.sp, color: UIColor.black),
                highlightedTextStyle: TextStyle(fontSize: 24.sp, color: UIColor.black),
                spacing: 50.w,
                itemHeight: 80.h,
                isForce2Digits: true,
                // onTimeChange: (time) {
                //   setState(() {
                //     _dateTime = time;
                //   });
                // },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
