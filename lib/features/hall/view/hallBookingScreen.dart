import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:officersclubdhaka/____demoData.dart';
import 'package:officersclubdhaka/features/hall/model/clubMemberModel.dart';
import 'package:officersclubdhaka/features/hall/model/onHallBookResponse.dart';
import 'package:officersclubdhaka/features/hall/model/hallModel.dart';
import 'package:officersclubdhaka/features/hall/model/hallRentInfoModel.dart';
import 'package:officersclubdhaka/features/hall/repository/hallRepo.dart';
import 'package:officersclubdhaka/features/hall/viewModel/hallViewModel.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/mainApp/util/resources/images.dart';
import 'package:officersclubdhaka/mainApp/util/sharedWidgets/screenLoader.dart';
import 'package:officersclubdhaka/mainApp/util/snack.dart';
import 'package:officersclubdhaka/mainApp/util/customDialog.dart';
import 'package:officersclubdhaka/user/viewModel/userViewModel.dart';

import 'widgets/rowTextInfoWidget.dart';

class HallBookingScreen extends StatefulWidget {
  final String? hasEvent;
  final String? selectedEvent;
  final HallModel hall;
  final DateTime? dateSelected;

  const HallBookingScreen({Key? key, this.hasEvent, this.dateSelected,required this.hall,required this.selectedEvent}) : super(key: key);

  @override
  _HallBookingScreenState createState() => _HallBookingScreenState();
}

class _HallBookingScreenState extends State<HallBookingScreen> {
  DateTime? _bookingDate;
  String? _bookingTime;

  final TextEditingController _nameController = TextEditingController(text: UserViewModel.user.value.fullNameEnglish);
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _nidController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? _bookFor = 'Spouse';
  int? _memberType = 1;
  String? _bookingHall;
  String? _bookShift;

  String _eventType = '1';

  @override
  void initState() {
    super.initState();
    _bookingTime =  widget.hasEvent;
    _bookingDate = widget.dateSelected;
    _bookingHall = widget.hall.hallCategoryId;
    _bookShift = widget.selectedEvent;
  }

  bool screenLoading = false;
  loadScreen()=>setState(()=>screenLoading = !screenLoading);

  bool textFieldEnabled = false;
  List<HallRentInfoModel> rents = [];

  _getBookingPrice(){
    try {
      final result = widget.hall.rentInfo!.firstWhere((element) =>
        element.rentType == _memberType.toString() &&
        element.hallRentCategoryId == _eventType
      );
      _priceController.text = '${((double.parse(result.rentAmount!)*((double.parse(result.rentVatPercentage!)+double.parse(result.rentTaxPercentage!))/100))+double.parse(result.rentAmount!)).toStringAsFixed(1)}';
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    _getBookingPrice();

    return IsScreenLoading(
      screenLoading: screenLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hall Booking Form'
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [

            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 60/36,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          widget.hall.hallImage != null ? Images.imagePrefix+widget.hall.hallImage! : Demo.hall
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
                Positioned(
                  left: 20,
                  bottom: 12,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(4)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                    child: Text(
                      widget.hall.hallName!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                )
              ],
            ),


            Container(
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  if(widget.hall.hallSize != null) RowTextWidget(title: 'Hall Size', subTitle: widget.hall.hallSize!),
                  SizedBox(height: 4),
                  if(widget.hall.hallFacilities != null) RowTextWidget(title: 'Facilities', subTitle: widget.hall.hallFacilities!),
                  SizedBox(height: 4),
                  if(widget.hall.hallRoom != null) RowTextWidget(title: 'No of Room', subTitle: widget.hall.hallRoom!),
                  SizedBox(height: 4),
                  if(widget.hall.hallCapacityType != null) RowTextWidget(title: 'Capacity', subTitle: widget.hall.hallCapacityType!),
                  SizedBox(height: 4),

                  Text(
                    'Booking Type:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonHideUnderline(child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: DropdownButton(
                      isExpanded: true,
                      onChanged: (int? value) {
                        setState((){
                          _eventType = '1';
                          _memberType = value!;
                        });
                        if(_memberType == 1){
                          textFieldEnabled = false;
                        }else{
                          textFieldEnabled = true;
                        }
                      },
                      value: _memberType,
                      items: MemberModel.types.map((e) => DropdownMenuItem(
                        value : e.id,
                        child: Text(
                            e.title
                        ),
                      )).toList(),
                    ),
                  )),
                  SizedBox(height: 12),

                  Text(
                    'Full Name:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      enabled: textFieldEnabled,
                      controller: _nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 4)
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

                  /// normal member info

                  AnimatedCrossFade(
                    firstChild: SizedBox(),
                    secondChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NID no:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: TextField(
                            controller: _nidController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 4)
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                      ],
                    ),
                    crossFadeState: _memberType != 2 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 300)
                  ),
                  AnimatedCrossFade(
                    firstChild: SizedBox(),
                    secondChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mobile No:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: TextField(
                            controller: _mobileController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 4)
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                      ],
                    ),
                    crossFadeState: _memberType != 2 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 300)
                  ),
                  AnimatedCrossFade(
                    firstChild: SizedBox(),
                    secondChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: TextField(
                            controller: _addressController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 4)
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                      ],
                    ),
                    crossFadeState: _memberType != 2 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 300)
                  ),

                  /// normal member info






                  Text(
                    'For Whom:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8),
                  StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
                    return DropdownButtonHideUnderline(child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButton(
                        isExpanded: true,
                        onChanged: (String? value) {
                          setState((){
                            _bookFor = value!;
                          });
                        },
                        value: _bookFor,
                        items: _listForWhom.map((e) => DropdownMenuItem(
                          value : e,
                          child: Text(
                              e
                          ),
                        )).toList(),
                      ),
                    ));
                  },),
                  SizedBox(height: 12),

                  Text(
                    'Purpose:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonHideUnderline(child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: DropdownButton(
                      isExpanded: true,
                      onChanged: (String? value) {
                        if(_memberType == 2){
                          if(_eventType == '2'){
                            setState((){
                              _eventType = value!;
                            });
                          }else{
                            Snack.top('Sorry', 'General Members can not choose this');
                          }
                        }else{
                          setState((){
                            _eventType = value!;
                          });
                        }
                      },
                      value: _eventType,
                      items: HallViewModel.hallRentCategories.map((e) => DropdownMenuItem(
                        value : e.hallRentCategoryId,
                        child: Text(
                            e.hallRentCategoryName
                        ),
                      )).toList(),
                    ),
                  )),
                  SizedBox(height: 12),

/*            Text(
                'Choose Category:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8),
              StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
                return DropdownButtonHideUnderline(child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButton(
                    onChanged: (String? value) {
                      setState((){
                        _bookingHall = value!;
                      });
                    },
                    hint: Text(
                      'Choose a hall'
                    ),
                    value: _bookingHall,
                    items: HallViewModel.hallList.map((e) => DropdownMenuItem(
                      value : e.hallCategoryId,
                      child: Text(
                        e.hallName!
                      ),
                    )).toList(),
                  ),
                ));
              },),
              SizedBox(height: 12),*/

                  Text(
                    'Shift:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonHideUnderline(child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: DropdownButton(
                      isExpanded: true,
                      onChanged: (String? value) {
                        if(_bookingTime!= null){
                          if(widget.hasEvent != value){
                            setState((){
                              _bookShift = value!;
                            });
                          }else{
                            Snack.top('Sorry', 'That shift is already booked');
                          }
                        }else{
                          setState((){
                            _bookShift = value!;
                          });
                        }
                      },
                      hint: Text(
                          'Choose one'
                      ),
                      value: _bookShift,
                      items: HallViewModel.hallBookShifts.map((e) => DropdownMenuItem(
                        value : e,
                        child: Text(
                            e
                        ),
                      )).toList(),
                    ),
                  )),
                  SizedBox(height: 12),

                  Text(
                    'Booking Price:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      enabled: false,
                      controller: _priceController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 4)
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () async{
                      if(_memberType == 1){
                        loadScreen();
                        bool error1 = await HallRepo.checkAvailable(
                            hallId: _bookingHall!,
                            date: DateFormat('yyyy-MM-dd').format(_bookingDate!),
                            shift: _bookShift!
                        );
                        if(error1){
                          loadScreen();
                          Snack.top('Sorry', 'Not available');
                        }else{
                          HallBookResponse response = await HallRepo.bookHall(
                            hallId: _bookingHall!,
                            date: DateFormat('yyyy-MM-dd').format(_bookingDate!),
                            shift: _bookShift!,
                            bookPrice: _priceController.text,
                            rentCatId: _eventType,
                            memberType: _memberType!,
                            name: _nameController.text,
                            mobile: _mobileController.text,
                            nid: _nidController.text,
                            address: _addressController.text,
                          );
                          loadScreen();
                          if(response.error){
                            Snack.top('Sorry', 'Something went wrong');
                          }else{
                            Get.back();
                            CustomDialog.dialog(
                              'Success',
                              'You booking request has been sent. Your Booking Serial No: ${response.bookingSerial}, and Booking ID: ${response.bookingId}',
                              DialogType.SUCCES
                            );
                          }
                        }
                      }else{
                        if(_nameController.text.isEmpty){
                          Snack.top('Wait', 'Please enter a name');
                        } else if(_nidController.text.isEmpty){
                          Snack.top('Wait', 'Please enter NID number');
                        } else if(_addressController.text.isEmpty){
                          Snack.top('Wait', 'Please enter address');
                        } else{
                          loadScreen();
                          bool error1 = await HallRepo.checkAvailable(
                              hallId: _bookingHall!,
                              date: DateFormat('yyyy-MM-dd').format(_bookingDate!),
                              shift: _bookShift!
                          );
                          if(error1){
                            loadScreen();
                            Snack.top('Sorry', 'Not available');
                          }else{
                            HallBookResponse response = await HallRepo.bookHall(
                              hallId: _bookingHall!,
                              date: DateFormat('yyyy-MM-dd').format(_bookingDate!),
                              shift: _bookShift!,
                              bookPrice: _priceController.text,
                              rentCatId: _eventType,
                              memberType: _memberType!,
                              name: _nameController.text,
                              mobile: _mobileController.text,
                              nid: _nidController.text,
                              address: _addressController.text,
                            );
                            loadScreen();
                            if(response.error){
                              Snack.top('Sorry', 'Something went wrong');
                            }else{
                              Get.back();
                              CustomDialog.dialog(
                                'Success',
                                'You booking request has been sent. Your Booking Serial No: ${response.bookingSerial}, and Booking ID: ${response.bookingId}',
                                DialogType.SUCCES
                              );
                            }
                          }
                        }
                      }
                    },
                    child: SizedBox(
                      width: Get.width * .9,
                      child: Center(
                        child: Text(
                            'Book Now'
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

final _listForWhom = <String>[
  'Spouse',
  'Own',
  'Offspring',
  'Other'
];