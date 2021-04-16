import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:officersclubdhaka/____demoData.dart';
import 'package:officersclubdhaka/features/hall/model/hallModel.dart';
import 'package:officersclubdhaka/features/hall/view/widgets/rowTextInfoWidget.dart';
import 'package:officersclubdhaka/mainApp/util/resources/images.dart';

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
            // imageUrl: Demo.hall,
            imageUrl: hall.hallImage != null ? Images.imagePrefix+hall.hallImage! : Demo.hall,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 4),
        if(hall.hallSize != null) RowTextWidget(title: 'Hall Size', subTitle: hall.hallSize!),
        if(hall.hallFacilities != null) RowTextWidget(title: 'Facilities', subTitle: hall.hallFacilities!),
        if(hall.hallRoom != null) RowTextWidget(title: 'No of Room', subTitle: hall.hallRoom!),
        if(hall.hallCapacityType != null) RowTextWidget(title: 'Capacity', subTitle: hall.hallCapacityType!),
        if(hall.rentInfo!.length > 0) Wrap(
          children: hall.rentInfo!.map((e) => ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
                e.hallRentCategory!.hallRentCategoryName + ' (${e.rentType!})'
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Rent: ${e.rentAmount}, VAT: ${e.rentVatPercentage}%, Income Tax: ${e.rentTaxPercentage}%'
                ),
                Text(
                    'Total: ${((double.parse(e.rentAmount!)*((double.parse(e.rentVatPercentage!)+double.parse(e.rentTaxPercentage!))/100))+double.parse(e.rentAmount!)).toStringAsFixed(1)}'
                )
              ],
            ),
          )).toList(),
        )
      ],
    );
  }
}