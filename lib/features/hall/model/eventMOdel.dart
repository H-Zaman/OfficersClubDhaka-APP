class HallEventModel {
  HallEventModel({
    required this.hallName,
    required this.hallBookDate,
    required this.hallShiftType,
    required this.hallRentCategoryName,
  });

  String hallName;
  DateTime hallBookDate;
  String hallShiftType;
  String hallRentCategoryName;

  factory HallEventModel.fromJson(Map<String, dynamic> json) {
    return HallEventModel(
      hallName: json["hall_name"],
      hallBookDate: DateTime.parse(json["hall_book_date"]),
      hallShiftType: json["hall_shift_type"],
      hallRentCategoryName: json["hall_rent_category_name"],
    );
  }
}