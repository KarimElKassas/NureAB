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
import 'package:nureab/shared/constants.dart';

class ChangePasswordScreen extends StatelessWidget {

  var newPasswordController = TextEditingController();
  var newPasswordConfirmController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ChangePasswordCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: greyFiveColor,
                    height: 60.h,
                    child: SizedBox.expand(),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 36.0.h, horizontal: 14.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Change Password",
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
                              child: Text(
                                "New Password",
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
                              controller: newPasswordController,
                              keyboardType: TextInputType.visiblePassword,
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
                                hintText: '*************',
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
                              child: Text(
                                "Confirm New Password",
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
                              controller: newPasswordConfirmController,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                  color: greyThreeColor,
                                  fontFamily: "Open Sans",
                                  fontSize: ScreenUtil().setSp(14,
                                      allowFontScalingSelf: true),
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '*************',
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
                              child: Text(
                                "A Link will be been Sent To Your Registered Email to Confirm changed password.",
                                style: TextStyle(
                                    color: darkBlueColor,
                                    fontSize: ScreenUtil().setSp(20,
                                        allowFontScalingSelf: true),
                                    overflow: TextOverflow.ellipsis),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                            SizedBox(
                              height: 64.0.h,
                            ),
                            defaultButton(
                              function: (){

                              },
                              text: "Done",
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
                            defaultButton(
                              function: (){
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                } else {
                                  SystemNavigator.pop();
                                }
                              },
                              text: "Cancel",
                              textStyle: TextStyle(
                                color: darkBlueColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                                fontSize:ScreenUtil().setSp(16,
                                    allowFontScalingSelf: true),
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
