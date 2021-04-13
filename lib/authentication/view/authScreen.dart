import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:officersclubdhaka/authentication/repository/authrepo.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/mainApp/util/resources/images.dart';
import 'package:officersclubdhaka/mainApp/view/home.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      hideForgotPasswordButton: true,
      hideSignUpButton: true,
      theme: LoginTheme(
        titleStyle: TextStyle(
          color: Colors.white,
          letterSpacing: 2,
          fontWeight: FontWeight.bold
        ),
        primaryColor: AppColor.purple,
        footerBackgroundColor: AppColor.purple,
        accentColor: AppColor.purple,
        pageColorLight: AppColor.purple,
        pageColorDark: AppColor.blue,
        buttonStyle: TextStyle(
          fontSize: 14
        ),
        buttonTheme: LoginButtonTheme(
          backgroundColor: AppColor.purple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
        )
      ),
      emailValidator: (_)=>null,
      passwordValidator: (_)=>null,
      title: 'OCD',
      logo: Images.logo,
      logoTag: Images.logo,
      onLogin: AuthRepo.login,
      onSubmitAnimationCompleted: () => Get.offAll(()=>Boom()),
      onSignup: AuthRepo.disabled,
      onRecoverPassword: AuthRepo.disabled,
    );
  }
}
