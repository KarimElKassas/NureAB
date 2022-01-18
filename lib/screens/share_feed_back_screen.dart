import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nureab/cubit/personal/change_password/change_password_cubit.dart';
import 'package:nureab/cubit/personal/change_password/change_password_states.dart';
import 'package:nureab/cubit/personal/personal_settings/personal_settings_cubit.dart';
import 'package:nureab/cubit/personal/personal_settings/personal_settings_states.dart';
import 'package:nureab/cubit/personal/personal_settings_edit/personal_settings_edit_cubit.dart';
import 'package:nureab/cubit/personal/personal_settings_edit/personal_settings_edit_states.dart';
import 'package:nureab/cubit/share_feed_back/share_feed_back_cubit.dart';
import 'package:nureab/cubit/share_feed_back/share_feed_back_states.dart';
import 'package:nureab/shared/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ShareFeedBackScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var feedbackController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShareFeedBackCubit(),
      child: BlocConsumer<ShareFeedBackCubit, ShareFeedBackStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShareFeedBackCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: greyFiveColor,
                    height: 60.h,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              color: greyFiveColor,
                              width: 150.w,
                              child: GestureDetector(
                                onTap: () {
                                  if (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  } else {
                                    SystemNavigator.pop();
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0.w, right: 8.0.w),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: darkBlueColor,
                                      ),
                                    ),
                                    AutoSizeText(
                                      "Back",
                                      style: TextStyle(
                                          color: darkBlueColor,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 1.0,
                                          fontSize: ScreenUtil().setSp(18,
                                              allowFontScalingSelf: true)),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 36.0.h, horizontal: 14.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText("Share Feedback",
                              style: TextStyle(
                                  color: darkBlueColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: ScreenUtil().setSp(28,
                                      allowFontScalingSelf: true)
                              ),
                            ),
                            SizedBox(height: 36.0.h,),
                            Padding(
                              padding: EdgeInsets.only(left: 4.0.w),
                              child: AutoSizeText(
                                "Email Address",
                                style: TextStyle(
                                    color: darkBlueColor,
                                    fontSize: ScreenUtil().setSp(18,
                                        allowFontScalingSelf: true),
                                    overflow: TextOverflow.ellipsis),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                            SizedBox(
                              height: 12.0.h,
                            ),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(
                                  color: greyThreeColor,
                                  fontFamily: "Open Sans",
                                  fontSize: ScreenUtil().setSp(14,
                                      allowFontScalingSelf: true),
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'John Doe@gmail.com',
                                hintStyle: TextStyle(
                                    color: greyThreeColor,
                                    fontFamily: "Open Sans",
                                    fontSize: ScreenUtil().setSp(14,
                                        allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w600),
                                alignLabelWithHint: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: greyBorderColor, width: 1.0),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                                border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: greyBorderColor, width: 1.0),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: greyBorderColor, width: 1.0),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                              ),
                            ),
                            SizedBox(height: 24.0.h,),
                            Padding(
                              padding: EdgeInsets.only(left: 4.0.w),
                              child: AutoSizeText(
                                "Add your Recommendations",
                                style: TextStyle(
                                    color: darkBlueColor,
                                    fontSize: ScreenUtil().setSp(18,
                                        allowFontScalingSelf: true),
                                    overflow: TextOverflow.ellipsis),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                            SizedBox(
                              height: 12.0.h,
                            ),
                            TextFormField(
                              controller: feedbackController,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              minLines: 8,
                              textInputAction: TextInputAction.newline,
                              style: TextStyle(
                                  color: greyThreeColor,
                                  fontFamily: "Open Sans",
                                  fontSize: ScreenUtil().setSp(16,
                                      allowFontScalingSelf: true),
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Type here ....",
                                hintStyle: TextStyle(
                                    color: greyThreeColor,
                                    fontFamily: "Open Sans",
                                    fontSize: ScreenUtil().setSp(16,
                                        allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w600),
                                alignLabelWithHint: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: greyBorderColor, width: 1.0),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                                border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: greyBorderColor, width: 1.0),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: greyBorderColor, width: 1.0),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                              ),
                            ),

                            SizedBox(
                              height: 64.0.h,
                            ),
                            defaultButton(
                              function: (){

                              },
                              text: "Submit",
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                                fontSize:ScreenUtil().setSp(18,
                                    allowFontScalingSelf: true),
                              ),
                              isUpperCase: false,
                              background: lightSecondaryColor,
                              borderColor: lightSecondaryColor,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
