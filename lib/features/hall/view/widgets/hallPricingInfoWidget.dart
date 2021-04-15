import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:officersclubdhaka/____demoData.dart';
import 'package:officersclubdhaka/features/hall/model/hallModel.dart';
import 'package:officersclubdhaka/features/hall/view/widgets/rowTextInfoWidget.dart';

class HallPricingInfoWidget extends StatelessWidget {
  final HallModel hall;

  const HallPricingInfoWidget({Key? key,required this.hall}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AspectRatio(
          aspectRatio: 16/9,
          child: CachedNetworkImage(
            imageUrl: Demo.hall,
            // imageUrl: hall.hallImage ?? Demo.hall,
            fit: BoxFit.cover,
          ),
        ),
        if(hall.hallSize != null) RowTextWidget(title: 'Hall Size', subTitle: hall.hallSize!),
        if(hall.hallFacilities != null) RowTextWidget(title: 'Facilities', subTitle: hall.hallFacilities!),
        if(hall.hallRoom != null) RowTextWidget(title: 'No of Room', subTitle: hall.hallRoom!),
        if(hall.hallCapacityType != null) RowTextWidget(title: 'Capacity', subTitle: hall.hallCapacityType!),
        if(hall.hallPrice != null) RowTextWidget(title: 'Price', subTitle: hall.hallPrice!),
      ],
    );
  }
}