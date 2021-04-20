import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:officersclubdhaka/features/services/hall/model/eventMOdel.dart';
import 'package:officersclubdhaka/features/services/hall/model/hallModel.dart';
import 'package:officersclubdhaka/features/services/hall/viewModel/hallViewModel.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/mainApp/util/resources/strings.dart';
import 'package:officersclubdhaka/mainApp/util/snack.dart';
import 'package:officersclubdhaka/mainApp/util/dateTimeHelper.dart';

import '../hallBookingScreen.dart';
import 'lib/paged_vertical_calendar.dart';

class HallEventCalender extends StatelessWidget {
  final List<HallEventModel> events;
  final HallModel hall;

  const HallEventCalender({Key? key,required this.events, required this.hall}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? _shift;
    return Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12)
          )
        ),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        child: Stack(
          children: [
            Column(
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
                  child: PagedVerticalCalendar(
                      startDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
                      dayBuilder: (context, date) {
                        final eventsThisDay = events.where((e) => e.hallBookDate == date);
                        bool avl = date.isAfter(DateTime.now()) || DateTimeHelper.isSameDay(date);
                        return GestureDetector(
                          onTap: () async{
                            if(avl){
                              _shift = null;
                              if(eventsThisDay.length < 2){
                                String? event;
                                if(eventsThisDay.length > 0){
                                  event = eventsThisDay.first.hallShiftType;
                                }
                                await Get.bottomSheet(
                                    StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
                                      return Container(
                                          height: 250,
                                          width: 200,
                                          color: Colors.white,
                                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Available Shifts',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              Wrap(
                                                children: HallViewModel.hallBookShifts.map((e) => Stack(
                                                  children: [
                                                    CheckboxListTile(
                                                        value: _shift == e,
                                                        onChanged: (bool){
                                                          if(event == e){

                                                          }else{
                                                            setState((){
                                                              _shift = e;
                                                            });
                                                          }
                                                        },
                                                        title: Text(
                                                            e
                                                        ),
                                                        subtitle: event == e ? Text(
                                                          'Unavailable',
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ) : null
                                                    ),

                                                  ],
                                                )).toList(),
                                              ),
                                              SizedBox(height: 12),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: Get.back,
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Colors.grey
                                                    ),
                                                    child: SizedBox(
                                                      width: Get.width * .2,
                                                      child: Center(
                                                        child: Text(
                                                            'Cancel'
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: (){
                                                      if(_shift != null){
                                                        Get.back();
                                                        Get.back();
                                                        Get.to(HallBookingScreen(
                                                          hasEvent : eventsThisDay.length > 0 ? eventsThisDay.first.hallShiftType : '',
                                                          selectedEvent: _shift,
                                                          dateSelected : date,
                                                          hall: hall,
                                                        ));
                                                      }
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      primary: AppColor.purple
                                                    ),
                                                    child: SizedBox(
                                                      width: Get.width * .2,
                                                      child: Center(
                                                        child: Text(
                                                            'Next'
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                      );
                                    },)
                                );
                              }else if(eventsThisDay.length > 1){
                                Snack.top('Sorry', 'Fully Booked');
                              }else {

                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              /// length == 0  meaning no event
                              /// length == 1 meaning either Day/Night is booked
                              /// length == 2 Fully booked
                              color: eventsThisDay.length == 0 ? Colors.transparent : eventsThisDay.length == 1 ? Colors.amber : Colors.red,
                            ),
                            margin: EdgeInsets.all(4),
                            child: Center(
                              child: Text(
                                DateFormat('d').format(date),
                                style: TextStyle(
                                  color: !avl ? Colors.grey : eventsThisDay.length > 0 ? Colors.white : Colors.black,
                                  fontWeight: eventsThisDay.length > 0 ? FontWeight.bold : FontWeight.normal,
                                ),
                              )
                            )
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
            Positioned(
              top: 15,
              right: 0,
              child: Container(
                width: Get.width * .285,
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
            ),
            Positioned(
              right: 0,
              child: Container(
                width: Get.width * .285,
                child: Row(
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
              ),
            ),
          ],
        )
    );
  }
}
