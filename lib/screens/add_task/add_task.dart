import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:task_application/configs/app.dart';
import 'package:task_application/responsive/responsive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_application/widgets/buttons/app_button.dart';
import 'package:task_application/widgets/nav/appbar.dart';
import 'package:task_application/widgets/text_fields/custom_text_field.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

import '../../configs/configs.dart';
import '../../models/task.dart';
import '../../provider/app_provider.dart';

part 'views/desktop.dart';
part 'views/tablet.dart';
part 'views/mobile.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(1440, 789));

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        appBar: CustomAppBar(
          isHomeScreen: false,
        ),
        body: SafeArea(
          child: Responsive(
            mobile: Mobile(),
            tablet: Tablet(),
            desktop: Desktop(),
          ),
        ),
      ),
    );
  }
}
