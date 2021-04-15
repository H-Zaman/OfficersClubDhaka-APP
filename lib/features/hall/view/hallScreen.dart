import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:officersclubdhaka/____demoData.dart';
import 'package:officersclubdhaka/features/hall/viewModel/hallViewModel.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/mainApp/util/resources/strings.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

import 'hallPaymentScreen.dart';
import 'widgets/hallPricingInfoWidget.dart';
import 'widgets/rowTextInfoWidget.dart';

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
    super.initState();
    getData();
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
              Strings.hallBookingInfo
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
              subTitle: Strings.hallBookingInfoSubtitle1
          ),
          RowTextWidget(
              title: Strings.hallBookingInfoTitle2,
              subTitle: Strings.hallBookingInfoSubtitle2
          ),
          RowTextWidget(
              title: Strings.hallBookingInfoTitle3,
              subTitle: Strings.hallBookingInfoSubtitle3
          ),
          RowTextWidget(
              title: Strings.hallBookingInfoTitle4,
              subTitle: '${HallViewModel.hallList.length} (available for rent)'
          ),
          RowTextWidget(
              title: Strings.hallBookingInfoTitle5,
              subTitle: Strings.hallBookingInfoSubtitle5
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
                300
              )),
              child: TabBarView(
                children: HallViewModel.hallList.map((e) => HallPricingInfoWidget(hall: e)).toList()
              ),
            )
          ],
        ),
      )
    );

    _buildExtraInfo() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: DefaultTabController(
        length: 3,
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
                    tabs: [
                      Tab(text: 'Decorator Bill'),
                      Tab(text: 'Name of Listed Decorator'),
                      Tab(text: 'Name of Listed Electric Decorator'),
                    ]
                )
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              height: 220,
              child: TabBarView(
                children: [
                  Container(
                    child: Text(
                      r'''
Decorator bill per person = 40tk,
VAT of food for per person = 24 tk
Gas bill for cooking = 3000 tk, 4000 tk, 5000 tk (varies according to total person)
I.P. Table = 2000 tk,
Chair Cover each = 20 tk, 15% VAT is applicable on decorator bill
Lighting bill for each floor = 10,500 tk
Honorable club members will get 25% discount on decorator bill and flowering cost
''',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  DecoratorList(),
                  DecoratorList(),
                ],
              ),
            )
          ],
        ),
      ),
    );

    _buildCalender() => Container(
        height: 400,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.hallBookingCalenderTitle,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: PagedVerticalCalendar(
                        startDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
                        dayBuilder: (context, date) {
                          final eventsThisDay = Demo.demoEvents.where((e) => e.time == date);
                          return GestureDetector(
                            onTap: (){
                              // Get.dialog(Dialog(
                              //   child: Container(
                              //     padding: EdgeInsets.all(20),
                              //     child: Wrap(
                              //       children: eventsThisDay.map((e) => Text(e.event)).toList(),
                              //     )
                              //   ),
                              // ));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: eventsThisDay.length == 1 ? Colors.amber : eventsThisDay.length == 2 ? Colors.red : Colors.transparent,
                                ),
                                margin: EdgeInsets.all(4),
                                child: Center(
                                    child: Text(
                                      DateFormat('d').format(date),
                                      style: TextStyle(
                                        color: eventsThisDay.length > 0 ? Colors.white : Colors.black,
                                        fontWeight: eventsThisDay.length > 0 ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    )
                                )
                            ),
                          );
                        }
                    ),
                  ),

                  Positioned(
                    top: 20,
                    left: 0,
                    child: Row(
                      children: [
                        Container(
                          height: 10,
                          width: 20,
                          color: Colors.amber,
                        ),
                        Text(
                          ' Partially Booked',
                          style: TextStyle(
                              fontSize: 12
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 20,
                        color: Colors.red,
                      ),
                      Text(
                        ' Fully Booked',
                        style: TextStyle(
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
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
                onPressed: () => Get.to(()=>HallPaymentScreen()),
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
            // _buildExtraInfo(),
            _buildCalender()
          ],
        )
    );
  }
}

class DecoratorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(4, (index) => ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        title: ListTile(
          leading: Text(
              (index+1).toString()
          ),
          title: Text(
              'Name of Decorator'
          ),
          subtitle: Text(
              'Location of the decorator'
          ),
        ),
        children: List.generate(4, (index) => Text(
          '01915949303'
        )),
      )),
    );
  }
}
