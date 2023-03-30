import 'package:flutter/material.dart';

import '../../configs/configs.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBar({super.key, this.isHomeScreen});
  final bool? isHomeScreen;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, AppDimensions.normalize(35));
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: widget.isHomeScreen!
          ? IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              iconSize: AppDimensions.normalize(10),
              color: Colors.white,
            )
          : GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.close_outlined,
                color: Colors.black,
                size: AppDimensions.normalize(13),
              ),
            ),
      centerTitle: true,
      title: Text(
        widget.isHomeScreen! ? 'Schedule' : 'Create New Task',
        style: AppText.b1.copyWith(
            color: widget.isHomeScreen! ? Colors.white : Colors.black),
      ),
    );
  }
}
