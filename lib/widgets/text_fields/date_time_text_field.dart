import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:task_application/configs/configs.dart';

class CustomDateTimeField extends StatelessWidget {
  final String name;
  final String hint;
  final String? Function(DateTime?)? validators;
  final InputType? inputType;
  final Icon? icon;
  final DateFormat format;

  const CustomDateTimeField({
    Key? key,
    required this.hint,
    required this.name,
    this.validators,
    this.inputType,
    this.icon,
    required this.format,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return SizedBox(
      width: 380.w,
      child: FormBuilderDateTimePicker(
        currentDate: DateTime.now(),
        style: AppText.b1,
        format: format,
        name: name,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 10)),
        inputType: inputType ?? InputType.date,
        initialDate: DateTime.now(),
        initialTime: TimeOfDay.now(),
        decoration: InputDecoration(
          filled: false,
          hintText: hint,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          prefixIcon: icon,
          hintStyle: AppText.b2.copyWith(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: AppDimensions.normalize(0.75),
              color: Colors.white,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: AppDimensions.normalize(0.75),
              color: Colors.white,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.red.withAlpha(200),
              width: AppDimensions.normalize(0.75),
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.red.withAlpha(200),
              width: AppDimensions.normalize(0.75),
            ),
          ),
        ),
        validator: validators,
      ),
    );
  }
}
