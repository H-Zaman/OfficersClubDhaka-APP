class UserModel {
  UserModel({
    this.memberId,
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
    this.status,
    this.committeeStatus,
    this.committeePosition,
    this.committeeSerial,
    this.committeeCategoryId,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.dateOfBirth,
    this.districtNameEngish,
    this.districtNameBangla,
    this.designationName,
    this.cadreName,
    this.occupationName,
  });

  String? memberId;
  String? membershipId;
  String? fullNameEnglish;
  String? fullNameBangla;
  String? currentStage;
  dynamic? nid;
  String? mobile;
  dynamic? telephoneHome;
  dynamic? telephoneOffice;
  String? email;
  dynamic? bloodGroup;
  dynamic? currentAddress;
  dynamic? spouseName;
  dynamic? spouseOccupationId;
  dynamic? emergencyContactNo;
  String? status;
  String? committeeStatus;
  dynamic? committeePosition;
  dynamic? committeeSerial;
  dynamic? committeeCategoryId;
  dynamic? createdAt;
  dynamic? updatedAt;
  dynamic? image;
  DateTime? dateOfBirth;
  dynamic? districtNameEngish;
  dynamic? districtNameBangla;
  dynamic? designationName;
  String? cadreName;
  dynamic? occupationName;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    memberId: json["member_id"],
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
    status: json["status"],
    committeeStatus: json["committee_status"],
    committeePosition: json["committee_position"],
    committeeSerial: json["committee_serial"],
    committeeCategoryId: json["committee_category_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    image: json["image"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    districtNameEngish: json["district_name_engish"],
    districtNameBangla: json["district_name_bangla"],
    designationName: json["designation_name"],
    cadreName: json["cadre_name"],
    occupationName: json["occupation_name"],
  );

  Map<String, dynamic> toJson() => {
    "member_id": memberId,
    "membership_id": membershipId,
    "full_name_english": fullNameEnglish,
    "full_name_bangla": fullNameBangla,
    "current_stage": currentStage,
    "nid": nid,
    "mobile": mobile,
    "telephone_home": telephoneHome,
    "telephone_office": telephoneOffice,
    "email": email,
    "blood_group": bloodGroup,
    "current_address": currentAddress,
    "spouse_name": spouseName,
    "spouse_occupation_id": spouseOccupationId,
    "emergency_contact_no": emergencyContactNo,
    "status": status,
    "committee_status": committeeStatus,
    "committee_position": committeePosition,
    "committee_serial": committeeSerial,
    "committee_category_id": committeeCategoryId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "image": image,
    "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "district_name_engish": districtNameEngish,
    "district_name_bangla": districtNameBangla,
    "designation_name": designationName,
    "cadre_name": cadreName,
    "occupation_name": occupationName,
  };
}
