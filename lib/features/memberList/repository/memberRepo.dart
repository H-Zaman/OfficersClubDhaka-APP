import 'package:dio/dio.dart';
import 'package:officersclubdhaka/features/memberList/viewModel/memberViewModel.dart';
import 'package:officersclubdhaka/mainApp/util/config/dioConfig.dart';
import 'package:officersclubdhaka/user/model/userModel.dart';

class MemberRepo{
  static Future<bool> getMemberList([String? nextPage]) async{

    try{
      final client = APIConfig.getClient();
      final endPoint = nextPage ?? APIConfig.getEndPoint('/MemberListDesc');
      MemberViewModel.dataLoading(true);
      Response response = await client.post(endPoint);
      MemberViewModel.dataLoading(false);
      if(response.data['status'] == 'success'){
        MemberViewModel.nextPageLink = response.data['memberInfo']['next_page_url'];
        MemberViewModel.addMembers(List.from(response.data['memberInfo']['data'].map((member) => UserModel.fromJson(member))));
        return false;
      }

      return response.data['status'];
    }catch(e){
      return true;
    }
  }
}