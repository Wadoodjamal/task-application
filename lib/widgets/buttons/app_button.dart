import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_application/configs/configs.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final bool elevated;
  final VoidCallback onPressed;
  final bool isBordered;
  final Widget? icon;
  final bool enableShadow;
  final bool isRounded;
  final BorderRadius? radius;

  const AppButton({
    Key? key,
    this.radius,
    this.isRounded = false,
    this.elevated = false,
    required this.child,
    this.height,
    this.width,
    this.color,
    required this.onPressed,
    this.isBordered = false,
    this.icon,
    this.enableShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1440, 789));

    return InkWell(
      onTap: onPressed,
      splashColor: AppTheme.c.primary,
      borderRadius: UIProps.radius,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: width ?? 200.w,
        height: height ?? 45,
        decoration: BoxDecoration(
          borderRadius:
              radius ?? (isRounded ? UIProps.radiusXL : UIProps.radius),
          boxShadow: elevated ? UIProps.couponCardShadowFull : null,
          border: isBordered
              ? Border.all(
                  color: AppTheme.c.primary,
                )
              : null,
          color: color ?? (isBordered ? Colors.white : Colors.white),
        ),
        child: Center(child: child),
      ),
    );
  }
}
