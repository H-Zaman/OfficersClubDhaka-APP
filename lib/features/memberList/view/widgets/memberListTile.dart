import 'package:flutter/material.dart';
import 'package:officersclubdhaka/features/memberList/repository/memberRepo.dart';
import 'package:officersclubdhaka/features/memberList/view/memberProfileScreen.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/mainApp/util/resources/images.dart';
import 'package:officersclubdhaka/mainApp/util/sharedWidgets/screenLoader.dart';
import 'package:officersclubdhaka/user/model/userModel.dart';
import 'package:officersclubdhaka/user/viewModel/usreBackUp.dart';
import 'package:get/get.dart';

class MemberListTile extends StatefulWidget {
  final UserModel member;

  const MemberListTile({Key? key,required this.member}) : super(key: key);

  @override
  _MemberListTileState createState() => _MemberListTileState();
}

class _MemberListTileState extends State<MemberListTile> {

  bool screenLoading = false;
  loadScreen() => setState(() => screenLoading = !screenLoading);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: () async{
          loadScreen();
          UserModel? data = await MemberRepo.getMemberData(widget.member.memberId!);
          loadScreen();
          if(data != null){
            Get.to(()=>MemberProfileScreen(member: data));
          }
        },
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: AppColor.pink,
          child: CircleAvatar(
              radius: 21,
              backgroundImage: NetworkImage(
                  widget.member.image != null ? Images.imagePrefix+widget.member.image! : BackUpData.profileImage
              )
          ),
        ),
        title: Text(
          widget.member.fullNameEnglish!,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.member.mobile!,
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            Text(
                widget.member.cadreName!.trim().capitalize!
            )
          ],
        ),
        trailing: SizedBox(height: 50, width: 50,child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(
                    colors: [
                      AppColor.blue.withOpacity(.45),
                      AppColor.purple.withOpacity(.45),
                    ]
                )
            ),
            child: IconButton(icon: Icon(Icons.call,color: AppColor.pink), onPressed: (){})))),
      ),
    );
  }
}