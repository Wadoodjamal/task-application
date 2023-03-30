import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_application/configs/app.dart';
import 'package:task_application/responsive/responsive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_application/utils/static_assets.dart';
import 'package:task_application/widgets/nav/bottom_navbar.dart';

import '../../app_routes.dart';
import '../../configs/configs.dart';
import '../../locator.dart';
import '../../models/task.dart';
import '../../provider/app_provider.dart';
import '../../services/app_navigation.dart';
import '../../widgets/nav/appbar.dart';

part 'views/desktop.dart';
part 'views/tablet.dart';
part 'views/mobile.dart';

part 'widgets/_task_card.dart';
part 'widgets/_task_details_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(1440, 789));

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const CustomAppBar(
          isHomeScreen: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: AppTheme.c.primary,
            size: AppDimensions.normalize(16),
          ),
          onPressed: () {
            locator<AppNavigation>().navigateTo(AppRoutes.addTask);
          },
        ),
        extendBody: true,
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
        ),
        backgroundColor: AppTheme.c.primary,
        body: const SafeArea(
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
