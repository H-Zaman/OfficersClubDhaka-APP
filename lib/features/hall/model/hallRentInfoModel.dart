import 'package:officersclubdhaka/features/hall/model/rentCategoryModel.dart';

class HallRentInfoModel {
  HallRentInfoModel({
    this.hallRentAssignId,
    this.hallRentCategoryId,
    this.rentType,
    this.hallCategoryId,
    this.rentAmount,
    this.rentVatPercentage,
    this.rentTaxPercentage,
    this.hallRentCategory
  });

  String? hallRentAssignId;
  String? hallRentCategoryId;
  String? rentType;
  String? hallCategoryId;
  String? rentAmount;
  String? rentVatPercentage;
  String? rentTaxPercentage;
  HallRentCategoryModel? hallRentCategory;

  factory HallRentInfoModel.fromJson(Map<String, dynamic> json) => HallRentInfoModel(
    hallRentAssignId: json["hall_rent_assign_id"],
    hallRentCategoryId: json["hall_rent_category_id"],
    rentType: json["rent_type"],
    hallCategoryId: json["hall_category_id"],
    rentAmount: json["rent_amount"],
    rentVatPercentage: json["rent_vat_percentage"],
    rentTaxPercentage: json["rent_tax_percentage"],
  );

  Map<String, dynamic> toJson() => {
    "hall_rent_assign_id": hallRentAssignId,
    "hall_rent_category_id": hallRentCategoryId,
    "rent_type": rentType,
    "hall_category_id": hallCategoryId,
    "rent_amount": rentAmount,
    "rent_vat_percentage": rentVatPercentage,
    "rent_tax_percentage": rentTaxPercentage,
  };
}