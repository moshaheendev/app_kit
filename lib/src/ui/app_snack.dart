import 'package:get/get.dart';

abstract class AppSnack {
  static show({required String message}){
    Get.rawSnackbar(
      message: message
    );
  }
}
