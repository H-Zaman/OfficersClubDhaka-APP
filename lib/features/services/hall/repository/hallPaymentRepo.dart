import 'package:dio/dio.dart';
import 'package:officersclubdhaka/features/services/hall/model/hallBookInfoModel.dart';
import 'package:officersclubdhaka/mainApp/util/config/dioConfig.dart';

class HallPaymentRepo{
  static final _client = APIConfig.getClient();
  static Future<HallBookInfoModel?> checkBooking(String bookNo, String mobile) async{
    final endPoint = APIConfig.getEndPoint('/HallInfoSearch');
    final data = {
      'booking_sl' : bookNo,
      'mobile' : mobile,
    };
    try{
      Response response = await _client.post(endPoint,data: data);
      if(response.data['status'] == 'success'){
        return HallBookInfoModel.fromJson(response.data['data']['booking_info']);
      }else{
        return null;
      }
    }catch(e){
      return null;
    }
  }

  static hallPayment(String hallBookId) async{
    final endPoint = APIConfig.getEndPoint('/HallPayment');
    final data = {
      'hall_booking_id' : hallBookId,
    };
    try{
      Response response = await _client.post(endPoint,data: data);
      if(response.data['status'] == 'success'){
        return false;
      }else{
        return true;
      }
    }catch(e){
      return true;
    }
  }
}