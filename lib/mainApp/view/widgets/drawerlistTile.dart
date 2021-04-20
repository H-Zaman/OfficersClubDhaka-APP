import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final Widget? route;

  const DrawerListTile({Key? key,required this.title, this.route}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Boom.drawerController.close!();
        if(route != null){
          Get.to(route);
        }
      },
      minVerticalPadding: 0,
      dense: true,
      leading: Icon(
        CupertinoIcons.circle_fill,
        color: Colors.white,
        size: 20,
      ),
      horizontalTitleGap: 0,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            height: 1.1
        ),
      ),
    );
  }
}