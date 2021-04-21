

import 'package:officersclubdhaka/features/services/hall/model/eventMOdel.dart';
import 'package:officersclubdhaka/features/services/hall/model/hallMasterDataModel.dart';
import 'package:officersclubdhaka/features/services/hall/model/hallModel.dart';
import 'package:officersclubdhaka/features/services/hall/model/hallRentInfoModel.dart';
import 'package:officersclubdhaka/features/services/hall/model/rentCategoryModel.dart';
import 'package:officersclubdhaka/features/services/hall/repository/hallRepo.dart';

class HallViewModel{
  static var hallMasterData = HallMasterData();
  static var hallList = <HallModel>[];
  static var hallRentCategories = <HallRentCategoryModel>[];
  static var hallRentInfo = <HallRentInfoModel>[];
  static var hallEvents = <HallEventModel>[];

  static init() async{
    hallMasterData = (await HallRepo.getHallMasterData())!;
    hallRentCategories = await HallRepo.getHallRentCategoryInfo();
    hallRentInfo = await HallRepo.getRentInfoDetails();
    hallList = await HallRepo.getHalls();
    hallEvents = await HallRepo.getHallEvents();
  }


  static final hallBookShifts = <String>[
    'Day Shift: 10 am to 4 pm',
    'Night Shift: 5 pm to 11 pm',
  ];
}