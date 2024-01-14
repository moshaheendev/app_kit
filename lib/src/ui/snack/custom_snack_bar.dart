import 'package:app_kit/app_kit.dart';
import 'package:flutter/material.dart';

/// Popup widget that you can use by default to show some information

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar.success({
    Key? key,
    required this.message,
    this.backgroundColor = const Color(0xff27ae60),
    this.borderRadius,
  }) : super(key: key);

  const CustomSnackBar.error({
    Key? key,
    required this.message,
    this.backgroundColor = const Color(0xffc0392b),
    this.borderRadius,
  }) : super(key: key);

  final String message;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius:
            borderRadius ?? BorderRadius.all(Radius.circular(12.adaptSize)),
        boxShadow: const [
          BoxShadow(
            color: Colors.white12,
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      width: double.infinity,
      padding: EdgeInsets.all(10.adaptSize),
      child: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 14.adaptSize),
        textAlign: TextAlign.center,
      ),
    );
  }
}
