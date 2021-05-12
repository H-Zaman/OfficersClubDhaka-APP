class HallEventModel {
  HallEventModel({
    required this.hallName,
    required this.hallBookDate,
    required this.hallShiftType,
    required this.hallRentCategoryName,
    required this.hallCategoryId,
  });

  dynamic hallName;
  dynamic hallCategoryId;
  DateTime hallBookDate;
  dynamic hallShiftType;
  dynamic hallRentCategoryName;

  factory HallEventModel.fromJson(Map<String, dynamic> json) {
    return HallEventModel(
      hallName: json["hall_name"],
      hallCategoryId: json["hall_category_id"],
      hallBookDate: DateTime.parse(json["hall_book_date"]),
      hallShiftType: json["hall_shift_type"],
      hallRentCategoryName: json["hall_rent_category_name"],
    );
  }
}