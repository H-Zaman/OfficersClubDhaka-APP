class HallBookInfoModel {
  HallBookInfoModel({
    this.membershipId,
    this.fullNameEnglish,
    this.fullNameBangla,
    this.currentStage,
    this.nid,
    this.mobile,
    this.telephoneHome,
    this.telephoneOffice,
    this.email,
    this.bloodGroup,
    this.currentAddress,
    this.spouseName,
    this.spouseOccupationId,
    this.emergencyContactNo,
    this.committeeStatus,
    this.committeePosition,
    this.committeeSerial,
    this.committeeCategoryId,
    this.hallName,
    this.hallRent,
    this.hallSize,
    this.hallFacilities,
    this.hallRoom,
    this.hallCapacityType,
    this.hallFloor,
    this.hallImage,
    this.hallPrice,
    this.hallBookingId,
    this.bookingSl,
    this.memberId,
    this.bookingPurpose,
    this.bookingType,
    this.bookingConfirmationStartDateTime,
    this.bookingConfirmationEndDateTime,
    this.bookerFullName,
    this.bookerMobile,
    this.bookerNid,
    this.bookerCurrentAddres,
    this.status,
    this.hallBookDate,
    this.hallShiftType,
    this.bookingPrice,
    this.createdAt,
    this.updatedAt,
    this.hallRentCategoryName,
  });

  dynamic? membershipId;
  dynamic? fullNameEnglish;
  dynamic? fullNameBangla;
  dynamic? currentStage;
  dynamic? nid;
  dynamic? mobile;
  dynamic? telephoneHome;
  dynamic? telephoneOffice;
  dynamic? email;
  dynamic? bloodGroup;
  dynamic? currentAddress;
  dynamic? spouseName;
  dynamic? spouseOccupationId;
  dynamic? emergencyContactNo;
  dynamic? committeeStatus;
  dynamic? committeePosition;
  dynamic? committeeSerial;
  dynamic? committeeCategoryId;
  dynamic? hallName;
  dynamic? hallRent;
  dynamic? hallSize;
  dynamic? hallFacilities;
  dynamic? hallRoom;
  dynamic? hallCapacityType;
  dynamic? hallFloor;
  dynamic? hallImage;
  dynamic? hallPrice;
  dynamic? hallBookingId;
  dynamic? bookingSl;
  dynamic? memberId;
  dynamic? bookingPurpose;
  dynamic? bookingType;
  dynamic? bookingConfirmationStartDateTime;
  dynamic? bookingConfirmationEndDateTime;
  dynamic? bookerFullName;
  dynamic? bookerMobile;
  dynamic? bookerNid;
  dynamic? bookerCurrentAddres;
  dynamic? status;
  DateTime? hallBookDate;
  dynamic? hallShiftType;
  dynamic? bookingPrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? hallRentCategoryName;

  factory HallBookInfoModel.fromJson(Map<String, dynamic> json) => HallBookInfoModel(
    membershipId: json["membership_id"],
    fullNameEnglish: json["full_name_english"],
    fullNameBangla: json["full_name_bangla"],
    currentStage: json["current_stage"],
    nid: json["nid"],
    mobile: json["mobile"],
    telephoneHome: json["telephone_home"],
    telephoneOffice: json["telephone_office"],
    email: json["email"],
    bloodGroup: json["blood_group"],
    currentAddress: json["current_address"],
    spouseName: json["spouse_name"],
    spouseOccupationId: json["spouse_occupation_id"],
    emergencyContactNo: json["emergency_contact_no"],
    committeeStatus: json["committee_status"],
    committeePosition: json["committee_position"],
    committeeSerial: json["committee_serial"],
    committeeCategoryId: json["committee_category_id"],
    hallName: json["hall_name"],
    hallRent: json["hall_rent"],
    hallSize: json["hall_size"],
    hallFacilities: json["hall_facilities"],
    hallRoom: json["hall_room"],
    hallCapacityType: json["hall_capacity_type"],
    hallFloor: json["hall_floor"],
    hallImage: json["hall_image"],
    hallPrice: json["hall_price"],
    hallBookingId: json["hall_booking_id"],
    bookingSl: json["booking_sl"],
    memberId: json["member_id"],
    bookingPurpose: json["booking_purpose"],
    bookingType: json["booking_type"],
    bookingConfirmationStartDateTime: json["booking_confirmation_start_date_time"],
    bookingConfirmationEndDateTime: json["booking_confirmation_end_date_time"],
    bookerFullName: json["booker_full_name"],
    bookerMobile: json["booker_mobile"],
    bookerNid: json["booker_nid"],
    bookerCurrentAddres: json["booker_current_addres"],
    status: json["status"],
    hallBookDate: DateTime.parse(json["hall_book_date"]),
    hallShiftType: json["hall_shift_type"],
    bookingPrice: json["booking_price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    hallRentCategoryName: json["hall_rent_category_name"],
  );
}
