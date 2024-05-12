import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'snack/custom_snack_bar.dart';
import 'snack/top_snack_bar.dart';

abstract class AppSnack{

  static success({required String label,Curve curve=Curves.fastOutSlowIn,Curve reverseCurve=Curves.fastOutSlowIn,double borderRadius=10}){
    _show(label: label,type: 0,borderRadius: borderRadius);
  }
  static error({required String label,Curve curve=Curves.fastOutSlowIn,Curve reverseCurve=Curves.fastOutSlowIn,double borderRadius=10}){
    _show(label: label,type: 1,borderRadius: borderRadius);
  }

  static _show({required int type,required String label,Curve curve=Curves.fastOutSlowIn,Curve reverseCurve=Curves.fastOutSlowIn,double borderRadius=10}){
    showTopSnackBar(
        Overlay.of(Get.overlayContext!),
        type==0? CustomSnackBar.success(
          message: label,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ):
        CustomSnackBar.error(
          message: label,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        curve: curve,
        reverseCurve: reverseCurve
    );
  }
}