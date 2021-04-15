import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:officersclubdhaka/____demoData.dart';
import 'package:officersclubdhaka/features/hall/view/hallScreen.dart';
import 'package:officersclubdhaka/features/memberList/view/memberListScreen.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/mainApp/util/resources/images.dart';
import 'package:officersclubdhaka/mainApp/util/sharedWidgets/itemWidget.dart';
import 'package:officersclubdhaka/mainApp/util/sharedWidgets/screenLoader.dart';
import 'package:officersclubdhaka/user/viewModel/userViewModel.dart';
import 'package:officersclubdhaka/user/viewModel/usreBackUp.dart';

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
      child: Container(
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
                            UserViewModel.user.value.image ?? BackUpData.profileImage
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
                  Container(
                    child: ListTile(
                      leading: Icon(
                        CupertinoIcons.circle_fill,
                        color: Colors.white,
                        size: 20,
                      ),
                      horizontalTitleGap: 0,
                      minVerticalPadding: 0,
                      title: Text(
                        'About Us',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.1
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 0,
                    leading: Icon(
                      CupertinoIcons.circle_fill,
                      color: Colors.white,
                      size: 20,
                    ),
                    horizontalTitleGap: 0,
                    title: Text(
                      'My Orders',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.1
                      ),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 0,
                    leading: Icon(
                      CupertinoIcons.circle_fill,
                      color: Colors.white,
                      size: 20,
                    ),
                    horizontalTitleGap: 0,
                    title: Text(
                      'My Guests',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.1
                      ),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 0,
                    leading: Icon(
                      CupertinoIcons.circle_fill,
                      color: Colors.white,
                      size: 20,
                    ),
                    horizontalTitleGap: 0,
                    title: Text(
                      'My Coupons',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.1
                      ),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 0,
                    leading: Icon(
                      CupertinoIcons.circle_fill,
                      color: Colors.white,
                      size: 20,
                    ),
                    horizontalTitleGap: 0,
                    title: Text(
                      'My Blogs',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.1
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Boom.drawerController.close!();
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>MemberListScreen()));
                    },
                    minVerticalPadding: 0,
                    leading: Icon(
                      CupertinoIcons.circle_fill,
                      color: Colors.white,
                      size: 20,
                    ),
                    horizontalTitleGap: 0,
                    title: Text(
                      'Member List',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.1
                      ),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 0,
                    leading: Icon(
                      CupertinoIcons.circle_fill,
                      color: Colors.white,
                      size: 20,
                    ),
                    horizontalTitleGap: 0,
                    title: Text(
                      'Contact US',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.1
                      ),
                    ),
                  ),
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

  @override
  Widget build(BuildContext context) {
    return IsScreenLoading(
      screenLoading: screenLoading,
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
                    Icons.menu,color: Colors.white,
                  ),
                ),
                actions: [
                  Container(
                    height: 30,
                    width: 50,
                    margin: EdgeInsets.symmetric(vertical: 14),
                    child: Icon(CupertinoIcons.qrcode_viewfinder,color: Colors.white,size: 30,),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 21,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      maxRadius: 20,
                      minRadius: 20,
                      backgroundImage: NetworkImage(
                        UserViewModel.user.value.image ?? BackUpData.profileImage
                      ),
                    ),
                  ),
                  SizedBox(width: 10)
                ],
                floating: true,
                snap: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.blue,
                          AppColor.purple,
                        ],
                      ),
                      // borderRadius: BorderRadius.only(
                      //   bottomLeft: Radius.circular(22),
                      //   bottomRight: Radius.circular(22),
                      // )
                    ),
                    padding: EdgeInsets.only(left: 20,right: 20,bottom: 12),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Welcome to Officer\'s Club Dhaka',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,

                              ),
                            ),
                          ),
                          Hero(tag: Images.appLogo,child: Image.asset(Images.appLogo))
                        ],
                      ),
                    ),
                  ),
                ),
                expandedHeight: 180,
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                    Services(),
                    LatestNews(),
                    SizedBox(height: 12),
                    Offers(),
                    SizedBox(height: 12),
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
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          mainAxisSpacing: 22,
          crossAxisSpacing: 12,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
          physics: NeverScrollableScrollPhysics(),
          children: [
            ItemWidget(title: 'Cafeteria', image: Images.iconCafeteria),
            ItemWidget(title: 'Salon', image: Images.iconSalon),
            ItemWidget(title: 'Hall', image: Images.iconHall,route: HallScreen()),
            ItemWidget(title: 'Pool', image: Images.iconPool),
            ItemWidget(title: 'Coupon', image: Images.iconCoupon),
            ItemWidget(title: 'Guest', image: Images.iconGuest),
            ItemWidget(title: 'Library', image: Images.iconLibrary),
            ItemWidget(title: 'Laundry', image: Images.iconLaundry),
          ],
        ),
      ],
    );
  }
}


class LatestNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Latest News',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            margin: EdgeInsets.zero,
            child: Row(
              children: [
                Container(
                  height: 90,
                  width: 120,
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
                      SizedBox(height: 12),
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
        ),
      ],
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
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                image: Images.iconCafeteria,
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
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'H.Zaman Writer',
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 16,
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