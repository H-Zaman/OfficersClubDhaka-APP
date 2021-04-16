import 'package:dio/dio.dart';
import 'package:officersclubdhaka/features/hall/model/eventMOdel.dart';
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
      print(response.data['hallInfo'].length);
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

  static Future<bool> bookHall({
    required String hallId,
    required String date,
    required String rentCatId,
    required String shift,
    required String bookPrice
  }) async{
    try{
      final endPoint = APIConfig.getEndPoint('/HallBookingSave');

      final data = {
        'hall_category_id' : hallId,
        'member_id' : UserViewModel.user.value.memberId,
        'hall_book_date' : date,
        'hall_rent_category_id' : rentCatId,
        'hall_shift_type' : shift,
        'booking_price' : bookPrice,
      };

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