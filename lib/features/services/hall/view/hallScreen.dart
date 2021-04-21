import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:officersclubdhaka/____demoData.dart';
import 'package:officersclubdhaka/features/services/hall/model/hallMasterDataModel.dart';
import 'package:officersclubdhaka/features/services/hall/viewModel/hallViewModel.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/mainApp/util/resources/strings.dart';
import 'hallPaymentScreen.dart';
import 'widgets/hallPricingInfoWidget.dart';
import '../../../../mainApp/util/sharedWidgets/rowTextInfoWidget.dart';

class HallScreen extends StatefulWidget {
  @override
  _HallScreenState createState() => _HallScreenState();
}

class _HallScreenState extends State<HallScreen> {

  bool initLoad = true;

  getData() async{
    await HallViewModel.init();
    setState(() {
      initLoad = false;
    });
  }

  @override
  void initState() {
    if(mounted){
      getData();
      super.initState();
    }else{
      return ;
    }
  }

  @override
  Widget build(BuildContext context) {

    _buildInfo() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.hallBookingInfoTitle,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 4),
          Text(
            HallViewModel.hallMasterData.hallBasicInfo!.hallDescription!,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );

    _buildHallInfo() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowTextWidget(
              title: Strings.hallBookingInfoTitle1,
              subTitle: HallViewModel.hallMasterData.hallBasicInfo!.bookingTime!
          ),
          RowTextWidget(
              title: Strings.hallBookingInfoTitle2,
              subTitle: HallViewModel.hallMasterData.hallBasicInfo!.dayShift!
          ),
          RowTextWidget(
              title: Strings.hallBookingInfoTitle3,
              subTitle: HallViewModel.hallMasterData.hallBasicInfo!.nightShift!
          ),
          RowTextWidget(
              title: Strings.hallBookingInfoTitle4,
              subTitle: HallViewModel.hallMasterData.hallBasicInfo!.noOfHallRoom!
          ),
          RowTextWidget(
              title: Strings.hallBookingInfoTitle5,
              subTitle: HallViewModel.hallMasterData.hallBasicInfo!.spaceCapacity!
          ),
        ],
      ),
    );

    _buildHallPricing() => Padding(
      padding: const EdgeInsets.only(left: 20,top: 4),
      child: DefaultTabController(
        length: HallViewModel.hallList.length,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.hallBookingPriceTitle,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 4),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.grey.shade200
                        )
                    )
                ),
                height: 40,
                child: TabBar(
                    indicatorColor: AppColor.purple,
                    isScrollable: true,
                    indicatorWeight: 3,
                    labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),
                    labelColor: AppColor.blue,
                    unselectedLabelColor: AppColor.blue,
                    tabs: HallViewModel.hallList.map((e) => Tab(text: e.hallName!)).toList()
                )
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              constraints: BoxConstraints.loose(Size(
                double.infinity,
                Get.height * .7
              )),
              child: TabBarView(
                children: HallViewModel.hallList.map((e) => HallPricingInfoWidget(hall: e)).toList()
              ),
            )
          ],
        ),
      )
    );

    _buildOtherInfo() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: DefaultTabController(
        length: HallViewModel.hallMasterData.hallDecoratorCategoryInfo!.length,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.hallBookingOtherInfoTitle,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 4),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.grey.shade200
                        )
                    )
                ),
                height: 40,
                child: TabBar(
                    indicatorColor: AppColor.purple,
                    isScrollable: true,
                    indicatorWeight: 3,
                    labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),
                    labelColor: AppColor.blue,
                    unselectedLabelColor: AppColor.blue,
                    tabs: HallViewModel.hallMasterData.hallDecoratorCategoryInfo!.map((e) => Tab(
                      text: e.decoratorCategoryName!
                    )).toList()
                )
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              height: 240,
              child: TabBarView(
                children: [
                  Container(
                    child: Wrap(
                      children: HallViewModel.hallMasterData.hallDecoratorDetailsInfo!.where((element) => element.decoratorCategoryId == '1').map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                        child: Text(
                          e.decoratorDescription!,
                          textAlign: TextAlign.justify,
                        ),
                      )).toList(),
                    )
                  ),
                  DecoratorList(data: HallViewModel.hallMasterData.hallDecoratorDetailsInfo!.where((element) => element.decoratorCategoryId == '2').toList()),
                  DecoratorList(data: HallViewModel.hallMasterData.hallDecoratorDetailsInfo!.where((element) => element.decoratorCategoryId == '3').toList()),
                ],
              ),
            )
          ],
        ),
      ),
    );

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
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
          actions: [
            Container(
              decoration: BoxDecoration(
                  color: AppColor.purple,
                  borderRadius: BorderRadius.circular(4)
              ),
              margin: EdgeInsets.all(12),
              child: TextButton(
                onPressed: () {
                  Get.to(()=>HallPaymentScreen());
                },
                child: Text(
                  'Payment',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
        body: initLoad ? SpinKitDualRing(color: AppColor.pink) : ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            AspectRatio(
              aspectRatio: 60/36,
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              Demo.hall
                          ),
                          fit: BoxFit.cover
                      ),
                      gradient: LinearGradient(
                          colors: [
                            AppColor.blue,
                            AppColor.purple,
                          ]
                      )
                  )
              ),
            ),
            _buildInfo(),
            _buildHallInfo(),
            _buildHallPricing(),
            _buildOtherInfo()
          ],
        )
    );
  }
}


/// this was built to show decorator info unfortunately currently it is disabled
class DecoratorList extends StatelessWidget {
  final List<HallDecoratorDetailsInfo> data;

  const DecoratorList({Key? key,required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (_,index)=>Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                  (index+1).toString().padLeft(2,'0')
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                    data[index].nameOfInstitution!
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        data[index].decoratorAddress!
                    ),
                    Text(
                      'Mobile: '+data[index].decoratorMobile!
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
