import 'package:app_kit/src/utils/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppBottomSheet {
  static show(
      {required List<Widget> content}) {
    Get.bottomSheet(
        Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisSize: MainAxisSize.min,children: [
          InkWell(
            onTap: (){
              Get.back();
            },
            customBorder: const CircleBorder(),
            child: Container(
              padding: EdgeInsets.all(12.adaptSize),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(.5, .5),
                  )]
              ),
              child: Icon(Icons.close,color: Colors.grey,size: 20.adaptSize,),
            ),
          ).paddingSymmetric(horizontal: 10.h),
          SizedBox(height: 10.v,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.adaptSize),topRight: Radius.circular(10.adaptSize))
            ),
            child: Column(mainAxisSize: MainAxisSize.min,children: content,),
          ),
        ],),
        isScrollControlled: true,
      ignoreSafeArea: false,
    );
  }
}