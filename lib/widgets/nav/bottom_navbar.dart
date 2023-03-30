import 'package:flutter/material.dart';

import '../../configs/configs.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: UIProps.topBoth50,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: UIProps.topBoth50,
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: widget.onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppTheme.c.primary,
          enableFeedback: true,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 4,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
