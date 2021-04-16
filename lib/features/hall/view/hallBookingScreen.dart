import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:officersclubdhaka/features/hall/model/clubMemberModel.dart';
import 'package:officersclubdhaka/features/hall/model/hallModel.dart';
import 'package:officersclubdhaka/features/hall/repository/hallRepo.dart';
import 'package:officersclubdhaka/features/hall/viewModel/hallViewModel.dart';
import 'package:officersclubdhaka/mainApp/util/sharedWidgets/screenLoader.dart';
import 'package:officersclubdhaka/mainApp/util/snack.dart';
import 'package:officersclubdhaka/user/viewModel/userViewModel.dart';

class HallBookingScreen extends StatefulWidget {
  final String? hasEvent;
  final HallModel? hall;
  final DateTime? dateSelected;

  const HallBookingScreen({Key? key, this.hasEvent, this.dateSelected, this.hall}) : super(key: key);

  @override
  _HallBookingScreenState createState() => _HallBookingScreenState();
}

class _HallBookingScreenState extends State<HallBookingScreen> {
  DateTime? _bookingDate;
  String? _bookingTime;

  final TextEditingController _nameController = TextEditingController(text: UserViewModel.user.value.fullNameEnglish);
  final TextEditingController _priceController = TextEditingController();
  String? _bookFor = 'Spouse';
  int? _memberType = 1;
  String? _bookingHall;
  String? _bookShift;

  String? _eventType = '1';

  @override
  void initState() {
    super.initState();
    _bookingTime =  widget.hasEvent;
    _bookingDate = widget.dateSelected;
    if(widget.hall != null){
      _bookingHall = widget.hall!.hallCategoryId;
    }
  }

  bool screenLoading = false;
  loadScreen()=>setState(()=>screenLoading = !screenLoading);

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
          children: [

            Text(
              'Booking Type:',
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
                  onChanged: (int? value) {
                    setState((){
                      _memberType = value!;
                    });
                  },
                  value: _memberType,
                  items: MemberModel.types.map((e) => DropdownMenuItem(
                    value : e.id,
                    child: Text(
                      e.title
                    ),
                  )).toList(),
                ),
              ));
            },),
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
                      _eventType = value!;
                    });
                  },
                  value: _eventType,
                  items: HallViewModel.hallRentCategories.map((e) => DropdownMenuItem(
                    value : e.hallRentCategoryId,
                    child: Text(
                      e.hallRentCategoryName
                    ),
                  )).toList(),
                ),
              ));
            },),
            SizedBox(height: 12),

            Text(
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
            SizedBox(height: 12),

            Text(
              'Shift:',
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
                    if(_bookingTime!= null){
                      if(_bookingTime != _bookShift){
                        setState((){
                          _bookShift = value!;
                        });
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
                  items: _hallBookShift.map((e) => DropdownMenuItem(
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
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                controller: _priceController,
                decoration: InputDecoration(
                  hintText: 'BDT',
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
                if(_bookingHall == null){
                  Snack.top('Wait', 'No hall Chosen');
                }else if(_bookShift == null){
                  Snack.top('Wait', 'No Shift Chosen');
                }else if(_priceController.text.isEmpty){
                  Snack.top('Wait', 'Please enter booking amount');
                }else if(_eventType == null){
                  Snack.top('Wait', 'No Event Type Chosen');
                }else{
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
                    bool error2 = await HallRepo.bookHall(
                      hallId: _bookingHall!,
                      date: DateFormat('yyyy-MM-dd').format(_bookingDate!),
                      shift: _bookShift!,
                      bookPrice: _priceController.text,
                      rentCatId: _eventType!,
                    );
                    loadScreen();
                    if(error2){
                      Snack.top('Sorry', 'Something went wrong');
                    }else{
                      Get.back();
                      Snack.top('Success', 'Booking successful');
                    }
                  }
                }
              },
              child: Text(
                'Book Now'
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

final _hallBookShift = <String>[
  'Day Shift: 10 am to 4 pm',
  'Night Shift: 5 pm to 11 pm',
];