import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:officersclubdhaka/____demoData.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/mainApp/util/resources/strings.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

import 'hallPaymentScreen.dart';
import 'widgets/rowTextInfoWidget.dart';

class HallScreen extends StatelessWidget {

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
              subTitle: Strings.hallBookingInfoSubtitle4
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
        length: 4,
        child: Column(
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
                    tabs: [
                      Tab(text: 'Hall 01: (Ground Floor)'),
                      Tab(text: 'Hall 02: (First Floor)'),
                      Tab(text: 'Both Floor'),
                      Tab(text: 'Hall 03: (Play Room Hall)')
                    ]
                )
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              height: 520,
              child: TabBarView(
                children: [
                  HallPricing(),
                  HallPricing(),
                  HallPricing(),
                  HallPricing(),
                ],
              ),
            )
          ],
        ),
      ),
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
              height: 320,
              child: TabBarView(
                children: [
                  Container(),
                  Container(),
                  Container(),
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
        body: ListView(
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
            _buildExtraInfo(),
            _buildCalender()
          ],
        )
    );
  }
}

class HallPricing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HallPricingInfo(),
        HallPricingInfo(),
        HallPricingInfo(),
      ],
    );
  }
}


class HallPricingInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        margin: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rent for Social Program (Member Only)',
                style: TextStyle(
                  fontSize: 16
                ),
              ),
              SizedBox(height: 8),
              RowTextWidget(title: 'Rent', subTitle: '145236',alignment: TextAlign.end),
              RowTextWidget(title: 'Vat', subTitle: '15%',alignment: TextAlign.end),
              RowTextWidget(title: 'Income Tax', subTitle: '5%',alignment: TextAlign.end),
              Divider(
                thickness: 1,
              ),
              RowTextWidget(title: 'Total Rent(TK)', subTitle: '123123',alignment: TextAlign.end),
            ],
          ),
        ),
      ),
    );
  }
}