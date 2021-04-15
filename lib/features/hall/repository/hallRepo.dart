import 'package:dio/dio.dart';
import 'package:officersclubdhaka/features/hall/model/hallModel.dart';
import 'package:officersclubdhaka/mainApp/util/config/dioConfig.dart';

class HallRepo{
  static Future<List<HallModel>> getHalls() async{

    try{
      final client = APIConfig.getClient();
      final endPoint = APIConfig.getEndPoint('/HallInfo');

      Response response = await client.get(endPoint);

      if(response.data['status'] == 'success'){
        return List.from(response.data['hallInfo'].map((hallInfo)=>HallModel.fromJson(hallInfo)));
      }else{
        return [];
      }

    }catch(e){
      return [];
    }
  }
}