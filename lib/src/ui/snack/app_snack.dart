import 'package:app_kit/app_kit.dart';
import 'top_snack_bar.dart';
import 'package:flutter/material.dart';
import 'custom_snack_bar.dart';

abstract class AppSnack {
  static success(BuildContext context,
      {required String label,
      Curve curve = Curves.fastOutSlowIn,
      Curve reverseCurve = Curves.fastOutSlowIn,
      double? borderRadius}) {
    _show(context,
        label: label, type: 0, borderRadius: borderRadius ?? 10.adaptSize);
  }

  static error(BuildContext context,
      {required String label,
      Curve curve = Curves.fastOutSlowIn,
      Curve reverseCurve = Curves.fastOutSlowIn,
      double? borderRadius}) {
    _show(context,
        label: label, type: 1, borderRadius: borderRadius ?? 10.adaptSize);
  }

  static _show(BuildContext context,
      {required int type,
      required String label,
      Curve curve = Curves.fastOutSlowIn,
      Curve reverseCurve = Curves.fastOutSlowIn,
      double? borderRadius}) {
    showTopSnackBar(
        Overlay.of(context),
        type == 0
            ? CustomSnackBar.success(
                message: label,
                borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius ?? 10.adaptSize)),
              )
            : CustomSnackBar.error(
                message: label,
                borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius ?? 10.adaptSize)),
              ),
        curve: curve,
        reverseCurve: reverseCurve);
  }
}
