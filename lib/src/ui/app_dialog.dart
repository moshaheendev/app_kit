import 'package:app_kit/src/utils/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppDialog {
  static show(
      {required List<Widget> content,
      Color? backgroundColor,
      double? borderRadius,
      bool isDismissible = true}) {
    Get.dialog(Dialog(
      backgroundColor: backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius??20.adaptSize))),
      child: SizedBox(
        width: double.infinity,
        child: Column(mainAxisSize: MainAxisSize.min,children: content,),
      ),
    ), barrierDismissible: isDismissible);
  }
}