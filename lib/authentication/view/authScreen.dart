import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officersclubdhaka/authentication/repository/authrepo.dart';
import 'package:officersclubdhaka/authentication/view/lib/flutter_login.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/mainApp/util/resources/images.dart';
import 'package:officersclubdhaka/mainApp/view/home.dart';

class AuthScreen extends StatelessWidget {
  final Map<String, dynamic>? data;

  const AuthScreen({Key? key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _idController;
    TextEditingController _mobileController;
    if(data == null){
      _idController = TextEditingController();
      _mobileController = TextEditingController();
    }else{
      _idController = TextEditingController(text: data!['id']);
      _mobileController = TextEditingController(text: data!['mobile']);
    }
    return FlutterLogin(
      idController: _idController,
      mobileController: _mobileController,
      hideForgotPasswordButton: true,
      hideSignUpButton: true,
      messages: LoginMessages(
        usernameHint: 'User ID',
        passwordHint: 'Mobile Number',
      ),
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
      idFieldValidator: (val)=>val!.length <1 ? 'Field can not be empty' : null,
      phoneNumberFieldValidator: (val)=>val!.length != 11 ? 'Phone number must be 11 digits' : null,
      title: 'OCD',
      logo: Images.appLogo,
      logoTag: Images.appLogo,
      onLogin: AuthRepo.login,
      onSubmitAnimationCompleted: () => Get.offAll(()=>Boom()),
      onSignup: AuthRepo.disabled,
      onRecoverPassword: AuthRepo.disabled,
    );
  }
}
