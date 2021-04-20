import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:officersclubdhaka/features/memberList/repository/memberRepo.dart';
import 'package:officersclubdhaka/features/memberList/view/widgets/memberListTile.dart';
import 'package:officersclubdhaka/features/memberList/viewModel/memberViewModel.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';
import 'package:officersclubdhaka/user/model/userModel.dart';

class MemberListScreen extends StatefulWidget {
  @override
  _MemberListScreenState createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {

  ScrollController _scrollController = ScrollController();

  getData() async{
    MemberRepo.getMemberList();
    MemberViewModel.members.clear();
    MemberViewModel.dataLoading(false);
    MemberViewModel.nextPageLink = null;
    _scrollController..addListener(_scrollListener);
    setState(() {
      pageLoad = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();

  }
  /// TRIGGERS WHEN SCROLLED TO END OF LIST
  _scrollListener(){
    if(_scrollController.position.maxScrollExtent == _scrollController.position.extentBefore){
      MemberRepo.getMemberList(MemberViewModel.nextPageLink);
    }
  }

  RxBool _showSearch = false.obs;
  RxString searchFiledValue = ''.obs;

  final TextEditingController _controller = TextEditingController();
  /// CLEARING TEXT-FIELD AT END OF SEARCH
  clearSearch(){
    _controller.clear();
    searchFiledValue.value = '';
    _showSearch.value = !_showSearch.value;
    FocusScope.of(context).unfocus();
  }

  bool pageLoad = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.blue,
                AppColor.purple,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )
          )
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
                color: Colors.white
            ),
            title: Obx(()=>AnimatedCrossFade(
              firstChild: Text(
                'Members',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.3
                ),
              ),
              secondChild: TextField(
                controller: _controller,
                onChanged: (value) => searchFiledValue.value = value,
                decoration: InputDecoration(
                  hintText: 'Search Member'
                ),
                onSubmitted: (_){
                  clearSearch();
                },
                onEditingComplete: (){
                  clearSearch();
                },
              ),
              crossFadeState: _showSearch.value ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 300)
             )
            ),
            actions: [
              IconButton(
                onPressed: (){
                  clearSearch();
                },
                icon: Obx(()=>Icon(
                    _showSearch.value ? Icons.close : Icons.search,
                    color: Colors.white
                )),
              ),
              SizedBox(width: 14,)
            ],
          ),
          body: pageLoad ? SpinKitDualRing(color: AppColor.purple) : Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: Obx((){
                    List<UserModel> tempList = [];
                    if(searchFiledValue.value != ''){
                      tempList.addAll(MemberViewModel.members.where((member) {
                        if(member.fullNameEnglish!.toLowerCase().contains(searchFiledValue.value.toLowerCase())){
                          return true;
                        }if(member.fullNameBangla!.toLowerCase().contains(searchFiledValue.value.toLowerCase())){
                          return true;
                        }if(member.mobile!.contains(searchFiledValue.value)){
                          return true;
                        }if(member.designationName != null && member.designationName!.contains(searchFiledValue.value)){
                          return true;
                        }if(member.districtNameEngish != null && member.districtNameEngish!.contains(searchFiledValue.value)){
                          return true;
                        }if(member.districtNameBangla != null && member.districtNameBangla!.contains(searchFiledValue.value)){
                          return true;
                        }if(member.cadreName != null && member.cadreName!.contains(searchFiledValue.value)){
                          return true;
                        }else{
                          return false;
                        }
                      }

                      ));
                    }else{
                      tempList.addAll(MemberViewModel.members);
                    }

                    return ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: tempList.length,
                        itemBuilder: (_, index)=> MemberListTile(member : tempList[index])
                    );
                  })
                ),
                Obx(()=>MemberViewModel.dataLoad.value ? SpinKitWave(color: AppColor.pink,size: 20) : SizedBox())
              ],
            ),
          ),
        ),
      ],
    );
  }
}