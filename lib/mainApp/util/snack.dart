import 'package:get/get.dart';

class Snack{
  static top(String title, String message){
    Get.snackbar(title, message);
  }

  static bottom(String title, String message){
    Get.rawSnackbar(title : title, message : message);
  }
}