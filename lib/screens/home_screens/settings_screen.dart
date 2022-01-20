import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nureab/cubit/settings/settings_cubit.dart';
import 'package:nureab/cubit/settings/settings_states.dart';
import 'package:nureab/screens/home_screens/personal/personal_settings_screen.dart';
import 'package:nureab/screens/privacy_screen.dart';
import 'package:nureab/screens/share_feed_back_screen.dart';
import 'package:nureab/shared/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocConsumer<SettingsCubit, SettingsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SettingsCubit.get(context);

          return Container(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: moreList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if(index == 0){
                              cubit.navigate(context, PersonalSettingsScreen());
                            }else if (index == 1){
                              showToast(
                                message: "Share APP",
                                gravity: ToastGravity.BOTTOM,
                                length: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 3,
                              );
                            }else if(index == 2){
                              cubit.navigate(context, PrivacyScreen());
                            }else if(index == 3){
                              cubit.navigate(context, ShareFeedBackScreen());
                            }else if (index == 4){
                              showToast(
                                message: "Rate APP",
                                gravity: ToastGravity.BOTTOM,
                                length: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 3,
                              );
                            }else if (index == 5){
                              showToast(
                                message: moreList[index].label,
                                gravity: ToastGravity.BOTTOM,
                                length: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 3,
                              );
                            }
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 10, bottom: 10),
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
                                        shape: BoxShape.circle,
                                        color: greyFiveColor),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10,bottom: 10, left: 20),
                                child: AutoSizeText(
                                  moreList[index].label,
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                      color: secondaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        index != 6
                            ? Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Divider(
                                  color: Color(
                                    0xFFEDEFF0,
                                  ),
                                  thickness: 1,
                                ),
                              )
                            : Container()
                      ],
                    );
                  }));
        },
      ),
    );
  }
}

List<MoreItem> moreList = [
  MoreItem(
      iconData: Icons.person_pin_circle_outlined, label: 'Personal Settings'),
  MoreItem(iconData: Icons.share_outlined, label: 'Share App'),
  MoreItem(iconData: Icons.privacy_tip_outlined, label: 'Privacy'),
  MoreItem(iconData: Icons.feedback_outlined, label: 'Share Feedback'),
  MoreItem(iconData: Icons.rate_review_outlined, label: 'Rate App'),
  MoreItem(iconData: Icons.ac_unit_outlined, label: 'Version 1.0.2'),
];

class MoreItem {
  String label;
  IconData iconData;

  MoreItem({
    this.iconData,
    this.label,
  });
}
