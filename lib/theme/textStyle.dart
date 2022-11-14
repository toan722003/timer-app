import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';

class UITextStyle {
  static TextStyle item_clock_black_40_bold = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.black, fontSize: 40, fontWeight: FontWeight.bold),
  );
  static TextStyle item_clock_black_15_bold = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.black, fontSize: 15, fontWeight: FontWeight.bold),
  );
  static TextStyle button_select_black_16_bold = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.black, fontSize: 16, fontWeight: FontWeight.bold),
  );
  static TextStyle button_select_accentWhite_16_bold = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.accentWhite, fontSize: 16, fontWeight: FontWeight.bold),
  );
  static TextStyle function_clock_black_15_normal = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.black, fontSize: 15, fontWeight: FontWeight.normal),
  );
  static TextStyle taskbar_item_black_12_normal = GoogleFonts.openSans(
    textStyle: TextStyle(color: UIColor.black.withOpacity(0.58), fontSize: 12, fontWeight: FontWeight.normal),
  );
  static TextStyle taskbar_item_black_12_bold = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.black, fontSize: 12, fontWeight: FontWeight.bold),
  );
  static TextStyle cancel_black_24_normal = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.black, fontSize: 24, fontWeight: FontWeight.normal),
  );
  static TextStyle save_white_24_normal = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.white, fontSize: 24, fontWeight: FontWeight.normal),
  );
  static TextStyle day_white_13_bold = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.white, fontSize: 13, fontWeight: FontWeight.bold),
  );
  static TextStyle text_notifical_red_20_bold = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.red, fontSize: 20, fontWeight: FontWeight.bold),
  );
  static TextStyle percent_black_25_bold = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.black, fontSize: 25, fontWeight: FontWeight.bold),
  );
  static TextStyle textViewPeecent_black_18_bold = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.black, fontSize: 18, fontWeight: FontWeight.bold),
  );
  static TextStyle countTask_accantGrey_14_normal = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.accentGrey, fontSize: 14, fontWeight: FontWeight.normal),
  );
  static TextStyle todayTask_black_20_bold = text_notifical_red_20_bold.copyWith(color: UIColor.black);
  static TextStyle newTask_black_24_bold = cancel_black_24_normal.copyWith(fontWeight: FontWeight.bold);
  static TextStyle button_newTask_white_20_bold = text_notifical_red_20_bold.copyWith(color: UIColor.white.withOpacity(0.88));
  static TextStyle hide_text_accentWhite_12_normal = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.accnetWhite, fontSize: 12, fontWeight: FontWeight.normal),
  );
  static TextStyle time_black_70_bold = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.black, fontSize: 70, fontWeight: FontWeight.bold),
  );
  static TextStyle text_notifical_red_28_bold = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.red, fontSize: 28, fontWeight: FontWeight.bold),
  );
  static TextStyle note_white_12_normal = GoogleFonts.openSans(
    textStyle: const TextStyle(color: UIColor.white, fontSize: 12, fontWeight: FontWeight.normal),
  );
  static TextStyle note_white_16_bold = GoogleFonts.openSans(
    textStyle: TextStyle(color: UIColor.white, fontSize: 16, fontWeight: FontWeight.bold),
  );
}
