import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:nureab/cubit/personal/personal_settings/personal_settings_cubit.dart';
import 'package:nureab/cubit/personal/personal_settings/personal_settings_states.dart';
import 'package:nureab/screens/home_screens/personal/personal_settings_edit_screen.dart';
import 'package:nureab/shared/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'change_password_screen.dart';

class PersonalSettingsScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var workController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalSettingsCubit(),
      child: BlocConsumer<PersonalSettingsCubit, PersonalSettingsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = PersonalSettingsCubit.get(context);

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
                        padding: EdgeInsets.symmetric(
                            vertical: 36.0.h, horizontal: 14.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Personal Settings",
                              style: TextStyle(
                                  color: darkBlueColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: ScreenUtil()
                                      .setSp(28, allowFontScalingSelf: true)),
                            ),
                            SizedBox(
                              height: 36.0.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.0.w),
                              child: AutoSizeText(
                                "Your Name",
                                style: TextStyle(
                                    color: darkBlueColor,
                                    fontSize: ScreenUtil()
                                        .setSp(18, allowFontScalingSelf: true),
                                    overflow: TextOverflow.ellipsis),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                            SizedBox(
                              height: 12.0.h,
                            ),
                            TextFormField(
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              enabled: false,
                              style: TextStyle(
                                  color: greyThreeColor,
                                  fontFamily: "Open Sans",
                                  fontSize: ScreenUtil()
                                      .setSp(14, allowFontScalingSelf: true),
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: greyColor,
                                hintText: 'John Doe',
                                hintStyle: TextStyle(
                                    color: greyThreeColor,
                                    fontFamily: "Open Sans",
                                    fontSize: ScreenUtil()
                                        .setSp(14, allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w600),
                                alignLabelWithHint: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greyColor, width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                              ),
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.0.w),
                              child: AutoSizeText(
                                "Email Address",
                                style: TextStyle(
                                    color: darkBlueColor,
                                    fontSize: ScreenUtil()
                                        .setSp(18, allowFontScalingSelf: true),
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
                              enabled: false,
                              style: TextStyle(
                                  color: greyThreeColor,
                                  fontFamily: "Open Sans",
                                  fontSize: ScreenUtil()
                                      .setSp(14, allowFontScalingSelf: true),
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: greyColor,
                                hintText: 'JohnDoe@example.com',
                                hintStyle: TextStyle(
                                    color: greyThreeColor,
                                    fontFamily: "Open Sans",
                                    fontSize: ScreenUtil()
                                        .setSp(14, allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w600),
                                alignLabelWithHint: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greyColor, width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                              ),
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.0.w),
                              child: AutoSizeText(
                                "Phone",
                                style: TextStyle(
                                    color: darkBlueColor,
                                    fontSize: ScreenUtil()
                                        .setSp(18, allowFontScalingSelf: true),
                                    overflow: TextOverflow.ellipsis),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                            SizedBox(
                              height: 12.0.h,
                            ),
                            TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              enabled: false,
                              style: TextStyle(
                                  color: greyThreeColor,
                                  fontFamily: "Open Sans",
                                  fontSize: ScreenUtil()
                                      .setSp(14, allowFontScalingSelf: true),
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: greyColor,
                                hintText: '011122334466',
                                hintStyle: TextStyle(
                                    color: greyThreeColor,
                                    fontFamily: "Open Sans",
                                    fontSize: ScreenUtil()
                                        .setSp(14, allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w600),
                                alignLabelWithHint: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greyColor, width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                              ),
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.0.w),
                              child: AutoSizeText(
                                "Hospital / Clinic Name",
                                style: TextStyle(
                                    color: darkBlueColor,
                                    fontSize: ScreenUtil()
                                        .setSp(18, allowFontScalingSelf: true),
                                    overflow: TextOverflow.ellipsis),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                            SizedBox(
                              height: 12.0.h,
                            ),
                            TextFormField(
                              controller: workController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              enabled: false,
                              style: TextStyle(
                                  color: greyThreeColor,
                                  fontFamily: "Open Sans",
                                  fontSize: ScreenUtil()
                                      .setSp(14, allowFontScalingSelf: true),
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: greyColor,
                                hintText: 'John Doe Clinic',
                                hintStyle: TextStyle(
                                    color: greyThreeColor,
                                    fontFamily: "Open Sans",
                                    fontSize: ScreenUtil()
                                        .setSp(14, allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w600),
                                alignLabelWithHint: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greyColor, width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                              ),
                            ),
                            SizedBox(
                              height: 64.0.h,
                            ),
                            defaultButton(
                              function: () {
                                cubit.navigate(
                                    context, PersonalSettingsEditScreen());
                              },
                              text: "Edit",
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                                fontSize: ScreenUtil()
                                    .setSp(18, allowFontScalingSelf: true),
                              ),
                              isUpperCase: false,
                              background: lightSecondaryColor,
                              borderColor: lightSecondaryColor,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            defaultButton(
                              function: () {
                                cubit.navigate(
                                    context, ChangePasswordScreen());
                              },
                              text: "Change Password",
                              textStyle: TextStyle(
                                color: darkBlueColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                                fontSize: ScreenUtil()
                                    .setSp(16, allowFontScalingSelf: true),
                              ),
                              isUpperCase: false,
                              background: greyFiveColor,
                              borderColor: greyFiveColor,
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
