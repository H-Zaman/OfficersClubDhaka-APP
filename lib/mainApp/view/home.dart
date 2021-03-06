import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:officersclubdhaka/____demoData.dart';
import 'package:officersclubdhaka/authentication/view/authScreen.dart';
import 'package:officersclubdhaka/features/memberList/repository/memberRepo.dart';
import 'package:officersclubdhaka/features/memberList/view/memberListScreen.dart';
import 'package:officersclubdhaka/features/memberList/view/memberProfileScreen.dart';
import 'package:officersclubdhaka/features/services/hall/view/hallScreen.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/mainApp/util/resources/images.dart';
import 'package:officersclubdhaka/mainApp/util/sharedWidgets/itemWidget.dart';
import 'package:officersclubdhaka/mainApp/util/sharedWidgets/screenLoader.dart';
import 'package:officersclubdhaka/user/model/userModel.dart';
import 'package:officersclubdhaka/user/viewModel/userViewModel.dart';
import 'package:officersclubdhaka/user/viewModel/usreBackUp.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

import 'widgets/drawerlistTile.dart';

class Boom extends StatelessWidget {
  static final drawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: drawerController,
      style: DrawerStyle.DefaultStyle,
      menuScreen: DrawerScreen(),
      mainScreen: Home(),
      borderRadius: 12.0,
      showShadow: true,
      backgroundColor: Colors.grey[300]!,
      slideWidth: MediaQuery.of(context).size.width*.35,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }
}

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.purple,
                    AppColor.blue,
                  ],
                )
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white,width: 1.5),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                UserViewModel.user.value.image != null ? Images.imagePrefix+UserViewModel.user.value.image! : BackUpData.profileImage
                              ),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              UserViewModel.user.value.fullNameEnglish!,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'ID : ${UserViewModel.user.value.membershipId!}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      DrawerListTile(title: 'About Us'),
                      DrawerListTile(title: 'Transactions'),
                      DrawerListTile(title: 'My Orders'),
                      DrawerListTile(title: 'My Guests'),
                      DrawerListTile(title: 'My Coupons'),
                      DrawerListTile(title: 'My Blogs'),
                      DrawerListTile(
                        title: 'Member list',
                        route: MemberListScreen(),
                      ),
                      DrawerListTile(title: 'My Logs'),
                      DrawerListTile(title: 'Contact Us'),
                    ],
                  ),
                  SizedBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: Text(
                          'App Version: 1.0.1+1',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: (){
                          AwesomeDialog(
                            context: context,
                            title: 'Confirm!',
                            desc: 'Are you sure you want to logout ?',
                            btnCancelOnPress: (){},
                            btnOkOnPress: (){
                              Get.offAll(()=>AuthScreen());
                            }
                          )..show();
                        },
                        minVerticalPadding: 0,
                        leading: Icon(
                          Icons.exit_to_app_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        horizontalTitleGap: 0,
                        title: Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              height: .7
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          Positioned(
            right: 12,
            top: 12,
            child: SafeArea(
              child: IconButton(icon: Icon(Icons.close,color: Colors.white,), onPressed: (){
                Boom.drawerController.close!();
              }),
            ),
          )
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;

  bool screenLoading = false;
  loadScreen() => setState(() => screenLoading = !screenLoading);
  GlobalKey globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return IsScreenLoading(
      screenLoading: screenLoading,
      child: GestureDetector(
        onTap: (){
          if(Boom.drawerController.isOpen!()){
            Boom.drawerController.close!();
          }
        },
        child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColor.blue,
                  pinned: true,
                  leading: IconButton(
                    onPressed: (){
                      if(Boom.drawerController.isOpen!()){
                        Boom.drawerController.close!();
                      }else{
                        Boom.drawerController.open!();
                      }
                    },
                    icon: FaIcon(
                      Icons.menu,color: AppColor.primary,
                    ),
                  ),
                  actions: [
                    GestureDetector(
                      onTap:() async{
                        AwesomeDialog(
                            context: context,
                            dialogType: DialogType.NO_HEADER,
                            body: AspectRatio(
                                aspectRatio: 1,
                                child: RepaintBoundary(
                                  key: globalKey,
                                  child: QrImage(
                                    data: '{"id": ${UserViewModel.user.value.membershipId}, "mobile": ${UserViewModel.user.value.mobile}',
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
                      },
                      child: Container(
                        height: 30,
                        width: 50,
                        margin: EdgeInsets.symmetric(vertical: 14),
                        child: Icon(CupertinoIcons.qrcode_viewfinder,color: Colors.white,size: 30,),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () async{
                        loadScreen();
                        UserModel? data = await MemberRepo.getMemberData(UserViewModel.user.value.memberId!);
                        loadScreen();
                        if(data != null){
                          Get.to(()=>MemberProfileScreen(member: data));
                        }
                      },
                      child: CircleAvatar(
                        radius: 21,
                        backgroundColor: AppColor.primary,
                        child: CircleAvatar(
                          maxRadius: 20,
                          minRadius: 20,
                          backgroundImage: NetworkImage(
                            UserViewModel.user.value.image != null ? Images.imagePrefix+UserViewModel.user.value.image! : BackUpData.profileImage
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10)
                  ],
                  floating: true,
                  snap: true,
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(height: 12),
                      Services(),
                      SizedBox(height: 12),
                      Recreation(),
                      SizedBox(height: 12),
                      EventsAndNews(),
                      SizedBox(height: 4),
                      MakePayment(),
                      SizedBox(height: 12),
                      Offers(),
                      SizedBox(height: 16),
                      RecentBlogs()
                    ])
                )
              ],
            ),
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: _selectedIndex,
              showElevation: true, // use this to remove appBar's elevation
              onItemSelected: (index) => setState(() {
                _selectedIndex = index;
              }),
              items: [
                BottomNavyBarItem(
                    icon: Icon(Icons.apps),
                    title: Text('Home'),
                    activeColor: AppColor.purple,
                    inactiveColor: AppColor.purple
                ),
                BottomNavyBarItem(
                    icon: FaIcon(FontAwesomeIcons.images),
                    title: Text('Gallery'),
                    activeColor: AppColor.purple,
                    inactiveColor: AppColor.purple
                ),
                BottomNavyBarItem(
                    icon: FaIcon(FontAwesomeIcons.microblog),
                    title: Text('Blog'),
                    activeColor: AppColor.purple,
                    inactiveColor: AppColor.purple
                ),
                BottomNavyBarItem(
                    icon: Icon(CupertinoIcons.chat_bubble_2_fill,size: 30),
                    title: Text('Chat'),
                    activeColor: AppColor.purple,
                    inactiveColor: AppColor.purple
                ),
              ],
            )
        ),
      ),
    );
  }
}


class MakePayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.transparent,padding: EdgeInsets.zero),
        onPressed: (){},
        child: Container(
          height: 45,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.purple,
                    AppColor.blue,
                  ],
                )
            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.credit_card,
                size: 30,
              ),
              SizedBox(width: 12),
              Text(
                'Make Payment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}


/// to be refactored later

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,top: 12),
          child: Text(
            'Services',
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          mainAxisSpacing: 22,
          crossAxisSpacing: 12,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
          physics: NeverScrollableScrollPhysics(),
          children: [
            ItemWidget(title: 'Hall', image: Images.iconServicesHall,route: HallScreen(),label: true,),
            ItemWidget(title: 'Catering', image: Images.iconServicesCatering),
            ItemWidget(title: 'Salon', image: Images.iconServicesSalon),
            ItemWidget(title: 'Laundry', image: Images.iconServicesLaundry),
          ],
        ),
      ],
    );
  }
}

class Recreation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double gap = 30;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,top: 12,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recreation'
              ),
              GestureDetector(
                onTap: (){
                  Get.bottomSheet(Container(
                    color: Colors.white,
                    height: 250,
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Text(
                            'Recreation'
                          ),
                        ),
                        SizedBox(height: 12,),
                        SizedBox(
                          height: 180,
                          child: GridView.count(
                            crossAxisCount: 4,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            children: [
                              ItemWidget(title: 'Cafeteria', image: Images.iconRecreationCafeteria,label: true,),
                              ItemWidget(title: 'Guest House', image: Images.iconRecreationGuest, label: true,),
                              ItemWidget(title: 'Library', image: Images.iconRecreationLibrary,label: true,),
                              ItemWidget(title: 'Cyber Cafe', image: Images.iconRecreationCyberCafe),
                              ItemWidget(title: 'Housie', image: Images.iconRecreationHouse),
                              ItemWidget(title: 'TV Lounge', image: Images.iconRecreationLounge),
                              ItemWidget(title: 'Kids Valley', image: Images.iconRecreationKidsValley),
                              ItemWidget(title: 'Others', image: Images.iconRecreationOther),
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
                },
                child: Icon(
                  Icons.arrow_drop_up
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 90,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
            children: [
              ItemWidget(title: 'Cafeteria', image: Images.iconRecreationCafeteria,label: true,),
              SizedBox(width: gap),
              ItemWidget(title: 'Guest House', image: Images.iconRecreationGuest, label: true,),
              SizedBox(width: gap),
              ItemWidget(title: 'Library', image: Images.iconRecreationLibrary,label: true,),
              SizedBox(width: gap),
              ItemWidget(title: 'Cyber Cafe', image: Images.iconRecreationCyberCafe),
              SizedBox(width: gap),
              ItemWidget(title: 'Housie', image: Images.iconRecreationHouse),
              SizedBox(width: gap),
              ItemWidget(title: 'TV Lounge', image: Images.iconRecreationLounge),
              SizedBox(width: gap),
              ItemWidget(title: 'Kids Valley', image: Images.iconRecreationKidsValley),
              SizedBox(width: gap),
              ItemWidget(title: 'Others', image: Images.iconRecreationOther),
            ],
          ),
        ),
      ],
    );
  }
}

class EventsAndNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DefaultTabController(
        length: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 40,
                child: TabBar(
                  isScrollable: true,
                  labelStyle: TextStyle(
                    fontSize: 14
                  ),
                  labelPadding: EdgeInsets.only(right: 16),
                  indicatorColor: AppColor.purple,
                  tabs: [
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.api_rounded,size: 16,),
                          SizedBox(width: 4),
                          Text('Event')
                        ],
                      )
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.api,size: 16,),
                          SizedBox(width: 4),
                          Text('News')
                        ],
                      )
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.api,size: 16,),
                          SizedBox(width: 4),
                          Text('Notice')
                        ],
                      )
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.api,size: 16,),
                          SizedBox(width: 4),
                          Text('Press Release')
                        ],
                      )
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: TabBarView(
                children: [
                  EventBlahBlahTile(),
                  EventBlahBlahTile(),
                  EventBlahBlahTile(),
                  EventBlahBlahTile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Offers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Offers',
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemWidget(
                title: 'VISA',
                image: Images.iconVisa,
              ),
              ItemWidget(
                title: 'Nagad',
                image: Images.iconNagad,
              ),
              ItemWidget(
                title: 'Bkash',
                image: Images.iconBkash,
              ),
              ItemWidget(
                title: 'OCD',
                image: Images.iconRecreationCafeteria,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RecentBlogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,bottom: 12),
          child: Text(
            'Recent Blogs',
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 20),
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  width: 160,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 75,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      Demo.blogImages[index]
                                  ),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'HighLighst of Pris and france- Blog',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'H.Zaman Writer',
                              style: TextStyle(
                                fontSize: 12
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 240,
          child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 20),
              itemCount: 4,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    height: 85,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 35,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        Demo.blogImages2[index]
                                    ),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          flex: 65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Blog-HighLights of Paris and france',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
          ),
        ),
        SizedBox(height: 12)
      ],
    );
  }
}

class EventBlahBlahTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        margin: EdgeInsets.zero,
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://static.toiimg.com/thumb/msid-81979700,width-1200,height-900,resizemode-4,imgsize-127229/81979700.jpg',
                      )
                  )
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    r'''Tributes to 'beloved' Prince Philip after a 'life of duty''',
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Publisher name & designation',
                    style: TextStyle(
                      fontSize: 12
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    r'''The Daily Mirror carries a similar quote, with the couple pictured beside one another. Prince Philip died at Windsor Castle on Friday morning at the age of 99, Buckingham Palace said. The duke was the longest-serving royal consort in British history. Philip and the Queen had four children, eight grandchildren and 10 great-grandchildren.''',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
