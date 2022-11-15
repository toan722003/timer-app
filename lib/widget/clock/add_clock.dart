import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:timer_app/controller/add_clock_controller.dart';
import 'package:timer_app/theme/color.dart';
import 'package:timer_app/theme/textStyle.dart';
import 'package:timer_app/widget/clock/futureAddClock.dart';

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
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: UIColor.white,
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
            margin: EdgeInsets.only(right: 20.w, top: 8.h, bottom: 8.h),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: UIColor.accentGreen,
            ),
            child: InkWell(
              onTap: () {
                print("Tao bao thuc thanh cong");
              },
              child: Text(
                "Done",
                // style:
                //     UITextStyle.cancel_black_24_normal.copyWith(fontSize: 20, color: UIColor.white),
                style: UITextStyle.cancel_black_24_normal
                    .copyWith(fontSize: 20.sp, color: UIColor.white),
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
              margin: EdgeInsets.symmetric(vertical: 10.h),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: UIColor.accentGreen, style: BorderStyle.solid, width: 3),
              ),
              child: TimePickerSpinner(
                alignment: Alignment.center,
                is24HourMode: true,
                normalTextStyle: TextStyle(fontSize: 20.sp, color: UIColor.black),
                highlightedTextStyle: TextStyle(fontSize: 20.sp, color: UIColor.black),
                spacing: 40.w,
                itemHeight: 50.h,
                isForce2Digits: true,
                // onTimeChange: (time) {
                //   setState(() {
                //     _dateTime = time;
                //   });
                // },
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 2.w),
              height: 40.h,
              child: ListView.separated(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    width: 35.w,
                    height: 35.h,
                    decoration: const BoxDecoration(
                      color: UIColor.accentWhite,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      child: Text(
                        index == 6 ? "CN" : "T${index + 2}",
                        style: UITextStyle.day_white_13_bold,
                      ),
                      onTap: (){
                        print("T$index");
                      },
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 12.w,
                  );
                },
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureAddClock(imageIcon: "resources/images/rung.png", nameFuture: "Rung"),
                InkResponse(
                  onTap: () {
                    print("Rung");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: UIColor.accentWhite,
                      shape: BoxShape.circle,
                      border: Border.all(color: UIColor.black, style: BorderStyle.solid),
                    ),
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureAddClock(
                    imageIcon: "resources/images/calender.png", nameFuture: "Hen bao thuc"),
                InkResponse(
                  onTap: () {
                    print("Hen bao thuc");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: UIColor.accentWhite,
                        shape: BoxShape.circle,
                        border: Border.all(color: UIColor.black, style: BorderStyle.solid),
                        image: const DecorationImage(
                          image: AssetImage("resources/images/images.png"),
                        )),
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            InkResponse(
              focusColor: UIColor.accentGreen,
              hoverColor: UIColor.accentGreen,
              highlightColor: UIColor.accentGreen,
              onTap: () {
                print("Nhac chuong");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureAddClock(
                      imageIcon: "resources/images/chuong.png", nameFuture: "Nhac Chuong"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
