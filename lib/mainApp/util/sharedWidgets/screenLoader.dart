import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:officersclubdhaka/mainApp/util/resources/color.dart';

class IsScreenLoading extends StatelessWidget {

  final bool screenLoading;
  final Widget child;
  IsScreenLoading({required this.screenLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: LoadingOverlay(
        isLoading: screenLoading,
        progressIndicator: SpinKitDualRing(
          color: AppColor.pink
        ),
        color: AppColor.blue.withOpacity(.45),
        child: WillPopScope(
            onWillPop: () async => screenLoading ? false : true,
            child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overScroll) {
                  overScroll.disallowGlow();
                  return false;
                },
                child: child)
        ),
      ),
    );
  }
}