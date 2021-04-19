import 'package:dio/dio.dart';
import 'package:officersclubdhaka/features/hall/model/eventMOdel.dart';
import 'package:officersclubdhaka/features/hall/model/onHallBookResponse.dart';
import 'package:officersclubdhaka/features/hall/model/hallModel.dart';
import 'package:officersclubdhaka/features/hall/model/hallRentInfoModel.dart';
import 'package:officersclubdhaka/features/hall/model/rentCategoryModel.dart';
import 'package:officersclubdhaka/features/hall/viewModel/hallViewModel.dart';
import 'package:officersclubdhaka/mainApp/util/config/dioConfig.dart';
import 'package:officersclubdhaka/user/viewModel/userViewModel.dart';

class HallRepo{
  static final _client = APIConfig.getClient();

  static Future<List<HallModel>> getHalls() async{

    try{
      final endPoint = APIConfig.getEndPoint('/HallInfo');

      Response response = await _client.get(endPoint);

      if(response.data['status'] == 'success'){
        List<HallModel> halls = [];
        for(var hall in response.data['hallInfo']){
          HallModel temp = HallModel.fromJson(hall);
          final List<HallRentInfoModel> hallRentInfo = HallViewModel.hallRentInfo.where((element) => element.hallCategoryId == temp.hallCategoryId).toList();
          temp.rentInfo = hallRentInfo;
          halls.add(temp);
        }
        return halls;
      }else{
        return [];
      }

    }catch(e){
      return [];
    }
  }

  static Future<List<HallEventModel>> getHallEvents() async{

    try{
      // final endPoint = APIConfig.getEndPoint('/HallBookingInfo');
      // Response response = await _client.post(endPoint);

      final endPoint = APIConfig.getEndPoint('/HallBookingInfoAll');
      Response response = await _client.get(endPoint);
      if(response.data['status'] == 'success'){
        return List.from(response.data['hallInfo'].map((hallInfo)=>HallEventModel.fromJson(hallInfo)));
      }else{
        return [];
      }

    }catch(e){
      return [];
    }
  }

  static Future<List<HallRentInfoModel>> getRentInfoDetails() async{

    try{
      final endPoint = APIConfig.getEndPoint('/HallRentInfo');

      Response response = await _client.post(endPoint);

      if(response.data['status'] == 'success'){
        List<HallRentInfoModel> infos = [];
        for(var info in response.data['data']){
          HallRentInfoModel temp = HallRentInfoModel.fromJson(info);
          temp.hallRentCategory = HallViewModel.hallRentCategories.firstWhere((element) => element.hallRentCategoryId == temp.hallRentCategoryId);
          infos.add(temp);
        }
        return infos;
      }else{
        return [];
      }

    }catch(e){
      return [];
    }
  }

  static Future<List<HallRentCategoryModel>> getHallRentCategoryInfo() async{

    try{
      final endPoint = APIConfig.getEndPoint('/HallRentCategoryInfo');

      Response response = await _client.get(endPoint);

      if(response.data['status'] == 'success'){
        return List.from(response.data['data'].map((hallInfo)=>HallRentCategoryModel.fromJson(hallInfo)));
      }else{
        return [];
      }

    }catch(e){
      return [];
    }
  }

  static Future<HallBookResponse> bookHall({
    required String hallId,
    required String date,
    required String rentCatId,
    required String shift,
    required String bookPrice,
    required int memberType,
    required String? name,
    required String? mobile,
    required String? nid,
    required String? address,
  }) async{
    try{
      final endPoint = APIConfig.getEndPoint('/HallBookingSave');

      final memberData = {
        'hall_category_id' : hallId,
        'member_id' : memberType == 1 ? UserViewModel.user.value.memberId : null,
        'hall_book_date' : date,
        'hall_rent_category_id' : rentCatId,
        'hall_shift_type' : shift,
        'booking_price' : bookPrice,
        ///disabled for now
        // 'booking_purpose' : booking_purpose,
        'booking_type': memberType,
      };

      final generalData = {
        'hall_category_id' : hallId,
        'hall_book_date' : date,
        'hall_rent_category_id' : rentCatId,
        'hall_shift_type' : shift,
        'booking_price' : bookPrice,
        ///disabled for now
        // 'booking_purpose' : booking_purpose,
        'booking_type': memberType,
        'booker_full_name' : name,
        'booker_mobile' : mobile,
        'booker_nid' : nid,
        'booker_current_addres' : address,
      };

      Response response = await _client.post(endPoint,data: memberType == 1 ? memberData : generalData);
      if(response.data['status'] == 'success'){
        return HallBookResponse(error: false, bookingSerial: response.data['message']['booking_sl'], bookingId: response.data['message']['hall_booking_id']);
      }else{
        return HallBookResponse(error: true);
      }

    }catch(e){
      return HallBookResponse(error: true);
    }
  }

  static Future<bool> checkAvailable({required String hallId,required String date,required String shift}) async{
    try{
      final endPoint = APIConfig.getEndPoint('/HallBookingCheck');

      final data = {
        'hall_category_id' : hallId,
        'hall_book_date' : date,
        'hall_shift_type' : shift,
      };

      Response response = await _client.post(endPoint,data: data);

      return response.data['status'];
    }catch(e){
      return true;
    }
  }
}