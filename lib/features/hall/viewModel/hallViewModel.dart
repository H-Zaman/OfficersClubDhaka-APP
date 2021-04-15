import 'package:officersclubdhaka/features/hall/model/hallModel.dart';
import 'package:officersclubdhaka/features/hall/repository/hallRepo.dart';

class HallViewModel{
  static var hallList = <HallModel>[];

  static init() async{
    hallList = await HallRepo.getHalls();
  }
}