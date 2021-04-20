import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:officersclubdhaka/authentication/view/lib/src/models/login_data.dart';
import 'package:officersclubdhaka/mainApp/util/config/dioConfig.dart';
import 'package:officersclubdhaka/user/model/userModel.dart';
import 'package:officersclubdhaka/user/viewModel/userViewModel.dart';

class AuthRepo{
  static Future<String?> login(LoginData loginData) async{
    
    try{
      final client = APIConfig.getClient();
      final endPoint = APIConfig.getEndPoint('/MemberValidation');
      final data = {
        'membership_id' : loginData.userID,
        'mobile' : '+88'+loginData.mobile
      };
      Response response = await client.post(endPoint,data: data);

      if(response.data['status'] == 'success'){
        UserViewModel.setUser(UserModel.fromJson(response.data['member']));
        GetStorage().write('userInfo', {
          'id' : loginData.userID,
          'mobile' : loginData.mobile
        });
        return null;
      }else{
        return response.data['status'];
      }
    }catch(e){
      print(e.toString());
      return 'Not Found';
    }
  }

  static Future<String?> disabled(loginData) async{
    return null;
  }

}