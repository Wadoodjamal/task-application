import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_application/configs/configs.dart';
import 'package:flutter/material.dart';

class AppText {
  static TextStyle? btn;

  // Headings
  static late TextStyle h1;
  static late TextStyle h1b;
  static late TextStyle h1bm;
  static late TextStyle h2;
  static late TextStyle h2b;
  static late TextStyle h2bm;
  static late TextStyle h3;
  static late TextStyle h3b;
  static late TextStyle h3bm;
  static late TextStyle h4;
  static late TextStyle h4b;
  static late TextStyle h4bm;
  static late TextStyle h5;
  static late TextStyle h5b;
  static late TextStyle h5bm;
  static late TextStyle h6;
  static late TextStyle h6b;
  static late TextStyle h6bm;

  // Body
  static late TextStyle b1;
  static late TextStyle b1b;
  static late TextStyle b1bm;
  static late TextStyle b2;
  static late TextStyle b2b;
  static late TextStyle b2bm;
  static late TextStyle b3;
  static late TextStyle b3b;
  static late TextStyle b3bm;
  static late TextStyle b4;
  static late TextStyle b4b;
  static late TextStyle b4bm;

  // Label
  static late TextStyle l1;
  static late TextStyle l1b;
  static late TextStyle l1bm;
  static late TextStyle l2;
  static late TextStyle l2b;
  static late TextStyle l2bm;
  static late TextStyle l3;
  static late TextStyle l3b;
  static late TextStyle l3bm;

  static init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));

    const b = FontWeight.bold;
    const baseStyle = TextStyle(fontFamily: fontFamily);

    // heading fonts
    h1 = baseStyle.copyWith(
        fontSize: 32 * MediaQuery.of(context).textScaleFactor);
    h1b = h1.copyWith(fontWeight: b);
    h1bm = h1.copyWith(fontWeight: FontWeight.w500);

    h2 = baseStyle.copyWith(
        fontSize: 30 * MediaQuery.of(context).textScaleFactor);
    h2b = h2.copyWith(fontWeight: b);
    h2bm = h2.copyWith(fontWeight: FontWeight.w500);

    h3 = baseStyle.copyWith(
        fontSize: 28 * MediaQuery.of(context).textScaleFactor);
    h3b = h3.copyWith(fontWeight: b);
    h3bm = h3.copyWith(fontWeight: FontWeight.w500);

    h4 = baseStyle.copyWith(
        fontSize: 26 * MediaQuery.of(context).textScaleFactor);
    h4b = h1.copyWith(fontWeight: b);
    h4bm = h1.copyWith(fontWeight: FontWeight.w500);

    h5 = baseStyle.copyWith(
        fontSize: 24 * MediaQuery.of(context).textScaleFactor);
    h5b = h2.copyWith(fontWeight: b);
    h5bm = h2.copyWith(fontWeight: FontWeight.w500);

    h6 = baseStyle.copyWith(
        fontSize: 22 * MediaQuery.of(context).textScaleFactor);
    h6b = h3.copyWith(fontWeight: b);
    h6bm = h3.copyWith(fontWeight: FontWeight.w500);

    // body fonts
    b1 = baseStyle.copyWith(
        fontSize: 18 * MediaQuery.of(context).textScaleFactor);
    b1b = b1.copyWith(fontWeight: b);
    b1bm = b1.copyWith(fontWeight: FontWeight.w500);

    b2 = baseStyle.copyWith(
        fontSize: 16 * MediaQuery.of(context).textScaleFactor);
    b2b = b1.copyWith(fontWeight: b);
    b2bm = b1.copyWith(fontWeight: FontWeight.w500);

    b3 = baseStyle.copyWith(
        fontSize: 14 * MediaQuery.of(context).textScaleFactor);
    b3b = b2.copyWith(fontWeight: b);
    b3bm = b2.copyWith(fontWeight: FontWeight.w500);

    b4 = baseStyle.copyWith(
        fontSize: 12 * MediaQuery.of(context).textScaleFactor);
    b4b = b2.copyWith(fontWeight: b);
    b4bm = b2.copyWith(fontWeight: FontWeight.w500);

    // label fonts
    l1 = baseStyle.copyWith(
        fontSize: 10 * MediaQuery.of(context).textScaleFactor);
    l1b = l1.copyWith(fontWeight: b);
    l1bm = l1.copyWith(fontWeight: FontWeight.w500);

    l2 = baseStyle.copyWith(
        fontSize: 8 * MediaQuery.of(context).textScaleFactor);
    l2b = l2.copyWith(fontWeight: b);
    l2bm = l2.copyWith(fontWeight: FontWeight.w500);

    l3 = baseStyle.copyWith(
        fontSize: 6 * MediaQuery.of(context).textScaleFactor);
    l3b = l2.copyWith(fontWeight: b);
    l3bm = l2.copyWith(fontWeight: FontWeight.w500);
  }
}
