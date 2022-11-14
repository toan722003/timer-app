import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_app/theme/color.dart';
import 'package:timer_app/theme/textStyle.dart';

class FutureAddClock extends StatelessWidget {
  String imageIcon;
  String nameFuture;
  String? imageButton;
  Function? onTap;

  FutureAddClock(
      {Key? key, required this.imageIcon, required this.nameFuture, this.imageButton, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.only(left: 5.w),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageIcon),
              ),
              shape: BoxShape.circle,
              border: Border.all(style: BorderStyle.solid, color: UIColor.black),
            ),
          ),
          SizedBox(
            width: 25.w,
          ),
          Text(
            nameFuture,
            style: UITextStyle.function_clock_black_15_normal,
          ),
        ],
      ),
    );
  }
}
