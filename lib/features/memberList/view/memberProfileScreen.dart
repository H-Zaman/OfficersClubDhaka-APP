import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:officersclubdhaka/features/hall/view/widgets/rowTextInfoWidget.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
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
                    member.image ?? BackUpData.profileImage
                  ),
                )
              ],
            )
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
            child: Column(
              children: [
                if(member.occupationName != null) RowTextWidget(title: 'Occupation', subTitle: member.occupationName!,size: 16),
                SizedBox(height: 10),
                if(member.fullNameBangla != null) RowTextWidget(title: 'Bangla Name', subTitle: member.fullNameBangla!,size: 16),
                SizedBox(height: 10),
                if(member.telephoneHome != null) RowTextWidget(title: 'Telephone Home', subTitle: member.telephoneHome!,size: 16),
                SizedBox(height: 10),
                if(member.telephoneOffice != null) RowTextWidget(title: 'Telephone Office', subTitle: member.telephoneOffice!,size: 16),
                SizedBox(height: 10),
                if(member.emergencyContactNo != null) RowTextWidget(title: 'Emergency Contact', subTitle: member.emergencyContactNo!,size: 16),
                SizedBox(height: 10),
                if(member.email != null) RowTextWidget(title: 'Email', subTitle: member.email!,size: 16),
                SizedBox(height: 10),
                if(member.bloodGroup!= null) RowTextWidget(title: 'Blood Group', subTitle: member.bloodGroup!,size: 16),
                SizedBox(height: 10),
                if(member.currentAddress != null) RowTextWidget(title: 'Current Address', subTitle: member.currentAddress!,size: 16),
                SizedBox(height: 10),
                if(member.committeePosition != null) RowTextWidget(title: 'Committee Position', subTitle: member.committeePosition!,size: 16),
                SizedBox(height: 10),
                if(member.districtNameEngish != null) RowTextWidget(title: 'District', subTitle: member.districtNameEngish!,size: 16),
              ],
            ),
          )
        ],
      ),
    );
  }
}