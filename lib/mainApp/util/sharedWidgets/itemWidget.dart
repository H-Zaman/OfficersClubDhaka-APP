import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';

class ItemWidget extends StatelessWidget {
  final String? title;
  final String? image;
  final Widget? route;
  const ItemWidget({Key? key, this.title, this.image, this.route}) : super(key: key);
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
              child: image == null ? Icon(Icons.dashboard,color: AppColor.blue,size: 42,) : Image.network(image!),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 2,
            left: 2,
            child: Center(
              child: Text(
                title!,
                style: TextStyle(
                  color: AppColor.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}