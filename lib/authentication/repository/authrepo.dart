import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:officersclubdhaka/mainApp/util/config/dioConfig.dart';
import 'package:officersclubdhaka/user/model/userModel.dart';
import 'package:officersclubdhaka/user/viewModel/userViewModel.dart';

class AuthRepo{
  static Future<String?> login(String id, String mobile) async{
    
    try{
      final client = APIConfig.getClient();
      final endPoint = APIConfig.getEndPoint('/MemberValidation');
      final data = {
        'membership_id' : id,
        'mobile' : '+88'+mobile
      };
      Response response = await client.post(endPoint,data: data);
      print(response.data['status']);
      if(response.data['status'] == 'success'){
        UserViewModel.setUser(UserModel.fromJson(response.data['member']));
        GetStorage().write('userInfo', {
          'id' : id,
          'mobile' : mobile
        });
        GetStorage().write('image', UserViewModel.user.value.image);
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