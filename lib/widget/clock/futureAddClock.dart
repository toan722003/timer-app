import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_app/theme/color.dart';
import 'package:timer_app/theme/textStyle.dart';

class FutureAddClock extends StatelessWidget {
  IconData iconData;
  String nameFuture;
  Function? onTap;
  Color? color;

  FutureAddClock(
      {Key? key, required this.iconData, required this.nameFuture, this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(style: BorderStyle.solid, color: UIColor.countDown_whiteAccent),
              color: color,
            ),
            child: Icon(iconData, color: UIColor.white),
          ),
          SizedBox(
            width: 20.w,
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
