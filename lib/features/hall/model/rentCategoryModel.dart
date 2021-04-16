class HallRentCategoryModel {
  HallRentCategoryModel({
    required this.hallRentCategoryId,
    required this.hallRentCategoryName,
  });

  String hallRentCategoryId;
  String hallRentCategoryName;

  factory HallRentCategoryModel.fromJson(Map<String, dynamic> json) => HallRentCategoryModel(
    hallRentCategoryId: json["hall_rent_category_id"],
    hallRentCategoryName: json["hall_rent_category_name"],
  );

  Map<String, dynamic> toJson() => {
    "hall_rent_category_id": hallRentCategoryId,
    "hall_rent_category_name": hallRentCategoryName,
  };
}