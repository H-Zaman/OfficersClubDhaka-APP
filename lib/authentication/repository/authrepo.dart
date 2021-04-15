import 'package:dio/dio.dart';
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
        return null;
      }

      return response.data['status'];
    }catch(e){
      return e.toString();
    }
  }

  static Future<String?> disabled(loginData) async{
    return null;
  }

}