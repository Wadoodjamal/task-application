import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_dimensions.dart';
import 'app_theme.dart';

abstract class UIProps {
  // Animations
  static Duration duration = const Duration(milliseconds: 280);
  static Duration duration2 = const Duration(milliseconds: 400);

  // Paddings
  static late EdgeInsets btnPadMed;
  static late EdgeInsets btnPadSm;

  // Radius
  static late BorderRadius radius;
  static late BorderRadius tabRadius;
  static late BorderRadius buttonRadius;
  static late BorderRadius radiusS;
  static late BorderRadius radiusL;
  static late BorderRadius radiusXL;
  static late BoxDecoration borderButton;
  static late BorderRadius topBoth15;
  static late BorderRadius topBoth30;
  static late BorderRadius topBoth50;

  // Shadows
  static late List<BoxShadow> cardShadow;
  static late List<BoxShadow> couponCardShadowLight;

  static late List<BoxShadow> couponCardShadowFull;
  static late List<BoxShadow> statsCardShadow;
  // BoxDecoration
  static BoxDecoration? boxCard;
  static BoxDecoration? boxCardWhite;
  static BoxDecoration? boxCardRounded;

  static init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));

    initRadius(context);
    initButtons();
    initShadows();
    initBoxDecorations();
  }

  static initRadius(BuildContext context) {
    // radius = 16 (previous code)
    tabRadius = BorderRadius.circular(16 * 2);
    buttonRadius = BorderRadius.circular(16 * 10);

    radiusS = BorderRadius.circular(ScreenUtil().radius(12));

    radius = BorderRadius.circular(ScreenUtil().radius(12));

    radiusL = BorderRadius.circular(ScreenUtil().radius(25));
    radiusXL = BorderRadius.circular(ScreenUtil().radius(100));

    topBoth15 = BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil().radius(15)),
      topRight: Radius.circular(ScreenUtil().radius(15)),
    );

    topBoth30 = BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil().radius(30)),
      topRight: Radius.circular(ScreenUtil().radius(30)),
    );

    topBoth50 = BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil().radius(50)),
      topRight: Radius.circular(ScreenUtil().radius(50)),
    );
  }

  static initButtons() {
    borderButton = BoxDecoration(
      borderRadius: UIProps.buttonRadius,
      border: Border.all(
        width: 1.4,
        color: AppTheme.c.primary,
      ),
    );
    btnPadSm = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding! * 2,
      vertical: AppDimensions.padding! * 1.0,
    );
    btnPadMed = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding! * 3,
      vertical: AppDimensions.padding! * 1.5,
    );
  }

  static initShadows() {
    cardShadow = [
      BoxShadow(
        color: AppTheme.c.primary.withAlpha(80),
        blurRadius: 15,
        spreadRadius: 0,
        offset: const Offset(0, 2),
      ),
    ];
    couponCardShadowLight = [
      BoxShadow(
          color: AppTheme.c.shadowSub!.withOpacity(0.4),
          blurRadius: 21,
          spreadRadius: 0,
          offset: const Offset(-7, 3)),
    ];
    couponCardShadowFull = [
      BoxShadow(
          color: AppTheme.c.shadowSub!,
          blurRadius: 21,
          spreadRadius: 0,
          offset: const Offset(-7, 3)),
    ];
    statsCardShadow = [
      BoxShadow(
          color: const Color(0xff081587).withOpacity(0.03),
          blurRadius: 24,
          spreadRadius: 0,
          offset: const Offset(-5, 13)),
    ];
  }

  static initBoxDecorations() {
    boxCard = BoxDecoration(
      borderRadius: radius,
      boxShadow: cardShadow,
      color: AppTheme.c.backgroundSub,
    );
    boxCardRounded = boxCard!.copyWith(borderRadius: radiusXL);

    boxCardWhite = boxCard!.copyWith(
      color: Colors.white,
    );
  }
}
