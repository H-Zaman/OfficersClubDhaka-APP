import 'package:officersclubdhaka/user/model/userModel.dart';
import 'package:get/get.dart';

class MemberViewModel{
  static var members = <UserModel>[].obs;
  static addMembers(List<UserModel> data) {
    data.forEach((element) {
      if(!members.contains(element)){
        members.add(element);
      }
    });
  }

  static String? nextPageLink;

  static RxBool dataLoad = false.obs;
  static dataLoading(bool value) => dataLoad.value = value;
}