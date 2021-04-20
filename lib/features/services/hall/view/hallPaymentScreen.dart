import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:officersclubdhaka/features/services/hall/model/hallBookInfoModel.dart';
import 'package:officersclubdhaka/features/services/hall/repository/hallPaymentRepo.dart';
import 'package:officersclubdhaka/mainApp/util/customDialog.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/mainApp/util/resources/images.dart';
import 'package:officersclubdhaka/mainApp/util/sharedWidgets/rowTextInfoWidget.dart';
import 'package:officersclubdhaka/mainApp/util/sharedWidgets/screenLoader.dart';

class HallPaymentScreen extends StatefulWidget {
  @override
  _HallPaymentScreenState createState() => _HallPaymentScreenState();
}

class _HallPaymentScreenState extends State<HallPaymentScreen> {
  final TextEditingController _bookingNoController = TextEditingController(text: '10017');
  final TextEditingController _mobileNoController = TextEditingController(text: '+8801915949303');

  bool screenLoading = false;
  loadScreen() => setState(()=>screenLoading = !screenLoading);

  @override
  Widget build(BuildContext context) {
    return IsScreenLoading(
      screenLoading: screenLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hall Payment'
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
          children: [
            Text(
              'Booking No:',
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
                controller: _bookingNoController,
                decoration: InputDecoration(
                  hintText: 'Enter the Hall Booking Number',
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 4)
                ),
              ),
            ),
            SizedBox(height: 12),

            Text(
              'Booking Mobile No:',
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
                controller: _mobileNoController,
                decoration: InputDecoration(
                    hintText: 'Enter Mobile No',
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
                loadScreen();
                HallBookInfoModel? data = await HallPaymentRepo.checkBooking(_bookingNoController.text, _mobileNoController.text);
                loadScreen();
                if(data != null){
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.NO_HEADER,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 16/9,
                          child: CachedNetworkImage(
                            imageUrl: Images.imagePrefix + data.hallImage!,
                          ),
                        ),
                        SizedBox(height: 4,),
                        RowTextWidget(title: 'Name', subTitle: data.fullNameEnglish!),
                        RowTextWidget(title: 'Mobile', subTitle: data.mobile!),
                        RowTextWidget(title: 'Email', subTitle: data.email!),
                        RowTextWidget(title: 'Hall', subTitle: data.hallName!),
                        RowTextWidget(title: 'Book Date', subTitle: DateFormat('dd MM yy').format(data.hallBookDate!)),
                        RowTextWidget(title: 'Shift', subTitle: data.hallShiftType!),
                        RowTextWidget(title: 'Rent Category', subTitle: data.hallRentCategoryName!),
                        RowTextWidget(title: 'Price', subTitle: data.bookingPrice!),
                        RowTextWidget(title: 'Payment Info', subTitle: data.status! == '1' ? 'Temporary Booking Completed' : data.status! == '2' ? 'Payment Permitted' : data.status! == '3' ? 'Payment Completed' : 'Invalid'),
                      ],
                    ),
                    btnOkOnPress: (){},
                    btnOkText: 'Pay Now',
                    btnCancelOnPress: (){}
                  )..show();
                }else{
                  CustomDialog.dialog('Sorry', 'The either your booking does not exist or your payment request has not yet been approved', DialogType.ERROR);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: AppColor.purple
              ),
              child: Text('Proceed to Pay')
            )
          ],
        ),
      ),
    );
  }
}
