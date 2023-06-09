import 'package:flutter/material.dart';
import 'app_core_theme.dart';

class AppTheme {
  static final _core = AppCoreTheme(
    primary: const Color(0xff2f394b),
    accent: const Color(0xff212A3A),
    text: const Color(0x99D9D9D9),
    textSub: const Color(0xff4b90b5),
    background: const Color(0xFFF9F9F9),
    backgroundSub: const Color(0xFFF3FBFE),
    shadow: Colors.black.withOpacity(0.25),
    shadowSub: const Color(0xFFE5EEFF),
  );

  static AppCoreTheme light = _core;

  static AppCoreTheme dark = _core;

  static late AppCoreTheme c;

  // Init
  static init(BuildContext context) {
    c = isDark(context) ? dark : light;
  }

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
