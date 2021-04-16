import 'package:officersclubdhaka/features/hall/model/eventMOdel.dart';
import 'package:officersclubdhaka/features/hall/model/hallModel.dart';
import 'package:officersclubdhaka/features/hall/model/hallRentInfoModel.dart';
import 'package:officersclubdhaka/features/hall/model/rentCategoryModel.dart';
import 'package:officersclubdhaka/features/hall/repository/hallRepo.dart';

class HallViewModel{
  static var hallList = <HallModel>[];
  static var hallRentCategories = <HallRentCategoryModel>[];
  static var hallRentInfo = <HallRentInfoModel>[];
  static var hallEvents = <HallEventModel>[];

  static init() async{
    hallRentCategories = await HallRepo.getHallRentCategoryInfo();
    hallRentInfo = await HallRepo.getRentInfoDetails();
    hallList = await HallRepo.getHalls();
    hallEvents = await HallRepo.getHallEvents();
  }
}