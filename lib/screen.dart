import 'package:flutter/material.dart';
import 'package:task_application/configs/app.dart';
import 'package:task_application/configs/app_theme.dart';

class Screen extends StatefulWidget {
  final Widget child;
  const Screen({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  AppTheme.c.accent,
                  AppTheme.c.accent,
                  AppTheme.c.accent,
                ],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
              ),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
