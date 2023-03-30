import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../configs/app_dimensions.dart';

class FlutterToasts {
  static successToast(String? message) => Fluttertoast.showToast(
        msg: message!,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP_LEFT,
        fontSize: AppDimensions.normalize(8),
      );

  static errorToast(String? message) => Fluttertoast.showToast(
        msg: message!,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP_LEFT,
        fontSize: AppDimensions.normalize(8),
      );
}
