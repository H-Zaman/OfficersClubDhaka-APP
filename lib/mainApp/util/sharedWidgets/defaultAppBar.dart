import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      leading: Card(
        color: Colors.black12,
        child: IconButton(
          onPressed: Get.back,
          icon: Icon(
            CupertinoIcons.arrow_left,
            color: Colors.white,
          )
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
