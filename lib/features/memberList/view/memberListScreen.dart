import 'package:flutter/material.dart';
import 'package:officersclubdhaka/____demoData.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';

class MemberListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.blue,
                    AppColor.purple,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
            )
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
                color: Colors.white
            ),
            title: Text(
              'Members',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.3
              ),
            ),
            actions: [
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              SizedBox(width: 14,)
            ],
          ),
          body: Container(
            color: Colors.white,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: Demo.users.length,
              itemBuilder: (_, index) {
                User user = Demo.users[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 23,
                      backgroundColor: AppColor.pink,
                      child: CircleAvatar(
                          radius: 21,
                          backgroundImage: NetworkImage(
                              user.image
                          )
                      ),
                    ),
                    title: Text(
                      user.name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text(
                      user.phone,
                      style: TextStyle(
                          fontSize: 16
                      ),
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
              },
            ),
          ),
        ),
      ],
    );
  }
}