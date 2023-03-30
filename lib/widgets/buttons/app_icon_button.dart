import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_application/configs/app_theme.dart';

enum AppIconButtonSize {
  normal,
  small,
}

class AppIconButton extends StatelessWidget {
  final Icon icon;
  final Color? color;
  final VoidCallback onPressed;
  final AppIconButtonSize size;

  const AppIconButton({
    Key? key,
    this.color,
    required this.icon,
    required this.onPressed,
    this.size = AppIconButtonSize.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1440, 789));

    return InkWell(
      borderRadius: BorderRadius.circular(360),
      onTap: onPressed,
      child: Container(
        height: size == AppIconButtonSize.small ? 43.h : 53.h,
        width: size == AppIconButtonSize.small ? 50.w : 60.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? AppTheme.c.primary,
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
