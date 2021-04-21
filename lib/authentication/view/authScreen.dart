import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:officersclubdhaka/authentication/repository/authrepo.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/mainApp/util/resources/images.dart';
import 'package:officersclubdhaka/mainApp/util/sharedWidgets/screenLoader.dart';
import 'package:officersclubdhaka/mainApp/util/snack.dart';
import 'package:officersclubdhaka/mainApp/view/home.dart';
import 'package:officersclubdhaka/user/viewModel/usreBackUp.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

class AuthScreen extends StatefulWidget {
  final Map<String, dynamic>? data;

  const AuthScreen({Key? key, this.data}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  GlobalKey globalKey = new GlobalKey();

  late TextEditingController _idController;
  late TextEditingController _mobileController;
  final FocusNode _node = FocusNode();
  bool showPrefix = true;
@override
  void initState() {
    super.initState();
    _node.addListener(() {
      if(_mobileController.text.isEmpty){
        setState(() {
          showPrefix = _node.hasFocus;
        });
      }
    });
    if(widget.data == null){
      _idController = TextEditingController();
      _mobileController = TextEditingController();
    }else{
      _idController = TextEditingController(text: widget.data!['id']);
      _mobileController = TextEditingController(text: widget.data!['mobile']);
    }
  }

  bool screenLoading = false;
  loadScreen() => setState(()=> screenLoading = !screenLoading);

  @override
  Widget build(BuildContext context) {
    return IsScreenLoading(
      screenLoading: screenLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              onTap: (){
                if(widget.data != null){
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.NO_HEADER,
                      body: AspectRatio(
                          aspectRatio: 1,
                          child: RepaintBoundary(
                            key: globalKey,
                            child: QrImage(
                              data: widget.data.toString(),
                              version: QrVersions.auto,
                            ),
                          )
                      ),
                      btnCancelOnPress: (){},
                      btnCancelText: 'Close',
                      btnOkOnPress: () async{
                        RenderRepaintBoundary? boundary = globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
                        var image = await boundary.toImage();
                        ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
                        Uint8List pngBytes = byteData!.buffer.asUint8List();

                        final tempDir = await getTemporaryDirectory();
                        final qrImagePath = '${tempDir.path}/image.png';
                        final file = await new File(qrImagePath).create();
                        await file.writeAsBytes(pngBytes);

                        Share.shareFiles([qrImagePath], subject: 'Officers Club Dhaka',text: 'My QR Image');
                      },
                      btnOkText: 'Share'
                  )..show();
                }else{
                  Snack.top('Sorry', 'No data available for QR generation');
                }
              },
              child: Container(
                height: 30,
                width: 50,
                margin: EdgeInsets.symmetric(vertical: 14),
                child: Icon(CupertinoIcons.qrcode_viewfinder,size: 30,),
              ),
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            // Positioned.fill(child: Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [
            //         AppColor.primary,
            //         AppColor.blue
            //       ]
            //     )
            //   ),
            // )),

            SafeArea(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 20,right: 20),
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        Images.appLogo,
                        height: 80,
                      ),


                      if(widget.data != null)
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.primary),
                          ),
                          child: GetStorage().read('image') != null && GetStorage().read('image') != '' ? Image(
                            image: AssetImage(Images.imagePrefix+GetStorage().read('image')),
                            height: 80,width: 70,fit: BoxFit.cover,
                          ) : Image.network(BackUpData.profileImage,height: 80,width: 70,fit: BoxFit.cover,),
                        ),


                    ],
                  ),
                  SizedBox(height: 12,),
                  Text(
                    'Welcome to\nOfficer\'s Club Dhaka',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),

                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Officer\'s club member Id'
                      ),
                      Card(
                        elevation: .5,
                        child: TextField(
                          controller: _idController,
                          autofocus: true,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Member ID input field',
                            fillColor: Colors.grey.shade50,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12)
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mobile No'
                      ),
                      Card(
                        elevation: .5,
                        child: TextField(
                          focusNode: _node,
                          controller: _mobileController,
                          decoration: showPrefix ? InputDecoration(
                            prefixText: '+88',
                            filled: true,
                            prefixStyle: TextStyle(color: Colors.black,fontSize: 16),
                            hintText: 'Mobile number input field',
                            fillColor: Colors.grey.shade50,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12)
                          ) : InputDecoration(
                            filled: true,
                            prefixStyle: TextStyle(color: Colors.black,fontSize: 16),
                            hintText: 'Mobile number input field',
                            fillColor: Colors.grey.shade50,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12)
                        ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async{
                      if(_idController.text.isEmpty){

                      }else if(_mobileController.text.length < 11 || _mobileController.text.length > 14){

                      }else{
                        loadScreen();
                        String? result = await AuthRepo.login(_idController.text, _mobileController.text);
                        loadScreen();
                        if(result == null){
                          Get.offAll(()=>Boom());
                        }else{
                          Snack.bottom('Error', result);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.primary
                    ),
                    child: Text(
                      'Login'
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
