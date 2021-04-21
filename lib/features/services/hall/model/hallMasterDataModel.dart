class HallMasterData {
  HallMasterData({
    this.hallBasicInfo,
    this.hallDecoratorCategoryInfo,
    this.hallDecoratorDetailsInfo,
  });

  HallBasicInfo? hallBasicInfo;
  List<HallDecoratorCategoryInfo>? hallDecoratorCategoryInfo;
  List<HallDecoratorDetailsInfo>? hallDecoratorDetailsInfo;

  factory HallMasterData.fromJson(Map<String, dynamic> json) => HallMasterData(
    hallBasicInfo: HallBasicInfo.fromJson(json["hall_basic_info"]),
    hallDecoratorCategoryInfo: List<HallDecoratorCategoryInfo>.from(json["hall_decorator_category_info"].map((x) => HallDecoratorCategoryInfo.fromJson(x))),
    hallDecoratorDetailsInfo: List<HallDecoratorDetailsInfo>.from(json["hall_decorator_details_info"].map((x) => HallDecoratorDetailsInfo.fromJson(x))),
  );
}

class HallBasicInfo {
  HallBasicInfo({
    this.hallBasicDataId,
    this.hallDescription,
    this.bookingTime,
    this.dayShift,
    this.nightShift,
    this.noOfHallRoom,
    this.spaceCapacity,
    this.status,
  });

  String? hallBasicDataId;
  String? hallDescription;
  String? bookingTime;
  String? dayShift;
  String? nightShift;
  String? noOfHallRoom;
  String? spaceCapacity;
  String? status;

  factory HallBasicInfo.fromJson(Map<String, dynamic> json) => HallBasicInfo(
    hallBasicDataId: json["hall_basic_data_id"],
    hallDescription: json["hall_description"],
    bookingTime: json["booking_time"],
    dayShift: json["day_shift"],
    nightShift: json["night_shift"],
    noOfHallRoom: json["no_of_hall_room"],
    spaceCapacity: json["space_capacity"],
    status: json["status"],
  );
}

class HallDecoratorCategoryInfo {
  HallDecoratorCategoryInfo({
    this.decoratorCategoryId,
    this.decoratorCategoryName,
    this.decoratorCategoryStatus,
  });

  String? decoratorCategoryId;
  String? decoratorCategoryName;
  String? decoratorCategoryStatus;

  factory HallDecoratorCategoryInfo.fromJson(Map<String, dynamic> json) => HallDecoratorCategoryInfo(
    decoratorCategoryId: json["decorator_category_id"],
    decoratorCategoryName: json["decorator_category_name"],
    decoratorCategoryStatus: json["decorator_category_status"],
  );
}

class HallDecoratorDetailsInfo {
  HallDecoratorDetailsInfo({
    this.decoratorDetailsId,
    this.decoratorCategoryId,
    this.decoratorType,
    this.nameOfInstitution,
    this.decoratorAddress,
    this.decoratorMobile,
    this.decoratorDescription,
    this.decoratorStatus,
  });

  String? decoratorDetailsId;
  String? decoratorCategoryId;
  String? decoratorType;
  String? nameOfInstitution;
  String? decoratorAddress;
  String? decoratorMobile;
  String? decoratorDescription;
  String? decoratorStatus;

  factory HallDecoratorDetailsInfo.fromJson(Map<String, dynamic> json) => HallDecoratorDetailsInfo(
    decoratorDetailsId: json["decorator_details_id"],
    decoratorCategoryId: json["decorator_category_id"],
    decoratorType: json["decorator_type"],
    nameOfInstitution: json["name_of_institution"] == null ? null : json["name_of_institution"],
    decoratorAddress: json["decorator_address"] == null ? null : json["decorator_address"],
    decoratorMobile: json["decorator_mobile"] == null ? null : json["decorator_mobile"],
    decoratorDescription: json["decorator_description"],
    decoratorStatus: json["decorator_status"],
  );
}