import 'package:flutter/material.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/user/model/userModel.dart';
import 'package:officersclubdhaka/user/viewModel/usreBackUp.dart';
import 'package:get/get.dart';

class MemberListTile extends StatelessWidget {
  final UserModel user;

  const MemberListTile({Key? key,required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: AppColor.pink,
          child: CircleAvatar(
              radius: 21,
              backgroundImage: NetworkImage(
                  user.image ?? BackUpData.profileImage
              )
          ),
        ),
        title: Text(
          user.fullNameEnglish!,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.mobile!,
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            Text(
                user.cadreName!.trim().capitalize!
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