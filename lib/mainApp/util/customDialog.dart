import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

class CustomDialog{
  static dialog(String title, String subtitle, DialogType dialogType, [Function? onCancel, Function? onOk]){
    AwesomeDialog(
      context: Get.context!,
      dialogType: dialogType,
      title: title,
      desc: subtitle,
      btnCancelOnPress: onCancel,
      btnOkOnPress: onOk
    )..show();
  }
}