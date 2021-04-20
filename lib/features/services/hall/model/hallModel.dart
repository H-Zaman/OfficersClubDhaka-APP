import 'hallRentInfoModel.dart';

class HallModel {
  HallModel({
    this.hallCategoryId,
    this.hallName,
    this.hallRent,
    this.hallSize,
    this.hallFacilities,
    this.hallRoom,
    this.hallCapacityType,
    this.hallFloor,
    this.hallImage,
    this.hallPrice,
    this.rentInfo
  });

  String? hallCategoryId;
  String? hallName;
  dynamic? hallRent;
  String? hallSize;
  String? hallFacilities;
  String? hallRoom;
  String? hallCapacityType;
  String? hallFloor;
  String? hallImage;
  String? hallPrice;
  List<HallRentInfoModel>? rentInfo;

  factory HallModel.fromJson(Map<String, dynamic> json) => HallModel(
    hallCategoryId: json["hall_category_id"],
    hallName: json["hall_name"],
    hallRent: json["hall_rent"],
    hallSize: json["hall_size"],
    hallFacilities: json["hall_facilities"],
    hallRoom: json["hall_room"],
    hallCapacityType: json["hall_capacity_type"],
    hallFloor: json["hall_floor"],
    hallImage: json["hall_image"],
    hallPrice: json["hall_price"],
  );

  Map<String, dynamic> toJson() => {
    "hall_category_id": hallCategoryId,
    "hall_name": hallName,
    "hall_rent": hallRent,
    "hall_size": hallSize,
    "hall_facilities": hallFacilities,
    "hall_room": hallRoom,
    "hall_capacity_type": hallCapacityType,
    "hall_floor": hallFloor,
    "hall_image": hallImage,
    "hall_price": hallPrice,
  };
}
