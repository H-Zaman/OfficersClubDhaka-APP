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
    this.image,
    this.dateOfBirth,
    this.districtNameEngish,
    this.districtNameBangla,
    this.designationName,
    this.cadreName,
    this.occupationName,
    this.subCommitteeStatus,
    this.subCommitteePosition,
    this.offspring
  });

  dynamic? memberId;
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
  dynamic? status;
  dynamic? committeeStatus;
  dynamic? committeePosition;
  dynamic? committeeSerial;
  dynamic? committeeCategoryId;
  dynamic? image;
  DateTime? dateOfBirth;
  dynamic? districtNameEngish;
  dynamic? districtNameBangla;
  dynamic? designationName;
  dynamic? cadreName;
  dynamic? occupationName;
  dynamic? subCommitteeStatus;
  dynamic? subCommitteePosition;
  List<OffSpringModel>? offspring;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
      image: json["image"],
      dateOfBirth: DateTime.parse(json["date_of_birth"]),
      districtNameEngish: json["district_name_engish"],
      districtNameBangla: json["district_name_bangla"],
      designationName: json["designation_name"],
      cadreName: json["cadre_name"],
      occupationName: json["occupation_name"],
      subCommitteePosition: json["sub_committeee_position"],
      subCommitteeStatus: json["sub_committeee_status"],
    );
  }
}



class OffSpringModel {
  OffSpringModel({
    this.memberOffspringId,
    this.memberId,
    this.fullName,
    this.dob,
  });

  dynamic? memberOffspringId;
  dynamic? memberId;
  dynamic? fullName;
  DateTime? dob;

  factory OffSpringModel.fromJson(Map<String, dynamic> json) => OffSpringModel(
    memberOffspringId: json["member_offspring_id"],
    memberId: json["member_id"],
    fullName: json["full_name"],
    dob: DateTime.parse(json["dob"]),
  );
}