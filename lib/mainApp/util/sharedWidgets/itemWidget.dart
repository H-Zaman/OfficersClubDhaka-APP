import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';

class ItemWidget extends StatelessWidget {
  final String? title;
  final String? image;
  final Widget? route;
  final bool? label;
  const ItemWidget({Key? key,this.label = false, this.title, this.image, this.route}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(route != null){
          Get.to(route);
        }
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 14,right: 14,bottom: 20,top: 10),
            child: Center(
              child: image == null ? Icon(Icons.dashboard,color: AppColor.blue,size: 42,) : Image.asset(image!),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                title!,
                style: TextStyle(
                ),
              ),
            ),
          ),
          if(label!)Positioned(
            right: 8,
            top: 8,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primary
              ),
            )
          ),
        ],
      ),
    );
  }
}