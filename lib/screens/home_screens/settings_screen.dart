import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nureab/shared/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            physics: BouncingScrollPhysics(),itemCount: moreList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          child: Container(
                            child: Icon(
                              moreList[index].iconData,
                              size: 30,
                              color: secondaryColor,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: greyFiveColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          moreList[index].label,
                          style: TextStyle(
                              fontSize: ScreenUtil()
                                  .setSp(16, allowFontScalingSelf: true),color: secondaryColor),
                        ),
                      )
                    ],
                  ),
                 index!=6? Padding(
                   padding: const EdgeInsets.only(left: 16),
                   child: Divider(color: Color(0xFFEDEFF0,),thickness: 1,),
                 ):Container()
                ],
              );
            }));
  }
}



List<MoreItem> moreList = [
  MoreItem(iconData: Icons.payment_outlined,label: 'Payment Settings'),
  MoreItem(iconData: Icons.person_pin_circle_outlined,label: 'Personal Settings'),
  MoreItem(iconData: Icons.share_outlined,label: 'Share App'),
  MoreItem(iconData: Icons.privacy_tip_outlined,label: 'Privacy'),
  MoreItem(iconData: Icons.feedback_outlined,label: 'Share Feedback'),
  MoreItem(iconData: Icons.rate_review_outlined,label: 'Rate App'),
  MoreItem(iconData: Icons.ac_unit_outlined,label: 'Version 1.0.2'),


];

class MoreItem {
  String label;
IconData iconData;
  MoreItem({
    this.iconData,
    this.label,

  });
}
