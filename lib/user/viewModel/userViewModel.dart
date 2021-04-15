import 'package:officersclubdhaka/user/model/userModel.dart';
import 'package:get/get.dart';

class UserViewModel{
  static var user = UserModel().obs;
  static setUser(UserModel data) => user.value = data;
}