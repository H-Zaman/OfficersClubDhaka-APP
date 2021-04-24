import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/mainApp/util/resources/images.dart';
import 'package:officersclubdhaka/mainApp/util/sharedWidgets/rowTextInfoWidget.dart';
import 'package:officersclubdhaka/user/model/userModel.dart';
import 'package:officersclubdhaka/user/viewModel/usreBackUp.dart';

class MemberProfileScreen extends StatelessWidget {
  final UserModel member;

  const MemberProfileScreen({Key? key,required this.member}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.purple,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text(
          'Member Profile',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
            height: 150,
            color: AppColor.purple,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        member.fullNameEnglish!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2
                        ),
                      ),
                      Text(
                        member.cadreName!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),
                      ),
                      Text(
                        member.mobile!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 45,
                  backgroundImage: CachedNetworkImageProvider(
                    member.image != null ? Images.imagePrefix+member.image! : BackUpData.profileImage
                  ),
                )
              ],
            )
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
            child: Column(
              children: [

                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)
                            )
                          ),
                          child: Center(
                            child: Text(
                              'Personal Information',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              RowTextWidget(title: 'Bangla Name', subTitle: member.fullNameBangla ?? '',size: 16,rowAlign: CrossAxisAlignment.start,),
                              RowTextWidget(title: 'DOB', subTitle: member.dateOfBirth != null ? DateFormat('dd MMM yyyy').format(member.dateOfBirth!) : '',size: 16,rowAlign: CrossAxisAlignment.start,),
                              RowTextWidget(title: 'Blood Group', subTitle: member.bloodGroup ?? '',size: 16),
                              RowTextWidget(title: 'Designation', subTitle: member.designationName ?? '',size: 16,rowAlign: CrossAxisAlignment.start,),
                              RowTextWidget(title: 'Current Stage', subTitle: member.currentStage ?? '',size: 16),
                              RowTextWidget(title: 'District', subTitle: member.districtNameEngish ?? '',size: 16),
                              RowTextWidget(title: 'Phone (Off.)', subTitle: member.telephoneOffice ?? '',size: 16),
                              RowTextWidget(title: 'Phone (Res.)', subTitle: member.telephoneHome ?? '',size: 16),
                              RowTextWidget(title: 'Email', subTitle: member.email ?? '',size: 16,rowAlign: CrossAxisAlignment.start),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)
                            )
                          ),
                          child: Center(
                            child: Text(
                              'Current Address',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            member.currentAddress ?? ''
                          )
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)
                              )
                          ),
                          child: Center(
                            child: Text(
                              'Spouse Information',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              RowTextWidget(title: 'Name', subTitle: member.spouseName ?? '',size: 16),
                              RowTextWidget(title: 'Occupation', subTitle: member.occupationName ?? '',size: 16),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)
                              )
                          ),
                          child: Center(
                            child: Text(
                              'OffSpring Information',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        if(member.offspring != null)Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Wrap(
                            children: member.offspring!.map((e) => Column(
                              children: [
                                RowTextWidget(title: 'Name', subTitle: e.fullName!,size: 16),
                                RowTextWidget(title: 'Dob', subTitle: e.dob != null ? DateFormat('dd MMM yyyy').format(e.dob!) : '',size: 16),
                              ],
                            )).toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)
                            )
                          ),
                          child: Center(
                            child: Text(
                              'Club Information',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [

                              RowTextWidget(title: 'Member ID', subTitle: member.membershipId ?? '',size: 16),
                              RowTextWidget(title: 'Status', subTitle: member.status == '0' ? 'Inactive' : 'Active',size: 16),
                              if(member.committeePosition != null && member.committeeStatus == '1') RowTextWidget(title: 'Committee Status', subTitle: member.committeePosition ?? '',size: 16),
                              if(member.subCommitteePosition != null && member.subCommitteePosition == '1') RowTextWidget(title: 'Sub-Committee Status', subTitle: member.subCommitteePosition ?? '',size: 16),
                            ]
                          )
                        )
                      ]
                    )
                  )
                )
              ]
            )
          )
        ]
      )
    );
  }
}