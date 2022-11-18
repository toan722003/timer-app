import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_app/theme/color.dart';
import 'package:timer_app/theme/textStyle.dart';

class ItemTaskInListView extends StatelessWidget {
  String? title;
  String? time;
  String? image;
  Function? onTap;
  Color? color;

  ItemTaskInListView({Key? key, this.title, this.time, this.image, this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String image = this.image != null ? this.image! : "";
    String title = this.title != null ? this.title! : "";
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h,horizontal: 3.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      height: 88.h,
      decoration: BoxDecoration(
        color: UIColor.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: color != null ? color! : UIColor.white,
            offset: const Offset(2, 4),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 70.w,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Image(
              image: AssetImage(image),
            ),
          ),
          SizedBox(width: 20.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: UITextStyle.button_select_black_16_bold,
                ),
                Expanded(child: Container()),
                Text(
                  time!,
                  style: UITextStyle.countTask_accantGrey_14_normal,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h),
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: UIColor.startTimer,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.arrow_right,
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
